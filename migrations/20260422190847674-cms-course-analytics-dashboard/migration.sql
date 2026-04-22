BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "task_answer_attempt" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid,
    "taskId" bigint NOT NULL,
    "userAnswer" text,
    "isCorrect" boolean NOT NULL,
    "feedbackType" text NOT NULL,
    "submittedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "task_answer_attempt_task_id_idx" ON "task_answer_attempt" USING btree ("taskId");
CREATE INDEX "task_answer_attempt_auth_user_id_idx" ON "task_answer_attempt" USING btree ("authUserId");
CREATE INDEX "task_answer_attempt_task_id_submitted_at_idx" ON "task_answer_attempt" USING btree ("taskId", "submittedAt");


--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260422190847674-cms-course-analytics-dashboard', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260422190847674-cms-course-analytics-dashboard', "timestamp" = now();

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
