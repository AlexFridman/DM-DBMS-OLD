DROP TABLE temp;
CREATE TABLE TEMP AS
SELECT * FROM Customers;
DECLARE
  CURSOR temp_cust_cur
  IS
    SELECT * FROM temp;
BEGIN
  FOR cust IN temp_cust_cur
  LOOP
    dbms_output.put_line('Id = ' || cust.customer_id ||', Last Name = '||cust.customer_last_name);
  END LOOP;
END;
