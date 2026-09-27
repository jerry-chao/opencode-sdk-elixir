# T6 — Spec source, CI, and packaging

## Spec source

| candidate | verdict |
| --- | --- |
| `https://opencode.ai/v2/openapi.json` | **use this** — `title = "opencode HttpApi"`, 113 paths / 136 operations / 245 schemas, 532 KB |
| `https://opencode.ai/openapi.json` | still v1 (`title = "opencode"`, 113… 162 paths) — the URL the current CI uses via GitHub |
| `GET <server>/openapi.json` | v2 but a **subset** (115 paths) and gains 2 undocumented paths (`/api/pair`, `/auth/connect/{code}`) |
| `https://raw.githubusercontent.com/anomalyco/opencode/dev/packages/sdk/openapi.json` | what CI uses today; network-blocked from this sandbox, and it serves **v1** |
| `opencode dev generate` | **gone in v2** — `opencode dev` prints root help and exits 1 |

So both halves of the current mix task's spec acquisition are dead:
`fetch_spec_from_cli/0` (R9) and, in practice, the CI's GitHub raw URL.

The mix task's HTTP fallback also guesses `http://127.0.0.1:3000/openapi.json`
— wrong port (v2 serves on 4096/4097) and it will now hit the SPA/401.
`/api/openapi.json` is 404; the correct path is `/openapi.json` **and it needs
Basic auth**.

## CI workflow (`.github/workflows/sync-openapi.yml`)

Current behaviour, all automatic on a daily cron:

1. `curl` the v1 spec from GitHub raw
2. if changed -> `mix opencode.gen.client`
3. bump **patch** version in `mix.exs`
4. `sed` the version in `README.md`
5. commit, **tag**, push `--tags`
6. `mix hex.publish --yes` with `HEX_API_KEY`

Problems for a v2 migration:

- The spec URL must move to the v2 endpoint, and it should be a **pinned
  source of truth** — the docs page itself warns the surface is experimental
  and moves fast.
- Auto-publish with no human gate is wrong for a breaking change. It should at
  minimum stop on a non-patch bump, or be disabled until the migration lands.
- The version bump must become major (or at least minor) when the spec's
  `info.title`/`paths` change shape, not an unconditional patch bump.
- Regeneration should **not** auto-commit if `mix compile` fails. Right now a
  broken generation would still be tagged and published.

## Packaging / version

`mix.exs` is at `@version "0.1.90"`, `elixir: "~> 1.15"`.
The v2 change is unambiguously breaking:

- `OpenCode.Generated.Operations` no longer exists (per-tag modules)
- every operation function is renamed and/or moved
- ~122 endpoints removed
- all paths re-prefixed to `/api`
- auth is now mandatory
- `session.prompt` semantics changed from sync to async

`0.1.x` is pre-1.0 so Hex will not enforce semver, but the README should be
explicit. Recommend `1.0.0` and a `CHANGELOG.md` (the repo has none today).

## Test situation

One test file: `test/opencode/server_test.exs`. It boots a real `opencode serve`
in an XDG sandbox and asserts `Operations.global_health(client) == %{"healthy" => true}`.
That assertion is v1-only on both counts: `/global/health` is gone, and
unauthenticated requests now 401. The test is skipped when the CLI is absent,
so it never caught any of this.

The environment sandbox in `setup` is good and should be kept:
`XDG_{DATA,CACHE,CONFIG,STATE}_HOME`, `OPENCODE_DISABLE_MODELS_FETCH`,
`OPENCODE_DISABLE_SHARE`, `OPENCODE_DISABLE_DEFAULT_PLUGINS`,
`OPENCODE_DISABLE_LSP_DOWNLOAD`, `OPENCODE_EXPERIMENTAL_DISABLE_FILEWATCHER`.
Add `OPENCODE_SERVER_PASSWORD` so the test does not have to scrape stdout, and
add a test asserting that **no** password also works when passed explicitly.
