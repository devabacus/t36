BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "configuration" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" bigint NOT NULL,
    "customerId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "lastModified" timestamp without time zone NOT NULL,
    "isDeleted" boolean NOT NULL DEFAULT false,
    "group" text NOT NULL,
    "key" text NOT NULL,
    "value" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customer" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "lastModified" timestamp without time zone NOT NULL,
    "isDeleted" boolean NOT NULL DEFAULT false,
    "name" text NOT NULL,
    "email" text,
    "info" text,
    "subscriptionStatus" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customer_user" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "customerId" uuid NOT NULL,
    "userId" bigint NOT NULL,
    "roleId" uuid NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "permission" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "key" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "role" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "role_permission" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "roleId" uuid NOT NULL,
    "permissionId" uuid NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "uploaded_files" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "bucketName" text NOT NULL,
    "objectKey" text NOT NULL,
    "originalFilename" text NOT NULL,
    "mimeType" text NOT NULL,
    "size" bigint NOT NULL,
    "status" text NOT NULL,
    "uploadedAt" timestamp without time zone NOT NULL,
    "userId" bigint NOT NULL,
    "customerId" uuid NOT NULL,
    "metadata" text,
    "publicUrl" text,
    "expiresAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "configuration"
    ADD CONSTRAINT "configuration_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "customer_user"
    ADD CONSTRAINT "customer_user_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "customer_user"
    ADD CONSTRAINT "customer_user_fk_1"
    FOREIGN KEY("roleId")
    REFERENCES "role"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "role_permission"
    ADD CONSTRAINT "role_permission_fk_0"
    FOREIGN KEY("roleId")
    REFERENCES "role"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "role_permission"
    ADD CONSTRAINT "role_permission_fk_1"
    FOREIGN KEY("permissionId")
    REFERENCES "permission"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "uploaded_files"
    ADD CONSTRAINT "uploaded_files_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR t36
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('t36', '20251204123154576', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251204123154576', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20250825102336032-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102336032-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();


COMMIT;
