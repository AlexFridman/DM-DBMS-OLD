CREATE TABLE RENTALS_DELETE_LOG 
(
  MESSAGE VARCHAR2(256) NOT NULL 
);

CREATE OR REPLACE TRIGGER RENTALS_DELETE_LOG BEFORE
  DELETE ON rentals FOR EACH ROW BEGIN IF :old.rent_arrival_date < to_date(2001, 'YYYY') THEN
  INSERT
  INTO rentals_delete_LOG VALUES
    (
      'Reccod with id = '
      ||:old.rent_id
      ||' deleted.'
    );
END IF;
END;


