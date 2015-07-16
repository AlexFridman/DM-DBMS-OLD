DECLARE
  y     NUMBER;
  x     NUMBER := 1;
  var_a NUMBER := 1;
  var_b NUMBER := 1;
  var_c NUMBER := 1;
BEGIN
  y := power(x,4)*ln(var_a) - var_b*var_c;
  dbms_output.put_line(y);
END;