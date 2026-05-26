BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "course_review" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "courseId" bigint NOT NULL,
    "rating" bigint NOT NULL,
    "comment" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "course_review_course_id_idx" ON "course_review" USING btree ("courseId");
CREATE UNIQUE INDEX "course_review_auth_user_id_course_id_unique" ON "course_review" USING btree ("authUserId", "courseId");


--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260525221849919-add-course-reviews', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260525221849919-add-course-reviews', "timestamp" = now();

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
