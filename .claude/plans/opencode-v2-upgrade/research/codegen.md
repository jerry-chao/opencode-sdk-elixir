# T1 — oapi_generator vs. the v2 spec (empirically verified)

Sandbox: `/private/var/folders/23/w4cq_fz53g55w59y3f50t54m0000gn/T/opencode/v2gen`
(an rsync of this repo, isolated `_build`).
Toolchain: Elixir 1.20.0 / OTP 29, `oapi_generator 0.4.0` (latest on Hex as of
2025-12-01 — no upgrade available), `req 0.5.17`.

## C1 — `mix opencode.gen.client` on the v2 spec works

```
$ mix opencode.gen.client --spec <v2 spec>
🔧 Generating OpenCode client from: <v2 spec>
✨ Injected 2 missing @type(s) into lib/opencode/generated/integration.ex
✅ Client generation complete!
files: 268
```

```
$ mix compile --force
exit=0
errors: 0
warnings: 1   (the pre-existing `unused require Logger` in the gen task)
```

So **no codegen workaround is required**. The existing `fix_missing_types/0`
post-pass still does its job (2 injections, both in `integration.ex`).

> Misleading first observation: an initial run appeared to hang for 15+ minutes
> with 246 files written and no `operations.ex`. That was stale state from a
> `pkill`-ed run, not a property of the spec. A clean run is 15–60 s. Do not
> "fix" a non-problem here; do add `--force`/clean-`_build` discipline to the
> plan's verification steps.

## C2 — Per-tag operation modules replace `Operations` (public API change)

v1 operationIds/tags produced a single `OpenCode.Generated.Operations`
(4258 lines, 1084 files total).

In v2 the operationIds are dotted (`session.prompt`, `agent.list`,
`server.experimental.persistentPty.snapshot`) and tags are single words
(`session`, `agent`, …). `OpenAPI.Processor.Naming.operation_modules/2` only
splits on `/`, so:

- `modules = []` (no `/` in the id) -> no id-derived module
- `tag_names = ["Session"]`
- result: **one module per tag**

Confirmed output — `operations.ex` is **absent**; these exist instead:

| module | fns | module | fns |
| --- | --- | --- | --- |
| `Session` | 64 | `Integration` | 21 |
| `Pty` | 14 | `Shell` | 10 |
| `Permission` | 13 | `Vcs` | 10 |
| `Mcp` | 8 | `Plugin` | 5 |
| `Agent` / `Model` / `Provider` / `Project` | 4 each | `Config` | 3 |
| `Skill` / `Reference` | 2 each | `Credential` | 3 |
| `Event` / `Debug` / `Location` | 2 each | `Filesystem` | 7 |
| `Command` | 2 | `Rpc` | 1 |

`agent_list/2`, `model_list/1`, `skill_list/1`, `event_subscribe/1` — **not**
`list/1`. The README's "All operations live in `OpenCode.Generated.Operations`"
is now wrong.

## C3 — New `request/1` contract fields the client ignores

Generated calls now pass:

```elixir
client.request(%{
  args: [sessionID: sessionID, body: body],
  call: {OpenCode.Generated.Session, :session_prompt},
  url: "/api/session/#{sessionID}/prompt",
  method: :post,
  body: body,
  request: [{"application/json", :map}],
  response: [
    {200, {OpenCode.Generated.Session, :session_prompt_200_json_resp}},
    {400, {OpenCode.Generated.InvalidRequestErrorEncoded, :t}},
    {401, {OpenCode.Generated.UnauthorizedErrorEncoded, :t}},
    ...
  ],
  opts: opts
})
```

`OpenCode.Client.request/1` currently reads only `:url`, `:method`, `:body`,
`:query`, `:opts`. It **ignores `:response`**, so the `@spec` on every generated
function (`{:error, InvalidRequestErrorEncoded.t() | ...}`) is a lie: the client
actually returns `{:error, {404, raw_body}}` with a string-keyed map.

Inline 200 responses become **map type aliases inside the operation module**,
not modules: `@type session_prompt_200_json_resp :: %{data: SessionInboxUser.t()}`,
`experimental_session_export_200_json_resp`, etc.

## C4 — Module names carry the upstream `Encoded` suffix

`OpenCode.Generated.InvalidRequestErrorEncoded`,
`SessionNotFoundErrorEncoded`, `UnauthorizedErrorEncoded`, … 20 such modules.
Also `V2EventEncoded`, `SessionLogItemEncoded`, `WebSearchResponseEncoded`,
`WorktreeErrorEncoded`. Upstream schema names leak into the public API.

## C5 — Things the spec declares but the generator drops

Zero `$ref` references to `Session.Metadata` and `V2EventEncoded`; no
`session_metadata.ex` / `v2_event_encoded.ex` produced. Harmless dead components,
but they mean "the spec lists 245 schemas" != "the SDK has 245 modules".

Generated code quality is otherwise good: `field_casing: :snake` yields
`session_id`, `provider_id`; enums become `{:enum, ["steer","queue"]}`; consts
become `{:const, "user"}`. `format: date-time` fields are typed `String.t()`
(oapi_generator does not map them to `DateTime`).

## C6 — End-to-end verification against a live v2.0.18 server

With only an `authorization: Basic …` header added to the existing client
(no other change), the freshly generated code works:

```
session_create       -> %{"data" => %{"id" => "ses_…", "projectID" => …, "cost" => 0,
                                     "tokens" => %{"cache" => %{"read"=>0,"write"=>0}, …},
                                     "time" => …, "title" => "e2e", "location" => %{…}}}
agent_list           -> %{"data" => [%{"description" => …, …}], …}       (+ "location" key)
model_list           -> %{"data" => [...], ...}
skill_list           -> %{"data" => [...], ...}
session_prompt(id, %{text: "say hi"})
                    -> %{"data" => %{"delivery" => "steer", "id" => "msg_…",
                                      "payload" => %{"text" => "say hi"},
                                      "sessionID" => "ses_…", "type" => "user"}}
session_inbox_list   -> %{"data" => []}
session_get("ses_does_not_exist")
                    -> {:error, {404, %{"_tag" => "SessionNotFoundError",
                                        "message" => "Session not found: …"}}}
```

And after waiting, `session_message_list` returned the real assistant turn in
the **new** shape — note `content: []`, `finish`, `error`, `model: {id, providerID}`,
plus sibling `"type" => "idle"` and `"type" => "user"` messages:

```elixir
%{
  "agent" => "build",
  "content" => [],
  "error" => %{"message" => "Upstream request failed: …", "status" => 403,
               "type" => "provider.auth"},
  "finish" => "error",
  "id" => "msg_…",
  "model" => %{"id" => "longcat-2.5-preview-free", "providerID" => "opencode-go"},
  "time" => %{"completed" => …, "created" => …},
  "type" => "assistant"
}
```

(The 403 is this sandbox lacking an OpenCode Go subscription — not an SDK fault.
It is, incidentally, a nice demonstration that `Session.Message.StructuredError`
surfaces provider failures on the message rather than as an HTTP error.)

`x-opencode-directory` continues to work unchanged.

## C7 — SSE is broken (confirmed hang)

```
$ mix run sse.exs     # Event.event_subscribe(client)
<hangs indefinitely; killed after 300 s>
```

Cause: `client.ex:75` guards on `url in ["/event", "/global/event"]`, but the
generated call uses `url: "/api/event"`. The client therefore treats it as an
ordinary GET, blocks on the never-ending `text/event-stream` body with
`receive_timeout: :infinity`, and never yields.
