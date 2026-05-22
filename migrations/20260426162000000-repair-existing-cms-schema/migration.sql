BEGIN;

--
-- ACTION REPAIR TABLE
--
ALTER TABLE IF EXISTS "course"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone,
    ADD COLUMN IF NOT EXISTS "contentStatus" text,
    ADD COLUMN IF NOT EXISTS "publishedAt" timestamp without time zone;

UPDATE "course"
SET "updatedAt" = "createdAt"
WHERE "updatedAt" IS NULL;

UPDATE "course"
SET "contentStatus" = 'published'
WHERE "contentStatus" IS NULL;

UPDATE "course"
SET "publishedAt" = COALESCE("publishedAt", "createdAt")
WHERE "contentStatus" = 'published' AND "publishedAt" IS NULL;

ALTER TABLE IF EXISTS "course"
    ALTER COLUMN "updatedAt" SET NOT NULL,
    ALTER COLUMN "contentStatus" SET NOT NULL;

--
-- ACTION REPAIR TABLE
--
ALTER TABLE IF EXISTS "module"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "module"
SET "updatedAt" = "createdAt"
WHERE "updatedAt" IS NULL;

ALTER TABLE IF EXISTS "module"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION REPAIR TABLE
--
ALTER TABLE IF EXISTS "lesson"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "lesson"
SET "updatedAt" = "createdAt"
WHERE "updatedAt" IS NULL;

ALTER TABLE IF EXISTS "lesson"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION REPAIR TABLE
--
ALTER TABLE IF EXISTS "task"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "task"
SET "updatedAt" = "createdAt"
WHERE "updatedAt" IS NULL;

ALTER TABLE IF EXISTS "task"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION REPAIR TABLE
--
ALTER TABLE IF EXISTS "task_option"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "task_option"
SET "updatedAt" = now()
WHERE "updatedAt" IS NULL;

ALTER TABLE IF EXISTS "task_option"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION REPAIR TABLE
--
ALTER TABLE IF EXISTS "task_test_case"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "task_test_case"
SET "updatedAt" = now()
WHERE "updatedAt" IS NULL;

ALTER TABLE IF EXISTS "task_test_case"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260426162000000-repair-existing-cms-schema', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260426162000000-repair-existing-cms-schema', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

COMMIT;
