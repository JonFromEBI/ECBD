CREATE TABLE L_JOB
  (
    "JOB_ID"    NUMBER(*,0) NOT NULL ENABLE,
    "JOB_TITLE" VARCHAR2(1000 BYTE),
    "JOB_USER"  VARCHAR2(50 BYTE),
    "JOB_START" DATE,
    "JOB_END" DATE,
    "SRC_ID"              NUMBER(*,0),
    "DEPOSITED_FILE_NAME" VARCHAR2(1000 BYTE),
    "JOB_DESCRIPTION"     VARCHAR2(4000 BYTE),
    "EMBARGO_DATE" DATE,
    "REQUESTED_EMBARGO_DAYS" NUMBER(*,0),
    CONSTRAINT "E_L_JOB_PK" PRIMARY KEY ("JOB_ID") ENABLE
  );
COMMENT ON COLUMN "L_JOB"."EMBARGO_DATE"
IS
  'The date after which all data connected with this job becomes public.';
  COMMENT ON COLUMN "L_JOB"."REQUESTED_EMBARGO_DAYS"
IS
  'The number of days of embargo requested by loader from job_start. Value may not correspond to EMBARGO_DATE if administrators have reset EMBARGO_DATE since loading.';