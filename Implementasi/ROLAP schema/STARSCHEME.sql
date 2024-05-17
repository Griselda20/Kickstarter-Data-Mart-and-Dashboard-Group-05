/*DROP DATABASE KickstarterDW
GO
CREATE DATABASE KickstarterDW
GO
ALTER DATABASE KickstarterDW
SET RECOVERY SIMPLE
GO
*/

USE KickstarterDW
;

/****** Object:  Table [dbo].[Parent] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[Location_id] [int] NOT NULL,
    [Location_name] [nvarchar](255),
    [Country] [nvarchar](2),
 CONSTRAINT [PK_DimLocation] PRIMARY KEY NONCLUSTERED 
(
	[Location_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dim_Project] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Project](
	[Project_id] [int] NOT NULL,
    [State] [nvarchar](50),
    [State_Changed_At] [date],
 CONSTRAINT [PK_Dim_Project] PRIMARY KEY NONCLUSTERED 
(
	[Project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimDate] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Date_id] [int] NOT NULL,
    [Deadline] [date],
    [Created_At] [date],
	[Creator_id] [int] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY NONCLUSTERED 
(
	[Date_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCategory] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategory](
	[Category_id] [int] NOT NULL,
    [Category_name] [nvarchar](255),
 CONSTRAINT [PK_DimCategory] PRIMARY KEY NONCLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCreator] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCreator](
	[Creator_id] [int] NOT NULL,
    [Creator_name] [nvarchar](255),
 CONSTRAINT [PK_DimCreator] PRIMARY KEY NONCLUSTERED 
(
	[Creator_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Crowdfunding_fact] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crowdfunding_fact](
	[Location_id] [int] NOT NULL,
    [Category_id] [int] NOT NULL,
    [Creator_id] [int] NOT NULL,
    [Project_id] [int] NOT NULL,
    [Date_id] [int] NOT NULL,
    [Backers_count] [int],
    [Pledged] [int],
    [Goal] [int],
 CONSTRAINT [PK_Crowdfunding_fact] PRIMARY KEY NONCLUSTERED 
(
	[Location_id],
	[Category_id],
	[Creator_id],
	[Project_id],
	[Date_id]
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Crowdfunding_fact] 
ADD CONSTRAINT [FK_Crowdfunding_fact_DimLocation] FOREIGN KEY([Location_id]) REFERENCES [dbo].[DimLocation] ([Location_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Crowdfunding_fact] 
ADD CONSTRAINT [FK_Crowdfunding_fact_DimCategory] FOREIGN KEY([Category_id]) REFERENCES [dbo].[DimCategory] ([Category_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Crowdfunding_fact] 
ADD CONSTRAINT [FK_Crowdfunding_fact_DimCreator] FOREIGN KEY([Creator_id]) REFERENCES [dbo].[DimCreator] ([Creator_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Crowdfunding_fact] 
ADD CONSTRAINT [FK_Crowdfunding_fact_Dim_Project] FOREIGN KEY([Project_id]) REFERENCES [dbo].[Dim_Project] ([Project_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Crowdfunding_fact] 
ADD CONSTRAINT [FK_Crowdfunding_fact_DimDate] FOREIGN KEY([Date_id]) REFERENCES [dbo].[DimDate] ([Date_id])
ON DELETE CASCADE
GO