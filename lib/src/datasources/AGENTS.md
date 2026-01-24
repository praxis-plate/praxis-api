# AGENTS — praxis_server datasources

`DataSource` is responsible for data access only (database, cache, external storage).

## Scope and responsibilities

DataSources:
- read and write data
- perform minimal transformations required for persistence and retrieval
- surface data-access failures in a consistent way (do not hide them)

Services:
- own orchestration and business rules
- combine multiple DataSources when needed
- implement validations beyond storage-level constraints

## Logic boundaries

- Do NOT place business logic in `DataSource`.
  Only data access operations and minimal persistence-related mapping are allowed.
- Keep orchestration and rules in services.

## Session usage (database)

- Always accept `Session` as a method parameter for DB operations.
- Never store `Session` in class fields and never inject it via the constructor.
- Keep `Session` usage strictly local to the method that performs DB work.

## Mapping and errors

- Centralize mapping in a small number of explicit functions/classes.
  Avoid spreading “null-fixing” and parsing across multiple DataSources.
- Do not swallow exceptions. Either:
  - rethrow with context, or
  - translate into a typed, predictable data-layer error/result expected by services.

## Review guidelines

- No business rules or orchestration inside DataSources.
- `Session` is method-scoped and not stored.
- Data access code is readable and minimal; mapping is explicit.
- Error handling is consistent and does not hide failures.
