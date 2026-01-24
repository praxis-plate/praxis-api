# AGENTS — praxis_server validation

`validation/` contains reusable validation rules and helpers.

## Rules

- Validation is centralized here; endpoints must not validate.
- Services should call validators from this layer when needed.
- Validators must be deterministic and side-effect free.
- Do not access the database or external services from validators.
- Keep validation focused on business or domain rules, not transport/DTO concerns.