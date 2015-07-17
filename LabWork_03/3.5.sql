CREATE OR REPLACE FUNCTION DATE_INTERSECTION(
    START_1 IN DATE ,
    END_1   IN DATE ,
    START_2 IN DATE ,
    END_2   IN DATE )
  RETURN NUMBER
AS
BEGIN
  RETURN LEAST(end_1, end_2) - GREATEST(start_1, start_2);
END DATE_INTERSECTION;


CREATE OR REPLACE FUNCTION CALC_MISSED_PROFIT(
    START_DATE IN DATE ,
    END_DATE   IN DATE )
  RETURN sys_refcursor
IS
  RC sys_refcursor;
BEGIN
  OPEN rc FOR SELECT rooms.room_id, temp.free_days*rooms.room_base_price FROM Rooms,
  (SELECT rooms.room_id,
    END_DATE - START_DATE -SUM(DATE_INTERSECTION(START_DATE,END_DATE, rentals.Rent_Arrival_Date, rentals.Rent_Departure_Date )) free_days
  FROM rooms
  RIGHT OUTER JOIN rentals
  ON rooms.room_id                 = rentals.room_id
  WHERE room_floor                 =5
  AND Rentals.Rent_Arrival_Date   <= END_DATE
  AND Rentals.Rent_Departure_Date >= START_DATE
  GROUP BY Rooms.Room_Id
  ) temp WHERE temp.room_id = rooms.room_id;
  RETURN rc;
END CALC_MISSED_PROFIT;