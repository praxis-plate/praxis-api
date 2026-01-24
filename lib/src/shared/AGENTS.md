# AGENTS — praxis_server shared

`shared/` contains reusable types and utilities (models, mappers, constants, small helpers).

## Purpose and scope

Use `shared/` only for code that is:
- broadly reused across multiple features/services, and
- stable enough to be a dependency without creating coupling.

If a type is used by only one service/feature, keep it local to that area instead of moving it into `shared/`.

## Structure

- Do NOT create new files directly in the root of `shared/`.
  Always place them into an appropriate subfolder.
- Before adding a file, decide its responsibility and pick the correct folder
  (e.g., `models/`, `mappers/`, `constants/`, `utils/`, `errors/`, etc.).
- Prefer narrow, intention-revealing folders over a single “misc” bucket.

## Models

- One model per file.
- Models must be value-like and predictable:
  - immutable where reasonable
  - explicit constructor requirements (no hidden defaults unless justified)
- If the project uses `Equatable`, then:
  - extend `Equatable`
  - override `props`
  - set `stringify` appropriately

## Review guidelines

- `shared/` does not turn into a dumping ground.
- Files are placed in the correct subfolder and have a single responsibility.
- Models are consistent (immutability, equality, clear naming).
- No unnecessary coupling: shared code stays generic and reusable.
