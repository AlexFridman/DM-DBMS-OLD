declare
  min_email_length integer;
begin
  select max(length(customer_email)) into min_email_length from customers;
  SYS.Dbms_Output.Put_Line(Min_Email_Length);
end;