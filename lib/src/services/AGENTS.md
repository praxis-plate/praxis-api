# AGENTS — praxis_server services

The services layer contains business logic and orchestration. Data access must happen only through `DataSource`.

## Scope and responsibilities

Services:
- implement business rules and validations
- orchestrate multiple `DataSource` calls when needed
- translate low-level failures into domain-meaningful errors/results

DataSources:
- perform data access only (database, external IO)
- do not contain business rules beyond storage-level integrity constraints

## Rules

- A service MUST NOT access the database directly:
  no SQL, no table queries, no `Session` usage, no repositories, no raw DB clients.
- A service MUST use `DataSource` for all data operations.
  Calling multiple data sources is allowed when orchestration is required.
- Keep each service in its own folder under `services/`.
  A service folder should encapsulate its public API and internal helpers.
- Put business rules and validations in services.
  DataSources should remain thin and focused on persistence/IO concerns.

## Review guidelines

- No direct DB access from services (including `Session`).
- Business rules/validation logic is in services, not in DataSources.
- Service interfaces are small and intention-revealing; helpers remain private to the service folder.
- Changes are minimal and scoped to the task; orchestration remains readable.
