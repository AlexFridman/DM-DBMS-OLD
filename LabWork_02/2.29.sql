DECLARE
  CURSOR cur
  IS
    SELECT Customers.Customer_Id,
      rentals.Rent_Id
    FROM Customers
    INNER JOIN rentals
    ON Rentals.Customer_Id = Customers.Customer_Id;
BEGIN
  FOR item IN cur
  LOOP
    IF cur%rowcount = 5 THEN
      dbms_output.put_line('The 5th record');
      dbms_output.put_line('Id = ' || item.customer_id ||', Last Name = '||item.Rent_Id);
      EXIT;
    END IF;
  END LOOP;
END;