clear screen;
SET SERVEROUTPUT ON;



DECLARE 
        NUM money.taka%TYPE;

BEGIN
    SELECT TAKA INTO NUM FROM MONEY WHERE ID = 1;
	
	CASE 
	    WHEN MOD(NUM , 3)=0 THEN
		  DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN MOD(NUM , 3)=1 THEN
		  DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
		   DBMS_OUTPUT.PUT_LINE('TWO');
	END CASE;

END;
/



-- In a Shortcut way
DECLARE 
        NUM money.taka%TYPE;

BEGIN
    SELECT TAKA INTO NUM FROM MONEY WHERE ID = 3;

	CASE MOD(NUM , 3)
	    WHEN 0 THEN
		  DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN 1 THEN
		  DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
		   DBMS_OUTPUT.PUT_LINE('TWO');
	END CASE;
END;
/
