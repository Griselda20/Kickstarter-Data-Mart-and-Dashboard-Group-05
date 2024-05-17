-- create database [Kickstarter_ROLAP]
-- go

--DROP database [Kickstarter_ROLAP]

use [Kickstarter_ROLAP]
go


/****** Object:  Table [dbo].[Parent] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentID] [nchar](2) NOT NULL,
	[ParentName] [ntext] NULL,
	[ParentColor] [ntext] NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY NONCLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Category] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nchar](10) NOT NULL,
	[CategoryName] [ntext] NULL,
	[CategorySlug] [ntext] NULL,
	[CategoryPosition] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY NONCLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Profile] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileID] [nchar](10) NOT NULL,
	[ProfileState] [nvarchar](20),
    [profileState_changed_at] [datetime],
    [ProfileName] [nvarchar](255),
    [ProfileBlurb] [ntext],
    [ProfileBackground_color] [nvarchar](50),
    [ProfileText_color] [nvarchar](50),
    [ProfileLink_background_color] [nvarchar](50),
    [ProfileLink_text_color] [nvarchar](50),
    [ProfileLink_text] [nvarchar](255),
    [ProfileLink_url] [nvarchar](255),
    [ProfileShow_feature_image] [nvarchar](50),
    [ProfileBackground_image_opacity] [float],
    [ProfileShould_show_feature_image_section] [nvarchar](50),
    [ProfileDefault_image_url] [nvarchar](255),
    [ProfileBaseball_card_image_url] [nvarchar](255)
 CONSTRAINT [PK_Profile] PRIMARY KEY NONCLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Creator] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Creator](
    [CreatorID] [int] NOT NULL,
    [CreatorName] [nvarchar](255),
    [CreatorIs_registered] [nvarchar](50),
    [CreatorIs_email_verified] [nvarchar](50),
    [CreatorChosen_currency] [nvarchar](10),
    [CreatorIs_superbacker] [nvarchar](50),
    [CreatorAvatar_thumb] [nvarchar](255),
    [CreatorAvatar_small] [nvarchar](255),
    [CreatorAvatar_medium] [nvarchar](255),
    [CreatorWeb_user_url] [nvarchar](255),
    [CreatorApi_user_url] [nvarchar](255)
 CONSTRAINT [PK_Creator] PRIMARY KEY NONCLUSTERED 
(
	[CreatorID] ASC
)
) 
GO

/****** Object:  Table [dbo].[Country] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
    [CountryID] [nchar](2) NOT NULL,
    [Country_displayable_name] [nvarchar](40)
 CONSTRAINT [PK_Country] PRIMARY KEY NONCLUSTERED 
(
	[CountryID] ASC
)
)
GO

/****** Object:  Table [dbo].[Location] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
    [LocationID] [int] NOT NULL PRIMARY KEY,
    [LocationName] [nvarchar](255),
    [LocationSlug] [nvarchar](255),
    [LocationShort_name] [nvarchar](255),
    [LocationDisplayable_name] [nvarchar](255),
    [LocationLocalized_name] [nvarchar](255),
    [LocationCountry] [nvarchar](2),
    [LocationState] [nvarchar](2),
    [LocationType] [nvarchar](50),
    [LocationIs_root] [nvarchar](50),
    [LocationExpanded_country] [nvarchar](255),
    [LocationWeb_discover_url] [nvarchar](255),
    [LocationWeb_location_url] [nvarchar](255),
    [LocationApi_nearby_projects_url] [nvarchar](255)
)
GO

/****** Object:  Table [dbo].[Project] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
    [ProjectID] [int] NOT NULL,
    [ProjectBackers_count] [int],
    [ProjectBlurb] [ntext],
    [ProjectConverted_pledged_amount] [int],
    [Created_at] [date],
    [ProjectCurrency] [nvarchar](3),
    [ProjectCurrency_symbol] [nvarchar](50),
    [ProjectCurrency_Trailing_code] [nvarchar](50),
    [ProjectCurrent_currency] [nvarchar](3),
    [Deadline] [date],
    [Projectdisable_communication] [nvarchar](50),
    [Projectfx_rate] [int],
    [ProjectGoal] [int],
    [ProjectIs_backing] [nvarchar](50),
    [ProjectIs_starrable] [nvarchar](50),
    [ProjectIs_starred] [nvarchar](50),
    [Launched_at] [date],
    [ProjectPledged] [int],
    [ProjectProfile_id] [int],
    [ProjectSlug] [VARCHAR](255),
    [ProjectSource_url] [VARCHAR](255),
    [ProjectSpotlight] [nvarchar](50),
    [ProjectStaff_pick] [nvarchar](50),
    [ProjectState] [VARCHAR](50),
    [State_changed_at] [date],
    [ProjectStatic_usd_rate] [int],
    [ProjectUrls_project] [VARCHAR](255),
    [ProjectUsd_exchange_rate] [int],
    [ProjectUsd_pledged] [int],
    [ProjectUsd_type] [VARCHAR](50),
 CONSTRAINT [PK_Projects] PRIMARY KEY NONCLUSTERED 
(
	[ProjectID] ASC 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO