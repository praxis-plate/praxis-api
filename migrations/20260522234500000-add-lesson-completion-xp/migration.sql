BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE IF EXISTS "lesson"
    ADD COLUMN IF NOT EXISTS "completionXp" bigint;

UPDATE "lesson"
SET "completionXp" = 0
WHERE "completionXp" IS NULL;

ALTER TABLE IF EXISTS "lesson"
    ALTER COLUMN "completionXp" SET NOT NULL;

--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260522234500000-add-lesson-completion-xp', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260522234500000-add-lesson-completion-xp', "timestamp" = now();

COMMIT;
