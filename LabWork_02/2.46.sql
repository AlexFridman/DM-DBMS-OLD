DECLARE
  y     NUMBER;
  var_a NUMBER := 1;
  var_b NUMBER := 1;
  var_c NUMBER := 1;
BEGIN
  y := power(sin(var_a)*exp(var_b*var_c), .5);
  dbms_output.put_line(y);
END;