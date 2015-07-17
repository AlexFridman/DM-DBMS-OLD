CREATE OR REPLACE FUNCTION GET_CUSTOmers(
    FIRST_NAME IN VARCHAR2 DEFAULT '' ,
    LAST_NAME  IN VARCHAR2 DEFAULT '' )
  RETURN sys_refcursor
IS
  RC sys_refcursor;
BEGIN
  OPEN RC FOR SELECT * FROM customers WHERE Customer_First_Name LIKE '%' ||first_name ||'%' AND Customer_Last_Name LIKE '%' ||last_name ||'%' ;
  RETURN RC;
END GET_CUSTOmers;
