DROP TABLE temp;
CREATE TABLE temp
  ("Date" DATE
  );
INSERT INTO temp VALUES
  (Sysdate
  );
DECLARE
  cur_month VARCHAR2(10);
  cur_time  VARCHAR2(10);
BEGIN
  SELECT TO_CHAR(sysdate, 'Month') INTO cur_month FROM dual ;
  SELECT TO_CHAR(sysdate, 'HH24:MI') INTO cur_time FROM dual ;
  dbms_output.put_line(cur_month);
  dbms_output.put_line(cur_time);
  --  EXECUTE Immediate 'drop table temp;';
  --  EXECUTE Immediate 'create table temp ("Date" Date)';
  --  EXECUTE Immediate 'insert into temp values (Sysdate);';
END;
