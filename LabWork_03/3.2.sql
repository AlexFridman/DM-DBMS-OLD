CREATE OR REPLACE FUNCTION GET_RENTALS(
    BEGIN_INT IN DATE ,
    END_INT   IN DATE )
  RETURN sys_refcursor
IS
  RC sys_refcursor;
BEGIN
  OPEN rc FOR SELECT rentals.room_id, AVG(Rent_Day_Price) avg_price FROM rentals INNER JOIN rooms ON rentals.Room_Id = Rooms.Room_Id WHERE Rent_Arrival_Date BETWEEN BEGIN_INT AND END_INT GROUP BY rentals.Room_Id;
  RETURN rc;
END GET_RENTALS;