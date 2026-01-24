# AGENTS — praxis_server endpoints

`endpoints/` contains Serverpod public entry points. Endpoints must stay thin: they handle transport concerns and delegate work to services.

## Scope and responsibilities

Endpoints:
- perform authentication and authorization checks
- accept generated request models and pass them to services (no DTO mapping)
- return generated response models (or primitive types) from services
- call services (passing `Session` only when the service needs DB access)
- translate failures into stable, client-facing errors
- add minimal logging for observability (no sensitive data)

Services:
- own business rules and orchestration
- call one or more DataSources
- invoke validation through the validation layer

## Rules

- An endpoint MUST NOT access the database directly:
  no SQL, no table queries, no repositories, no raw DB clients.
- An endpoint MUST NOT contain business logic or decision-making rules.
  Keep business rules in services.
- Do NOT perform validation in endpoints.
  Endpoints may only rely on typing/serialization performed by the transport layer.
  All business/domain validation is invoked from services via the validation layer.
- Pass `Session` through to services only when DB access is required.
  Never store `Session` and never use it outside the request scope.
- Allowed in endpoints:
  - authentication and authorization checks
  - passing request models to services and returning response models
  - error translation and logging that improves observability

## Error handling contract

- Do not swallow exceptions.
- Prefer predictable, typed errors for client-facing behavior.
- Avoid leaking internal details (stack traces, raw DB messages, secrets) into responses.

## Review guidelines

- Endpoint code remains thin: wiring, auth checks, passing request/response models, error translation.
- No DB access from endpoints; `Session` is not misused.
- No validation logic in endpoints.
- Business rules remain in services (not duplicated).
- Request/response models are used directly; response shapes remain stable.
