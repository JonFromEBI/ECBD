CREATE TABLE "L_ASSAY"
  (
    "DAID"                 VARCHAR2(2000 BYTE) NOT NULL ENABLE,
    "DESCRIPTION"          VARCHAR2(4000 BYTE),
    "FORMAT"               VARCHAR2(2000 BYTE),
    "DESIGN"               VARCHAR2(2000 BYTE),
    "DETECTION_TECHNOLOGY" VARCHAR2(2000 BYTE),
    "ORGANISM_SPECIES"     VARCHAR2(400 BYTE),
    "ORGANISM_STRAIN"      VARCHAR2(400 BYTE),
    "ORGANISM_TAX_ID"      NUMBER(*,0),
    "JOB_ID"               NUMBER(*,0),
    "PKIN"                 NUMBER(*,0) NOT NULL ENABLE,
    "TITLE"                VARCHAR2(2000 BYTE),
    "SRC_ID"               NUMBER(*,0),
    CONSTRAINT "E_L_ASSAY_PK" PRIMARY KEY ("PKIN") ENABLE,
    CONSTRAINT "FK_JOB_ID_FOR_ASSAY" FOREIGN KEY ("JOB_ID") REFERENCES "L_JOB" ("JOB_ID") ENABLE
  );
COMMENT ON COLUMN "L_ASSAY"."DAID"
IS
  'Unique identifier for the assay within this deposition dataset. May be a simple integer (1, 2, or 3), or the depositor may wish to use something more meaningful within their system. Each record in this file must have a unique assay_id.';
  COMMENT ON COLUMN "L_ASSAY"."DESCRIPTION"
IS
  'Meaningful short sentence describing the assay performed';
  COMMENT ON COLUMN "L_ASSAY"."FORMAT"
IS
  'Methodology grouping, such as Biochemical Assay or Organism-based assay, or Cell based assay.';
  COMMENT ON COLUMN "L_ASSAY"."DESIGN"
IS
  'Method used to convert perturbation into a detectable signal. Examples: Bonding Reporter, Enzyme Reporter, Morphology Reporter, Viability Reporter';
  COMMENT ON COLUMN "L_ASSAY"."DETECTION_TECHNOLOGY"
IS
  'Technology used to generate signal. Examples include Spectrophotometry, Fluorescence, Luminescence';
  COMMENT ON COLUMN "L_ASSAY"."PKIN"
IS
  'Primary Key. Internal - for loader tables only.';
  COMMENT ON COLUMN "L_ASSAY"."SRC_ID"
IS
  'The owner (ie: depositor) of this assay. FK to C_SOURCE';
CREATE OR REPLACE TRIGGER "L_ASSAY_ID_TRIG" BEFORE
  INSERT ON L_ASSAY FOR EACH ROW WHEN (NEW.PKIN IS NULL) BEGIN
  SELECT L_ASSAY_ID_SQ.NEXTVAL INTO :NEW.PKIN FROM DUAL;
END L_ASSAY_ID_TRIG;
/
ALTER TRIGGER "L_ASSAY_ID_TRIG" ENABLE;