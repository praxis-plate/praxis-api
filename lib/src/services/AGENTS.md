# AGENTS — praxis_server services

The services layer contains business logic and orchestration. Data access must happen only through `DataSource`.

## Scope and responsibilities

Services:
- implement business rules and validations
- orchestrate multiple `DataSource` calls when needed (within a single domain)
- translate low-level failures into domain-meaningful errors/results

DataSources:
- perform data access only (database, external IO)
- do not contain business rules beyond storage-level integrity constraints

## Structure

- Keep each service in its own folder under `services/`.
  A service folder should encapsulate its public API and internal helpers.
- Service-scoped business entities MAY be placed under `services/<service_name>/entities/` when they:
  - participate in business logic (rules/invariants), and
  - are not generated DTOs, and
  - are not part of the shared protocol surface.
- Entities stored under `services/<service_name>/entities/` MUST:
  - extend `Equatable`,
  - override `props`,
  - set `stringify` appropriately (usually `true` for debugging-friendly value objects).
- If an entity/type is reused across multiple services, move it to an appropriate shared location (e.g., `shared/models/`).
- Generated and protocol-facing types MUST NOT live inside service folders.

## Rules

- A service MUST NOT perform database operations directly:
  no SQL, no table queries, no repositories, no raw DB clients, and no DB access via `Session`.
  `Session` is allowed only for:
  - reading request/auth context (e.g., `session.authenticated`, user identity),
  - passing through to DataSources when DB access is required.
- Use cases orchestrate services; services should not depend on other services.
- Transactions are primarily managed in the use case layer.
  - Use `TransactionRunner` to wrap multi-step, atomic workflows.
  - Pass the resulting `Transaction` through to participating services and data sources.
  - A service MAY open its own transaction for self-contained, single-domain operations when required.
- If a service method needs DB access, it may accept `Session` as a parameter and pass it to DataSources.
  Do not store `Session` in fields and do not pass it via constructors.
- A service MUST use `DataSource` for all data operations.
  Calling multiple data sources is allowed when orchestration is required.
- Put business rules and validations in services.
  DataSources should remain thin and focused on persistence/IO concerns.

## Review guidelines

- No DB queries via Session in services (Session is allowed only for auth context reads and pass-through to DataSources).
- Business rules/validation logic is in services, not in DataSources.
- Service-local entities stay in `services/<service_name>/entities/` and do not leak into protocol/generated surfaces.
- Entities use `Equatable` consistently (`props` overridden, `stringify` set).
- Shared types are not duplicated across services; reuse is consolidated into shared folders.
- Changes are minimal and scoped to the task; orchestration remains readable.
