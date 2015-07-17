DECLARE
  str VARCHAR2(32767);
  f UTL_FILE.FILE_TYPE;
  f_word  VARCHAR2(32767);
  l_word  VARCHAR2(32767);
  l_chars CHAR(10);
BEGIN
  F := UTL_FILE.FOPEN('MY_DIR','db_text_task.txt','R');
  UTL_FILE.GET_LINE(F,str,32767);
  UTL_FILE.FCLOSE(F);
  SELECT trim(Regexp_substr(str, '\w+-*\w+\W')) INTO f_word FROM dual;
  SELECT Regexp_replace(str,'\w+-*\w+\W', '',1,1) INTO str FROM dual;
  SELECT regexp_substr(str,'\w+',instr(str,' ',-1,1)) INTO l_word FROM dual;
  SELECT Regexp_replace(str,'\w+', '',instr(str,' ',-1,1)) INTO str FROM dual;
  SELECT ltrim(regexp_substr(str,'\W+',instr(str,' ',-1,1)))
  INTO l_chars
  FROM dual;
  SELECT Regexp_replace(str,'\W+', '',instr(str,' ',-1,1)) INTO str FROM dual;
  str := l_word||' '||str||' '||f_word||l_chars;
  DBMS_OUTPUT.put_line(str);
END;