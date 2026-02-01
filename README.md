# Praxis API

[![Dart](https://img.shields.io/badge/Dart-3.10-blue.svg)](https://dart.dev)
[![Serverpod](https://img.shields.io/badge/Serverpod-2.x-orange.svg)](https://serverpod.dev)

Backend API server for the **Praxis** educational platform – an interactive learning system for programming courses with AI-powered assistance and progress tracking.

**[Documentation](#documentation)** • **[Quick Start](#quick-start-local)** • **[API Reference](#api-overview-serverpod-endpoints)**

---

**Languages:** [English](#) • [Русский](docs/ru/README.md)

## Overview

Praxis Server is built with [Serverpod](https://serverpod.dev) (Dart) and provides the backend API for the Praxis mobile/web application. It handles:

- **Course management** – courses, modules, lessons, and interactive tasks
- **User progress tracking** – lesson completion, statistics, achievements
- **Virtual wallet** – internal coins and transaction history (no real money integration)
- **AI assistance** – hint generation and task explanations via LLM integration (optional)
- **Authentication** – email-based identity provider with JWT tokens

## Architecture

The server follows a **layered architecture** with clear separation of concerns:

![Architecture Diagram](docs/diagrams/images/architecture-overview.png)

*[View PlantUML source](docs/diagrams/uml/architecture-overview.puml)*

```
Endpoints (API layer)
    ↓
Use Cases (business orchestration)
    ↓
Services (domain logic) + Validation
    ↓
Data Sources (database access)
```

### Key principles

- **Endpoints** expose the API surface via Serverpod RPC
- **Use Cases** orchestrate business workflows by coordinating multiple services
- **Services** encapsulate domain logic and aggregate data from multiple data sources. Each service represents a specific domain area (like a feature) and may contain its own validation logic, helper entities, and business rules specific to that domain
- **Data Sources** interact directly with Postgres tables via Serverpod ORM
- **Validation** is applied at boundaries (input validation, business rules). Domain-specific validations and entities often live within services
- **Utilities** provide cross-cutting concerns (transaction management, mappers, helpers)

This structure ensures testability, maintainability, and clear dependency flow.

## Prerequisites

- [FVM](https://fvm.app) with the pinned Dart/Flutter SDK (3.10+)
- [Docker Desktop](https://www.docker.com/products/docker-desktop) (for Postgres + Redis)

## Quick start (local)

From the project root:

```bash
# 1. Start Postgres + Redis
docker compose up --build --detach

# 2. Install dependencies
fvm dart pub get

# 3. Configure secrets (see Configuration section below)
# Edit config/passwords.yaml with your credentials

# 4. Run database migrations (automatic on first start)
# Migrations are applied automatically when the server starts

# 5. Run the server
fvm dart run bin/main.dart
```

The server will start on:
- API: `http://localhost:8080`
- Insights: `http://localhost:8081`
- Web: `http://localhost:8082`

Stop services:

```bash
docker compose stop
```

## Project layout

- `bin/main.dart` – entry point
- `lib/server.dart` – server wiring / initialization
- `lib/src/endpoints/` – Serverpod endpoints
- `lib/src/services/` – domain services
- `lib/src/datasources/` – data access
- `lib/src/models/` – models (request/response/shared/table)
- `lib/src/validation/` – validation rules
- `config/` – environment configuration
- `migrations/` – database migrations
- `web/` – server-side web assets (if used)

## API overview (Serverpod endpoints)

The server exposes RPC-style endpoints via Serverpod. Methods marked **(auth)** require authentication (user must be logged in).

### Course & Learning Content

- **CourseEndpoint**
  - `get(limit, offset)` – list available courses
  - `getById(courseId)` – course details
  - `getEnrolled()` – user's enrolled courses **(auth)**
  - `enroll(courseId)` / `unenroll(courseId)` – manage enrollment **(auth)**
  - `getTableOfContents(courseId)` – course structure (modules/lessons)

- **ModuleEndpoint**
  - `get(courseId)` – modules for a course

- **LessonEndpoint**
  - `getByCourseId(courseId)` / `getByModuleId(moduleId)` – fetch lessons
  - `getById(lessonId)` – lesson details
  - `markComplete(lessonId, timeSpentSeconds)` – mark completion **(auth)**
  - `complete(request)` – complete lesson session **(auth)**

- **TaskEndpoint**
  - `getById(taskId)` / `getByLessonId(lessonId)` – fetch tasks
  - `answer(taskId, userAnswer)` – validate answer and return feedback

### Progress & Achievements

- **AchievementEndpoint**
  - `getAll()` – list all achievements
  - `getUserAchievements()` – user's unlocked achievements **(auth)**
  - `unlock(achievementId)` / `isUnlocked(achievementId)` **(auth)**

- **UserStatisticsEndpoint**
  - `get()` – user learning statistics **(auth)**

- **WalletEndpoint**
  - `getBalance()` – wallet balance **(auth)**
  - `topUp(request)` – grant coins **(auth)**
  - `buy(request)` – spend coins **(auth)**
  - `getHistory(limit, offset)` – transaction history **(auth)**

### AI Assistance

- **AiEndpoint** **(auth)**
  - `generateHint(request)` – AI-generated hints for tasks
  - `generateExplanation(request)` – AI explanations for concepts

### Authentication & Health

- **EmailIdpEndpoint** – email identity provider (Serverpod Auth)
- **JwtRefreshEndpoint** – JWT token refresh (Serverpod Auth)
- **HealthEndpoint**
  - `ping()` – health check

## Configuration

### Environment Setup

The server uses Serverpod's configuration system with environment-specific files:

- `config/development.yaml` – local development settings
- `config/staging.yaml` – staging environment
- `config/production.yaml` – production environment
- `config/passwords.yaml` – **secrets (not in version control)**

### Required Secrets

Edit `config/passwords.yaml` for your environment:

```yaml
development:
  database: "your_db_password"
  redis: "your_redis_password"
  serviceSecret: "your_service_secret"
  
  # Email authentication (Serverpod Auth)
  emailSecretHashPepper: "random_string"
  jwtHmacSha512PrivateKey: "random_string"
  jwtRefreshTokenHashPepper: "random_string"
  
  # Optional: AI service (Gemini)
  geminiApiKey: "your_api_key"
  proxyHost: "proxy_host"
  proxyPort: "proxy_port"
  proxyUser: "proxy_user"
  proxyPass: "proxy_password"
  
  # Optional: Test user for development
  testUserEmail: "test@example.com"
  testUserPassword: "test1234"
```

**Note:** If AI credentials are not provided, the AI endpoints will be unavailable but the server will run normally.

### Database Configuration

Database settings are in `config/development.yaml`:

```yaml
database:
  host: localhost
  port: 8090
  name: praxis
  user: postgres
```

## Database & Migrations

### Migrations

Migrations are located in `migrations/` and are **automatically applied** when the server starts.

To manually manage migrations:

```bash
# Apply migrations manually
fvm dart run bin/main.dart --apply-migrations

# Create a new migration (after modifying models)
fvm dart pub global run serverpod_cli create-migration
```

### Seed Data

To populate the database with test data, use the seed endpoints or scripts (if available). Check `lib/src/services/course_seed/` and `lib/src/services/user_seed/` for seeding logic.

## Development

### Code Generation

Serverpod uses code generation for protocol classes. After modifying files in `lib/src/models/`:

```bash
# Generate protocol code
fvm dart pub global run serverpod_cli generate

# Or use the full build
fvm dart run build_runner build
```

**Important:** Never manually edit files in `lib/src/generated/` – they are auto-generated.

### Running Tests

```bash
# Run all tests
fvm dart test

# Run specific test file
fvm dart test test/services/ai/ai_service_test.dart

# Run with coverage
fvm dart test --coverage=coverage
```

### Code Quality

```bash
# Format code
fvm dart format .

# Analyze code
fvm dart analyze

# Fix common issues
fvm dart fix --apply
```

### Development Workflow

1. Make changes to models in `lib/src/models/`
2. Run `fvm serverpod generate` to update protocol
3. Implement business logic in services/use cases
4. Add tests for new functionality
5. Run `fvm dart format .` and `fvm dart analyze`
6. Commit changes

## Data storage

- **Postgres** – persistent data storage (local dev uses the `pgvector` image)
- **Redis** – session management and caching (local dev uses Redis 6.2)
- See `docker-compose.yaml` for local infra setup

## Documentation

- [Serverpod Documentation](https://docs.serverpod.dev)
- [API Reference](#api-overview-serverpod-endpoints) (below)
- [Architecture](#architecture) (above)
- [AGENTS.md](AGENTS.md) – guidelines for AI coding assistants

## Development Guidelines

### Commit Message Format

```
[TICKET-ID] Brief description in Russian or English

Examples:
[PA-14] Добавил эндпоинт для получения lesson по id
[CDM-23] Поправил детальную страницу
[PA-10] Перенес раннер транзакций в утилиты
```

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `fvm dart format .` before committing
- Ensure `fvm dart analyze` passes with no issues

## License

This is an educational project developed for university purposes.

---
