BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "achievement" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "iconUrl" text,
    "pointsReward" bigint NOT NULL,
    "relatedCourseId" bigint,
    "conditionType" text NOT NULL,
    "conditionValue" text
);

-- Indexes
CREATE INDEX IF NOT EXISTS "achievement_condition_idx" ON "achievement" USING btree ("conditionType");

-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "coin_transaction" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "transactionKey" text NOT NULL,
    "type" text NOT NULL,
    "status" text NOT NULL,
    "amount" bigint NOT NULL,
    "currency" text NOT NULL,
    "relatedEntityId" text,
    "reversalOfTransactionId" bigint,
    "reason" text,
    "metadata" text,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX IF NOT EXISTS "coin_transaction_transaction_key_unique" ON "coin_transaction" USING btree ("transactionKey");
CREATE INDEX IF NOT EXISTS "coin_transaction_auth_user_id_created_at_idx" ON "coin_transaction" USING btree ("authUserId", "createdAt");

ALTER TABLE "coin_transaction"
    ADD COLUMN IF NOT EXISTS "relatedEntityId" text,
    ADD COLUMN IF NOT EXISTS "reversalOfTransactionId" bigint,
    ADD COLUMN IF NOT EXISTS "reason" text,
    ADD COLUMN IF NOT EXISTS "metadata" text;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "course" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "author" text NOT NULL,
    "category" text NOT NULL,
    "priceInCoins" bigint NOT NULL,
    "durationMinutes" bigint NOT NULL,
    "rating" double precision NOT NULL,
    "thumbnailUrl" text,
    "coverImage" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "contentStatus" text NOT NULL,
    "publishedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX IF NOT EXISTS "course_category_idx" ON "course" USING btree ("category");
CREATE INDEX IF NOT EXISTS "course_rating_idx" ON "course" USING btree ("rating");

ALTER TABLE "course"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone,
    ADD COLUMN IF NOT EXISTS "contentStatus" text,
    ADD COLUMN IF NOT EXISTS "publishedAt" timestamp without time zone;

UPDATE "course"
SET "updatedAt" = COALESCE("updatedAt", "createdAt"),
    "contentStatus" = COALESCE("contentStatus", 'published'),
    "publishedAt" = COALESCE("publishedAt", "createdAt")
WHERE "updatedAt" IS NULL
   OR "contentStatus" IS NULL;

ALTER TABLE "course"
    ALTER COLUMN "updatedAt" SET NOT NULL,
    ALTER COLUMN "contentStatus" SET NOT NULL;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "lesson" (
    "id" bigserial PRIMARY KEY,
    "moduleId" bigint NOT NULL,
    "title" text NOT NULL,
    "contentText" text NOT NULL,
    "videoUrl" text,
    "imageUrls" text,
    "orderIndex" bigint NOT NULL,
    "durationMinutes" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "lesson_module_id_idx" ON "lesson" USING btree ("moduleId");
CREATE INDEX IF NOT EXISTS "lesson_module_id_order_idx" ON "lesson" USING btree ("moduleId", "orderIndex");

ALTER TABLE "lesson"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "lesson"
SET "updatedAt" = COALESCE("updatedAt", "createdAt")
WHERE "updatedAt" IS NULL;

ALTER TABLE "lesson"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "lesson_progress" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "lessonId" bigint NOT NULL,
    "isCompleted" boolean NOT NULL,
    "completedAt" timestamp without time zone,
    "timeSpentSeconds" bigint NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "lesson_progress_auth_user_id_idx" ON "lesson_progress" USING btree ("authUserId");
CREATE UNIQUE INDEX IF NOT EXISTS "lesson_progress_auth_user_id_lesson_id_unique" ON "lesson_progress" USING btree ("authUserId", "lessonId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "module" (
    "id" bigserial PRIMARY KEY,
    "courseId" bigint NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "orderIndex" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "module_course_id_idx" ON "module" USING btree ("courseId");
CREATE INDEX IF NOT EXISTS "module_course_id_order_idx" ON "module" USING btree ("courseId", "orderIndex");

ALTER TABLE "module"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "module"
SET "updatedAt" = COALESCE("updatedAt", "createdAt")
WHERE "updatedAt" IS NULL;

ALTER TABLE "module"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "task" (
    "id" bigserial PRIMARY KEY,
    "lessonId" bigint NOT NULL,
    "taskType" text NOT NULL,
    "questionText" text NOT NULL,
    "correctAnswer" text NOT NULL,
    "optionsJson" text,
    "codeTemplate" text,
    "testCasesJson" text,
    "programmingLanguage" text,
    "difficultyLevel" bigint NOT NULL,
    "xpValue" bigint NOT NULL,
    "orderIndex" bigint NOT NULL,
    "fallbackHint" text,
    "fallbackExplanation" text,
    "topic" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "task_lesson_id_idx" ON "task" USING btree ("lessonId");
CREATE INDEX IF NOT EXISTS "task_lesson_id_order_idx" ON "task" USING btree ("lessonId", "orderIndex");

ALTER TABLE "task"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "task"
SET "updatedAt" = COALESCE("updatedAt", "createdAt")
WHERE "updatedAt" IS NULL;

ALTER TABLE "task"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "task_option" (
    "id" bigserial PRIMARY KEY,
    "taskId" bigint NOT NULL,
    "optionText" text NOT NULL,
    "isCorrect" boolean NOT NULL,
    "orderIndex" bigint NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "task_option_task_id_idx" ON "task_option" USING btree ("taskId");
CREATE INDEX IF NOT EXISTS "task_option_task_id_order_idx" ON "task_option" USING btree ("taskId", "orderIndex");

ALTER TABLE "task_option"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "task_option"
SET "updatedAt" = COALESCE("updatedAt", NOW())
WHERE "updatedAt" IS NULL;

ALTER TABLE "task_option"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "task_test_case" (
    "id" bigserial PRIMARY KEY,
    "taskId" bigint NOT NULL,
    "input" text NOT NULL,
    "expectedOutput" text NOT NULL,
    "isHidden" boolean NOT NULL,
    "orderIndex" bigint NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "task_test_case_task_id_idx" ON "task_test_case" USING btree ("taskId");
CREATE INDEX IF NOT EXISTS "task_test_case_task_id_order_idx" ON "task_test_case" USING btree ("taskId", "orderIndex");

ALTER TABLE "task_test_case"
    ADD COLUMN IF NOT EXISTS "updatedAt" timestamp without time zone;

UPDATE "task_test_case"
SET "updatedAt" = COALESCE("updatedAt", NOW())
WHERE "updatedAt" IS NULL;

ALTER TABLE "task_test_case"
    ALTER COLUMN "updatedAt" SET NOT NULL;

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "user_achievement" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "achievementId" bigint NOT NULL,
    "unlockedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS "user_achievement_auth_user_id_idx" ON "user_achievement" USING btree ("authUserId");
CREATE UNIQUE INDEX IF NOT EXISTS "user_achievement_auth_user_id_achievement_id_unique" ON "user_achievement" USING btree ("authUserId", "achievementId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE IF NOT EXISTS "user_course" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "courseId" bigint NOT NULL,
    "enrolledAt" timestamp without time zone NOT NULL,
    "isCompleted" boolean NOT NULL,
    "completedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX IF NOT EXISTS "user_course_auth_user_id_idx" ON "user_course" USING btree ("authUserId");
CREATE UNIQUE INDEX IF NOT EXISTS "user_course_auth_user_id_course_id_unique" ON "user_course" USING btree ("authUserId", "courseId");


--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260422183011851-cms-admin-api-and-persistent-course-publishing', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260422183011851-cms-admin-api-and-persistent-course-publishing', "timestamp" = now();

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
