USE [PolyOEAsm]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 4/18/2022 8:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[VideoId] [varchar](50) NULL,
	[LikeDate] [date] NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 4/18/2022 8:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[ShareId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[VideoId] [varchar](50) NULL,
	[Emails] [nvarchar](150) NULL,
	[SharedDate] [date] NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[ShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/18/2022 8:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](30) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
	[Password] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 4/18/2022 8:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [varchar](50) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Poster] [nvarchar](150) NOT NULL,
	[Views] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Users]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Videos]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Users]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Videos]
GO
