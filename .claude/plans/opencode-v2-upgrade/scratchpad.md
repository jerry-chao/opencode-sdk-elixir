# Scratchpad — upgrade opencode-sdk-elixir to OpenCode v2

Status: RESEARCH COMPLETE — plan at `plan.md`

## Concern tracks

- [x] T1 `[codegen]` oapi_generator vs. the v2 spec — does it compile? naming? breakage?
      -> `research/codegen.md`
- [x] T2 `[runtime]` `OpenCode.Client` — `/api` path prefix, SSE detect, response shapes
      -> `research/runtime-verification.md` R1-R10, C7
- [x] T3 `[runtime]` `OpenCode.Server` / `OpenCode.Tui` — readiness probe, CLI flags, port
      -> `research/runtime-verification.md` R1, R2, R4, R9
- [x] T4 `[schema]` Domain-model delta v1→v2 -> `research/schema-delta.md`
- [x] T5 `[surface]` Public API ergonomics + migration guide
      -> folded into `research/codegen.md` C2-C4 and `plan.md` Phase 5/6
- [x] T6 `[ci]` Spec source + workflow updates -> `research/ci-and-packaging.md`

Note: the Phoenix-specific tracks (`[ecto]`, `[liveview]`, `[oban]`, context
boundaries) do not apply — this is a codegen'd HTTP client library with no
Phoenix/Ecto/Oban surface.

## Headline findings

1. **Codegen is fine.** `mix opencode.gen.client --spec <v2>` -> 268 files in
   15-60 s, `mix compile --force` -> 0 errors / 1 pre-existing warning, 2 `@type`
   injections. No generator workaround needed. (C1)
2. **Auth is the blocker.** v2 requires HTTP Basic `opencode:<password>` on
   *every* request. `Client.request/1` sends no credentials, so today every
   operation would 401. (R3, C6)
3. **Prompts are async now.** `session.prompt` returns the queued inbox item,
   not the assistant turn. `session.prompt`'s name survives but its meaning does
   not — so a compat shim would fail *silently*. (R7, C6)
4. **`Operations` is gone.** Per-tag modules instead (`Session`, `Agent`, …);
   function names gained tag prefixes (`agent_list`, not `list`). (C2)
5. **Readiness detection is doubly broken.** Startup line changed to
   `server listening on …`, and `/global/health` now returns the SPA's HTML
   with status 200. (R1, R2)
6. **SSE hangs.** `client.ex` allowlists `["/event", "/global/event"]`; v2 path
   is `/api/event`. Confirmed 300 s hang. (C7)
7. **Most reads are enveloped** as `{location, data}` — undocumented in the
   spec, so generated types say `map`. (R8)
8. **Spec acquisition is dead both ways.** `opencode dev generate` no longer
   exists (exit 1); CI's GitHub raw URL still serves v1. (R9, T6)
9. `x-opencode-directory` still works — keep `add_directory/2` as-is. (R5)

## Decisions taken (with rationale)

- **D1. Clean break, no v1 compat shim, major version.** The server no longer
  serves v1 paths at all (they hit the SPA), so a shim would wrap 200-OK HTML.
  Worse, `session_prompt` keeps its name while changing semantics, so a shim
  would compile *and* misbehave. A loud break is safer than a silent one.
- **D2. Error shape stays `{:error, {status, body}}`.** The generated `@spec`
  advertises decoded `*ErrorEncoded.t()` structs, but decoding would introduce a
  third key convention (snake_case atoms) alongside the string-keyed bodies
  users already handle. Instead: add an `OpenCode.Error` helper for matching on
  `{"_tag" => tag}`, and document that the `@spec` error unions are aspirational.
  *Flagged for user confirmation.*
- **D3. Auth: explicit option + stdout capture.** `Server.create(password: …)`
  sets `OPENCODE_SERVER_PASSWORD` (verified to work, and it suppresses the log
  line); `Server.create/1` also captures the generated `server password …` line
  and `create_client/1` sends `auth: {:basic, "opencode:#{pw}"}` via Req.
- **D4. Readiness = parse `server listening on <url>` + probe `GET /api/info`.**
  Never accept a non-JSON 200 as healthy (that was the old silent bug).
- **D5. No response decoding.** Return raw bodies. Add a documented
  `OpenCode.unwrap/1` for the `{location, data}` / `{data, cursor}` envelopes
  rather than hiding it in the client.
- **D6. CI stops auto-publishing on breaking changes** and gates the commit on a
  successful `mix compile`.

## Dead ends / things NOT to do

- Do **not** try to "fix" an oapi_generator hang — the first run looked like a
  15-minute hang; it was stale `_build` from a `pkill`-ed run. Clean run: 15 s.
- Do **not** chase the "Unknown type: nil" warning; it also appears on the v1
  spec and is harmless.
- Do **not** try to reach `raw.githubusercontent.com` from this sandbox (network
  blocked) — the v2 spec must come from `https://opencode.ai/v2/openapi.json`.
- Do **not** assume `?location=` works as a query string; the server wants an
  object and `x-opencode-directory` is the supported mechanism.
- Do **not** use `timeout`/`gtimeout` — not installed on this macOS box.
- Do **not** use `path` as a shell loop variable in zsh; it clobbers `PATH`.
