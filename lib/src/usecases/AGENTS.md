# AGENTS — usecases (praxis_server)

Rules for use cases under `lib/src/usecases/`. Codex applies the closest AGENTS.md to the files being edited.

## Purpose

Use cases define application-level workflows that coordinate multiple services to implement a single user-facing action.

## Naming and structure

- Use case names MUST be action-focused and specific (e.g., `CompleteLessonUseCase`, `MarkLessonCompleteUseCase`).
- A use case MUST expose exactly one public method: `execute(...)`.
- Do not add multiple execution methods in one use case. If two actions are needed, create two separate use cases.

## Dependencies and boundaries

- Use cases MUST be invoked by endpoints (or other entry points), never by services.
- Use cases MUST NOT depend on endpoints (no imports, no endpoint calls).
- Use cases MUST call services only.
  Do not access DataSources directly and do not access the database/SQL/tables.
- Use cases may orchestrate multiple services and may wrap the workflow in a transaction when required by the project conventions.
- Use cases MAY depend on `TransactionRunner` to wrap workflows in a transaction.

## Result contract (current)

- Use cases return DTOs (including `List<DTO>`) or primitive types (e.g., `bool`, `int`, `String`) as the public contract.
- `Future<void>` is allowed for commands that do not return data.
- Do not leak low-level exceptions or storage details as the public API.

## Wiring (DI)

- Register each new use case in `AppUseCases` (composition root) so it is available for endpoints.
- Keep `AppUseCases.build(...)` as wiring only: no business decisions, no workflow logic.
