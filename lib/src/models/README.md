# Models structure

This directory contains Serverpod model definitions used by the server.
Some models are shared with clients via the generated protocol, while
`serverOnly` models are excluded from client code.

- `shared/`:
  Reusable DTOs and common API types shared across endpoints.
- `shared/exceptions/`:
  Serializable exceptions used by services and endpoints.
- `requests/`:
  Input DTOs for endpoint methods.
- `responses/`:
  Output DTOs returned by endpoint methods.
- `tables/`:
  Database table models (serverOnly) used by datasources.
