USE SCHOOL_DW
GO
/*
 * 
 * Project:              school dw 
 * Author:              Rick Sherman
 * Date Modified:  2020-07-26
 * Target DBMS:   Microsoft SQL Server 
 */

/* 
 * TABLE: dbo.Dim_SOR 
 */

CREATE TABLE dbo.Dim_SOR(
    SOR_SK             int               IDENTITY(1,1) NOT NULL,
    SOR_System_ID       int             NOT NULL,
    SOR_Table_Name      nchar(80)       NULL,
    SOR_Description     nchar(80)       NULL,
    DI_Job_ID           nvarchar(20)    ,


    DI_Create_Date      datetime        DEFAULT getdate() NOT NULL,
    DI_Modified_Date    datetime        DEFAULT getdate() NOT NULL,
    PRIMARY KEY CLUSTERED (SOR_SK)
)
go

/* 
 * TABLE: dbo.Dim_SOR_System 
 */

CREATE TABLE dbo.Dim_SOR_System(
    SOR_System_SK       int        IDENTITY(1,1) NOT NULL,
    SOR_Name            nchar(20)       NULL,
    SOR_Description     nchar(80)       NULL,
    SOR_Type            varchar(80)     NULL,
    SOR_DBMS            varchar(80)     NULL,
    SOR_DBName          varchar(80)     NULL,
    SOR_DBSchema        varchar(80)     NULL,
    SOR_FileType        varchar(80)     NULL,
    SOR_Filename        varchar(255)    NULL,
    SOR_AppName         varchar(255)    NULL,
    SOR_AppModule       varchar(255)    NULL,
    DI_Job_ID           nvarchar(20)    NULL,
    DI_Create_Date      datetime        DEFAULT getdate() NOT NULL,
    DI_Modified_Date    datetime        DEFAULT getdate() NOT NULL,
    PRIMARY KEY (SOR_System_SK)
)
go

CREATE TABLE Dim_Reject_Codes(
    DI_Reject_SK               int              IDENTITY(1,1) NOT NULL,
    DI_Reject_Code           int              NOT NULL,
    DI_Reject_Reason        nchar(80)        NULL, 
    DI_Reject_Description   nchar(255)      NULL,
    SOR_ID                  int              DEFAULT -1 NOT NULL,
    DI_Job_ID               nvarchar(20)     NOT NULL,
    DI_Create_Date          datetime         DEFAULT getdate() NOT NULL,
    DI_Modified_Date        datetime         DEFAULT getdate() NOT NULL,
    PRIMARY KEY (DI_Reject_SK)
)
go


/* ************************************************************************** */

DROP TABLE if exists Dim_Absence_Reason;

CREATE TABLE Dim_Absence_Reason (
	Absence_Reason_SK int NOT NULL IDENTITY(1,1),

	Reason_Id int NULL,
	Reason_Code nvarchar(10) NULL,

	Reason_Desc nvarchar(250),
	Reason_Abbv nvarchar(10),
	Reason_Type nvarchar(20),

	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) not null,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Absence_Reason_SK)
);


DROP TABLE if exists Dim_Behavior_Event_Type ;

CREATE TABLE Dim_Behavior_Event_Type (
	Behavior_Event_Type_SK int NOT NULL IDENTITY(1,1),

	Behavior_Event_Id int NULL,
	Behavior_Event_Code nvarchar(5) NULL,
	Behavior_Event_Desc nvarchar(150) NOT NULL,

	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Behavior_Event_Type_SK)
);

DROP TABLE if exists Dim_Behavior_Location_Type ;

CREATE TABLE Dim_Behavior_Location_Type (
	Behavior_Location_Type_SK int NOT NULL IDENTITY(1,1),
	Behavior_Location_Id int NOT NULL,
	Behavior_Location_Desc nvarchar(150) NOT NULL,
	Behavior_Location_Code nvarchar(5) NOT NULL,

	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Behavior_Location_Type_SK )
);

DROP TABLE if exists Dim_Behavior_Resolution_Type ;

CREATE TABLE Dim_Behavior_Resolution_Type (
	Behavior_Resolution_SK int NOT NULL IDENTITY(1,1),
	Behavior_Resolution_id int NULL,
	Behavior_Resolution_Code nvarchar(5) NULL,
	Behavior_Resolution_Desc nvarchar(150) NOT NULL,

	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Behavior_Resolution_SK )
);

DROP TABLE if exists Dim_Behavior_Role ;

CREATE TABLE Dim_Behavior_Role (
	Behavior_Role_SK int NOT NULL IDENTITY(1,1),
	Behavior_Role_Id int NOT NULL,
	Behavior_Role_Desc nvarchar(150) NOT NULL,
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Behavior_Role_SK )
);

DROP TABLE if exists Dim_CDE_School ;

CREATE TABLE Dim_CDE_School (
	CDE_School_SK int NOT NULL IDENTITY(1,1),
	CDE_School_Id int NOT NULL,
	CDE_School_Number nvarchar(10),
	CDE_Minimum_Grade_Taught nvarchar(10),
	CDE_Maximum_Grade_Taught nvarchar(10),
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (CDE_School_SK)
);

DROP TABLE if exists Dim_Date ;

CREATE TABLE Dim_Date (
	Date_SK int NOT NULL,
	Date_AK date not null,
	DateSerial int,

	Year_ID int,
	Year_Name int,
	Year_Start date,
	Year_End date,
	Half_ID int,
	Half_Name nvarchar(10),
	Qtr_ID int,
	Qtr_Name nvarchar(10),
	Quarter_Start date,
	Quarter_End date,
	Month_ID int,
	Month_Name nvarchar(10),
	Month_Start nvarchar(10),
	Month_End nvarchar(10),
	Day_In_Month char(2),
	Day_ID nvarchar(10),
	Day_Name nvarchar(10),
	DOW nvarchar(10),
	DOW_Num int,
	DOY int,
	Week_ID int,
	Week_Name nvarchar(50),
	WOY int,
	Week_Start nvarchar(10),
	Week_End nvarchar(10),
	Fiscal_Year int,
	Fiscal_Year_Start date,
	Fiscal_Year_End date,
	Fiscal_Half nvarchar(10),
	Fiscal_Qtr nvarchar(10),
	Fiscal_Month nvarchar(10),
	Fiscal_Month_Num int,
	Fiscal_Week nvarchar(50),
	Fiscal_Week_Num int,
	Fiscal_DOY int,
	Contract_Year int,
	Contract_Qtr nvarchar(10),
	Contract_Month nvarchar(10),
	Contract_Month_Num int,
	Pay_Period_Month_ID int,
	Pay_Month nvarchar(10),
	Pay_Year nvarchar(10),
	Fiscal_Week_Start nvarchar(10),
	Fiscal_Week_End nvarchar(10),
	School_Year nvarchar(10),
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Date_SK)
);


DROP TABLE if exists Dim_Grade_Level ;

CREATE TABLE Dim_Grade_Level (
	Grade_Level_SK int NOT NULL IDENTITY(1,1),
	Grade_Id int NOT NULL,
	Grade_Name nvarchar(5) NOT NULL,
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Grade_Level_SK)
);

DROP TABLE if exists Dim_Language ;

CREATE TABLE Dim_Language (
	Language_SK int NOT NULL IDENTITY(1,1),

	Language_Id int NOT NULL,
	[Language] nvarchar(50),
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Language_SK )
);

DROP TABLE if exists Dim_School_District ;

CREATE TABLE Dim_School_District (
	District_Area_SK int NOT NULL IDENTITY(1,1),

	District_Id int NULL,
	District_Area_Code nchar(2),
	SOR_SK int NOT NULL,
	District_Area_Name nvarchar(100),
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (District_Area_SK )
);

DROP TABLE if exists Dim_School_Type ;

CREATE TABLE Dim_School_Type (
	School_Type_SK int NOT NULL IDENTITY(1,1),

	School_Type_Id int NULL,
	School_Type_Code nvarchar(10) NULL,
	School_Description nvarchar(250) NOT NULL,
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (School_Type_SK)
);

DROP TABLE if exists Dim_Staff_by_District ;

CREATE TABLE Dim_Staff_by_District (
	Staff_SK int NOT NULL IDENTITY(1,1),

	Staff_PK varchar(36) NULL,
	Staff_DAC_ID int null,
	staff_state_number int null,
	employee_state_id varchar(50) null,

	District_Area_SK int not null,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	BirthDate date,
	HireDate date,
	MaritalStatus int,
	Gender nchar(1),
	StaffType int,
	university nvarchar(50),
	phone nvarchar(50),
	address nvarchar(50),
	city nvarchar(50),
	state nvarchar(50),
	statecode nvarchar(3),
	country nvarchar(50),
	Latitude decimal(28,10),
	Longitude decimal(28,10),
	SOR_CreateDate datetime,
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Staff_SK)
);


DROP TABLE if exists Dim_Student_by_District ;

CREATE TABLE Dim_Student_by_District (
	Student_SK int NOT NULL IDENTITY(1,1),

                   Student_ID int NULL,
                   Student_DAC_ID int null,
	ODS_Student_Id bigint NULL,
	State_Student_Id bigint null,
	PermNum bigint NULL,

	Last_Name nvarchar(80),
	First_Name nvarchar(80),
	Middle_Name nvarchar(80),
	Generation nvarchar(10),
	Gender nchar(1),
	Birthdate date,
	Language_SK int,
	GT_Date datetime,
	IEP_Date datetime,
	Class_Affiliate_ID int,
	Class_Affiliate nvarchar(50),
	phone nvarchar(50),
	address nvarchar(50),
	city nvarchar(50),
	state nvarchar(50),
	statecode nvarchar(3),
	Postal int,
	Latitude decimal(28,10),
	Longitude decimal(28,10),
	Parent_Last_Name nvarchar(50),
	Parent_First_Name nvarchar(50),
	District_Area_SK int not null,
	Misbehave_Flag nchar(1),
	SOR_SK int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Student_SK)
);

DROP TABLE if exists Fact_Student_Absence ;

CREATE TABLE Fact_Student_Absence(
                  Student_Absence_SK  int NOT NULL IDENTITY(1,1),
	Absence_id int null,
	Absence_Number int NULL,
	Absence_PK varchar(36) NULL,

	Absence_Date_SK int,
	Student_SK int NOT NULL,
	School_SK int NOT NULL,
	Absence_Reason_SK int NOT NULL,
	
	District_Area_SK int not null,
	Grade_Id int,
	Section_Id int,
	AbsencePeriods int,
	AbsenceMinutes int,
	Tardy int,
	Current_Flag bit,
	SOR_Create_Date datetime,
	SOR_SK int NOT NULL,
	DW_Reject_Code int NOT NULL,

	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Student_Absence_SK)
);

DROP TABLE if exists Fact_Student_Behavior;

CREATE TABLE Fact_Student_Behavior (
	Event_SK int NOT NULL IDENTITY(1,1),

	Event_ID int null,
	Event_Number int null,
	Event_PK varchar(36) null,

	Behavior_Date_SK int not null,
	Student_SK int NOT NULL,
	School_SK  int not null,
	Staff_SK int NOT NULL,
	District_Area_SK int,
	Behavior_Event_SK int NOT NULL,
                   Behavior_Event_Type_SK int not null,
	Behavior_Location_SK int NOT NULL,

	Behavior_Role_SK int,
	Grade_Id int,
	Violence_Flag int,
	Weapon_Id int,
	Current_Flag int,
	SOR_Create_Date datetime,
	SOR_SK int NOT NULL,
	DW_Reject_Code int NOT NULL,

	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,
	
	PRIMARY KEY (Event_SK)
);

DROP TABLE if exists Fact_Student_Behavior_Resolution;

CREATE TABLE Fact_Student_Behavior_Resolution (
	Behavior_Resolution_SK int NOT NULL IDENTITY(1,1),

	Resolution_ID int,
	Resolution_Number int,
	Resolution_PK uniqueidentifier NULL,

	Event_SK int not null,

	Behavior_Resolution_Id int NOT NULL,
	Behavior_Resolution_Code nvarchar(5) NOT NULL,
	Resolution_Start_Date date,

	Resolution_Start_Date_SK int,
	Resolution_End_Date_SK int,
	District_Area_SK int not null,

	SOR_Create_Date datetime,
	Expulsion_Service_Flag int,

	SOR_SK int NOT NULL,
	DW_Reject_Code int NOT NULL,
	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime DEFAULT getdate() NOT NULL,

	PRIMARY KEY (Behavior_Resolution_SK)
);

