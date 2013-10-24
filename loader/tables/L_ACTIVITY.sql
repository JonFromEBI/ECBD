CREATE TABLE "L_ACTIVITY"
  (
    "PKIN"                        NUMBER NOT NULL ENABLE,
    "DSID"                        VARCHAR2(1000 BYTE) NOT NULL ENABLE,
    "DAID"                        VARCHAR2(2000 BYTE) NOT NULL ENABLE,
    "DBID"                        VARCHAR2(2000 BYTE),
    "MEASUREMENT_TYPE"            VARCHAR2(20 BYTE),
    "OPERATOR"                    VARCHAR2(20 BYTE),
    "VALUE"                       NUMBER,
    "UNIT"                        VARCHAR2(20 BYTE),
    "SD_MINUS"                    NUMBER,
    "SD_PLUS"                     NUMBER,
    "ACTIVITY_COMMENT"            VARCHAR2(200 BYTE),
    "COMMON_TEST_OCCASSION"       NUMBER,
    "SRC_ID_DSID"                 NUMBER,
    "JOB_ID"                      NUMBER(*,0),
    "DTID"                        VARCHAR2(2000 BYTE),
    "SRC_ID_DAID"                 NUMBER(*,0),
    "SRC_ID_DTID"                 NUMBER(*,0),
    "PURTURBAGEN_CONC_STD"        NUMBER,
    "PURTURBAGEN_CONC_STD_UNITS"  VARCHAR2(40 BYTE),
    "PURTURBAGEN_CONC_TEST"       NUMBER,
    "PURTURBAGEN_CONC_TEST_UNITS" VARCHAR2(40 BYTE),
    "SRC_ID"                      NUMBER(*,0),
    CONSTRAINT "E_L_ACTIVITY_PK" PRIMARY KEY ("PKIN") ENABLE,
    CONSTRAINT "FK_JOB_ID_FOR_ACTIVITY" FOREIGN KEY ("JOB_ID") REFERENCES "L_JOB" ("JOB_ID") ENABLE
  );
COMMENT ON COLUMN "L_ACTIVITY"."PKIN"
IS
  'Primary Key. Internal - for loader tables only.';
  COMMENT ON COLUMN "L_ACTIVITY"."DSID"
IS
  'Depositor-defined Substance ID';
  COMMENT ON COLUMN "L_ACTIVITY"."DAID"
IS
  'Depositor-defined Assay ID';
  COMMENT ON COLUMN "L_ACTIVITY"."DBID"
IS
  'Depositor-defined batch id for activity records';
  COMMENT ON COLUMN "L_ACTIVITY"."SRC_ID_DSID"
IS
  'src_id of the source in ECBD which deposited an existing substance. REQUIRED ONLY IF DEPOSITING BIOASSAY DATA AGAINST OTHER DEPOSITORS SUBSTANCES';
  COMMENT ON COLUMN "L_ACTIVITY"."JOB_ID"
IS
  'FK to L_JOB.JOB_ID';
  COMMENT ON COLUMN "L_ACTIVITY"."DTID"
IS
  'Depositor-defined Target ID';
  COMMENT ON COLUMN "L_ACTIVITY"."SRC_ID_DAID"
IS
  'src_id of the source in ECBD which deposited an existing assay. REQUIRED ONLY IF DEPOSITING BIOASSAY DATA AGAINST OTHER DEPOSITORS ASSAY';
  COMMENT ON COLUMN "L_ACTIVITY"."SRC_ID_DTID"
IS
  'src_id of the source in ECBD which deposited an existing target. REQUIRED ONLY IF DEPOSITING BIOASSAY DATA AGAINST OTHER DEPOSITORS TARGETS';
  COMMENT ON COLUMN "L_ACTIVITY"."PURTURBAGEN_CONC_STD"
IS
  'Concentration of a standard within assay, used to offset the signal (eg: fixed agonist conc when screening for antagonists).';
  COMMENT ON COLUMN "L_ACTIVITY"."PURTURBAGEN_CONC_TEST"
IS
  'Concentration of the test substance used in the assay.';
  COMMENT ON COLUMN "L_ACTIVITY"."SRC_ID"
IS
  'The owner (ie: depositor) of this activity record. FK to C_SOURCE';
CREATE OR REPLACE TRIGGER "L_ACTIVITY_ID_TRIG" BEFORE
  INSERT ON L_ACTIVITY FOR EACH ROW WHEN (NEW.PKIN IS NULL) BEGIN
  SELECT L_ACTIVITY_ID_SQ.NEXTVAL INTO :NEW.PKIN FROM DUAL;
END L_ACTIVITY_ID_TRIG;
/
ALTER TRIGGER "L_ACTIVITY_ID_TRIG" ENABLE;