clear screen;



/*********************************************
**************  DATA TABLE   *****************
*********************************************/


drop table Teamlist1 CASCADE CONSTRAINTS;
drop table Teamlist2 CASCADE CONSTRAINTS;
drop table PerformanceList1 CASCADE CONSTRAINTS;
drop table PerformanceList2 CASCADE CONSTRAINTS;
drop table RelegationBattle CASCADE CONSTRAINTS;
drop table RecordList CASCADE CONSTRAINTS;

create table Teamlist1(
	teamID int,
	teamName VARCHAR2(50), 
	country VARCHAR2(50),
	seasonID int,
	PRIMARY KEY (teamID)
);

create table Teamlist2(
	teamID int,
	teamName VARCHAR2(50), 
	country VARCHAR2(50),
	seasonID int,
	PRIMARY KEY (teamID)
);	

create table Teamlist3(
	teamID int,
	teamName VARCHAR2(50), 
	country VARCHAR2(50),
	seasonID int,
	PRIMARY KEY (teamID)
);	

create table PerformanceList1(
	perID int,
	teamID int,
	win int,
	lost int,
	draw int,
	gf int,
	ga int,
	points int,
	PRIMARY KEY (perID),
	FOREIGN KEY (teamID) REFERENCES Teamlist1 (teamID),
	FOREIGN KEY (teamID) REFERENCES Teamlist2 (teamID),
	FOREIGN KEY (teamID) REFERENCES Teamlist3 (teamID)
);	
create table PerformanceList2(
	perID int,
	teamID int,
	win int,
	lost int,
	draw int,
	gf int,
	ga int,
	points int,
	PRIMARY KEY (perID),
	FOREIGN KEY (teamID) REFERENCES Teamlist1 (teamID),
	FOREIGN KEY (teamID) REFERENCES Teamlist2 (teamID),
	FOREIGN KEY (teamID) REFERENCES Teamlist3 (teamID)
);	

create table RelegationBattle(
	relID int,
	perID int,
	rbStatus VARCHAR2(50), 
	PRIMARY KEY (relID),
	FOREIGN KEY (perID) REFERENCES PerformanceList1 (perID),
	FOREIGN KEY (perID) REFERENCES PerformanceList2 (perID)
);
	
create table RecordList(
	recID int,
	teamName VARCHAR2(50), 
	win int,
	lost int,
	draw int,
	gf int,
	ga int,
	points int,
	predictedStatus VARCHAR2(50),
	PRIMARY KEY (recID)
);	





insert into Teamlist1(teamID, teamName,country, seasonID) values (23,'Brighton','England',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (19,'West Ham','England',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (15,'Aston Villa','England ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (33,'Real Betis','Spain ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (4,'Alaves','Spain ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (25,'Celta Vigo','Spain ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (12,'Norwich City','England ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (29,'Leganes','Spain ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (7,'Mallorca','Spain ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (14,'Bournemouth','England ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (20,'Espanyol','Spain ',1);
insert into Teamlist1(teamID, teamName,country, seasonID) values (21,'Watford','England ',1);


insert into Teamlist2(teamID, teamName,country, seasonID) values (11,'Alaves','Spain ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (5,'Elche','Spain ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (36,'Southampton','England ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (2,'Brighton ','England ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (35,'Burnley','England ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (31,'Huesca','Spain ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (22,'Fulham','England ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (16,'Valladodid','Spain ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (8,'West Brom','England ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (10,'Eibar','Spain ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (18,'Getafe','Spain ',2);
insert into Teamlist2(teamID, teamName,country, seasonID) values (30,'Sheffield United','England ',2);


insert into Teamlist3(teamID, teamName,country, seasonID) values (6,'Huddersfield','England ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (13,'Levante','Spain ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (24,'Fulham','England ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (17,'Cardiff City','England ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (27,'Valladolid','Spain ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (1,'Celta Vigo','Spain ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (32,'Brighton ','England ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (34,'Southampton','England ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (3,'Girona','Spain ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (26,'Huesca','Spain ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (9,'Rayo Vallecano','Spain ',3);
insert into Teamlist3(teamID, teamName,country, seasonID) values (28,'Burnley','England ',3);



insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (4,14,9,7,22,40,65,34);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (5,21,8,10,20,36,64,34);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (6,12,5,6,27,26,75,21);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (10,22,5,13,20,27,53,28);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (11,8,5,11,22,35,76,26);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (12,30,7,2,29,20,63,23);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (17,7,9,6,23,40,65,33);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (18,20,5,10,23,27,58,25);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (22,31,7,13,18,34,53,34);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (23,16,5,16,17,34,57,31);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (24,10,6,12,20,29,52,30);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (28,17,10,4,23,34,69,34);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (29,24,7,5,26,34,81,26);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (30,6,3,7,28,22,76,16);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (35,26,7,12,19,43,65,33);
insert into PerformanceList1(perID, teamID,win, lost,draw,gf,ga,points) values (36,9,8,8,22,41,70,32);



insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (1,23,9,14,15,39,54,41);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (2,19,10,9,19,49,62,39);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (3,15,9,8,21,41,67,35);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (7,36,12,7,19,47,68,43);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (8,2,9,14,15,40,47,41);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (9,35,10,9,19,33,55,39);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (13,33,10,11,17,48,6,41);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (14,4,10,9,19,34,59,39);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (15,25,7,16,15,37,49,37);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (16,29,8,12,18,30,51,36);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (19,18,9,11,18,28,43,38);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (20,11,9,11,18,36,57,38);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (21,5,8,12,18,34,55,36);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (25,28,11,7,20,45,68,40);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (26,34,9,12,17,45,65,39);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (27,32,9,9,20,35,60,36);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (31,13,11,11,16,59,66,44);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (32,27,10,11,17,32,51,41);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (33,1,10,11,17,53,62,41);
insert into PerformanceList2(perID, teamID,win, lost,draw,gf,ga,points) values (34,3,9,10,19,37,53,37);



insert into RelegationBattle(relID, perID,rbStatus) values (1,36,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (4,1,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (19,2,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (23,33,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (2,25,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (15,29,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (22,19,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (3,30,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (7,22,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (18,3,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (29,27,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (11,4,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (30,32,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (5,20,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (21,10,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (25,31,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (14,16,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (28,11,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (33,5,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (6,7,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (32,8,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (12,17,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (35,15,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (8,23,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (36,9,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (16,35,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (34,13,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (9,24,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (20,14,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (24,12,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (10,21,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (31,34,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (17,26,'No');
insert into RelegationBattle(relID, perID,rbStatus) values (26,28,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (27,18,'Yes');
insert into RelegationBattle(relID, perID,rbStatus) values (13,6,'Yes');







commit;