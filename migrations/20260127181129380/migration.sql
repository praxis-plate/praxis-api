BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_statistics" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "currentStreak" bigint NOT NULL,
    "maxStreak" bigint NOT NULL,
    "experiencePoints" bigint NOT NULL,
    "lastActiveDate" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_statistics_auth_user_id_unique" ON "user_statistics" USING btree ("authUserId");


--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260127181129380', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260127181129380', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
