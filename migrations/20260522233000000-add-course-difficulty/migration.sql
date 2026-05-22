BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE IF EXISTS "course"
    ADD COLUMN IF NOT EXISTS "difficultyLevel" text;

UPDATE "course"
SET "difficultyLevel" = 'beginner'
WHERE "difficultyLevel" IS NULL;

ALTER TABLE IF EXISTS "course"
    ALTER COLUMN "difficultyLevel" SET NOT NULL;

--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260522233000000-add-course-difficulty', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260522233000000-add-course-difficulty', "timestamp" = now();

COMMIT;
