USE [master]
GO
/****** Object:  Database [GYM_Managemt_Sys]    Script Date: 5/13/2026 8:55:37 PM ******/
CREATE DATABASE [GYM_Managemt_Sys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GYM_Managemt_Sys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GYM_Managemt_Sys.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GYM_Managemt_Sys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GYM_Managemt_Sys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GYM_Managemt_Sys] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GYM_Managemt_Sys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ARITHABORT OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET RECOVERY FULL 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET  MULTI_USER 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GYM_Managemt_Sys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GYM_Managemt_Sys] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GYM_Managemt_Sys', N'ON'
GO
ALTER DATABASE [GYM_Managemt_Sys] SET QUERY_STORE = ON
GO
ALTER DATABASE [GYM_Managemt_Sys] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GYM_Managemt_Sys]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[Assign_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mem_ID] [int] NOT NULL,
	[Trainer_ID] [int] NOT NULL,
	[Assigned_By] [int] NOT NULL,
	[Assigned_Date] [date] NOT NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[Assign_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendances_History]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances_History](
	[Att_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mem_ID] [int] NOT NULL,
	[Session_ID] [int] NOT NULL,
	[Marked_By] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Check_In_Date] [datetime2](7) NOT NULL,
	[Check_Out_Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AttendancesHistory] PRIMARY KEY CLUSTERED 
(
	[Att_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books_Training]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_Training](
	[Booking_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mem_ID] [int] NOT NULL,
	[Session_ID] [int] NOT NULL,
	[Booking_Date] [datetime2](7) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_BooksTraining] PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Per_ID] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Emergency_Name] [nvarchar](100) NULL,
	[Emergency_Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_Records]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_Records](
	[Equ_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Purchase_Date] [date] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Last_Maintenance_Date] [date] NOT NULL,
	[Next_Maintenance_Date] [date] NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
	[Managed_By] [int] NOT NULL,
 CONSTRAINT [PK_EquipmentRecords] PRIMARY KEY CLUSTERED 
(
	[Equ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member_Training_Plans]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member_Training_Plans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mem_ID] [int] NOT NULL,
	[Plan_ID] [int] NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NULL,
 CONSTRAINT [PK_MemberTrainingPlans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Mem_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Status_ID] [int] NOT NULL,
	[Join_Date] [date] NOT NULL,
	[Added_By] [int] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Mem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members_Status]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members_Status](
	[Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_MembersStatus] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membership_Plans]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership_Plans](
	[Plan_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Duration_Days] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_MembershipPlans] PRIMARY KEY CLUSTERED 
(
	[Plan_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Pay_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sub_ID] [int] NOT NULL,
	[Mem_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Total_Amount] [decimal](10, 2) NOT NULL,
	[Is_Paid] [bit] NOT NULL,
	[Paid_Date] [datetime2](7) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Pay_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Per_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Per_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Ses_ID] [int] IDENTITY(1,1) NOT NULL,
	[Trainer_ID] [int] NOT NULL,
	[Plan_ID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Session_Date] [date] NOT NULL,
	[Start_Time] [time](7) NOT NULL,
	[End_Time] [time](7) NOT NULL,
	[Capacity] [tinyint] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Ses_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Sub_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mem_ID] [int] NOT NULL,
	[Plan_ID] [int] NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Sub_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[Trainer_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Specialization] [nvarchar](100) NOT NULL,
	[Hire_Date] [date] NOT NULL,
	[Resignation_Date] [date] NULL,
	[Salary] [decimal](10, 2) NOT NULL,
	[Added_By] [int] NOT NULL,
 CONSTRAINT [PK_Trainers] PRIMARY KEY CLUSTERED 
(
	[Trainer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training_Plans]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training_Plans](
	[Plan_ID] [int] IDENTITY(1,1) NOT NULL,
	[Designed_By] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Goal] [nvarchar](100) NOT NULL,
	[Duration_Weeks] [tinyint] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_TrainingPlans] PRIMARY KEY CLUSTERED 
(
	[Plan_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/13/2026 8:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Per_ID] [int] NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Permissions] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Users_UserName] UNIQUE NONCLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assignments] ADD  DEFAULT (CONVERT([date],getdate())) FOR [Assigned_Date]
GO
ALTER TABLE [dbo].[Books_Training] ADD  DEFAULT (getdate()) FOR [Booking_Date]
GO
ALTER TABLE [dbo].[Books_Training] ADD  DEFAULT ('booked') FOR [Status]
GO
ALTER TABLE [dbo].[Member_Training_Plans] ADD  DEFAULT (CONVERT([date],getdate())) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (CONVERT([date],getdate())) FOR [Join_Date]
GO
ALTER TABLE [dbo].[Membership_Plans] ADD  DEFAULT ('active') FOR [Status]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0)) FOR [Is_Paid]
GO
ALTER TABLE [dbo].[People] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ('scheduled') FOR [Status]
GO
ALTER TABLE [dbo].[Subscriptions] ADD  DEFAULT (CONVERT([date],getdate())) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Permissions]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_AssignedBy] FOREIGN KEY([Assigned_By])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_AssignedBy]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Members] FOREIGN KEY([Mem_ID])
REFERENCES [dbo].[Members] ([Mem_ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Members]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Trainers] FOREIGN KEY([Trainer_ID])
REFERENCES [dbo].[Trainers] ([Trainer_ID])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Trainers]
GO
ALTER TABLE [dbo].[Attendances_History]  WITH CHECK ADD  CONSTRAINT [FK_Att_Members] FOREIGN KEY([Mem_ID])
REFERENCES [dbo].[Members] ([Mem_ID])
GO
ALTER TABLE [dbo].[Attendances_History] CHECK CONSTRAINT [FK_Att_Members]
GO
ALTER TABLE [dbo].[Attendances_History]  WITH CHECK ADD  CONSTRAINT [FK_Att_Sessions] FOREIGN KEY([Session_ID])
REFERENCES [dbo].[Sessions] ([Ses_ID])
GO
ALTER TABLE [dbo].[Attendances_History] CHECK CONSTRAINT [FK_Att_Sessions]
GO
ALTER TABLE [dbo].[Attendances_History]  WITH CHECK ADD  CONSTRAINT [FK_Att_Trainers] FOREIGN KEY([Marked_By])
REFERENCES [dbo].[Trainers] ([Trainer_ID])
GO
ALTER TABLE [dbo].[Attendances_History] CHECK CONSTRAINT [FK_Att_Trainers]
GO
ALTER TABLE [dbo].[Books_Training]  WITH CHECK ADD  CONSTRAINT [FK_Books_Members] FOREIGN KEY([Mem_ID])
REFERENCES [dbo].[Members] ([Mem_ID])
GO
ALTER TABLE [dbo].[Books_Training] CHECK CONSTRAINT [FK_Books_Members]
GO
ALTER TABLE [dbo].[Books_Training]  WITH CHECK ADD  CONSTRAINT [FK_Books_Sessions] FOREIGN KEY([Session_ID])
REFERENCES [dbo].[Sessions] ([Ses_ID])
GO
ALTER TABLE [dbo].[Books_Training] CHECK CONSTRAINT [FK_Books_Sessions]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_People] FOREIGN KEY([Per_ID])
REFERENCES [dbo].[People] ([Per_ID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_People]
GO
ALTER TABLE [dbo].[Equipment_Records]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Users] FOREIGN KEY([Managed_By])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Equipment_Records] CHECK CONSTRAINT [FK_Equipment_Users]
GO
ALTER TABLE [dbo].[Member_Training_Plans]  WITH CHECK ADD  CONSTRAINT [FK_MTP_Members] FOREIGN KEY([Mem_ID])
REFERENCES [dbo].[Members] ([Mem_ID])
GO
ALTER TABLE [dbo].[Member_Training_Plans] CHECK CONSTRAINT [FK_MTP_Members]
GO
ALTER TABLE [dbo].[Member_Training_Plans]  WITH CHECK ADD  CONSTRAINT [FK_MTP_TrainingPlans] FOREIGN KEY([Plan_ID])
REFERENCES [dbo].[Training_Plans] ([Plan_ID])
GO
ALTER TABLE [dbo].[Member_Training_Plans] CHECK CONSTRAINT [FK_MTP_TrainingPlans]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_AddedBy] FOREIGN KEY([Added_By])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_AddedBy]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Members_Status] ([Status_ID])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Status]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Users]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Members] FOREIGN KEY([Mem_ID])
REFERENCES [dbo].[Members] ([Mem_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Members]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Subscriptions] FOREIGN KEY([Sub_ID])
REFERENCES [dbo].[Subscriptions] ([Sub_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Subscriptions]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Trainers] FOREIGN KEY([Trainer_ID])
REFERENCES [dbo].[Trainers] ([Trainer_ID])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Trainers]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_TrainingPlans] FOREIGN KEY([Plan_ID])
REFERENCES [dbo].[Training_Plans] ([Plan_ID])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_TrainingPlans]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Members] FOREIGN KEY([Mem_ID])
REFERENCES [dbo].[Members] ([Mem_ID])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Members]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Plans] FOREIGN KEY([Plan_ID])
REFERENCES [dbo].[Membership_Plans] ([Plan_ID])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Plans]
GO
ALTER TABLE [dbo].[Trainers]  WITH CHECK ADD  CONSTRAINT [FK_Trainers_AddedBy] FOREIGN KEY([Added_By])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Trainers] CHECK CONSTRAINT [FK_Trainers_AddedBy]
GO
ALTER TABLE [dbo].[Trainers]  WITH CHECK ADD  CONSTRAINT [FK_Trainers_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Trainers] CHECK CONSTRAINT [FK_Trainers_Users]
GO
ALTER TABLE [dbo].[Training_Plans]  WITH CHECK ADD  CONSTRAINT [FK_TrainingPlans_Trainers] FOREIGN KEY([Designed_By])
REFERENCES [dbo].[Trainers] ([Trainer_ID])
GO
ALTER TABLE [dbo].[Training_Plans] CHECK CONSTRAINT [FK_TrainingPlans_Trainers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_People] FOREIGN KEY([Per_ID])
REFERENCES [dbo].[People] ([Per_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_People]
GO
ALTER TABLE [dbo].[Attendances_History]  WITH CHECK ADD  CONSTRAINT [CHK_Att_Status] CHECK  (([Status]='late' OR [Status]='absent' OR [Status]='present'))
GO
ALTER TABLE [dbo].[Attendances_History] CHECK CONSTRAINT [CHK_Att_Status]
GO
ALTER TABLE [dbo].[Books_Training]  WITH CHECK ADD  CONSTRAINT [CHK_Booking_Status] CHECK  (([Status]='cancelled' OR [Status]='booked'))
GO
ALTER TABLE [dbo].[Books_Training] CHECK CONSTRAINT [CHK_Booking_Status]
GO
ALTER TABLE [dbo].[Equipment_Records]  WITH CHECK ADD  CONSTRAINT [CHK_Equipment_Status] CHECK  (([Status]='broken' OR [Status]='under maintenance' OR [Status]='working'))
GO
ALTER TABLE [dbo].[Equipment_Records] CHECK CONSTRAINT [CHK_Equipment_Status]
GO
ALTER TABLE [dbo].[Membership_Plans]  WITH CHECK ADD  CONSTRAINT [CHK_Plans_Status] CHECK  (([Status]='inactive' OR [Status]='active'))
GO
ALTER TABLE [dbo].[Membership_Plans] CHECK CONSTRAINT [CHK_Plans_Status]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [CHK_Sessions_Status] CHECK  (([Status]='cancelled' OR [Status]='completed' OR [Status]='scheduled'))
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [CHK_Sessions_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Users_Role] CHECK  (([Role]='member' OR [Role]='trainer' OR [Role]='admin'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [GYM_Managemt_Sys] SET  READ_WRITE 
GO
