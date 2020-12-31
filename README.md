# DataWarehousing-BusinessIntelligence
Data Modelling

OVERVIEW:
In schools, students misbehave and skip classes (sometimes for valid excused reasons but not always.
These events are recorded as student absences, misbehavior and misbehavior consequences (or resolutions).
Student Absences, Behavior & Resolution data is split by the five school districts (AL, NE, NW, SE & SW) with the data being stored in the following:

District      DBMS          Database
NE            MySQL         school_sor_ne
NW            PostgreSQL    school_sor_nw
SE            SQL Server    school_sor_se
SW            Oracle        school_sor_sw
AL            MySQL         school_sor_al
DW            SQL Server    school_dw


DELIVERABLES:
• Created Schools_DW database using schools_dw.sql for SQL Server
• load these data sources into the School DW using Talend
• create data visualizations and dashboards answering a list of questions below using Microsoft PowerBI and Tableau

DATA INTEGRATION:
• Loaded data from the data sources provided into Schools DWs
o Talend Enterprise Data Integration
o DW database: School_DW – SQL Server

• Separated “reject” rows, i.e. rows that have invalid foreign keys (FKs) in regards to dimensional data provided in data sources. 
  Also put a rejection reason in the Rejects table using column such as: DW_Reject_Code (write the specific reason for rejection) – int not null
  
• Each table records:
o DI_Job_ID (ETL process ID) - nvarchar(20) NULL
o DI_Create_Date (Create Date of row) - datetime NOT NULL DEFAULT (getdate())

BI AND DATA VISUALIZATION:
• Created data visualizations, tabular reports and dashboards to answer question below using Tableau and PowerBI

• Created BI dashboards for Educators and parents who are interested on getting BI reports on student absences, misbehavior and behavior resolutions listing number of students, number of instances, types of instances, types of resolution and location of instances.
