# T2/T3 — Runtime verification against a live OpenCode v2 server

CLI: `opencode v2.0.18` (`/Users/easemob/.nvm/.../bin/opencode`)

Probe server: `opencode serve --hostname=127.0.0.1 --port=4199` in an isolated
XDG sandbox.

## R1 — Startup output changed → `Server.create/1` readiness is broken

```
$ opencode serve --hostname=127.0.0.1 --port=4199
server listening on http://127.0.0.1:4199
server password 7JvZBtkRsZQYbXBcOZ4EkEw4sl1ybjDQA_nb46Kk700
```

`server.ex:120 parse_url/1` matches on the literal `"opencode server listening"`.
v2 prints `"server listening on ..."`. **The regex never matches**, so
`create_server/1` always falls through to the deadline branch.

## R2 — `/global/health` is gone AND the SPA answers 200

```
GET /global/health  -> 200  content-type: text/html  ("<!doctype html>…")
GET /agent          -> 200  text/html
GET /session        -> 200  text/html
GET /file/status    -> 200  text/html
GET /api/info       -> 200  application/json
```

Unmatched paths fall through to the SPA catch-all, so `health_ok?/1`
(`server.ex:137`) **returns true on an HTML page** — readiness is reported for
an arbitrary wrong path. `/api/info` (`ServerInfo`) is the v2 replacement.

Note: the v1 spec's 122 non-`/api` paths are NOT served in v2. The v2 spec's
"selected instance routes" wording is accurate: it is a *different*, not merely
renamed, surface.

## R3 — v2 requires HTTP Basic auth (BREAKING)

```
GET /api/info  (no auth)   -> 401 {"_tag":"UnauthorizedError","message":"Authentication required"}
Authorization: Bearer <pw> -> 401
x-api-key: <pw>            -> 401
?password=<pw>             -> 401
Authorization: Basic base64("opencode:<pw>")  -> 200
```

Username is the literal `opencode`; password is the per-boot random value
printed on the server's stdout as `server password <pw>`.
`Client.request/1` sends no credentials → **every operation returns
`{:error, {401, ...}}`**.

`ServerInfo`:
```json
{"version":"2.0.18","pid":36030,"urls":["http://127.0.0.1:4199"],"paths":{"tmp":"…"}}
```

## R4 — Password can be pinned, which suppresses the stdout line

```
OPENCODE_SERVER_PASSWORD=hunter2 opencode serve --port=4202
  -> "server listening on http://127.0.0.1:4202"   (NO password line)
  -> Basic opencode:hunter2 => 200

config/opencode.json {"server":{"password":"hunter3"}}   -> IGNORED (still random)
```

So `Server.create/1` must handle "no `server password` line" as a valid case.

## R5 — `x-opencode-directory` header still honoured; `?location=` is an object

```
GET /api/location
  -H 'x-opencode-directory: /Users/easemob/work/elixir/opencode-sdk-elixir'
  -> {"directory":"/Users/easemob/work/…","project":{…}}          OK

GET /api/location?location=/Users/...    -> 400 {"_tag":"InvalidRequestError",
                                                "message":"Expected object | undefined\n  at [\"location\"]"}
```

`client.ex:62 add_directory/2` still works unchanged. The spec types `location`
as an untyped query param; the server wants `{directory: ...}`.

## R6 — SSE works, envelope + heartbeat comments

```
GET /api/event  (Basic auth, accept: text/event-stream)
data: {"id":"evt_0e30943fd001ddNF4Y5rlyrlQT","type":"server.connected","data":{}}

: heartbeat
```

`client.ex:75 sse?/1` matches `url in ["/event", "/global/event"]` — v2 path is
`/api/event`, so SSE detection fails and the client would try to JSON-decode the
stream. Unauthenticated `/api/event` -> 401.

## R7 — `session.prompt` is now ASYNCHRONOUS (the big one)

```
POST /api/session  {"title":"probe"}
  -> 200 {"data":{"id":"ses_f1cf…","projectID":"…","cost":0,
                  "tokens":{…},"time":{…},"title":"probe","location":{…}}}

POST /api/session/{id}/prompt  {"text":"say hi"}
  -> 200 {"data":{"id":"msg_0e3…","sessionID":"ses_…","time":{"created":…},
                  "type":"user","payload":{"text":"say hi"},"delivery":"steer"}}

POST /api/session/{id}/prompt  {"parts":[{"type":"text","text":"hi"}]}   # v1 shape
  -> 400 {"_tag":"InvalidRequestError","message":"Missing key\n  at [\"text\"]",
          "kind":"Payload"}

GET /api/session/{id}/inbox
  -> 200 {"data":[]}

GET /api/session/{id}/message
  -> 200 {"data":[{"id":"msg_…","time":{…},"text":"say hi","type":"user"}],
          "cursor":{"previous":"eyJ…","next":"eyJ…"}}
```

- v1 returned `%{"info" => …, "parts" => …}` (the finished assistant turn).
  v2 returns the **queued inbox item**. There is no synchronous prompt.
- `model:` and `parts:` are gone from the prompt body; it is now
  `text` + `files` + `agents` + `skills` + `metadata` + `delivery` + `resume`.
- Model selection moved to `POST /api/session/{id}/model` (`{model: Model.Ref}`)
  and `session.create`.
- `session.create` and `session.message.list` are both `{data, cursor}`-shaped;
  the spec types them as bare inline `"object"`.

## R8 — Almost every read endpoint returns a `{location, data}` envelope

```
GET /api/agent     -> {"location":{"directory":"…"},"data":[…]}
GET /api/model     -> {"location":{"directory":"…"},"data":[…]}
GET /api/provider  -> {"location":{"directory":"…"},"data":[…]}
GET /api/skill     -> {"location":{"directory":"…"},"data":[…]}
GET /api/command   -> {"location":{"directory":"…"},"data":[…]}
GET /api/mcp       -> {"location":{"directory":"…"},"data":[]}
GET /api/plugin    -> {"location":{"directory":"…"},"data":[]}
GET /api/vcs       -> {"location":{"directory":"…"},"data":{"branch":{}}}
GET /api/location  -> {"directory":"…","project":{…}}      (no envelope)
GET /api/session   -> {"data":[],"cursor":{…}}
GET /api/config    -> [ {"type":"directory", …} ]           (bare array)
GET /api/project   -> [ {"id":"…", …} ]                     (bare array)
```

The envelope is **not in the spec** (all typed as inline `"object"`/`"array"`),
so the generated code will say `map` / `[map]` and users must reach into
`body["data"]`. This needs documenting or a helper.

## R9 — `opencode serve` flags

```
$ opencode serve --help
  --hostname string   --port integer   --cors string   --service   --stdio
GLOBAL: --log-level <all|trace|debug|info|warn|warning|error|fatal|none>
        --print-logs
```

- `--log-level` is a **global** flag but cobra accepts it after the subcommand:
  `opencode serve --port=4201 --log-level=error` starts fine. `server.ex:53
  build_args/3` needs no change here.
- With no `--port`, v2 picks **4097** (4096 was occupied). `server.ex` always
  passes `--port` explicitly, so 4096 stays correct.
- `opencode dev generate` **no longer exists** in v2 — `opencode dev` prints the
  root help and **exits 1**. `opencode.gen.client`'s `fetch_spec_from_cli/0`
  would write 2 KB of help text into `priv/opencode_openapi.json`.
  (It matches on exit status `0`, so it would have failed loudly — good — but
  the HTTP fallback then points at the wrong port.)

## R10 — Where the v2 spec lives

| URL | title | paths | verdict |
| --- | --- | --- | --- |
| `https://opencode.ai/v2/openapi.json` | `opencode HttpApi` | 136 | **canonical v2** |
| `https://opencode.ai/openapi.json` | `opencode` | 162 | still **v1** |
| `GET <server>/openapi.json` (v2.0.18) | `opencode HttpApi` | 115 | live subset |
| `https://raw.githubusercontent.com/…/packages/sdk/openapi.json` | — | — | network-blocked here; this is what CI uses today |

Live-vs-published v2 diff: published is a superset; live adds 2 undocumented
paths (`/api/pair`, `/auth/connect/{code}`).
`/api/openapi.json` -> 404. `/doc` -> 200 HTML.

The v2 mix task default base URL `http://127.0.0.1:3000` is wrong (server
default is 4096/4097, and the spec endpoint is `/openapi.json` not
`/openapi.json` under `/api`).
