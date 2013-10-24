CREATE TABLE "L_BATCH"
  (
    "BATCH_ID"          NUMBER NOT NULL ENABLE,
    "JOB_ID"            NUMBER NOT NULL ENABLE,
    "DBID"              VARCHAR2(2000 BYTE) NOT NULL ENABLE,
    "DBID_DB_GENERATED" VARCHAR2(200 BYTE),
    CONSTRAINT "E_L_BATCH_PK" PRIMARY KEY ("BATCH_ID") ENABLE,
    CONSTRAINT "FK_JOB_ID_FOR_BATCH" FOREIGN KEY ("JOB_ID") REFERENCES "L_JOB" ("JOB_ID") ENABLE
  );
COMMENT ON COLUMN "L_BATCH"."BATCH_ID"
IS
  'Batch ID for ECBD, assigned on loading data to this table, from sequence.';
  COMMENT ON COLUMN "L_BATCH"."JOB_ID"
IS
  'FK to E_L_JOB';
  COMMENT ON COLUMN "L_BATCH"."DBID"
IS
  'A depositor-defined batch id used only to tie together batches within deposition data set. NOT used within ECBD. May be DBID, but if DBID not defined then loader assigns these local batch_ids.';
