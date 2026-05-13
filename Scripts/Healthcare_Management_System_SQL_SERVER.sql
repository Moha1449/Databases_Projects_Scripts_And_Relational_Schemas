USE [master]
GO
/****** Object:  Database [Hospital_Sys]    Script Date: 5/13/2026 8:43:52 PM ******/
CREATE DATABASE [Hospital_Sys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital_Sys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hospital_Sys.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_Sys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hospital_Sys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hospital_Sys] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital_Sys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital_Sys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital_Sys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital_Sys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital_Sys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital_Sys] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital_Sys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital_Sys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital_Sys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital_Sys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital_Sys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital_Sys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital_Sys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital_Sys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital_Sys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital_Sys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital_Sys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital_Sys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital_Sys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital_Sys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital_Sys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital_Sys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital_Sys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital_Sys] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital_Sys] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital_Sys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital_Sys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital_Sys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital_Sys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital_Sys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital_Sys] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital_Sys', N'ON'
GO
ALTER DATABASE [Hospital_Sys] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hospital_Sys] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hospital_Sys]
GO
/****** Object:  Table [dbo].[People]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Per_ID] [int] IDENTITY(1,1) NOT NULL,
	[National_No] [int] NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Date_Of_Birth] [datetime] NOT NULL,
	[First_Name] [varchar](20) NOT NULL,
	[Second_Name] [varchar](20) NOT NULL,
	[Third_Name] [varchar](20) NOT NULL,
	[Last_Name] [varchar](20) NOT NULL,
	[Country_ID] [tinyint] NOT NULL,
 CONSTRAINT [people_per_id_primary] PRIMARY KEY CLUSTERED 
(
	[Per_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_People_NationalNo] UNIQUE NONCLUSTERED 
(
	[National_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Doc_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Specialization] [varchar](255) NOT NULL,
	[Emp_ID] [int] NOT NULL,
 CONSTRAINT [doctors_doc_id_primary] PRIMARY KEY CLUSTERED 
(
	[Doc_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Per_ID] [int] NOT NULL,
	[Hire_Date] [datetime] NOT NULL,
	[Resignation_Date] [datetime] NULL,
	[Salary] [float] NOT NULL,
	[Experience] [tinyint] NOT NULL,
	[Dep_ID] [tinyint] NOT NULL,
 CONSTRAINT [employees_emp_id_primary] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Dep_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Dep_Name] [varchar](255) NOT NULL,
	[Mange_By] [int] NULL,
 CONSTRAINT [departments_dep_id_primary] PRIMARY KEY CLUSTERED 
(
	[Dep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Doctors_Data]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctors_Data] AS
SELECT Doctors.Doc_ID AS 'Doctor ID' , 
People.First_Name + ' ' + People.Second_Name + ' ' + People.Third_Name + ' ' +People.Last_Name 
AS 'Full Name' , Doctors.Emp_ID AS 'Employee ID' , Employees.Experience , Doctors.Specialization 
,Employees.Hire_Date AS 'Hire Date',
CASE Employees.Resignation_Date 
WHEN NULL THEN 'Working'
ELSE Resignation_Date
END AS 'Resignation Date'
,Departments.Dep_Name AS Department FROM Doctors INNER JOIN Employees ON Employees.Emp_ID = Doctors.Emp_ID
INNER JOIN People ON Employees.Per_ID = People.Per_ID INNER JOIN Departments 
ON Departments.Dep_ID = Employees.Dep_ID;
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Appoint_ID] [int] NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
	[Appoint_Date] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [appointments_appoint_id_primary] PRIMARY KEY CLUSTERED 
(
	[Appoint_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [varchar](50) NOT NULL,
	[Per_ID] [int] NOT NULL,
 CONSTRAINT [contacts_contact_id_primary] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Contacts_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Contacts_PerID] UNIQUE NONCLUSTERED 
(
	[Per_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Country_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Country_Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diaganoses]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diaganoses](
	[Diagno_ID] [bigint] NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Dia_Date] [datetime] NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[Pati_ID] [int] NOT NULL,
	[Doc_ID] [smallint] NOT NULL,
	[Appoin_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [diaganosises_diagno_id_primary] PRIMARY KEY CLUSTERED 
(
	[Diagno_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Patient_ID] [int] NOT NULL,
	[Per_ID] [int] NOT NULL,
	[User_ID] [bigint] NOT NULL,
 CONSTRAINT [patients_patient_id_primary] PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Treatment_ID] [int] NOT NULL,
	[Appointment_ID] [int] NOT NULL,
	[Total_Ammount] [float] NOT NULL,
	[Pay_Date] [datetime] NOT NULL,
	[Is_Paid] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatments]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatments](
	[Treatment_ID] [int] NOT NULL,
	[Treat_Data] [datetime] NOT NULL,
	[Treat_Description] [varchar](255) NOT NULL,
	[Per_ID] [int] NOT NULL,
	[Doc_ID] [smallint] NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [treatments_treatment_id_primary] PRIMARY KEY CLUSTERED 
(
	[Treatment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Permissions] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Creator_ID] [int] NULL,
	[Employee_ID] [int] NOT NULL,
 CONSTRAINT [users_user_id_primary] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UN_UserName_Users] UNIQUE NONCLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [contacts_phone_unique]    Script Date: 5/13/2026 8:43:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [contacts_phone_unique] ON [dbo].[Contacts]
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF__Payments__Is_Pai__05F8DC4F]  DEFAULT ((0)) FOR [Is_Paid]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [appointments_patient_id_foreign] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patients] ([Patient_ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [appointments_patient_id_foreign]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Users_Appointments] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Users_Appointments]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [contacts_per_id_foreign] FOREIGN KEY([Per_ID])
REFERENCES [dbo].[People] ([Per_ID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [contacts_per_id_foreign]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [departments_mange_by_foreign] FOREIGN KEY([Mange_By])
REFERENCES [dbo].[Employees] ([Emp_ID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [departments_mange_by_foreign]
GO
ALTER TABLE [dbo].[Diaganoses]  WITH CHECK ADD  CONSTRAINT [diaganosises_appoin_id_foreign] FOREIGN KEY([Appoin_ID])
REFERENCES [dbo].[Appointments] ([Appoint_ID])
GO
ALTER TABLE [dbo].[Diaganoses] CHECK CONSTRAINT [diaganosises_appoin_id_foreign]
GO
ALTER TABLE [dbo].[Diaganoses]  WITH CHECK ADD  CONSTRAINT [diaganosises_doc_id_foreign] FOREIGN KEY([Doc_ID])
REFERENCES [dbo].[Doctors] ([Doc_ID])
GO
ALTER TABLE [dbo].[Diaganoses] CHECK CONSTRAINT [diaganosises_doc_id_foreign]
GO
ALTER TABLE [dbo].[Diaganoses]  WITH CHECK ADD  CONSTRAINT [diaganosises_pati_id_foreign] FOREIGN KEY([Pati_ID])
REFERENCES [dbo].[Patients] ([Patient_ID])
GO
ALTER TABLE [dbo].[Diaganoses] CHECK CONSTRAINT [diaganosises_pati_id_foreign]
GO
ALTER TABLE [dbo].[Diaganoses]  WITH CHECK ADD  CONSTRAINT [FK_Users_Diaganoses] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Diaganoses] CHECK CONSTRAINT [FK_Users_Diaganoses]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [doctors_emp_id_foreign] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employees] ([Emp_ID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [doctors_emp_id_foreign]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [employees_dep_id_foreign] FOREIGN KEY([Dep_ID])
REFERENCES [dbo].[Departments] ([Dep_ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [employees_dep_id_foreign]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [employees_per_id_foreign] FOREIGN KEY([Per_ID])
REFERENCES [dbo].[People] ([Per_ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [employees_per_id_foreign]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [patients_per_id_foreign] FOREIGN KEY([Per_ID])
REFERENCES [dbo].[People] ([Per_ID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [patients_per_id_foreign]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Payments] FOREIGN KEY([Appointment_ID])
REFERENCES [dbo].[Appointments] ([Appoint_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Appointments_Payments]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Payments] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patients] ([Patient_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Patients_Payments]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Treatments_Payments] FOREIGN KEY([Treatment_ID])
REFERENCES [dbo].[Treatments] ([Treatment_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Treatments_Payments]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Countries] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Countries]
GO
ALTER TABLE [dbo].[Treatments]  WITH CHECK ADD  CONSTRAINT [FK_Users_Treatments] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Treatments] CHECK CONSTRAINT [FK_Users_Treatments]
GO
ALTER TABLE [dbo].[Treatments]  WITH CHECK ADD  CONSTRAINT [treatments_doc_id_foreign] FOREIGN KEY([Doc_ID])
REFERENCES [dbo].[Doctors] ([Doc_ID])
GO
ALTER TABLE [dbo].[Treatments] CHECK CONSTRAINT [treatments_doc_id_foreign]
GO
ALTER TABLE [dbo].[Treatments]  WITH CHECK ADD  CONSTRAINT [treatments_per_id_foreign] FOREIGN KEY([Per_ID])
REFERENCES [dbo].[Patients] ([Patient_ID])
GO
ALTER TABLE [dbo].[Treatments] CHECK CONSTRAINT [treatments_per_id_foreign]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__CreatorID] FOREIGN KEY([Creator_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__CreatorID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employees] ([Emp_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeUserStatusByUserID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChangeUserStatusByUserID] @UserID INT,@IsActive BIT
AS 
BEGIN 
UPDATE Users  SET Is_Active = @IsActive WHERE  User_ID = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUserByUserID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteUserByUserID] @UserID INT
AS 
BEGIN 

DELETE FROM Users WHERE User_ID = @UserID;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_DismissalEmployeeByEmployeeID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DismissalEmployeeByEmployeeID] @EmployeeID INT 
As
BEGIN
UPDATE Employees SET Resignation_Date = CAST(GETDATE() AS DATE) WHERE Emp_ID = @EmployeeID;
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDoctorDataByDoctorID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllDoctorDataByDoctorID] @DoctorID INT
AS 
BEGIN
SELECT People.*,Contacts.Email,Contacts.Phone , Employees.Emp_ID,Employees.Experience,
Employees.Hire_Date,Employees.Resignation_Date,Employees.Salary,Employees.Dep_ID,
Doctors.Specialization FROM People INNER JOIN Employees ON Employees.Per_ID = People.Per_ID
INNER JOIN Doctors ON Doctors.Emp_ID = Employees.Emp_ID INNER JOIN Contacts ON Contacts.Per_ID = People.Per_ID
WHERE Doc_ID = @DoctorID
END 

GO
/****** Object:  StoredProcedure [dbo].[sp_GetDoctorsPaged]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDoctorsPaged] @PageNumber INT, @RowsPerPage INT 
As
BEGIN
DECLARE @TotalDoctors INT;

SELECT @TotalDoctors =  COUNT(*) FROM Users;

SELECT *
FROM Doctors_Data
ORDER BY [Doctor ID]
OFFSET (@PageNumber - 1) * @RowsPerPage ROWS 
FETCH NEXT @RowsPerPage ROWS ONLY;

RETURN @TotalDoctors;
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeePlusPersonalDataByEmployeeID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetEmployeePlusPersonalDataByEmployeeID] @EmployeeID INT 
As
BEGIN
SELECT People.*,Employees.Emp_ID,Employees.Dep_ID,Employees.Experience,Employees.Hire_Date,
Employees.Resignation_Date,Employees.Salary,Contacts.Phone,Contacts.Email FROM People INNER JOIN 
Employees ON Employees.Per_ID = People.Per_ID INNER JOIN 
Contacts ON Contacts.Per_ID = People.Per_ID WHERE Employees.Emp_ID = @EmployeeID;
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPersonalDataByPersonID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPersonalDataByPersonID] @PersonID INT 
AS 
BEGIN
SELECT People.First_Name , People.Second_Name , People.Third_Name , People.Last_Name ,People.National_No ,
People.Address,People.Country_ID,People.Date_Of_Birth,Contacts.Email,Contacts.Per_ID FROM People
INNER JOIN Contacts ON Contacts.Per_ID = People.Per_ID WHERE People.Per_ID = @PersonID;
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPersonalDataOfEmployeeByEmployeeID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetPersonalDataOfEmployeeByEmployeeID] @EmployeeID INT
AS 
BEGIN

SELECT People.* ,Contacts.Phone,Contacts.Email FROM Employees INNER JOIN People ON 
Employees.Per_ID = People.Per_ID INNER JOIN Contacts ON Contacts.Per_ID = People.Per_ID
WHERE Employees.Emp_ID = @EmployeeID;

END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDataByUserID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserDataByUserID]
    @UserID INT 
AS 
BEGIN 
SELECT * FROM Users WHERE User_ID = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDataByUserName]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserDataByUserName] @UserName VARCHAR(50)
AS 
BEGIN 
SELECT * FROM Users WHERE User_Name = @UserName;
END








GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDataByUserNameAndPassword]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserDataByUserNameAndPassword] @UserName VARCHAR(50) ,@Password VARCHAR(64) 
AS 
BEGIN 
SELECT * FROM Users WHERE User_Name = @UserName AND Password = @Password;
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsersPaged]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUsersPaged] 
    @PageNumber INT,
    @RowsPerPage INT 
AS 
BEGIN 

DECLARE @TotalUsers INT;

SELECT @TotalUsers =  COUNT(*) FROM Users;

SELECT *
FROM USERS
ORDER BY User_ID
OFFSET (@PageNumber - 1) * @RowsPerPage ROWS 
FETCH NEXT @RowsPerPage ROWS ONLY;

RETURN @TotalUsers;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RehireEmployeeByEmployeeID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RehireEmployeeByEmployeeID] @EmployeeID INT 
As
BEGIN
UPDATE Employees SET Resignation_Date = Null WHERE Emp_ID = @EmployeeID;
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePersonalDataAndContactDataByPersonID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_UpdatePersonalDataAndContactDataByPersonID] @PersonID INT,@FirstName VARCHAR(20),
@SecondName VARCHAR(20), @ThirdName VARCHAR(20),@LastName VARCHAR(20),@Address VARCHAR(255),
@Email VARCHAR(255),@Phone VARCHAR(50),@DateOfBirth DATETIME
AS 
BEGIN



BEGIN TRY
BEGIN TRANSACTION

UPDATE People SET First_Name = @FirstName , Second_Name = @SecondName, Third_Name = @ThirdName, 
Last_Name = @LastName, Address =@Address, Date_Of_Birth = @DateOfBirth  WHERE Per_ID = @PersonID;

UPDATE Contacts SET Email = @Email ,Phone = @Phone WHERE Per_ID = @PersonID;

COMMIT;

END TRY
BEGIN  CATCH 
ROLLBACK;
END CATCH 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUserNameAndPasswordByUserID]    Script Date: 5/13/2026 8:43:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateUserNameAndPasswordByUserID] @UserID INT, @UserName VARCHAR(50) ,@Password VARCHAR(64) 
AS 
BEGIN 
UPDATE Users SET User_Name = @UserName,Password = @Password WHERE User_ID = @UserID;
END 
GO
USE [master]
GO
ALTER DATABASE [Hospital_Sys] SET  READ_WRITE 
GO
