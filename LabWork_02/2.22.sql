DECLARE
  avg_email_length INTEGER;
BEGIN
  SELECT AVG(LENGTH(customer_email)) INTO avg_email_length FROM customers;
  IF (Avg_Email_Length NOT BETWEEN 3000 AND 5000) THEN
    SYS.Dbms_Output.Put_Line('Среднеезначение = ' || avg_email_length);
  END IF;
END;