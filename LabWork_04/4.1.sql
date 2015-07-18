-- Create table
create table CUSTOMERS_LOG
(
  id      number not null,
  message varchar2(256) not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table CUSTOMERS_LOG
  add constraint CUSTOMERS_LOG_PK primary key (ID);


  CREATE OR REPLACE TRIGGER CUSTOMERS_LOG before
  INSERT ON customers FOR EACH row DECLARE MESSAGE VARCHAR2(256);
  BEGIN
    MESSAGE := 'Customer with id = ' || :new.customer_id || ' added.';
    INSERT INTO customers_log VALUES
      (MESSAGE
      );
  END CUSTOMERS_LOG;