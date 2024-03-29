IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'webclock')
	DROP DATABASE [webclock]
GO

CREATE DATABASE [webclock]  ON (NAME = N'webclock_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\data\webclock_Data.MDF' , SIZE = 2, FILEGROWTH = 10%) LOG ON (NAME = N'webclock_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\data\webclock_Log.LDF' , SIZE = 12, FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'webclock', N'autoclose', N'false'
GO

exec sp_dboption N'webclock', N'bulkcopy', N'false'
GO

exec sp_dboption N'webclock', N'trunc. log', N'false'
GO

exec sp_dboption N'webclock', N'torn page detection', N'true'
GO

exec sp_dboption N'webclock', N'read only', N'false'
GO

exec sp_dboption N'webclock', N'dbo use', N'false'
GO

exec sp_dboption N'webclock', N'single', N'false'
GO

exec sp_dboption N'webclock', N'autoshrink', N'false'
GO

exec sp_dboption N'webclock', N'ANSI null default', N'false'
GO

exec sp_dboption N'webclock', N'recursive triggers', N'false'
GO

exec sp_dboption N'webclock', N'ANSI nulls', N'false'
GO

exec sp_dboption N'webclock', N'concat null yields null', N'false'
GO

exec sp_dboption N'webclock', N'cursor close on commit', N'false'
GO

exec sp_dboption N'webclock', N'default to local cursor', N'false'
GO

exec sp_dboption N'webclock', N'quoted identifier', N'false'
GO

exec sp_dboption N'webclock', N'ANSI warnings', N'false'
GO

exec sp_dboption N'webclock', N'auto create statistics', N'true'
GO

exec sp_dboption N'webclock', N'auto update statistics', N'true'
GO

if( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) )
	exec sp_dboption N'webclock', N'db chaining', N'false'
GO

use [webclock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Employees_EmpStatus]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT FK_Employees_EmpStatus
GO



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Employees_Shifts]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT FK_Employees_Shifts
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_PunchClock_Employees]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PunchClock] DROP CONSTRAINT FK_PunchClock_Employees
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_GetEmployeeByBadge]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[lsc_GetEmployeeByBadge]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_GetEmployeeTimeByWeek]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_GetEmployeeTimeByWeek]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_UpdPunchClockLateIn1old]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_UpdPunchClockLateIn1old]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_getEmpCumulativeRep]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_getEmpCumulativeRep]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_insPunch]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_insPunch]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_insPunchFP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_insPunchFP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_getEmpWeeklyRep]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_getEmpWeeklyRep]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_getEmployeeByShift]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_getEmployeeByShift]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_getWeeklyRep]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_getWeeklyRep]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_insEmployee]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_insEmployee]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[old_ins_Punch]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[old_ins_Punch]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vijaytest1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[vijaytest1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_EmpLateMark1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_EmpLateMark1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_UpdPunchClockLateIn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_UpdPunchClockLateIn]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_getUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_getUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_GenerateTimeSheet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_GenerateTimeSheet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_GetShiftTime]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_GetShiftTime]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_PageEmployees]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_PageEmployees]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_SearchBadge]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_SearchBadge]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_calcTime]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_calcTime]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_getEmployeePunchStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_getEmployeePunchStatus]
GO



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selCompany]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_selCompany]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selEmp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_selEmp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selEmpShift]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_selEmpShift]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selEmpn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lsc_selEmpn]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_vwPunchingEmployees]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_vwPunchingEmployees]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_infoCard]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_infoCard]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_vwEmpList]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_vwEmpList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_vwLateMark1]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_vwLateMark1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_vwLateMarkold]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_vwLateMarkold]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_vwselEmp]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_vwselEmp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[View105]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[View105]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_SelShiftn]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_SelShiftn]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selShift]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_selShift]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selShiftTime]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_selShiftTime]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_selStatus]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_selStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lsc_vwMissingPunch]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[lsc_vwMissingPunch]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[test12]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[test12]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[test3]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[test3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[test4]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[test4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[test9]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[test9]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PunchClock]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PunchClock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Employees]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Employees]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Company]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Company]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EmpStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EmpStatus]
GO



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Shifts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Shifts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Users]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE function lsc_GetEmployeeByBadge ( @badgeno INT)

returns  INT

as
begin
	declare @empid int
	select @empid = employeeid from Employees where BadgeNumber = @badgeno

	return(@empid)
end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE TABLE [dbo].[Company] (
	[CompanyID] [int] IDENTITY (1, 1) NOT NULL ,
	[CompanyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ContactName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StateOrProvince] [nchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PostalCode] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Phone1] [nchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MultShifts] [bit] NOT NULL ,
	[DBName] [nchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LateMinAllow] [int] NOT NULL ,
	[LateTimesAllow] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EmpStatus] (
	[EmpStatusID] [int] IDENTITY (1, 1) NOT NULL ,
	[Status] [nchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FingerDescription] (
	[FingerID] [int] IDENTITY (1, 1) NOT NULL ,
	[FingerIndex] [int] NULL ,
	[FingerDescription] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Shifts] (
	[ShiftID] [int] IDENTITY (1, 1) NOT NULL ,
	[ShiftDescription] [nchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PunchIn] [smalldatetime] NULL ,
	[PunchOut] [smalldatetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Users] (
	[UserID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserName] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Password] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[AccessID] [int] NOT NULL ,
	[CompanyID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Employees] (
	[EmployeeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ShiftID] [int] NULL ,
	[EmpStatusID] [int] NULL ,
	[BadgeNumber] [int] NOT NULL ,
	[PIN] [int] NOT NULL ,
	[SocialSecurity] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[HireDate] [datetime] NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[MI] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Address] [nchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [nchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StateOrProvince] [nchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PostalCode] [nchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PunchLoc] [int] NULL 
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[PunchClock] (
	[PunchID] [int] IDENTITY (1, 1) NOT NULL ,
	[EmployeeID] [int] NOT NULL ,
	[TimeIn] [datetime] NULL ,
	[TimeOut] [datetime] NULL ,
	[LateIn] [bit] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Company] WITH NOCHECK ADD 
	CONSTRAINT [PK_Company] PRIMARY KEY  CLUSTERED 
	(
		[CompanyID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EmpStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_EmpStatus] PRIMARY KEY  CLUSTERED 
	(
		[EmpStatusID]
	)  ON [PRIMARY] 
GO



ALTER TABLE [dbo].[Shifts] WITH NOCHECK ADD 
	CONSTRAINT [PK_Shifts] PRIMARY KEY  CLUSTERED 
	(
		[ShiftID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employees] WITH NOCHECK ADD 
	CONSTRAINT [PK_Employees] PRIMARY KEY  CLUSTERED 
	(
		[EmployeeID]
	)  ON [PRIMARY] 
GO



ALTER TABLE [dbo].[PunchClock] WITH NOCHECK ADD 
	CONSTRAINT [PK_PunchClock] PRIMARY KEY  CLUSTERED 
	(
		[PunchID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Company] ADD 
	CONSTRAINT [DF_Company_MultShifts] DEFAULT (0) FOR [MultShifts],
	CONSTRAINT [DF_Company_LateMinAllow] DEFAULT (0) FOR [LateMinAllow],
	CONSTRAINT [DF_Company_LateTimesAllow] DEFAULT (0) FOR [LateTimesAllow]
GO



ALTER TABLE [dbo].[Users] ADD 
	CONSTRAINT [PK_Users] PRIMARY KEY  NONCLUSTERED 
	(
		[UserID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employees] ADD 
	CONSTRAINT [DF_Employees_HireDate] DEFAULT (getdate()) FOR [HireDate],
	CONSTRAINT [DF_Employees_Status] DEFAULT ('O') FOR [Status]
GO



ALTER TABLE [dbo].[PunchClock] ADD 
	CONSTRAINT [DF_PunchClock_LateIn] DEFAULT (0) FOR [LateIn]
GO

ALTER TABLE [dbo].[Employees] ADD 
	CONSTRAINT [FK_Employees_EmpStatus] FOREIGN KEY 
	(
		[EmpStatusID]
	) REFERENCES [dbo].[EmpStatus] (
		[EmpStatusID]
	),
	CONSTRAINT [FK_Employees_Shifts] FOREIGN KEY 
	(
		[ShiftID]
	) REFERENCES [dbo].[Shifts] (
		[ShiftID]
	)
GO



ALTER TABLE [dbo].[PunchClock] ADD 
	CONSTRAINT [FK_PunchClock_Employees] FOREIGN KEY 
	(
		[EmployeeID]
	) REFERENCES [dbo].[Employees] (
		[EmployeeID]
	)
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  VIEW dbo.View105
AS
SELECT     dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName, dbo.Employees.BadgeNumber, dbo.Employees.Pin, 
                      dbo.Shifts.ShiftDescription, dbo.Employees.Status
FROM         dbo.Employees INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.lsc_SelShiftn
AS
SELECT     dbo.Shifts.*
FROM         dbo.Shifts

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.lsc_selShift
AS
SELECT     ShiftID, CAST(ShiftID AS char(1)) + '-' + ShiftDescription AS ShiftDescription
FROM         dbo.Shifts


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.lsc_selShiftTime
AS
SELECT     ShiftID, PunchIn, PunchOut
FROM         dbo.Shifts


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE  VIEW dbo.lsc_selStatus
AS
SELECT     EmpStatusID, Status
FROM         dbo.EmpStatus



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  VIEW dbo.lsc_vwMissingPunch
AS
SELECT     TOP 100 PERCENT e.FirstName, e.MI, e.LastName, p.PunchID, p.TimeIn, p.TimeOut
FROM         dbo.Employees e CROSS JOIN
                      dbo.PunchClock p
WHERE     (p.TimeIn IS NULL) OR
                      (p.TimeOut IS NULL) AND (e.EmployeeID = p.EmployeeID)
ORDER BY p.TimeIn


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.test12
AS
SELECT dbo.Users.UserName, dbo.Users.Password, 
    dbo.Users.AccessID, dbo.Users.CompanyID, 
    dbo.Company.URLBase
FROM dbo.Users INNER JOIN
    dbo.Company ON 
    dbo.Users.CompanyID = dbo.Company.CompanyID

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.test3
AS
SELECT     TOP 100 PERCENT *
FROM         (SELECT     dbo.Employees.BadgeNumber, dbo.Employees.LastName + ', ' + dbo.Employees.FirstName EmpName, CONVERT(varchar(10), 
                                              dbo.PunchClock.timein, 121) AS DayOfRep, CAST(DATEDIFF(second, dbo.PunchClock.timein, dbo.PunchClock.timeout) 
                                              / 60.0 / 60.0 AS decimal(6, 2)) AS hrswkd
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID) temptable
GROUP BY BadgeNumber, EmpName, DayOfRep, hrswkd
ORDER BY BadgeNumber, SUM(hrswkd), DayOfRep


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.test4
AS
SELECT     TOP 100 PERCENT *
FROM         (SELECT     dbo.Employees.BadgeNumber, dbo.Employees.LastName + ', ' + dbo.Employees.FirstName AS empName, CONVERT(varchar(10), 
                                              dbo.PunchClock.TimeIn, 121) AS RepDay, CAST(DATEDIFF(minute, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut) / 60.0 AS decimal(6, 2)) 
                                              AS hrswrkd, dbo.Shifts.ShiftDescription theshift
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID INNER JOIN
                                              dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID
                       WHERE      empstatusid = 1) temptable
GROUP BY theshift, BadgeNumber, empName, RepDay, hrswrkd
ORDER BY empName, BadgeNumber, RepDay, SUM(hrswrkd)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.test9
AS
SELECT     *
FROM         (SELECT     TOP 100 PERCENT dbo.Employees.BadgeNumber, dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName, 
                                              dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut, CAST(DATEDIFF(minute, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut) 
                                              / 60.0 AS decimal(6, 2)) AS hours
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID
                       WHERE      (dbo.PunchClock.TimeIn = CONVERT(DATETIME, '2004-11-01 06:00:00', 102))
                       ORDER BY dbo.Employees.LastName, dbo.Employees.FirstName, dbo.Employees.BadgeNumber) temptable


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  VIEW dbo.lsc_infoCard
AS
SELECT     TOP 100 PERCENT dbo.Employees.EmployeeID, dbo.Shifts.ShiftDescription, dbo.Employees.BadgeNumber, dbo.Employees.PIN, 
                      dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName
FROM         dbo.Employees INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID
WHERE     (dbo.Employees.EmpStatusID = 1)
ORDER BY dbo.Employees.LastName, dbo.Employees.FirstName, dbo.Employees.MI


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  VIEW dbo.lsc_vwEmpList
AS
SELECT     TOP 100 PERCENT dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName, dbo.Employees.BadgeNumber, 
                      dbo.Shifts.ShiftDescription, dbo.Employees.Status, dbo.EmpStatus.Status AS eStatus, dbo.Employees.EmployeeID
FROM         dbo.Employees INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID INNER JOIN
                      dbo.EmpStatus ON dbo.Employees.EmpStatusID = dbo.EmpStatus.EmpStatusID
ORDER BY dbo.Employees.LastName, dbo.Employees.FirstName


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.lsc_vwLateMark1
AS
SELECT     TOP 100 PERCENT dbo.Employees.EmployeeID, dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName, dbo.Employees.Status, 
                      dbo.PunchClock.TimeIn, dbo.PunchClock.LateIn
FROM         dbo.Employees LEFT OUTER JOIN
                      dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID
ORDER BY dbo.Employees.LastName, dbo.Employees.FirstName

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.lsc_vwLateMark
AS
SELECT     TOP 100 PERCENT dbo.Employees.EmployeeID, dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName, 
                      dbo.Employees.BadgeNumber, dbo.Shifts.ShiftDescription, dbo.Employees.Status, dbo.EmpStatus.Status AS eStatus, dbo.PunchClock.TimeIn, 
                      dbo.Shifts.PunchIn, dbo.PunchClock.LateIn
FROM         dbo.Employees INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID INNER JOIN
                      dbo.EmpStatus ON dbo.Employees.EmpStatusID = dbo.EmpStatus.EmpStatusID LEFT OUTER JOIN
                      dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID
ORDER BY dbo.Employees.LastName, dbo.Employees.FirstName

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE  VIEW dbo.lsc_vwselEmp
AS
SELECT     TOP 100 PERCENT EmployeeID, FirstName, MI, LastName, BadgeNumber
FROM         dbo.Employees
WHERE     (EmpStatusID = 1)
ORDER BY LastName, FirstName, MI, BadgeNumber


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  VIEW dbo.lsc_vwPunchingEmployees
AS
SELECT DISTINCT dbo.PunchClock.EmployeeID, COUNT(*) AS Expr1, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.Shifts.ShiftDescription
FROM         dbo.PunchClock INNER JOIN
                      dbo.Employees ON dbo.PunchClock.EmployeeID = dbo.Employees.EmployeeID INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID
GROUP BY dbo.PunchClock.EmployeeID, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.Shifts.ShiftDescription


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE [dbo].[lsc_GenerateTimeSheet] 
	@empid int,
	@thedate datetime

AS

begin
	set nocount on
	declare @wkbeg datetime
	declare @wkend datetime

	select @wkbeg = DATEADD(wk, DATEDIFF(wk,0,@thedate), -1) /* Sunday */
	select @wkend = DATEADD(wk, DATEDIFF(wk,0,@thedate), 5)  /* Saturday */
	select @wkend = dateadd(hour, 6, @wkend)
	/* select @wkbeg */
	/* select @wkend */

	select timein, timeout 
	from punchclock 
	where employeeid =@empid 
		and timein >= @wkbeg and timeout <= @wkend
	set nocount off
end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE  PROCEDURE lsc_GetShiftTime(@shiftID int, @thetimein datetime output, @thetimeout datetime output) 

AS

begin
 select @thetimein = punchin from shifts where shiftid = @shiftID
 select @thetimeout = punchout from shifts where shiftid = @shiftID
end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE  procedure lsc_PageEmployees

(	@Page		int,
	@RecsPerPage	int
)

as

begin
	/* Don't count the records inserted */
	set nocount on

	/* Create a temporary table */

	create table #tempemployees
	(
		id int identity,
		fname varchar(50),
		mi char(1),
		lname varchar(50),
		badge int,
		shift char(25),
		pstatus char(1),
		estatus char(25),
		empid int
	)

	/* insert the data into the temp table from the EmpList view*/
	insert into #tempemployees 
		select * from lsc_vwEmpList

	/* Find the first and last record */
	declare @firstrec int, @lastrec int
	SELECT @FirstRec = (@Page - 1) * @RecsPerPage
	SELECT @LastRec = (@Page * @RecsPerPage + 1)

	/* Now, return the set of paged records, plus, an indiciation of we 
	   have more records or not! */
	SELECT *, MoreRecords = 
		(
	 		SELECT COUNT(*) 
	 		FROM #Tempemployees TI
	 		WHERE TI.ID >= @LastRec
		) 
	FROM #tempemployees
	WHERE #tempemployees.ID > @FirstRec AND #tempemployees.ID < @LastRec


	set nocount off
end







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.lsc_SearchBadge
(
	@badgeno int
)

 AS

begin
	select badgenumber 
	from employees 
	where badgenumber = @badgeno
end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE lsc_calcTime AS

begin
  SELECT     TOP 100 PERCENT *
FROM         (SELECT     dbo.Employees.EmployeeID, dbo.Employees.LastName + ', ' + dbo.Employees.FirstName EmpName, CONVERT(varchar(10), 
                                              dbo.PunchClock.TimeIn, 121) AS DayOfRep, CAST(DATEDIFF(second, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut) 
                                              / 60.0 / 60.0 AS decimal(6, 2)) AS hrswkd
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID) temptable
GROUP BY EmployeeID, EmpName, DayOfRep, hrswkd
ORDER BY EmployeeID, SUM(hrswkd)
compute sum(hrsWkd) by EmployeeId

end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE  lsc_getEmployeePunchStatus 
  (
      @badgeno int,

      @status char output

)

AS

begin
   select @status = status from employees where badgenumber = @badgeno
end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE  PROCEDURE dbo.lsc_GetCompany
AS
set nocount on
 SELECT     CompanyID, CompanyName
FROM         dbo.Company


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE lsc_selEmp  AS
set nocount on

select badgenumber, employeeid,firstname, mi, lastname 
from employees
where empstatusid=1
order by lastname, firstname, mi, badgenumber
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.lsc_selEmpShift
(
	@shiftID INT
)
AS 
set nocount on
SELECT     FirstName, MI, LastName, BadgeNumber
FROM        dbo.Employees
WHERE	 ShiftID = @shiftID

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE lsc_selEmpn AS
/* Doesn't filter out employees for the VOP application */
set nocount on

select *
from employees
order by lastname, firstname, mi, badgenumber
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE                   PROCEDURE dbo.lsc_EmpLateMark1
(	@Page		int,
	@RecsPerPage	int
)
AS

begin

	/* Don't count the records inserted */
	set nocount on

	declare @PrSat datetime
	declare @wkbeg datetime
	declare @wkend datetime
	declare @NoLateTimesAllow int 


  select @NoLateTimesAllow = LateTimesAllow 
	from company

	select @PrSat = (
			  dateadd(SS, -DATEPART(SS,getdate()),
			     dateadd(MI, -DATEPART(MI,getdate()),
				dateadd(HH, -DATEPART(HH,getdate()),
				 	dateadd(DW, -DATEPART(DW,getdate()), getdate())
				)
			     )
			  )
			)

	select @wkbeg = dateadd(HH, 24, @PrSat)
	select @wkend = dateadd(week, 1, @wkbeg)


	/* Create a temporary table */
	create table #TmpTBLLate1
	(
		employeeid int,
                fname varchar(50),
		mi char(1),
		lname varchar(50),
		pstatus char(1),
                TimeIn datetime,
                LateIn int
	)


INSERT INTO #TmpTBLLate1 

SELECT  *  

FROM        lsc_vwLateMark1
WHERE /* BadgeNumber  = @badge and */
             TimeIn >= @wkbeg and
             TimeIn < @wkend 

create table #TmpTBLLate2
	(
		employeeid int,
                NoOfLates int
	)

INSERT INTO #TmpTBLLate2 
SELECT  employeeid,
	SUM( LateIn)
FROM    #TmpTBLLate1
	GROUP BY employeeid

create table #TmpTBLLate3
	(
		employeeid int,
                TimeIn datetime
	)

INSERT INTO #TmpTBLLate3
SELECT  	employeeid,
                MAX(TimeIn)
FROM    #TmpTBLLate1
	GROUP BY employeeid


	/* Create a temporary table */
create table #TmpTBLLate4
	(
		employeeid int,
                fname varchar(50),
		mi char(1),
		lname varchar(50),
		pstatus char(1),
                TimeIn datetime,
                LateIn int,
                Is3Lates bit
	)

INSERT INTO #TmpTBLLate4
SELECT  	Temp1.employeeid,
                Temp1.fname,
		Temp1.mi,
		Temp1.lname,
		Temp1.pstatus,
                Temp3.TimeIn,
                Temp1.LateIn,
                Is3Lates =
                CASE  WHEN Temp2.NoOfLates > @NoLateTimesAllow 
                      THEN 1
                      ELSE 0
                END

FROM    #TmpTBLLate1 AS Temp1 INNER JOIN
        #TmpTBLLate2 AS Temp2 ON 
		Temp1.EmployeeID = Temp2.EmployeeID INNER JOIN
        #TmpTBLLate3 AS Temp3 ON 
		Temp1.EmployeeID = Temp3.EmployeeID AND 
		Temp1.TimeIn = Temp3.TimeIn 

DROP table #TmpTBLLate1
DROP table #TmpTBLLate2
DROP table #TmpTBLLate3

create table #TmpTBLLate5
	(
		id int identity,
                fname varchar(50),
		mi char(1),
		lname varchar(50),
		pstatus char(1),
                LateIn bit,
                Is3Lates int
	)

INSERT INTO #TmpTBLLate5
SELECT   	
               fname,
		mi,
		lname,
		pstatus,
                LateIn,
                Is3Lates 

FROM    #TmpTBLLate4

	/* Find the first and last record */
	declare @firstrec int, @lastrec int
	SELECT @FirstRec = (@Page - 1) * @RecsPerPage
	SELECT @LastRec = (@Page * @RecsPerPage + 1)

	/* Now, return the set of paged records, plus, an indiciation of we 
	   have more records or not! */
	SELECT *, MoreRecords = 
		(
	 		SELECT COUNT(*) 
	 		FROM #TmpTBLLate5 TI
	 		WHERE TI.ID >= @LastRec
		) 
	FROM #TmpTBLLate5
	WHERE #TmpTBLLate5.ID > @FirstRec AND #TmpTBLLate5.ID < @LastRec


	set nocount off
end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




/* 

7-15-2005 using it in Addtime.asp to update the LateIn 

*/

CREATE            PROCEDURE dbo.lsc_UpdPunchClockLateIn
@PunchID		int
AS

begin

	/* Don't count the records inserted */
	set nocount on

  declare @LateMinAllow		int
  select distinct @LateMinAllow = LateMinAllow
  from Company


create table #TmpTBLLateUpdate1
	(
		PunchIDTemp int,
                LateYN bit
	)

INSERT INTO #TmpTBLLateUpdate1 

SELECT     /*dbo.Employees.EmployeeID, dbo.Employees.ShiftID, dbo.Shifts.PunchIn, dbo.PunchClock.TimeIn, dbo.PunchClock.LateIn,*/
PunchID,
	CASE  WHEN ((DATEPART(HH,TimeIn) * 60 +  DATEPART(MI,TimeIn)) -  (DATEPART(HH,PunchIn) * 60)) > @LateMinAllow 
                                                THEN 1
                                                 ELSE 0
                                     END


FROM         dbo.PunchClock INNER JOIN
                      dbo.Employees ON dbo.PunchClock.EmployeeID = dbo.Employees.EmployeeID  INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID 

WHERE 	     dbo.PunchClock.PunchID =  @PunchID



/*select * from #TmpTBLLateUpdate1 */


UPDATE a1 SET LateIn = LateYN
FROM dbo.PunchClock a1, #TmpTBLLateUpdate1 b1
WHERE a1.PunchID = b1.PunchIDTemp



	set nocount off
end







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE lsc_getUser
(
    @uid varchar (50),
    @pwd varchar (50),
    @companyid int 
    
)

 AS

begin
  select  Users.UserName, Users.Password, Users.AccessID, Company.MultShifts,
    Users.CompanyID, Company.DBName
FROM dbo.Users INNER JOIN
    dbo.Company ON 
    dbo.Users.CompanyID = dbo.Company.CompanyID
 where username = @uid and password = @pwd /* and users.companyid = @companyid */
end




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE procedure lsc_getEmpWeeklyRep
            
	@wkbeg datetime
as 
begin
	declare @wkend datetime
	select @wkend = dateadd(week, 1, @wkbeg)
	SELECT     empname, sum(hrswrkd) hrswrkd
	FROM         (SELECT     dbo.Employees.EmployeeID, dbo.Employees.LastName + ', ' + dbo.Employees.FirstName AS empName, CONVERT(varchar(10), 
                                              dbo.PunchClock.TimeIn, 121) AS RepDay, round(CAST(DATEDIFF(minute, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut) / 60.0 AS decimal(4, 2))*4,0) /4 
                                              AS hrswrkd, dbo.Shifts.ShiftDescription theshift,dbo.punchclock.punchid
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID INNER JOIN
                                              dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID
                       WHERE      empstatusid = 1 and timein >= @wkbeg and timein <= @wkend ) temptable
	GROUP BY employeeid, empName
	ORDER BY empName
end




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE lsc_getEmployeeByShift

    @daytolook datetime,
    @theshift int

 AS 

begin
  /* declare @shifttime int
   select @shifttime = datepart(hour,punchin) from shifts where shiftid=@theshift 
   select @daytolook =dateadd(hour,@shifttime, @daytolook)*/
  
  SELECT * FROM 
   (SELECT TOP 100 PERCENT dbo.Employees.BadgeNumber, dbo.PunchClock.PunchID,  dbo.Employees.FirstName, dbo.Employees.MI, dbo.Employees.LastName, 
     dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut, 
      (round(CAST(DATEDIFF(minute, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut)/ 60.0 AS decimal(6, 2))*4,0))/4 AS hours
    FROM dbo.Employees INNER JOIN dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID
    WHERE (shiftid=@theshift and cast(punchclock.timein as char(12))=cast(@daytolook as char(12)))
    ORDER BY dbo.Employees.LastName, dbo.Employees.FirstName, dbo.Employees.BadgeNumber) temptable
  group by badgenumber, firstname, mi, lastname, timein, timeout, hours, punchid
  order by lastname, firstname, badgenumber, sum(hours)


end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE   procedure lsc_getWeeklyRep 
	@wkbeg datetime
as 
begin
	declare @wkend datetime
	select @wkend = dateadd(week, 1, @wkbeg)
	SELECT      theshift, sum(hrswrkd) as hrswrkd
	FROM         (SELECT     dbo.Employees.BadgeNumber, dbo.Employees.LastName + ', ' + dbo.Employees.FirstName AS empName, CONVERT(varchar(10), 
                                              dbo.PunchClock.TimeIn, 121) AS RepDay, round(CAST(DATEDIFF(minute, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut) / 60.0 AS decimal(4, 2))*4,0) /4 
                                              AS hrswrkd, dbo.Shifts.ShiftID, dbo.Shifts.ShiftDescription theshift
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID INNER JOIN
                                              dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID
                       WHERE      empstatusid = 1 and timein >= @wkbeg and timein <= @wkend) temptable
	GROUP BY  ShiftID, theshift
	ORDER BY  ShiftID,  SUM(hrswrkd)
end









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








CREATE        procedure dbo.lsc_insEmployee

(
	@shiftid 	int,
	@BadgeNo 	int,
	@PIN 		int,
	@Social 	varchar(10),
	@HireDate	datetime,
	@FName 		varchar (50),
	@MI 		char (1),
	@LName 		varchar (50),
	@Address 	char (30),
	@City 		char (30),
	@StateProv	char (2),
	@PostalCode	char (10),
	@empid		int output
)

as

begin
  set nocount on
  begin transaction
  INSERT INTO [dbo].[Employees]
    ([ShiftID], [EmpStatusID], [BadgeNumber], [PIN], [SocialSecurity], [HireDate], [FirstName], [MI], [LastName], [Address], [City], [StateOrProvince], [PostalCode])
     VALUES(@ShiftID,1, @BadgeNo,@PIN,@Social,@HireDate,@FName,@MI,@LName,@Address,@City,@StateProv,@PostalCode)
  if @@error > 0 
    rollback transaction
  else
    commit transaction
  select @empid = @@identity
end




set nocount off



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[old_ins_Punch] 

@badgeNo int,
@pass int,
@shiftID int, 
@pTime datetime


AS

set nocount on
begin
  declare @empid		int
  declare @linkid		int
  declare @hourdiff 		int
  declare @minutediff 		int
  declare @pStatus 		char(1)
  declare @sameday 		int


/* Make sure we have a valid badge number or the query will self destruct */	
  if @badgeNo not in (select BadgeNumber from Employees)
    begin
      raiserror('Employee not found in database',0,1)
      return(100)
    end

if @pass <> (select pin from employees where badgenumber = @badgeno and empstatusid=1)
  begin
    raiserror ('Incorrect password',0,1)
    return (100)
  end

/* Get the employee's ID number (the PK) of the database */
  select @empid =  dbo.lsc_GetEmployeeByBadge(@badgeNo)

/*
   Now lets see what type of punch this is
*/

  select @pStatus = status 
	from Employees
	where EmployeeID = @empid
/* 
   You can't punch in more than 5 minutes after the beginning of the shift. 
   The ASP page tells them this, but should the user decide to punch in 
   anyways, we will kick them out here
*/

/* select @hourdiff =  datepart(hour, @pTime) - datepart(hour, punchin) 
	from shifts where shiftid=@shiftID
select @minutediff = datepart(minute, @pTime) - datepart(minute, punchin) 
	from shifts where shiftid=@shiftID */



/* They are punching in, the punch status should be OUT already let's go into detail */
  if @pStatus = 'O'
    begin
      if @hourdiff > 1 
        return (100)

      if @minutediff > 10
        return (100)
      /* insert the new punch into the punchclock */
       
      select @sameday = count(*) 
	from punchclock 
	where employeeid = @empid and 
		datediff(dd, getdate(), timein)>1 and 
		datediff(hour, getdate(), timein) < 12
      if @sameday <> 0
        begin
           raiserror(' Duplicate punch',0,1)
           return (100)
        end
      insert into dbo.punchclock (employeeid, timein)
      values (@empid,@pTime)

      /* Save the id in the punchclock table to the employee table for punch
         out reference */
      select @linkid = @@IDENTITY
      update dbo.Employees
      set PunchLoc = @linkid, status = 'I'
      where employeeid = @empid
    end

  /* The user is punching out */
  if @pStatus = 'I'
    begin
      declare @intime   datetime
    
      select @sameday = count(*) 
	from punchclock 
	where employeeid = @empid and datediff(dd, getdate(), timeout) = 0
      select @linkid =  punchloc 
	from dbo.Employees 
	where employeeid = @empid
      select @intime = timein 
	from punchclock 
	where punchid = @linkid 

      if @linkid = NULL     /* They already punched out */
        return (99)
      /* If the punch occurs less then 12 hours from the previous punch
         record the punch
      */		
      if cast(datediff(minute,@intime,@ptime)/60.0 as decimal(6,2)) < 12
        update dbo.punchclock
        set timeout = @ptime
	where punchid = @linkid

        /* regardless of whether they punched out 12 hours later or not,
           change their status so they can punch in again on the next day
	   we will alert the supervisor that there is a missing punch
        */
      update dbo.Employees
      set PunchLoc = NULL, status = 'O'
      where employeeid = @empid
    end

end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  PROCEDURE dbo.lsc_GetEmployeeTimeByWeek(@weekbgn datetime,
@weekend datetime,
@empid int)
AS SELECT     EmployeeID, TimeIn, TimeOut, LateIn
FROM         dbo.PunchClock
WHERE     (TimeIn >= @weekbgn) AND (TimeIn <= @weekend) AND (EmployeeID = @empid)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE            PROCEDURE dbo.[lsc_UpdPunchClockLateIn1]

AS

begin

	
	set nocount on

  declare @LateMinAllow		int
  select distinct @LateMinAllow = LateMinAllow
  from Company

UPDATE dbo.PunchClock SET LateIn = 0

create table #TmpTBLLateUpdate1
	(
		PunchIDTemp int,
                LateYN bit
	)

INSERT INTO #TmpTBLLateUpdate1 

SELECT     
PunchID,
	CASE  WHEN ((DATEPART(HH,TimeIn) * 60 +  DATEPART(MI,TimeIn)) -  (DATEPART(HH,PunchIn) * 60)) > @LateMinAllow 
                                                THEN 1
                                                 ELSE 0
                                     END


FROM         dbo.Employees INNER JOIN
                      dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID INNER JOIN
                      dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID 






UPDATE a1 SET LateIn = LateYN
FROM dbo.PunchClock a1, #TmpTBLLateUpdate1 b1
WHERE a1.PunchID = b1.PunchIDTemp






	set nocount off
end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE  procedure lsc_getEmpCumulativeRep
            
	
as 
begin
	declare @wkbeg datetime
	declare @wkend datetime
	select @wkbeg =  DATEADD(yy, DATEDIFF(yy,0,getdate()), 0)
	
	SELECT     FirstName + ' ' + LastName empname, sum(hrswrkd) hrswrkd
	FROM         (SELECT     dbo.Employees.EmployeeID, Employees.LastName, dbo.Employees.FirstName, CONVERT(varchar(10), 
                                              dbo.PunchClock.TimeIn, 121) AS RepDay, round(CAST(DATEDIFF(minute, dbo.PunchClock.TimeIn, dbo.PunchClock.TimeOut) / 60.0 AS decimal(4, 2))*4,0) /4 
                                              AS hrswrkd, dbo.Shifts.ShiftDescription theshift,dbo.punchclock.punchid
                       FROM          dbo.Employees INNER JOIN
                                              dbo.PunchClock ON dbo.Employees.EmployeeID = dbo.PunchClock.EmployeeID INNER JOIN
                                              dbo.Shifts ON dbo.Employees.ShiftID = dbo.Shifts.ShiftID
                       WHERE      empstatusid = 1 and timein >= @wkbeg and timein <= getdate() ) temptable
	GROUP BY employeeid, LastName, FirstName
	ORDER BY LastName
end





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO













CREATE        PROCEDURE dbo.lsc_insPunch
@badgeNo int,
@pass int,
@shiftID int, 
@pTime datetime


AS

set nocount on
begin
  declare @empid		int
  declare @linkid		int
  declare @hourdiff 		int
  declare @minutediff 		int
  declare @pStatus 		char(1)
  declare @sameday 		int

  declare @Latediff 		int
  declare @LateMinAllow		int
  declare @IsLate		bit

/* to handle the situation 
   Shift time runs into next day  
*/
  declare @ShiftTRND		bit 


  select distinct @LateMinAllow = LateMinAllow
  from Company
    

/* Make sure we have a valid badge number or the query will self destruct */	
  if @badgeNo not in (select BadgeNumber from Employees)
    begin
      raiserror('Employee not found in database',0,1)
      return(100)
    end

if @pass <> (select pin from employees where badgenumber = @badgeno and empstatusid=1)
  begin
    raiserror ('Incorrect password',0,1)
    return (100)
  end

/* Get the employee's ID number (the PK) of the database */
  select @empid =  dbo.lsc_GetEmployeeByBadge(@badgeNo)

/*
   Now lets see what type of punch this is
*/

  select @pStatus = status 
	from Employees
	where EmployeeID = @empid
/* 
   You can't punch in more than 5 minutes after the beginning of the shift. 
   The ASP page tells them this, but should the user decide to punch in 
   anyways, we will kick them out here
*/

/* select @hourdiff =  datepart(hour, @pTime) - datepart(hour, punchin) 
	from shifts where shiftid=@shiftID
select @minutediff = datepart(minute, @pTime) - datepart(minute, punchin) 
	from shifts where shiftid=@shiftID 
*/


select @hourdiff =  datepart(hour, @pTime) - datepart(hour, punchin), 
@minutediff = datepart(minute, @pTime) - datepart(minute, punchin),
@ShiftTRND = 	CASE  WHEN (((datepart(hour, punchin) * 60)+ datepart(minute, punchin)) > 960) 
             		THEN 1
             		ELSE 0
		END
	from shifts where shiftid=@shiftID 

select @latediff = (@hourdiff * 60) + @minutediff


select @IsLate = CASE  WHEN ( 	(@latediff > @LateMinAllow) OR 
				((@ShiftTRND = 1) AND (@latediff < -720))
			    )
             		THEN 1
             		ELSE 0
       		 END
from shifts where shiftid=@shiftID 


/* They are punching in, the punch status should be OUT already let's go into detail */
  if @pStatus = 'O'
    begin

/* 7/11/2005 we are not using it
      if @hourdiff > 1 
        return (100)

      if @minutediff > 10
        return (100)
*/

      /* insert the new punch into the punchclock */
       
      select @sameday = count(*) 
	from punchclock 
	where employeeid = @empid and 
		datediff(dd, getdate(), timein)>1 and 
		datediff(hour, getdate(), timein) < 12
      if @sameday <> 0
        begin
           raiserror(' Duplicate punch',0,1)
           return (100)
        end
      insert into dbo.punchclock (employeeid, timein,LateIn)
      values (@empid,@pTime,@IsLate)

      /* Save the id in the punchclock table to the employee table for punch
         out reference */
      select @linkid = @@IDENTITY
      update dbo.Employees
      set PunchLoc = @linkid, status = 'I'
      where employeeid = @empid
    end

  /* The user is punching out */
  if @pStatus = 'I'
    begin
      declare @intime   datetime
    
      select @sameday = count(*) 
	from punchclock 
	where employeeid = @empid and datediff(dd, getdate(), timeout) = 0
      select @linkid =  punchloc 
	from dbo.Employees 
	where employeeid = @empid
      select @intime = timein 
	from punchclock 
	where punchid = @linkid 

      if @linkid = NULL     /* They already punched out  */
        return (99)
      /* If the punch occurs less then 12 hours from the previous punch
         record the punch
      */		
      if cast(datediff(minute,@intime,@ptime)/60.0 as decimal(6,2)) < 12
        update dbo.punchclock
        set timeout = @ptime
	where punchid = @linkid

        /* regardless of whether they punched out 12 hours later or not,
           change their status so they can punch in again on the next day
	   we will alert the supervisor that there is a missing punch
        */
      update dbo.Employees
      set PunchLoc = NULL, status = 'O'
      where employeeid = @empid

    /* The user probably assumes that they are punching in again because they don't know they missed a punch 
         so this portion of code accommodates that theory, although its very wrong. 
   */

     if cast(datediff(minute, @intime, @ptime)/60.0 as decimal(6,2)) > 12
      begin
	insert into dbo.punchclock (employeeid, timein, LateIn)
      	values (@empid,@pTime,@IsLate)


     	 /* Save the id in the punchclock table to the employee table for punch
       	  out reference */
     	 select @linkid = @@IDENTITY
    	  update dbo.Employees
      	set PunchLoc = @linkid, status = 'I'
     	 where employeeid = @empid
      end

    
    end

end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

