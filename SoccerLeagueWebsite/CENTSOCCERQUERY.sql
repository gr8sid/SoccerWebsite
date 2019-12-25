
 CREATE TABLE "CLUBS" 
   (	
   "CLUBID" int PRIMARY KEY NOT NULL IDENTITY(1,1), 
	"CLUBNAME" VARCHAR(255), 
	"CLUBCITY" VARCHAR(255), 
	"REGISTRATIONNUMBER" VARCHAR(255), 
	"ADDRESS" VARCHAR(255)
   );
   
   Insert into clubs values('don','donmills','0h0i','09 welk st');
   Insert into clubs values('daredevils','ecopark','89rt8','15/01 ecopar gate');
select * from CLUBS;
drop table clubs;
select MAX(clubid) from clubs;


CREATE TABLE "PLAYERS" 
   (	"PLAYERID" int PRIMARY KEY NOT NULL IDENTITY(1,1), 
	"CLUBID" int NOT NULL, 
	"PLAYERNAME"VARCHAR(255), 
	"JERSEYNUMBER" int, 
	"DATEOFBIRTH" VARCHAR(255),
	"PROFILEIMAGE" NVARCHAR (100),
  CONSTRAINT FK_CLUBID FOREIGN KEY (CLUBID) REFERENCES CLUBS(CLUBID)
   );

 insert into players values(1,'John',55,'10/09/95');
 insert into players values(1,'Adam',56,'10/10/95');
 insert into players values(1,'Steve',57,'25/09/92');
 insert into players values(2,'Laura',58,'13/09/90');
 insert into players values(2,'Mohan',59,'10/05/91');


 drop table players;
SELECT * FROM PLAYERS;   

CREATE TABLE "MATCHES"
(
 "MATCHID" int PRIMARY KEY NOT NULL IDENTITY(1,1),
 "HOSTTEAM" VARCHAR(255),
 "GUESTTEAM" VARCHAR(255),
 "MATCHDATE" VARCHAR (200),
 "HOSTGOALS" int, 
 "GUESTGOALS" int
 );
 
 Select * from matches;
 DROP TABLE MATCHES;