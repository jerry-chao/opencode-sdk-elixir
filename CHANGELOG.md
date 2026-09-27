# Changelog

All notable changes to `opencode_sdk` are documented here.

This project is unofficial and is not affiliated with the OpenCode team.

## Unreleased

## 1.0.0 — OpenCode v2

Regenerates the client from the OpenCode v2 HttpApi surface
(`https://opencode.ai/v2/openapi.json`, served by `opencode serve` 2.x) and
reworks the hand-written runtime to match.

This is a **breaking** release. Three things will bite first, in this order:

1. **Authentication is now mandatory.** Every v2 request needs HTTP Basic auth
   with username `opencode` and the per-boot server password. Connect to an
   existing server with `OpenCode.create_client(base_url: url, password: pw)`.
   `OpenCode.create/1` wires this up for you automatically.

2. **`session_prompt` is asynchronous and its meaning changed.** It now returns
   the queued inbox item (`%{"data" => %{"id" => "msg_…", "delivery" => "steer"}}`),
   not the finished assistant turn. The old `parts:` request body and the
   `response["parts"]` read both no longer exist — use `%{text: "…"}` and then
   wait for and read the assistant's `content`. Because the function name
   survives while the semantics change, **existing code will compile and quietly
   return a queue ticket.** See "Migrating from 0.1.x" in the README.

3. **`OpenCode.Generated.Operations` no longer exists.** v2 operations are
   grouped into per-tag modules (`OpenCode.Generated.Session`,
   `.Agent`, `.Pty`, `.Permission`, …) and function names gained a tag prefix
   (`Operations.app_agents/1` -> `Agent.agent_list/1`).

### Removed

- ~122 v1 endpoints, all of which the v2 server no longer serves (they fall
  through to the web UI): `global/*`, `tui/*`, `question/*`, `sync/*`,
  `auth/*`, `lsp`, `formatter`, `find/symbol`, `session/{id}/share`,
  `session/{id}/todo`, `session/{id}/children`, `session/{id}/summarize`,
  `experimental/workspace*`, `experimental/console*`.
- `OpenCode.Tui` process helpers are deprecated pending review — see the
  migration table in the README.

### Added

- `GET /api/info` (`OpenCode.Generated.Info.info/1`) as the readiness probe,
  replacing `/global/health`.
- Session inbox (`session_inbox_list/2`, `session_inbox_update/3`,
  `session_inbox_cancel/3`), forms, websearch, worktree, VCS, plugin, RPC,
  project, credential, integration, and `persistent-pty` resources.
- `OpenCode.Error` for matching the typed `{"_tag" => …}` error envelope.
- `OpenCode.unwrap/1` and `OpenCode.text/1` for the `{location, data}` and
  `{data, cursor}` response envelopes, which the spec does not describe.
- `:password` / `:username` options on `OpenCode.create_server/1` and
  `OpenCode.create_client/1`.
- `CHANGELOG.md` (this file).

### Changed

- All paths are now under `/api`.
- SSE moved to `GET /api/event`; the stream interleaves `: heartbeat` comments.
- 204 No Content responses return `:ok` rather than `""`.
- `OpenCode.Server` readiness now requires a JSON body from `/api/info`
  containing a `version` key. Previously it accepted a 200 from the web UI's
  HTML fallback.
- `x-opencode-directory` is unchanged and remains the supported way to scope a
  request to a directory; the `?location=` query parameter is not.
