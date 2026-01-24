# AGENTS — praxis_server (Serverpod, Dart)

This file describes how to work with the server project. Codex applies the closest AGENTS.md to the files being edited.

## SDK / toolchain (FVM)

This workspace uses FVM. Always invoke Flutter/Dart via FVM:

- Use `fvm flutter ...` and `fvm dart ...`
- If a tool calls `flutter`/`dart` indirectly, run it via `fvm exec <command>`
- Do not change pinned Flutter/Dart versions unless explicitly requested

## Quick commands (run from praxis_server/)

This project uses FVM. Always run commands via FVM:

- Install: `fvm dart pub get`
- Format: `fvm dart format .`
- Lint: `fvm dart analyze`
- Tests: `fvm dart test`
- Run (dev): `fvm dart run bin/main.dart`

If a tool calls `dart` indirectly, use `fvm exec <command>`.

## Project map

### Entry points
- `bin/main.dart`: entry point
- `lib/server.dart`: server wiring / initialization

### Core source
- `lib/src/datasources/`: data access
- `lib/src/endpoints/`: Serverpod endpoints
- `lib/src/models/`: request/response/shared/table models
- `lib/src/generated/`: generated code (DO NOT edit manually)
- `lib/src/services/`: application/domain logic
- `lib/src/shared/`: shared utilities, mappers
- `lib/src/validation/`: validations and rules
- `lib/src/web/`: server-side web routes/widgets (if used)

### Ops & config
- `config/`: environment configs and generator config
- `migrations/`: migrations and registry
- `docker-compose.yaml`, `Dockerfile`: containerization
- `web/`: static assets/templates

### Tests
- `test/`: tests (including `test/integration/`)

## Safety & scope (important)

- Never commit secrets. Treat `config/passwords.yaml` and any keys/tokens as sensitive. Do not paste secrets into code or logs.
- Do not edit build artifacts or caches: `build/`, `.dart_tool/`, generated outputs (unless the task explicitly requires regeneration).
- Do not edit `lib/src/generated/` manually. Change the Serverpod sources and regenerate instead.

## Definition of Done

1) `dart format .` produces no further diff
2) `dart analyze` passes
3) `dart test` passes (at least the affected suite)
4) No manual changes in `lib/src/generated/`
5) Environment configs remain sane for dev/test; no secret leakage

## Review guidelines

- Ensure no manual edits to `lib/src/generated/`
- Ensure no secrets end up in code/logs/commits
- Keep changes strictly scoped to the task; avoid incidental refactors
- Error handling and validation are explicit (no silent catch/ignore)
- For business logic and endpoints: add/update tests (especially integration tests when relevant)