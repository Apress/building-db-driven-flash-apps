if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Answers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Answers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Categories]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Categories]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Levels]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Levels]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Players]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Players]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Questions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Questions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Responses]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Responses]
GO

CREATE TABLE [dbo].[Answers] (
	[idAnswer] [int] IDENTITY (1, 1) NOT NULL ,
	[idQuestion] [int] NULL ,
	[AnswerText] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Correct] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Categories] (
	[idCategory] [int] IDENTITY (1, 1) NOT NULL ,
	[CategoryName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Levels] (
	[idLevel] [int] IDENTITY (1, 1) NOT NULL ,
	[LevelName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LevelColor] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LevelOrder] [int] NULL ,
	[QuestionPoints] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Players] (
	[idPlayer] [int] IDENTITY (1, 1) NOT NULL ,
	[PlayerName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Password] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastQuestion] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Questions] (
	[idQuestion] [int] IDENTITY (1, 1) NOT NULL ,
	[idCategory] [int] NULL ,
	[idLevel] [int] NULL ,
	[DisplayOrderNumber] [int] NULL ,
	[QuestionText] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Responses] (
	[idPlayer] [int] NULL ,
	[idQuestion] [int] NULL ,
	[idAnswer] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

