--------------------------------------------------------
--  DDL for Table DISCOUNTS_LOG
--------------------------------------------------------

  CREATE TABLE "C##FRIDMAN"."DISCOUNTS_LOG" 
   (    "MESSAGE" VARCHAR2(256 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table DISCOUNTS_LOG
--------------------------------------------------------

  ALTER TABLE "C##FRIDMAN"."DISCOUNTS_LOG" MODIFY ("MESSAGE" NOT NULL ENABLE);


CREATE OR REPLACE TRIGGER DISCOUNTS_LOG AFTER
  INSERT ON DISCOUNTs FOR EACH ROW BEGIN IF :new.disc_name LIKE '%disc%' THEN
  INSERT INTO discounts_Log VALUES
    ( :new.disc_name
    );
END IF;
END;