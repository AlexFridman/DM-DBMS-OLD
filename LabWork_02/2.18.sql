DECLARE
  int_var     NUMBER  := 5;
  date_var    DATE    := Sysdate;
  boolean_var BOOLEAN := False;
  float_var FLOAT;
  char_var     CHAR(20);
  Smallint_var SMALLINT;
BEGIN
  SELECT CAST (int_var AS FLOAT) INTO float_var FROM dual;
  --SELECT CAST (date_var AS CHAR) INTO char_var FROM dual;
  char_var := TO_CHAR(Date_Var);
  --SELECT CAST (boolean_var AS SMALLINT) INTO Smallint_var FROM dual;
  SYS.Dbms_Output.Put_Line(float_var);
  SYS.Dbms_Output.Put_Line(char_var);
  --SYS.Dbms_Output.Put_Line(Smallint_var);
END;