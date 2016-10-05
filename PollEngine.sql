if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Admins]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Admins]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Answers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Answers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Poll]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Poll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PollVoters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PollVoters]
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Admins]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Admins] (
	[intAdminID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Password] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Answers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Answers] (
	[intAnswerID] [int] IDENTITY (1, 1) NOT NULL ,
	[intPollID] [int] NULL ,
	[strAnswer] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[intResponseCount] [int] NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Poll]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Poll] (
	[intPollID] [int] IDENTITY (1, 1) NOT NULL ,
	[strQuestion] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PollVoters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[PollVoters] (
	[intVoterID] [int] IDENTITY (1, 1) NOT NULL ,
	[intPollID] [int] NULL ,
	[strVoterIP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
END

GO

