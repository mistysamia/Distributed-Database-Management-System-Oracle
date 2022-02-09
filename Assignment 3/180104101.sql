clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;


/*********************************************
**************  DATA TABLE   *****************
*********************************************/


drop table artist;
create table artist (artistId number , name varchar2(20), age number,
gender VARCHAR2(20));
insert into artist values(1,'A',20,'M');
insert into artist values(2,'B',30,'F');
insert into artist values(3,'C',35,'M');
insert into artist values(4,'D',32,'F');
insert into artist values(5,'E',46,'F');
insert into artist values(6,'F',48,'M');
select * from artist;


drop table album;
create table album (albumId number , albumTitle varchar2(20), artistId number,
certification VARCHAR2(20),numberOfTracks number);
insert into album values(1,'PONM',2,'GOLD',7);
insert into album values(2,'TSRQ',5,'PLATINUM',14);
insert into album values(3,'DCBA',3,'SILVER',12);
insert into album values(4,'HGFE',1,'GOLD',10);
insert into album values(5,'LKJI',2,'PLATINUM',9);
select * from album;

drop table track;
create table track (trackId number ,trackTitle varchar2(20),
genre VARCHAR2(20), albumId number,released date);
insert into track values(1,'title1','rock',1,'22-JUN-1992');
insert into track values(2,'title2','rock',1,'12-JUL-1992');
insert into track values(3,'title3','country',4,'02-FEB-1972');
insert into track values(4,'title4','rock',1,'12-JUL-1992');
insert into track values(5,'title5','country',2,'25-MAR-1997');
insert into track values(6,'title6','country',2,'25-MAR-1997');
insert into track values(7,'title7','pop',3,'26-JUN-2010');
insert into track values(8,'title8','pop',5,'22-MAY-1982');
select * from track;
 
 
drop table artistDetails;
create table artistDetails (artistId number , name varchar2(20), age number,
gender VARCHAR2(20)); 
 
 
 
/*********************************************
**************  Trigger  *****************
*********************************************/
create or replace trigger t1
after update or insert
on artistDetails
for each row

DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('New Values Inserted on table Artist Details');
End;
/


/*********************************************
**************  Package Head   *****************
*********************************************/
create or replace package mypack AS
    function finding(A in album.albumId%TYPE)
	   return varchar2;
	   
	Procedure artistSearching (A in number,B out artist.age%TYPE,
    C out artist.gender%TYPE,D out artist.name%TYPE, flag in out number);
	
	Procedure otherSearching (A in artist.gender%TYPE,B in artist.artistId%TYPE);
End mypack;
/



/*********************************************
**************  Package Body   *****************
*********************************************/
create or replace package body mypack AS

    -------------  Function  --------------
    function finding(A in album.albumId%TYPE)
    return varchar2
    is
    BEGIN
        for R IN (select * from track) LOOP
            if A=R.albumId THEN
		       return R.genre;
		    End if;
	    End loop;
    End finding;


    -------------  Procerdure  --------------
    procedure artistSearching(A in number,B out artist.age%TYPE,
    C out artist.gender%TYPE,D out artist.name%TYPE, flag in out number)
    is 
    BEGIN 
        for R IN (select * from artist) LOOP    
		    If R.artistId=A then
		        B:=R.age;
		        C:=R.gender;
		        D:=R.name;
		        flag:=1;
		        Exit;
	    	End if;
        END LOOP;	
    End artistSearching;
	
	-------------  Procerdure  --------------
	procedure otherSearching(A in artist.gender%TYPE,B in artist.artistId%TYPE)
    is 
    BEGIN 
        for R IN (select * from Album inner join 
		    Artist on artist.artistId=album.artistId  where (album.certification='GOLD'
		    or album.certification='PLATINUM') and artist.gender=A) LOOP   
		        for P IN (  select * from album where albumId=R.albumId) LOOP 
                    If P.artistId!=B then
		                DBMS_OUTPUT.PUT_LINE('Other artists of '||A||' gender: '||R.name);
		                DBMS_OUTPUT.PUT_LINE('Albums of '||R.name||': '||R.albumTitle);
						DBMS_OUTPUT.PUT_LINE('Genre of '||R.albumTitle||': '||finding(R.albumId));
		                DBMS_OUTPUT.PUT_LINE('Number of tracks in '||R.albumTitle||': '|| R.numberOfTracks );
		            End if;					
	            End Loop;
        END LOOP;	
    End otherSearching;
	
End mypack;
/



Accept X  number prompt "Enter the Artist ID = "
DECLARE
    Num int := &x;
	Age artist.age%TYPE; 
	Gender artist.gender%TYPE;
	Name artist.name%TYPE;
    flag number:=0;	
	Error Exception; 
BEGIN
    If Num<=0 then 
	    raise Error;  
	end if;
	mypack.artistSearching(Num,Age,Gender,Name,flag);
	if flag=0 then
	    DBMS_OUTPUT.PUT_LINE('Artist does not exist.');
    else 
	    DBMS_OUTPUT.PUT_LINE('Age of '||Name||': '||Age);
		DBMS_OUTPUT.PUT_LINE('Gender of '||Name||': '||Gender);
        mypack.otherSearching(Gender,Num);
        insert into artistDetails values (Num,Name,Age,Gender);		
    end if;
	
EXCEPTION
    when Error THEN
	    DBMS_OUTPUT.PUT_LINE('Artist ID can''t be less than or equal to Zero.');
  
END;
/


select * from artistDetails;

commit;

