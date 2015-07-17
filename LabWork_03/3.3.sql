CREATE OR REPLACE FUNCTION GET_CUSTOMERS_BY_YEAR(
    y_in IN NUMBER,
    d_in IN NUMBER)
  RETURN sys_refcursor
IS
  RC sys_refcursor;
BEGIN
  OPEN rc FOR SELECT customer_id, SUM(Rent_Day_Price * (Rent_Departure_Date - Rent_Arrival_Date)) FROM rentals WHERE EXTRACT(YEAR FROM Rent_Arrival_Date) = y_in GROUP BY Customer_Id HAVING SUM(Rent_Departure_Date - Rent_Arrival_Date) > d_in;
  RETURN rc;
END GET_CUSTOMERS_BY_YEAR;