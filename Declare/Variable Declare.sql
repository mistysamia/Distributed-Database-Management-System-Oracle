clear screen
SET SERVEROUTPUT ON;
--If we want to print something (DBMS_....) then have to write this on the top

DECLARE 
        t_name varchar2(20);
        t_taka number ;

BEGIN  
    select name, taka into t_name, t_taka  from money where id = 2;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
