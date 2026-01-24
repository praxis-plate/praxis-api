BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "coin_transaction" (
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
CREATE UNIQUE INDEX "coin_transaction_transaction_key_unique" ON "coin_transaction" USING btree ("transactionKey");
CREATE INDEX "coin_transaction_auth_user_id_created_at_idx" ON "coin_transaction" USING btree ("authUserId", "createdAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_wallet" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "balance" bigint NOT NULL,
    "available" bigint NOT NULL,
    "held" bigint NOT NULL,
    "currency" text NOT NULL,
    "version" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_wallet_auth_user_id_unique" ON "user_wallet" USING btree ("authUserId");


--
-- MIGRATION VERSION FOR praxis
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('praxis', '20260124215530690', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260124215530690', "timestamp" = now();

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
