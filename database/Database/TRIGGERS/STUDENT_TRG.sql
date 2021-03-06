--------------------------------------------------------
--  DDL for Trigger STUDENT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMS"."STUDENT_TRG" 
BEFORE INSERT ON STUDENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.STUID IS NULL THEN
      SELECT STUDENTSEQ.NEXTVAL INTO :NEW.STUID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "IMS"."STUDENT_TRG" ENABLE;
