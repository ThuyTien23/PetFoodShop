USE [master]
GO

CREATE DATABASE [PetFoodManagement] 
GO
USE [PetFoodManagement]
GO

-- User table --

CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](500) NOT NULL,
	[roleID] [char](2) NOT NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'admin', N'Administrator', N'AD', N'12345')
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'thuytien', N'Thủy Tiên', N'US', N'1')

-- PetFood table --
--drop table [dbo].[tblFoods]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFoods](
	[id] [char](5) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,	
	[quantity] [int] NOT NULL,	
	[imageSrc] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblFoods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblFoods] ([id], [name], [description], [price], [quantity], [imageSrc]) VALUES ('F-001', N'Soup CIAO', N'Súp thưởng vị ức gà và tôm', 40000, 5, N'images/pate-cho-meo-vi-ca-ngu.webp')
INSERT [dbo].[tblFoods] ([id], [name], [description], [price], [quantity], [imageSrc]) VALUES ('F-002', N'Soup CIAO', N'Súp thưởng vị cá ngừ nướng', 25000, 5, N'images/pate-cho-meo-vi-ca-ngu.webp')
INSERT [dbo].[tblFoods] ([id], [name], [description], [price], [quantity], [imageSrc]) VALUES ('F-003', N'Pate CAT SEA FISH', N'Pate mèo vị cá ngừ', 30000, 5, N'images/pate-cho-meo-vi-ca-ngu.webp')
INSERT [dbo].[tblFoods] ([id], [name], [description], [price], [quantity], [imageSrc]) VALUES ('F-004', N'Pate', N'Pate mèo', 20000, 5, N'images/pate-cho-meo-vi-ca-ngu.webp')