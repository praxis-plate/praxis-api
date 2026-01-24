# AGENTS — praxis_server models (.spy.yaml)

This directory contains Serverpod model definitions used by the server. Some models are shared with clients via the generated protocol, while `serverOnly` models are excluded from client code.

## Toolchain

This project uses FVM. Always run Dart/Serverpod commands via FVM:

- `fvm dart ...`
- If a tool calls `dart` indirectly, run it via `fvm exec <command>`
- Do not change pinned Flutter/Dart versions unless explicitly requested

## File format (important)

Create Serverpod model files using the `.spy.yaml` extension (Serverpod-recommended). Do not introduce `.yaml`/`.yml` model files in this directory.

## Models structure

- `shared/`
  Reusable DTOs and common API types shared across endpoints.

- `shared/exceptions/`
  Serializable exceptions used by services and endpoints.

- `requests/`
  Input DTOs for endpoint methods.

- `responses/`
  Output DTOs returned by endpoint methods.

- `tables/`
  Database table models (`serverOnly`) used by datasources.

## Generation rules

- Do not edit generated output manually (e.g., `lib/src/generated/`).
- Update `.spy.yaml` sources and regenerate via the project’s standard Serverpod workflow.

## Review guidelines

- New models follow the correct folder and naming conventions.
- Models intended for client use are not placed under `serverOnly`/tables.
- Exceptions that must cross the wire are serializable and placed under `shared/exceptions/`.
- No manual edits to generated code; changes are made in `.spy.yaml` sources only.
