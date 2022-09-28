SET SERVEROUTPUT ON;


BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/


DECLARE 
        t_name varchar2(20);
        t_taka number ;

BEGIN  
    select name, taka into t_name, t_taka  from money where id = 2;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/



DECLARE 
        t_name money.name%TYPE;
        t_taka money.taka%TYPE :=700;

BEGIN
 
    update money set taka = t_taka where id =1;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/

DECLARE 
        NUM money.taka%TYPE;

BEGIN
    SELECT TAKA INTO NUM FROM MONEY WHERE ID = 1;
    
	/*IF MOD (NUM,3) = 0 THEN
	    DBMS_OUTPUT.PUT_LINE('ZERO');
    ELSIF MOD (NUM,3) = 1 THEN
	    DBMS_OUTPUT.PUT_LINE('ONE');
    ELSE 
 	    DBMS_OUTPUT.PUT_LINE('TWO');
	  
	END IF;*/
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


DECLARE 
        NUM INT := 0;

BEGIN
    LOOP
	    NUM := NUM+1;
		DBMS_OUTPUT.PUT_LINE(NUM);
		
		/*IF NUM=5 THEN
		   EXIT;
		END IF;*/
		
		EXIT WHEN NUM=5;
	END LOOP;
END;
/


DECLARE 
        NUM INT := 0;

BEGIN
    WHILE NUM<5
    LOOP
	    NUM := NUM+1;
		DBMS_OUTPUT.PUT_LINE(NUM);
	END LOOP;
END;
/

DECLARE 
        NUM INT := 5;

BEGIN
    FOR i IN 1..NUM LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
END;
/


DECLARE 
        NUM money.id%TYPE := 0;

BEGIN
    select count(id) into NUM from money;
    FOR i IN 1..5 LOOP
	    NUM := NUM+1;
		insert into money values (NUM , 'D',300);
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
END;
/


SET VERIFY OFF;
DECLARE
    A int := &x;
	B int := &y;
	
BEGIN
     DBMS_OUTPUT.PUT_LINE(A+B);
END;
/

SET VERIFY OFF;
DECLARE
    A VARCHAR2(100) := '&NAME';
	B VARCHAR2(100) := '&ADDRESS';
	
BEGIN
     DBMS_OUTPUT.PUT_LINE(A || ' ' || B);
END;
/