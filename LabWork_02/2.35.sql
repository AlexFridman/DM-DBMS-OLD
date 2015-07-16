--CREATE DIRECTORY MY_DIR AS 'C:\temp';
DECLARE
  f UTL_FILE.FILE_TYPE;
  str            VARCHAR2(32767);
  Perem          VARCHAR2(32767);
  str_len        INTEGER;
  idx            INTEGER := 0;
  next_idx       INTEGER := 0;
  cur_ch         CHAR(1);
  next_ch        CHAR(1);
  ch_to_end      INTEGER;
  delimiters_str VARCHAR2(10) := '.,!?:;';
  s_start        INTEGER := 0;
  s_end          INTEGER := 0;
BEGIN
  F := UTL_FILE.FOPEN('MY_DIR','db_text_task.txt','R');
  UTL_FILE.GET_LINE(F,str,32767);
  UTL_FILE.FCLOSE(F);
  SELECT REGEXP_REPLACE(Str, '\s+\.', '.') INTO str FROM dual;
  SELECT REGEXP_REPLACE(Str, '\s+,', ',') INTO str FROM dual;
  SELECT REGEXP_REPLACE(Str, '\s+!', '!') INTO str FROM dual;
  SELECT REGEXP_REPLACE(Str, '\s+[?]', '?') INTO str FROM dual;
  SELECT REGEXP_REPLACE(Str, '\s+:', ':') INTO str FROM dual;
  SELECT REGEXP_REPLACE(Str, '\s+;', ';') INTO str FROM dual;
  str_len   := LENGTH(str);
  WHILE (idx < str_len) AND str_len > 1
  LOOP
    cur_ch                          := SUBSTR(str, idx, 1);
    IF instr(delimiters_str, cur_ch) = 0 THEN
      idx                           := idx +1;
      CONTINUE;
    END IF;
    next_idx   :=idx+1;
    next_ch    := SUBSTR(str, next_idx, 1);
    IF next_ch != ' ' THEN
      BEGIN
        ch_to_end :=LENGTH(str)-idx;
        str       := SUBSTR(str,0,idx) || ' '||SUBSTR(str,next_idx,ch_to_end);
        idx       :=idx      +2;
        str_len   := str_len + 1;
      END;
    ELSE
      idx := idx +1;
    END IF;
  END LOOP;
  cur_ch                           := SUBSTR(str, idx, 1);
  IF instr(delimiters_str, cur_ch) != 0 THEN
    str                            := str || ' ';
  END IF;
  SELECT REGEXP_INSTR(str, '[.|!|?]\s') INTO s_start FROM dual;
  IF s_start = 0 THEN
    dbms_output.put_line('no sentences in text');
  END IF;
  SELECT REGEXP_INSTR(str, '[.|!|?]\s', 1,2) INTO s_end FROM dual;
  IF s_end = 0 THEN
    dbms_output.put_line('no 2nd sentence in text');
  END IF;
  SELECT SUBSTR(str,s_start+2,s_end) INTO perem FROM dual;
  dbms_output.put_line(str);
  dbms_output.put_line(perem);
END;