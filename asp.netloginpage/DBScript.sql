

USE [LoginDB]
GO
/****** Object:  Table [dbo].[tblUser]    ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser]') AND type in (N'U'))
DROP TABLE [dbo].[tblUser]
GO
USE [master]
GO
/****** Object:  Database [LoginDB]     ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'LoginDB')
DROP DATABASE [LoginDB]
GO
/****** Object:  Database [LoginDB]     ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'LoginDB')
BEGIN
CREATE DATABASE [LoginDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LoginDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLE2012\MSSQL\DATA\LoginDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LoginDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLE2012\MSSQL\DATA\LoginDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [LoginDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoginDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoginDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoginDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoginDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoginDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoginDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoginDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoginDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoginDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoginDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoginDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoginDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoginDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoginDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoginDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoginDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoginDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoginDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoginDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoginDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LoginDB] SET  MULTI_USER 
GO
ALTER DATABASE [LoginDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoginDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LoginDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LoginDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LoginDB]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 05-Apr-2017 9:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUser](
	[UserID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](250) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUser] ([UserID], [UserName], [Password]) VALUES (1, N'User1', N'123')
USE [master]
GO
ALTER DATABASE [LoginDB] SET  READ_WRITE 
GO


CREATE TABLE ships(

ship_ID int primary key,

shipName varchar(30),

fuel float,

Beam int,

D_Displacement float,

speed float,

Endurance float,

lenght float,

draught varchar(15),

Home_Port varchar(20)

);

insert into ships (ship_ID,shipName,fuel,BEAM,D_Displacement,speed,Endurance,lenght,draught,Home_Port) values
(400,'Bella','90','800000','10000','1800','800','10000','400mm','kingston');

select * from ships

create table Crew(
  CrewID int primary key not null,
  fname varchar(25) not null,
  lname varchar(25) not null,
  Master_ varchar(30) not null,
  Qualifications varchar(20)
);

insert into Crew ( CrewID,fname,lname,Master_,Qualifications) values
(1508890,'Kehlia','Atkins','Lee','Masters');

CREATE TABLE Passenger (
    ship_IDentification int ,
    Capacity int NOT NULL,    
    Stateroom varchar(20) not null,
	class varchar(20),
	PRIMARY KEY(ship_IDentification),
    Constraint fk_ship Foreign Key (ship_IDentification) references ships(ship_ID)
);




Create table Oil_Tanker(
ship_identify int,
dead_weight float,
class_Petroleum varchar (20),
PRIMARY KEY(ship_identify),
Constraint fk_s Foreign Key (ship_identify) references ships(ship_ID),
);

 ---- Purpose of this table trip is store the infromation of all the infromation on the shipping company-----
 
  create table Trip(
 Dates date not null,
 Departure varchar (max) not null,
 Destination varchar(max) not null,
 Number_On_Board int not null,
 Number_of_Officers int not null,
 Repairs varchar (max) not null,
 Position_Of_Vessles varchar (max) not null,
 Port_Rec varchar (max) not null,
 Value_s float not null,
 Trip_ID int not null primary key
 );

 Insert into Trip(Dates,Departure,Destination,Number_On_Board,Number_of_Officers,Repairs,Position_Of_Vessles,Port_Rec,Value_s,Trip_ID) Values

 ('10-19-2019','K','C','100','5','N','N','P','87674','8001');


create table Cargo(
ship_IDent int,
cargo_class varchar(20),
cargo_capacity int,
PRIMARY KEY(ship_IDent),
Constraint fk_shpid Foreign Key (ship_IDent) references ships(ship_ID),
);


insert into Cargo (ship_IDent, cargo_class,cargo_capacity)  values 
(1532, 'First','120') 


create table takes(
TripID int ,
Crew_ID int ,
bounty float null,
Position varchar(max)
 constraint pk_take primary key (TripID,Crew_ID),
 Constraint fk_SID Foreign Key (TripID) references Trip(Trip_ID),
 Constraint fk_CRD Foreign Key (Crew_ID) references Crew(CrewID),
);
 

 create table Salary(
 salary_id int ,
 Individual_Service_Length varchar(max) not null,
 Length_of_trip float not null,
 CrewI_D int,
 Current_Appointment varchar(max),
 TRN varchar(20),
  Constraint fk_sal Foreign Key (CrewI_D) references Crew(CrewID),
  constraint pk_sal primary key (salary_id,CrewI_D),
 );




 ---------purpose of this table includes is to get the information of the trips that each ship take-------

  create table Includes (
  TripId int,
  ship_ID int 
  constraint pk_flt primary key (Tripid,ship_ID),
 Constraint fk_tINc Foreign Key (Tripid) references Trip(Trip_ID),
 Constraint fk_SInc Foreign Key (ship_ID) references Ships(Ship_ID),
 );




 create table Contain 
 (
	Work_Date date,
	Shipid int,
	crew_i_d int,
	constraint pk_contain primary key (Shipid,crew_i_d),
	Constraint fk_cont Foreign Key (Shipid) references Ships(Ship_ID),
	Constraint fk_contC Foreign Key (crew_i_d) references Crew(CrewID)
 )
 

 create table Manager
 (
	Manager_id  int primary key,
	Crew_id int,

	Constraint fk_man Foreign Key (Crew_id) references Crew(CrewID),
 )




                        --------five views----------



  --------- purpose  for the view which ship doced at which port on a specific date--------
GO
CREATE VIEW viewship AS
SELECT ships.shipName,Trip.Dates,Trip.port_rec
FROM Trip,ships
WHERE Trip.Dates='12/12/1999';
GO

SELECT * FROM viewship;



  --------- purpose is to view which port had the most ships on a date-------
GO
CREATE VIEW viewport AS
SELECT count(ships.ship_ID) as numOfShip,Trip.port_rec
FROM Trip,ships
WHERE Trip.Dates='12/12/1999'
group by port_rec;
GO


 --------- purpose is to get the ships that value more than average--------
GO
CREATE VIEW [ships Above Average value] AS
SELECT shipName, value_s
FROM ships,Trip
WHERE value_s> (SELECT AVG(value_s) FROM Trip);
GO
SELECT * FROM [ships Above Average value] ;


  --------- purpose is to find out all the ships a specific manager worked on --------
GO
 CREATE VIEW Master_ships AS
 SELECT shipName
 FROM Crew, Ships
 where  Master_='Mario';
 GO
 select * from Master_ships


 --------- purpose is to view which Oil tanker takes a specific typoe of fuel--------
 GO
 CREATE VIEW OilTankers AS
 SELECT shipName,ship_ID
 FROM ships,oil_Tanker
 where  class_Petroleum='90'
 GO
  SELECT * FROM OilTankers;




  --stored procedures


  --1 to insert the type of petrol the ship carries
 GO 
CREATE PROCEDURE [dbo].[sp_insertGas]
(
	@ship_identify int,
	@dead_weight float,
	@class_Petroleum varchar (20)
)
AS
INSERT INTO Oil_Tanker(ship_identify, dead_weight, class_Petroleum)
VALUES
(@ship_identify, @dead_weight, @class_Petroleum)


--2 chnage the name of a ship by accepting id number and new name
GO
CREATE PROCEDURE [dbo].[sp_updaterec] 
(
	@Ship_ID Int,
	@newname varchar(20)
)
AS
	SELECT * FROM ships WHERE ship_ID=@Ship_ID

	UPDATE ships set shipName=@newname where ship_ID=@Ship_ID




--output 1
--3 Enter ship id to get name and speed of ship
GO
CREATE PROCEDURE [dbo].[sp_ships] 
(
@shipId int
)
AS
SELECT shipName, speed FROM ships WHERE ship_ID=@shipid



exec sp_parishrec'portland'



--4 output 2


--enter ship id to count how many ships are of the same length
GO
CREATE PROCEDURE [dbo].[sp_shiplenght] 
(
	@shipID int
)
AS

SELECT COUNT(*) AS ship_length FROM ships WHERE ship_ID=@shipID GROUP BY lenght





--5 in and out accepts new name and prints the results updated master name
GO
CREATE PROCEDURE [dbo].[sp_updateMaster] 
(
	@crew_ID Int,
	@newname varchar(20)
)
AS
SELECT * FROM crew WHERE crewID=@crew_ID

--error---
UPDATE crew 
set Master_=@newname where crewID=@crew_ID
SELECT * FROM crew WHERE crewID=@crew_ID

--6 in and out
GO
CREATE PROCEDURE [dbo].[sp_insertGas2]
(
	@ship_identify int,
	@dead_weight float,
	@class_Petroleum varchar (20)
)
AS
INSERT INTO Oil_Tanker(ship_identify, dead_weight, class_Petroleum)
VALUES (@ship_identify, @dead_weight, @class_Petroleum)

select* from Oil_Tanker


--Function

--1
--return how much ship have the same home port
GO
CREATE FUNCTION countShip
(
	@Home_Port varchar(15)
)
RETURNS varchar(15)
AS
BEGIN
return (select  count(ship_ID)as numOfShip  from ships where Home_Port=@Home_Port);
END

--2

--accepts lengths and bounty and iscreases the county by 10% if length is above 1000
GO
CREATE FUNCTION bountyincrease
(
@bounty float,
@length float
)
RETURNS float
AS
BEGIN
DECLARE @Output float
if(@length>1000.00)
SET @Output =((10/100)*@bounty)+@bounty
RETURN @Output
END

------------------------------------DEMO 3---------------------------------------------------
--Trigger that keeps an audit log of each modification to SalaryTable as well as the user who made the change and the time that change was made
CREATE TABLE SALARYAudit
(
	AuditID int primary key NOT NULL IDENTITY(1,1),
	CrewID int not null,
	Crew_fname varchar(20) not null,
	Crew_lname varchar(20) not null,
	Salary_id int,
	ModifiedBy varchar(30),
	ModifiedDate DATE,
	operation varchar(1)
);

GO
CREATE TRIGGER TR_Audit_CrewSalary ON dbo.Salary
	FOR  UPDATE, DELETE
	AS

	DECLARE @Crew_id int,
	@Crew_fname varchar(20),
	@Crew_lname varchar(20),
	@Salary_id int,
	--@ModifiedBy varchar(30),
	@ModifiedDate DATE,
	@operation varchar(1);

	SET @Crew_id=(SELECT CrewI_D FROM inserted)
	SET @Crew_fname = (SELECT fname FROM Crew where CrewId=@Crew_id)
	SET @Crew_lname = (SELECT lname FROM Crew where CrewId=@Crew_id)
	SET @Salary_id = (SELECT salary_id FROM inserted)
	--SET @ModifiedBy = (SELECT fname FROM Crew where CrewId=@Crew_id)
	SET @ModifiedDate = GETDATE()
	SET @operation = 'U'

	SET @Crew_id=(SELECT CrewI_D FROM deleted)
	SET @Crew_fname = (SELECT fname FROM Crew where CrewId=@Crew_id)
	SET @Crew_lname = (SELECT lname FROM Crew where CrewId=@Crew_id)
	SET @Salary_id = (SELECT salary_id FROM deleted)
	--SET @ModifiedBy = (SELECT fname FROM Crew where CrewId=@Crew_id)
	SET @ModifiedDate = GETDATE()
	SET @operation = 'D'

	INSERT INTO SALARYAudit(CrewID,Crew_fname,Crew_lname,Salary_id,ModifiedDate,operation) 
	VALUES (@Crew_id,@Crew_fname,@Crew_lname,@Salary_id,@ModifiedDate,@operation);
GO

--DROP TRIGGER TR_Audit_CrewSalary
--INSERT INTO Crew VALUES (1,'Carl','Green','Captain Jack','Seaman');
--INSERT INTO Salary (salary_id,Individual_Service_Length,Length_of_trip,CrewI_D,Current_Appointment,TRN) 
--VALUES (2,'20',3,1,'Passenger','123456789');
--DELETE FROM Salary WHERE salary_id=2


create table P_Ship(
p_ID int primary key,
Capacity_ int NOT NULL
);
	
	Go
CREATE TRIGGER tr_PassengerShip_ForInsert on  [dbo].[Passenger]

for insert as 
begin

declare @ID int,
@Capacity varchar(20)

select @ID = i.ship_IDentification from inserted i;
select @Capacity = i.Capacity from inserted i;

insert into P_Ship(p_ID,Capacity_)
values (@ID, @Capacity  );   
End
---------------------------------------------------------------------------------------
 create Table Trip_log(
 T_ID int primary key not null,
 trip_Destination varchar not null,
 OnBoard int not null
 );

 GO
 Create Trigger tr_TripDestination_forinsert on [dbo].[Trip] 
 for insert as
 begin
 declare @TID int,
 @Destination_ varchar(20),
 @Num_board int

 select @TID=i.Trip_ID from inserted i;
 select @Destination_=i.Destination from inserted i;
 select  @Num_board=i.Number_On_Board from inserted i;

 insert into Trip_log(T_ID, trip_Destination, OnBoard)
 values( @TID,@Destination_,@Num_board);
 end


-------Encrypting Password Column
SELECT * FROM userlogin
CREATE table userlogin
(
ID int primary key not null,
Username   varchar (800) not null,
Password_   varchar (800) not null,
Role_       varchar (800) NOT NULL,
Pin			varchar(10) NOT NULL		
);


CREATE ASYMMETRIC KEY Demo1234Password
WITH ALGORITHM = RSA_2048 ENCRYPTION BY PASSWORD = 'yourKey'
GO 
CREATE PROCEDURE sp_encryptPassword_before_insert 
(
	@id int,
	@username varchar(20),
	@password varchar(30),
	@role varchar(1),
	@pin varchar(10)
)
AS
	DECLARE @KEYID INT
	BEGIN
	SET 
		@KEYID = AsymKey_ID('Demo1234Password')
		INSERT INTO userlogin(ID,Username,Password_,Role_,Pin) 
		VALUES (@id,@username,EncryptByAsymKey (@KEYID, @password),@role,@pin);
		END
EXEC sp_encryptPassword_before_insert  010,'admin1002','hello','CrewMember','1234'
EXEC sp_encryptPassword_before_insert  020,'Corey','mypassword','Master_','9453'
EXEC sp_encryptPassword_before_insert  040,'Mario','hello','Master_','9574'

select * from userlogin 

go
CREATE ROLE CrewMember
GO

go
CREATE ROLE Master_
GO

GRANT SELECT ON takes to CrewMember
GRANT SELECT ON Trip to CrewMember

GRANT SELECT, insert, update ON takes to  Master_
Grant insert, select on Contain to Master_
grant alter, select, delete, insert on Crew to Master_
grant select on manager to Master_
grant select on master_ships to Master_
Grant select on ships to Master_

GRANT ROLE Master_ to 'admin1002'

-------------TEST------------------------------------------
CREATE TABLE [tblLoginInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL ,
	[EmpId] [int] PRIMARY KEY NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserRole] [nvarchar](10) NOT NULL,
	[OnDate] [datetime] NULL DEFAULT (getdate())
)

GO

INSERT INTO tblLoginInfo VALUES (1002,'test1','test123','admin',GETDATE());

 Select * from tblLoginInfo

