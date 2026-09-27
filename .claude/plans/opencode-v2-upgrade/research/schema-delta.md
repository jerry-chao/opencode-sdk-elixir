# T4 — Domain-model delta: v1 spec vs v2 spec

Sources: `priv/opencode_openapi.json` (v1, `info.title = "opencode"`, 162 paths,
472 schemas) and `research/v2_openapi.json` (v2, `info.title = "opencode HttpApi"`,
136 operations, 245 schemas).

## 1. Surface size and shape

| | v1 | v2 |
| --- | --- | --- |
| paths | 162 | 136 |
| operations | ~162 | 136 |
| schemas | 472 | 245 |
| prefix | mixed: `/session`, `/agent`, `/event` **and** `/api/...` | **all** `/api/...` |
| generated modules | 1084 | (see T1) |

**122 paths removed, 73 added.** But per the live probe (R2 in
`runtime-verification.md`) the v1 paths are *not* served in v2 — they hit the SPA
catch-all. So removal is real, not cosmetic.

## 2. Resource groups

Removed in v2: `auth/*`, `tui/*`, `question/*`, `sync/*`, `lsp`, `formatter`,
`find/symbol`, `experimental/workspace*`, `experimental/console*`,
`experimental/capabilities`, `experimental/control-plane/*`, `global/*`
(`health`, `dispose`, `upgrade`, `event`, `config`), `instance/dispose`,
`session/{id}/share`, `session/{id}/todo`, `session/{id}/init`,
`session/{id}/children`, `session/{id}/summarize`.

New in v2: `info`, `location(+reload)`, `plugin(list/check/update)`,
`project(list/update)`, `shell(5)`, `reference`, `rpc`, `websearch(2)`,
`worktree(4)`, `vcs(5)`, `debug/location(2)`, `config/shell`,
`experimental/config`, `experimental/generate`, `experimental/fs/write`,
`experimental/integration/wellknown`, `experimental/mcp/*`, `experimental/migration/v1`,
`persistent-pty/*` (11), `session/{id}/inbox(3)`, `session/{id}/form(5)`,
`session/{id}/view`, `session/{id}/move`, `session/{id}/environment`,
`session/{id}/generate`, `session/{id}/background`, `session/{id}/synthetic`,
`session/{id}/context`, `session/{id}/interrupt`,
`session/{id}/permission(4)`, `session/{id}/log`,
`experimental/session/{id}/skill`, `experimental/session/{id}/instructions/entries(3)`,
`experimental/session/{id}/terminal(2)`, `experimental/session/{id}/terminal/read`,
`experimental/session/import`, `experimental/session/stats`,
`experimental/session/{id}/export`, `experimental/session/{id}/wait`,
`credential/{id}(3)`, `mcp/resource`, `model/default`, `form` (location-level).

## 3. Message model — fully rewritten

**v1**: `Message{role, …}` + `parts: [Part]`, where `Part` was a union of
TextPart / ToolPart / ReasoningPart / StepStartPart / StepFinishPart / FilePart /
PatchPart / AgentPart / SnapshotPart. `session.prompt` returned
`{info, parts}`.

**v2**: `Session.Message.Info` is a union of **11 message kinds**, each carrying
its own payload inline. There is no separate `parts` array.

| variant | notable fields |
| --- | --- |
| `AgentSelected` | `agent`, `previous` |
| `ModelSelected` | `model: Model.Ref`, `previous: Model.Ref` |
| `LocationSwitched` | `projectID`, `subpath`, `location`, `previous` |
| `User` | `text`, `files`, `agents`, `skills` |
| `Synthetic` | `text`, `description` |
| `System` | `text`, `description` |
| `Skill` | `skill`, `name`, `text` |
| `Shell` | `shellID`, `command`, `status`, `exit`, `output` |
| `Assistant` | `agent`, `model`, `content[]`, `cost`, `tokens`, `error`, `retry`, `finish` |
| `Compaction` | `Running` / `Completed` / `Failed` |
| `Idle` | `outcome` |

Assistant content is now a union of `Text` / `Tool` / `Reasoning`:
- `Assistant.Text`: `type`, `text`, `state`
- `Assistant.Tool`: `type`, `id`, `name`, `executed`, `state`, `providerState`, `providerResultState`, `time`
- `ToolState`: `Streaming` / `Running{status,input,metadata}` /
  `Completed{status,input,content[],metadata}` / `Error`
- `Tool.Content` = `TextContent{type,text}` | `FileContent{type,uri,mime,name}`

The old `"tool-invocation"` / `"step-start"` / `"step-finish"` / `"patch"` /
`"file"` part types are **gone**.

## 4. Prompt is asynchronous; inbox is a new concept

`POST /api/session/{id}/prompt` body:
```
id?  text (required)  files[]  agents[]  skills[]  metadata?  delivery?  resume?
```
`delivery` is `Session.Inbox.Delivery` = `"steer" | "queue"`.
Response `200` = `{data: Session.Inbox.User}` — the queued inbox entry, **not** the
assistant turn (confirmed live, R7).

`GET /api/session/{id}/inbox` -> `{data: [Session.Inbox.Info]}` where
`Session.Inbox.Info` = `User | Synthetic | Compaction | Move`, each with
`payload` + `delivery`. `PATCH`/`DELETE` on `/inbox/{inboxID}` to update/cancel.

Practical consequence: to get the assistant's text you must either subscribe to
`GET /api/event` and follow the message events, or poll
`GET /api/session/{id}/message` and filter the `Session.Message.Assistant`
variant. **This is the single biggest ergonomic change and the README/examples
must be rewritten around it.**

## 5. Permissions replace Questions

- v1 had `question/*` (`question_list`, `question_reply`, `question_reject`) and
  a location-level `permission/*`.
- v2 has `Permission` everywhere:
  `Permission.Request{id, sessionID, action, resources[], save[], metadata, source, message}`,
  `Permission.Reply` = `"once" | "always" | "reject"`,
  `Permission.Rule{action, resource, effect}`, `Permission.Effect` =
  `"allow" | "deny" | "ask"`, `Permission.Ruleset` = `Permission.Rule[]`,
  plus `PermissionSaved.Info` and per-session routes
  `GET/POST /api/session/{id}/permission[/{requestID}[/reply]]`.
- `Agent.Info.permissions` is a `Permission.Ruleset`; `Session.Info.permissions`
  too; `session.create` accepts a `ruleset`.

## 6. Model reference changes

- v1 prompt body: `model: {providerID, modelID}`.
- v2: `Model.Ref{id, providerID, variant}` — note **no `modelID`**, and `id` is
  the combined `provider/model` string. `Model.Info` still has `modelID` and
  also `canonical`, `family`, `capabilities`, `cost[]`, `limit`, `enabled`.
- Selection is `POST /api/session/{id}/model {model: Model.Ref}` (204) and
  `POST /api/session/{id}/agent {agent}` (204), or at `session.create`.
- `GET /api/model/default` is new.

## 7. Sessions

`Session.Info`: `id`, `parentID?`, `fork?{sessionID,boundary}`, `projectID`,
`agent`, `model: Model.Ref`, `cost`, `tokens`, `outcome?`, `time{created,updated,idle,viewed,archived}`,
`title?`, `subpath?`, `metadata`, `permissions: Ruleset`, `revert: Session.Revert`,
`location: Location.PublicRef`.

- `Session.Metadata` is an open object in the spec (empty).
- `TokenUsage.Info` = `{input, output, reasoning, cache{read, write}}` (cache
  became an object; v1 had flat `cacheRead`/`cacheWrite`).
- `Revert` is now 3-stage: `revert/stage` -> `revert/commit` / `revert` (clear),
  replacing v1's `revert` / `unrevert`.
- `SessionStats.Info`, `SessionTransfer.Data{info, messages}`,
  `SessionLogItemEncoded` (a bare `string`) are new.
- `SessionInterruptResponse{interrupted: bool}` — semantics: whether *this*
  process owned the execution.
- `Session.Active` (`GET /api/session/active`) is new; `GET /api/session` is now
  paginated with `limit/order/search/parentID/directory/project/subpath/cursor`
  and returns `{data, cursor}`.

## 8. Config

- v1: `GET /config`, `GET /config/providers`, `POST /config`, `GET /global/config`.
- v2: `GET /api/config` -> **bare array** of `Config.DocumentEncoded` /
  `Config.DirectoryEncoded`; `PATCH /api/experimental/config` with `Config.Patch`
  (`{shell}` only — a very thin patch surface); `GET /api/config/shell` ->
  `ConfigShell.Option[]`.
- `Config` schema set is large (`AgentEncoded`, `CommandEncoded`, `LSP.ServerEncoded`,
  `ModelEncoded`, `ProviderEncoded`, `Plugin.EntryEncoded`, `Reference.GitEncoded`,
  `WarmingEncoded`, `Worktree`, `WebSearch.InfoEncoded`, `Formatter.EntryEncoded`).

## 9. Errors — typed envelope

All v2 errors are `{_tag, message, …}`:

| schema | fields |
| --- | --- |
| `InvalidRequestErrorEncoded` | `_tag`, `message`, `kind?`, `field?` |
| `SessionNotFoundErrorEncoded` | `_tag`, `sessionID`, `message` |
| `MessageNotFoundErrorEncoded` | `_tag`, `messageID`?, `message` |
| `PermissionNotFoundErrorEncoded` | `_tag`, `requestID`, `message` |
| `SessionBusyErrorEncoded` | `_tag`, `sessionID`, `message` |
| `ConflictErrorEncoded` | `_tag`, `message`, `resource?` |
| `UnauthorizedErrorEncoded` | `_tag`, `message` |
| `UnknownErrorEncoded` | `_tag`, `message`, `ref?` |
| `ServiceUnavailableErrorEncoded` | `_tag`, `message`, `service?` |
| `RpcErrorEncoded` / `RpcInternalErrorEncoded` | `_tag`, `type`, `message`, `data?` |
| plus `AgentNotFound`, `CommandNotFound`, `CommandExecutionError`, `FileNotFound`, `Forbidden`, `FormAlreadySettled`, `FormInvalidAnswer`, `FormNotFound`, `InstructionEntryValueTooLarge`, `IntegrationNotFound`, `IntegrationAttemptNotFound`, `IntegrationMethodNotFound`, `InvalidCursor`, `McpServerNotFound`, `ProjectNotFound`, `ProviderNotFound`, `PtyNotFound`, `ShellNotFound`, `SkillNotFound`, `Worktree` |

`401 Unauthorized` is now a **routine** response, not exceptional — worth a
first-class helper.

## 10. Events

`V2EventEncoded` is typed as a bare `string`; the actual SSE payload is
`{id, type, data}` (live: `{"id":"evt_…","type":"server.connected","data":{}}`)
plus `: heartbeat` comment lines. v1's `GlobalEvent`/`Events` schemas and all
`event_tui_*` schemas are gone (no more TUI control routes).

## 11. Things the spec gets wrong / omits (must be handled in docs, not codegen)

1. The `{location, data}` envelope on most reads (R8) — spec says bare
   `object`/`array`.
2. `Session.Metadata` is an empty object (untyped).
3. `location` query param is untyped; server requires an object.
4. `session.prompt` 200 schema is an inline `{data: …}` object rather than a
   named component.
5. `event.subscribe` 200 is `text/event-stream` with an `object` schema.
6. `SessionLogItemEncoded` / `WebSearch.ResponseEncoded` / `*ErrorEncoded` names
   carry a codegen-flavoured suffix — module names will be awkward
   (`OpenCode.Generated.SessionLogItemEncoded`). Worth a rename pass.
