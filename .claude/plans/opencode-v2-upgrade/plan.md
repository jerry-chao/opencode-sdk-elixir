# Upgrade opencode-sdk-elixir to OpenCode v2

Bring the SDK onto the OpenCode v2 HttpApi surface
(`https://opencode.ai/v2/openapi.json`, served by `opencode serve` 2.x).

Research backing every task is in `.claude/plans/opencode-v2-upgrade/research/`:

| file | contents |
| --- | --- |
| `codegen.md` | T1 — generator behaviour, module/function naming, e2e run |
| `runtime-verification.md` | T2/T3 — live `opencode v2.0.18` probes |
| `schema-delta.md` | T4 — v1→v2 domain-model diff |
| `ci-and-packaging.md` | T6 — spec source, workflow, version, tests |

**Key constraint:** codegen already works (268 files, compiles clean). This is a
runtime + ergonomics + docs migration, not a generator fight.

---

## Phase 0 — Safety net

- [ ] 0.1 Work on a branch off `dev` (`git checkout -b v2-migration`); confirm
      `git status` is clean first.
- [ ] 0.2 Record the current API surface so the migration table is grounded, not
      guessed:
      `grep -E '^  def ' lib/opencode/generated/operations.ex | sed 's/(.*//' > /tmp/v1_ops.txt`
- [ ] 0.3 Add a `CHANGELOG.md` (repo has none) with an `Unreleased` heading to
      start collecting the breaking changes.

**Verify:** `git branch --show-current` prints `v2-migration`; `/tmp/v1_ops.txt`
has one line per v1 operation.

---

## Phase 1 — Spec swap and regeneration

- [ ] 1.1 Replace the spec: fetch `https://opencode.ai/v2/openapi.json` over
      `priv/opencode_openapi.json` (532 KB, `info.title` = `"opencode HttpApi"`).
      Sanity-check before committing:
      `python3 -c "import json;d=json.load(open('priv/opencode_openapi.json'));print(d['info']['title'],len(d['paths']))"`
      → expect `opencode HttpApi 113`.
- [ ] 1.2 Fix `fetch_spec_from_cli/0` in `lib/mix/tasks/opencode.gen.client.ex`.
      `opencode dev generate` **no longer exists** in v2 (prints root help,
      exits 1). Replace with a direct download of the v2 spec URL, honouring
      `OPENCODE_V2_SPEC_URL` so the source is overridable, and make it the
      default when `--spec` is absent.
- [ ] 1.3 Fix `fetch_spec_from_http/0`: the fallback URL is wrong twice over —
      default port is `127.0.0.1:4096` (not `3000`), the path is
      `/openapi.json` (not `/openapi.json` under `/api`, which 404s), and the
      endpoint requires Basic auth. Accept `:username`/`:password` and build the
      header.
- [ ] 1.4 Delete the stale v1 output before regenerating. `api.gen` does not
      remove modules that no longer exist in the spec, so without this the tree
      keeps 1084 dead files:
      `rm -rf lib/opencode/generated`
- [ ] 1.5 Regenerate and confirm the expected shape:
      `mix opencode.gen.client --spec priv/opencode_openapi.json`
      → 268 files, 2 `@type` injections into `integration.ex`.
      `ls lib/opencode/generated/operations.ex` → absent (expected).
      `ls lib/opencode/generated | grep -c ex` → 268.
- [ ] 1.6 `mix compile --force` → 0 errors. Expect exactly 1 warning
      (`unused require Logger` in the gen task) — treat any other warning as a
      regression to investigate.
- [ ] 1.7 Delete the now-unused `require Logger` in the gen task so the
      baseline is warning-free.

**Verify:** `mix compile --force 2>&1 | grep -c "error:"` → `0`.

---

## Phase 2 — Authentication (the blocker)

Every v2 request needs HTTP Basic auth. Verified: `Authorization: Basic
base64("opencode:" <> password)`. Bearer tokens, `x-api-key`, and
`?password=` are all rejected with 401.

- [ ] 2.1 Add `:username` / `:password` to `OpenCode.create_client/1` and thread
      them into `OpenCode.Client.request/1`. Use Req's native option rather than
      hand-rolling the header:
      `Req.merge(req, auth: {:basic, "#{user}:#{pass}"})`
      (`req 0.5.17` supports `auth: {:basic, userinfo}` — see
      `deps/req/lib/req/steps.ex:197`.) Default `:username` to `"opencode"`.
- [ ] 2.2 Capture the generated password in `OpenCode.Server`. v2 prints
      `server password <pw>` to stdout. Extend the `Port.open` reader in
      `wait_for_ready/5` to recognise **both** lines:
      - `server listening on <url>` (v2 — note: **no** leading `opencode`)
      - `server password <pw>`
      Add `:password` to the `%Server{}` struct.
- [ ] 2.3 Add `:password` to `OpenCode.Server.create/1`. When supplied, set
      `OPENCODE_SERVER_PASSWORD` in the child env — verified to work, and it
      suppresses the stdout line entirely, so 2.2 must tolerate its absence.
      When absent, use the value captured from stdout.
- [ ] 2.4 Wire it together in `OpenCode.create/1`: pass `server.password` into
      `create_client/1` so `{:ok, %{client: client, server: server}}` is
      immediately usable with no extra step. This is the single most important
      ergonomics fix — it keeps the documented one-liner working.
- [ ] 2.5 Document that the password is per-boot and sensitive: never log it,
      never put it in a URL. If `:password` is nil **and** no line was captured,
      fail loudly in `create_server/1` rather than returning a client that will
      401 on every call.

**Verify:** a test that calls `GET /api/info` through a client built by
`OpenCode.create/1` and gets `200`.

---

## Phase 3 — Client runtime fixes

- [ ] 3.1 **Fix SSE detection** (currently a hard hang). `lib/opencode/client.ex:75`
      matches `url in ["/event", "/global/event"]`; the v2 path is `/api/event`.
      Replace the literal allowlist — hardcoding a second path list just
      recreates the bug. The spec declares the response as `text/event-stream`,
      so key off that when the generated call exposes it, and keep
      `"/api/event"` as the fallback:

      ```elixir
      defp sse?(%{url: "/api/event", method: :get}), do: true
      defp sse?(_), do: false
      ```

- [ ] 3.2 **Handle SSE comments and partial chunks.** The v2 stream interleaves
      `: heartbeat` comment lines. The existing `decode_sse/1` already filters to
      `data:`-prefixed lines, so `: heartbeat` yields `[]` — verify rather than
      assume, and add a test. Also confirm a multi-line `data:` block is joined
      (current code does `Enum.join("\n")`).
- [ ] 3.3 **Handle 204 No Content.** Many v2 operations return 204
      (`session.update`, `session.switch_model`, `session.switch_agent`,
      `session.move`, `session.view`, `session.environment`, `session.background`,
      `session.revert.commit`, `session.revert.clear`). Verified:
      `Session.experimental_session_wait` returns `{:ok, ""}`. Return `:ok`
      instead of `""` so callers can `assert :ok = …`.
- [ ] 3.4 **Decide and implement the error shape.** The generated `@spec`s
      advertise `{:error, InvalidRequestErrorEncoded.t() | …}`, but
      `Client.request/1` returns `{:error, {status, body}}` and never reads the
      `:response` map. Recommended: keep `{:error, {status, body}}` (no
      decoding) so key conventions stay consistent, and add Phase 5.4's
      `OpenCode.Error` helper. If the user prefers typed structs instead, decode
      via the `response:` map + `__fields__/1` and document the third key style.
- [ ] 3.5 **Undocumented envelope.** Most reads return `{location, data}` and
      list/session reads return `{data, cursor}`; the spec types these as bare
      `object`/`array`, so generated types say `map`. Keep the client honest
      (raw bodies) and cover it in Phase 6 + 5.3.
- [ ] 3.6 Keep `add_directory/2` (`x-opencode-directory`) as-is — re-verified
      working in v2. Do **not** switch to the `?location=` query param: the
      server wants an object there and returns
      `400 Expected object | undefined at ["location"]`.

**Verify:** `Event.event_subscribe/1` yields a stream that produces
`%{"id" => "evt_…", "type" => "server.connected", "data" => %{}}` within 5 s.

---

## Phase 4 — Server and TUI lifecycle

- [ ] 4.1 Fix readiness parsing: `parse_url/1` matches
      `"opencode server listening"`, which v2 never prints. Match
      `"server listening on <url>"`.
- [ ] 4.2 Fix the health probe. `health_ok?/1` hits `/global/health`, which in
      v2 returns **200 with the SPA's HTML**. This is a silent-corruption bug:
      readiness "succeeds" against a page that is not the API. Switch to
      `GET /api/info` and require a JSON body containing a `"version"` key —
      never accept a bare 200.
- [ ] 4.3 Probe with credentials, using the same password as 2.3, and 401-aware:
      treat `401` as *healthy* (the server is up) but *not authenticated*, so a
      password bug surfaces as a clear error rather than a timeout.
- [ ] 4.4 Confirm the remaining `build_args/3` behaviour still holds: `--log-level`
      is a global flag but cobra accepts it after `serve` (verified), and
      `--port` is always passed explicitly so the 4096 default stays correct
      (with no `--port`, v2 picks 4097).
- [ ] 4.5 Review `OpenCode.Tui`: it passes only `--project/--model/--session/--agent`
      and replaces the whole env with `OPENCODE_CONFIG_CONTENT`, dropping
      `PATH` and everything else the CLI needs. Confirm whether v2's TUI still
      accepts those flags; if not, either map to the v2 equivalents or
      deprecate `create_tui/1` with a clear error rather than spawning a broken
      process.

**Verify:** `OpenCode.create_server/1` returns well under the timeout on a
machine where 4096 is free, and the health assertion in the test uses `/api/info`.

---

## Phase 5 — Public API surface

- [ ] 5.1 Rewrite the `OpenCode` moduledoc. Every code sample in it is v1 and
      now wrong. The flagship example must become the async flow:

      ```elixir
      alias OpenCode.Generated.Session

      {:ok, %{"data" => session}} = Session.session_create(%{title: "My session"}, client)
      id = session["id"]

      {:ok, %{"data" => inbox}} = Session.session_prompt(id, %{text: "Hello!"}, client)
      # inbox["delivery"] == "steer" | "queue" — the turn is queued, not finished

      {:ok, _} = Session.experimental_session_wait(id, client)

      {:ok, %{"data" => messages}} = Session.session_message_list(id, client)
      ```

- [ ] 5.2 Add `OpenCode.unwrap/1` for the envelopes:

      ```elixir
      @spec unwrap(map() | list()) :: {:ok, term()} | {:error, term()}
      def unwrap(%{"data" => data}), do: {:ok, data}
      def unwrap(other), do: {:ok, other}
      ```

      Plus a `text/1` convenience that pulls
      `Session.Message.Assistant.Text` out of an assistant message's `content`
      list. Guard the export surface so this stays a deep, obvious module
      rather than a grab-bag.
- [ ] 5.3 Document the assistant-content model, since it is the biggest
      conceptual change: `Session.Message.Info` is an 11-variant union keyed on
      `"type"` (`user`, `assistant`, `system`, `synthetic`, `skill`, `shell`,
      `compaction`, `idle`, `agent-selected`, `model-selected`,
      `location-switched`), and assistant text lives in
      `content[]` with `type: "text"` — **not** in a top-level `parts` array.
- [ ] 5.4 Add `OpenCode.Error` so callers can pattern-match on the typed error
      envelope without stringly-typed status juggling:

      ```elixir
      def tag({:error, {_status, %{"_tag" => tag}}}), do: {:ok, tag}
      def tag({:error, _}), do: :error
      ```

      Cover `SessionNotFoundError`, `InvalidRequestError` (with its
      `kind`/`field`), `UnauthorizedError`, `SessionBusyError`, `ConflictError`,
      `ServiceUnavailableError`, `UnknownError`.
- [ ] 5.5 State the `*Encoded` naming leak in the docs
      (`OpenCode.Generated.InvalidRequestErrorEncoded` etc., ~20 modules) so it
      reads as a known upstream artefact rather than an SDK bug. Do **not** add a
      rename pass — regenerated code would undo it.
- [ ] 5.6 Note the operations-module map (from `research/codegen.md` C2) in the
      moduledoc: `Session` (64 fns), `Pty` (14), `Permission` (13), `Mcp` (8),
      `Integration` (21), `Shell`/`Vcs` (10 each), `Agent`/`Model`/`Provider`/
      `Project` (4 each), etc. `Operations` no longer exists.

**Verify:** `mix docs` builds with no broken references.

---

## Phase 6 — Docs and examples

- [ ] 6.1 Rewrite `README.md`. Stale today in at least these ways: "All
      operations live in `OpenCode.Generated.Operations`"; `global_health`;
      `session_prompt` returning `%{"info", "parts"}`; `parts:` request bodies;
      `model:` in the prompt body; the whole `tui_*`, `question_*`, `auth_*`,
      `app_*`, `find_symbols` sections; `session_messages`/`session_abort`/
      `session_share`/`session_summarize`/`session_unrevert`; and the create
      options table.
- [ ] 6.2 Add a **"Migrating from 0.1.x"** section with an explicit old→new
      table. Build it from `/tmp/v1_ops.txt` (0.2) against the new surface.
      Minimum rows:

      | 0.1.x | v2 |
      | --- | --- |
      | `Operations.global_health/1` | `OpenCode.Generated.Info.info/1` (`GET /api/info`) |
      | `Operations.session_create/2` | `Session.session_create/2` (returns `%{"data" => …}`) |
      | `Operations.session_messages/2` | `Session.session_message_list/2` (returns `%{"data" => …, "cursor" => …}`) |
      | `Operations.session_prompt/3` returning parts | `Session.session_prompt/3` returns the **inbox item**; poll `session_message_list` or stream `/api/event` |
      | `Operations.session_abort/2` | `Session.session_interrupt/2` |
      | `Operations.session_revert/3` + `session_unrevert/2` | `Session.session_revert_stage/3` → `…_commit/2` / `…_clear/2` |
      | `Operations.session_summarize/3` | `Session.session_compact/3` |
      | `Operations.session_share/…` | removed (not in v2) |
      | `Operations.question_*/…` | `Permission.permission_request_list/…`, `Session.session_permission_reply/…` |
      | `Operations.tui_*/…` | removed (TUI control routes gone) |
      | `Operations.auth_set/3` | `Credential.credential_update/…` or `Integration.integration_connect_key/…` |
      | `Operations.event_subscribe/1` | `Event.event_subscribe/1` |
      | `Operations.mcp_status/1` | `Mcp.mcp_list/1` |
      | `Operations.app_agents/1` | `Agent.agent_list/1` |
      | `Operations.file_read/file_list` | `Filesystem.fs_read/…`, `Filesystem.fs_list/1` |

- [ ] 6.3 Add an auth section to the README covering all three ways to
      authenticate: managed server (automatic), `password:` option, and
      `OPENCODE_SERVER_PASSWORD` env. Warn that the password is per-boot.
- [ ] 6.4 Rewrite `examples/hello.exs`. It is v1 in three places: it calls
      `session_prompt` with `parts:`, then reads `response["parts"]`. Both are
      gone. New flow: create → prompt with `%{text: …}` →
      `experimental_session_wait` → `session_message_list` → print
      `content` entries where `type == "text"`.
- [ ] 6.5 Rewrite `examples/chat.exs` (459 lines). It depends on
      `global_health`, `file_list`, `session_list` as a bare array,
      `session_messages` as `[%{"info", "parts"}]`, `session_diff`,
      `session_delete`, and the `parts:` prompt body — every one changed.
      Because prompt→response is now async, the REPL also needs to render
      *streaming* progress, not one blocking response. Decide deliberately
      whether to stream `/api/event` (nicer) or poll `session_message_list`
      (simpler); document the choice in the file header.
- [ ] 6.6 Update the `create/1` and `create_client/1` option tables
      (README 2 tables) and `mix.exs`'s `description/0`, which still says the
      SDK "Mirrors the functionality of the official JavaScript SDK
      (@opencode-ai/sdk)" without noting the v2 surface.
- [ ] 6.7 Update the "Regenerating" section to point at the v2 spec source and
      the new default.

**Verify:** `mix run examples/hello.exs` completes and prints assistant text
against a real `opencode` v2 server.

---

## Phase 7 — Tests

- [ ] 7.1 Rewrite `test/opencode/server_test.exs`. It asserts
      `Operations.global_health(client) == %{"healthy" => true}`, which fails
      twice over in v2 (route gone, and 401 without a password). Keep the good
      XDG sandbox in `setup`; add `OPENCODE_SERVER_PASSWORD` so the test does
      not have to scrape stdout, and keep the
      `System.find_executable("opencode")` skip.
- [ ] 7.2 Add a `Server` test asserting readiness uses `/api/info` and that a
      non-JSON 200 is **rejected** — the regression guard for 4.2.
- [ ] 7.3 Add a `Client` test for SSE: `Event.event_subscribe/1` must yield
      `server.connected` within a few seconds and must not hang. This is the
      regression guard for 3.1. Use a short `receive_timeout` so a regression
      fails fast instead of hanging CI.
- [ ] 7.4 Add a 204 test: `Session.session_update/…` (or `switch_model`) returns
      `:ok`, not `""`.
- [ ] 7.5 Add a Client unit test for the auth header construction and for
      `x-opencode-directory` being preserved.
- [ ] 7.6 Add an envelope test asserting `OpenCode.unwrap/1` on a
      `%{"location" => …, "data" => […]}` body and on a bare array.
- [ ] 7.7 Add a codegen guard so the next upstream spec change cannot silently
      break compilation: a test (or CI step) that runs
      `mix opencode.gen.client` into a temp dir and asserts the expected module
      set — at minimum that per-tag modules exist and that `Operations` does not.

**Verify:** `mix test` green with the CLI installed; all new tests skip cleanly
without it.

---

## Phase 8 — CI and release

- [ ] 8.1 Repoint `.github/workflows/sync-openapi.yml` from
      `https://raw.githubusercontent.com/anomalyco/opencode/dev/packages/sdk/openapi.json`
      (v1) to `https://opencode.ai/v2/openapi.json`.
- [ ] 8.2 Add a `mix compile` step **before** the commit step. Today a broken
      generation would still be tagged and published, because the commit is
      gated only on "the spec file changed".
- [ ] 8.3 Stop the unconditional patch bump. Make the bump major when
      `info.title` or the path set changes shape, minor for additive changes,
      patch otherwise — or, simpler and safer, require a manual trigger
      (`workflow_dispatch`) for anything above patch.
- [ ] 8.4 Gate `mix hex.publish` behind a human approval step (GitHub
      environment protection) for non-patch bumps. A published breaking release
      is not reversible on Hex.
- [ ] 8.5 Bump `mix.exs` `@version` to **`1.0.0`**, and reconcile
      `docs.source_ref: "v#{@version}"`. The change is unambiguously breaking:
      `Operations` removed, ~122 endpoints removed, all paths re-prefixed, auth
      mandatory, `session_prompt` semantics changed. `0.1.x` is pre-1.0 so Hex
      will not enforce semver — say so in the changelog.
- [ ] 8.6 Fill in `CHANGELOG.md` (created in 0.3) with the 1.0.0 entry, the
      migration table from 6.2, and the three breaking "must read" items:
      auth, async prompt, per-tag modules.
- [ ] 8.7 Consider pinning the spec by vendoring (the file is already committed
      at `priv/opencode_openapi.json`) and syncing on a schedule without
      auto-publishing. The v2 surface is documented as experimental and
      "selected instance routes", so it can change without notice.

**Verify:** workflow YAML parses; a dry run with `workflow_dispatch` regenerates
cleanly and stops before publishing.

---

## Final verification

- [ ] `mix compile --force --warnings-as-errors` → clean
- [ ] `mix format --check-formatted` → clean
- [ ] `mix test` → green
- [ ] `mix run examples/hello.exs` → prints real assistant text
- [ ] `mix docs` → builds, no unresolved references
- [ ] Manual: `OpenCode.create()` then `Info.info/1` returns
      `%{"version" => "2.x"}` with no manual auth plumbing

---

## Risks

1. **The v2 surface is explicitly experimental.** The spec's own description
   says "Experimental HttpApi surface for **selected** instance routes", and the
   live server's `/openapi.json` is a *different subset* (115 paths) from the
   published one (113 paths) while adding two undocumented routes. Whatever we
   generate can shift under us. Mitigation: pin the vendored spec, keep the
   Phase 7.7 codegen guard, and treat the daily sync as informational rather
   than auto-publishing.

2. **Three silent-failure modes are already latent and the same class of bug.**
   (a) `health_ok?/1` accepts the SPA's 200 HTML as healthy; (b) the SSE
   allowlist misses `/api/event` and hangs instead of erroring; (c) missing
   auth returns a 401 that a caller may read as "server said no" rather than
   "client is misconfigured". All three fail quietly. Mitigation: Phase 4.2
   requires JSON with a `version` key, 3.1 keys off the declared content type,
   2.5 fails loudly when the password is unknown, and each gets a regression
   test in Phase 7.

3. **`session_prompt` keeps its name but changes meaning.** This is the trap
   most likely to burn a user mid-upgrade: existing code compiles, gets
   `{:ok, …}`, and silently receives a queue ticket instead of an answer. That
   is the core reason for decision D1 (no compat shim) and for making the
   migration table's first row the prompt change rather than burying it under
   renames.
