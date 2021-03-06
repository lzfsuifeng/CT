USE [master]
GO
/****** Object:  Database [CT]    Script Date: 2018/6/26 星期二 23:31:14 ******/
CREATE DATABASE [CT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LZF\MSSQL\DATA\CT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LZF\MSSQL\DATA\CT_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CT] SET ARITHABORT OFF 
GO
ALTER DATABASE [CT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CT] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CT] SET RECOVERY FULL 
GO
ALTER DATABASE [CT] SET  MULTI_USER 
GO
ALTER DATABASE [CT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CT', N'ON'
GO
USE [CT]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Name] [nvarchar](50) NOT NULL,
	[Admin_Password] [char](20) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Border]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Border](
	[Border_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_ID] [int] NULL,
	[Border_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Border] PRIMARY KEY CLUSTERED 
(
	[Border_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collection]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[Collection_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
	[Goods_ID] [int] NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[Collection_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GetGoods]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GetGoods](
	[GetGoods_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
	[GetGoods_Name] [nvarchar](40) NOT NULL,
	[GetGoods_Address] [nvarchar](150) NOT NULL,
	[GetGoods_Telephone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GetGoods] PRIMARY KEY CLUSTERED 
(
	[GetGoods_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[Goods_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_ID] [int] NOT NULL,
	[Border_ID] [int] NOT NULL,
	[Goods_Name] [nchar](40) NOT NULL,
	[Goods_Content] [nvarchar](max) NOT NULL,
	[Goods_Img] [nvarchar](200) NOT NULL,
	[Goods_Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[Goods_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsComment]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsComment](
	[GoodsComment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Goods_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
	[GoodsComment_Content] [nvarchar](max) NOT NULL,
	[GoodsComment_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_GoodsComment] PRIMARY KEY CLUSTERED 
(
	[GoodsComment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsSave]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsSave](
	[GoodsSave_ID] [int] IDENTITY(1,1) NOT NULL,
	[Goods_ID] [int] NOT NULL,
	[GoodsSave_Num] [int] NOT NULL,
 CONSTRAINT [PK_GoodsSave] PRIMARY KEY CLUSTERED 
(
	[GoodsSave_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsType]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsType](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ICC]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICC](
	[ICC_ID] [int] IDENTITY(1,1) NOT NULL,
	[ICC_Name] [nvarchar](40) NOT NULL,
	[InfoClass_ID] [int] NULL,
 CONSTRAINT [PK_ICC] PRIMARY KEY CLUSTERED 
(
	[ICC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Info]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[Info_ID] [int] IDENTITY(1,1) NOT NULL,
	[Info_Title] [nchar](100) NOT NULL,
	[Info_Content] [nvarchar](max) NOT NULL,
	[Info_Img] [nvarchar](200) NOT NULL,
	[Info_Time] [datetime] NOT NULL,
	[InfoClass_ID] [int] NOT NULL,
	[ICC_ID] [int] NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoClass]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoClass](
	[InfoClass_ID] [int] IDENTITY(1,1) NOT NULL,
	[Info_Class] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_InfoClasss] PRIMARY KEY CLUSTERED 
(
	[InfoClass_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoComment]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoComment](
	[IC_ID] [int] IDENTITY(1,1) NOT NULL,
	[Info_ID] [int] NOT NULL,
	[IC_Content] [nvarchar](max) NOT NULL,
	[IC_Time] [datetime] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_InfoComment] PRIMARY KEY CLUSTERED 
(
	[IC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoCommentAgainst]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoCommentAgainst](
	[ICA_ID] [int] IDENTITY(1,1) NOT NULL,
	[Info_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_InfoCommentAgainst] PRIMARY KEY CLUSTERED 
(
	[ICA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoCommentBack]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoCommentBack](
	[ICB_ID] [int] IDENTITY(1,1) NOT NULL,
	[ICB_Content] [nvarchar](max) NOT NULL,
	[ICB_Time] [datetime] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
	[IC_ID] [int] NULL,
 CONSTRAINT [PK_InfoCommentBack] PRIMARY KEY CLUSTERED 
(
	[ICB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoCommentSupport]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoCommentSupport](
	[ICS_ID] [int] IDENTITY(1,1) NOT NULL,
	[Info_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_InfoCommentSupport] PRIMARY KEY CLUSTERED 
(
	[ICS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
	[Goods_ID] [int] NOT NULL,
	[Order_GoodsNum] [int] NOT NULL,
	[Order_Time] [datetime] NOT NULL,
	[Goods_Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserInfo_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserInfo_Img] [nvarchar](200) NOT NULL,
	[UserInfo_Name] [nchar](10) NOT NULL,
	[UserInfo_Password] [char](20) NOT NULL,
	[UserInfo_Email] [nvarchar](50) NOT NULL,
	[UserInfo_Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[Video_ID] [int] IDENTITY(1,1) NOT NULL,
	[Video_Title] [nchar](100) NOT NULL,
	[Video_Url] [nvarchar](max) NOT NULL,
	[Video_Img] [nvarchar](200) NOT NULL,
	[VideoClass_ID] [int] NOT NULL,
	[Video_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[Video_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoClass]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoClass](
	[VideoClass_ID] [int] IDENTITY(1,1) NOT NULL,
	[Video_Class] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_VideoClass] PRIMARY KEY CLUSTERED 
(
	[VideoClass_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoComment]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoComment](
	[VC_ID] [int] IDENTITY(1,1) NOT NULL,
	[Video_ID] [int] NOT NULL,
	[VC_Content] [nvarchar](max) NOT NULL,
	[VC_Time] [datetime] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_VideoComment] PRIMARY KEY CLUSTERED 
(
	[VC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoCommentAgainst]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCommentAgainst](
	[VCA_ID] [int] IDENTITY(1,1) NOT NULL,
	[Video_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_VideoCommentAgainst] PRIMARY KEY CLUSTERED 
(
	[VCA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoCommentBack]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCommentBack](
	[VCB_ID] [int] IDENTITY(1,1) NOT NULL,
	[VCB_Content] [nvarchar](max) NOT NULL,
	[VCB_Time] [datetime] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
	[VC_ID] [int] NOT NULL,
 CONSTRAINT [PK_VideoCommentBack] PRIMARY KEY CLUSTERED 
(
	[VCB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoCommentSupport]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCommentSupport](
	[VCS_ID] [int] IDENTITY(1,1) NOT NULL,
	[Video_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_VideoCommentSupport] PRIMARY KEY CLUSTERED 
(
	[VCS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Admin_ID], [Admin_Name], [Admin_Password]) VALUES (1, N'wa', N'123456              ')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Border] ON 

INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (1, 1, N'苹果')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (2, NULL, N'联想')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (3, 3, N'苹果')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (4, NULL, N'联想')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (5, 2, N'华硕')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (6, NULL, N'背包')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (7, NULL, N'背包')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (8, 4, N'背包啊')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (9, NULL, N'iPod')
INSERT [dbo].[Border] ([Border_ID], [Type_ID], [Border_Name]) VALUES (10, 3, N'北大啊')
SET IDENTITY_INSERT [dbo].[Border] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (5, 1, 1, N'iPhone 7                                ', N'<p>性价比极高的苹果手机</p>', N'/UploadGoodsImg/2018/6/c5b77d37-22ef-479d-9df0-bfc43393fa92.png', CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (6, 3, 3, N'时尚又有型让你不撞包                              ', N'<p>时尚又有型让你不撞包</p>', N'/UploadGoodsImg/2018/6/60051ff8-6c88-428c-9181-9482214927e6.png', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (7, 2, 5, N'iPod小巧的音乐播放歌曲                           ', N'<p>iPod小巧的音乐播放歌曲</p>', N'/UploadGoodsImg/2018/6/a226b279-a135-4a43-b894-a930cd8a7acc.png', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (8, 1, 1, N'modern design耳机                         ', N'<p>modern design耳机</p>', N'/UploadGoodsImg/2018/6/568dcc00-5601-431a-ac8d-94994bccabbb.png', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (9, 1, 1, N'三星盖乐世s5                                 ', N'<p>三星盖乐世s5</p>', N'/UploadGoodsImg/2018/6/eb4352e9-0156-444f-be3b-cf339afebd29.jpg', CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (10, 1, 1, N'永恒经典的诺基亚                                ', N'<p>永恒经典的诺基亚</p>', N'/UploadGoodsImg/2018/6/27008ac8-7201-49c5-be48-f24d3e0f98db.jpg', CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (11, 1, 1, N'LG G3                                   ', N'<p>LG G3</p>', N'/UploadGoodsImg/2018/6/1dda243a-2437-46cc-81c2-93b9cb52cbcb.jpg', CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (12, 1, 1, N'落寞的索尼手机                                 ', N'<p>落寞的索尼手机</p>', N'/UploadGoodsImg/2018/6/8cc5a04c-008a-43cc-9c57-449b8d28817d.jpg', CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (13, 1, 1, N'iPhone 6                                ', N'<p>iPhone 6</p>', N'/UploadGoodsImg/2018/6/a8e106a2-3ddf-4192-8700-14ee24995203.jpg', CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (14, 2, 5, N'华硕笔记本                                   ', N'<p>华硕笔记本</p>', N'/UploadGoodsImg/2018/6/9c960cd3-61cc-41b7-9807-58250c2696f4.jpg', CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (15, 2, 5, N'联想笔记本                                   ', N'<p>联想笔记本</p>', N'/UploadGoodsImg/2018/6/2fea7e5a-4d1c-4bba-abd7-c033896ff4cf.jpg', CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Goods] ([Goods_ID], [Type_ID], [Border_ID], [Goods_Name], [Goods_Content], [Goods_Img], [Goods_Price]) VALUES (16, 3, 3, N'三星平板                                    ', N'<p>三星平板</p>', N'/UploadGoodsImg/2018/6/3eaaa7eb-5574-400c-aab2-d8be9fc1af76.png', CAST(2000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Goods] OFF
SET IDENTITY_INSERT [dbo].[GoodsType] ON 

INSERT [dbo].[GoodsType] ([Type_ID], [Type_Name]) VALUES (1, N'手机')
INSERT [dbo].[GoodsType] ([Type_ID], [Type_Name]) VALUES (2, N'笔记本')
INSERT [dbo].[GoodsType] ([Type_ID], [Type_Name]) VALUES (3, N'平板')
INSERT [dbo].[GoodsType] ([Type_ID], [Type_Name]) VALUES (4, N'其他')
SET IDENTITY_INSERT [dbo].[GoodsType] OFF
SET IDENTITY_INSERT [dbo].[ICC] ON 

INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (1, N'评测', 1)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (2, N'曝光', 1)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (3, N'杂谈', 1)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (4, N'评测', 2)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (5, N'曝光', 2)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (6, N'杂谈', 2)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (7, N'评测', 3)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (8, N'曝光', 3)
INSERT [dbo].[ICC] ([ICC_ID], [ICC_Name], [InfoClass_ID]) VALUES (10, N'快讯', 1)
SET IDENTITY_INSERT [dbo].[ICC] OFF
SET IDENTITY_INSERT [dbo].[Info] ON 

INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (10, N'iPhone X的面部识别                                                                                       ', N'iPhone X的面部识别将成为大势所趋吗？', N'/UploadInfoImg/2018/6/e80a9681-34b3-4563-8c78-8fc01b3ad365.jpg', CAST(0x0000A90B011CD72D AS DateTime), 1, 1)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (12, N'三星S9上手初体验                                                                                           ', N'不跟风刘海屏的设计有多惊艳', N'/Content/InfoDemo/img/Info/samsung.jpg', CAST(0x0000A8EF00000000 AS DateTime), 1, 1)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (13, N'小米Mix2s的相机是否有提升?                                                                                    ', N'拍照常常不给力的小米能逆袭吗?', N'/Content/InfoDemo/img/Info/xiaomi.jpg', CAST(0x0000A8EF00000000 AS DateTime), 1, 3)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (14, N'华为P20Pro的三镜头能否打败双镜头成为新的趋势                                                                           ', N'惊艳的极光色极为吸引眼球', N'/Content/InfoDemo/img/Info/huawei.jpg', CAST(0x0000A8EF00000000 AS DateTime), 1, 3)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (16, N'提前发布但可能无屏下指纹，三星 Galaxy Note 9 爆料汇总                                                                  ', N'根据以往三星发布新机的节奏，三星会在上半年发布 S 系列旗舰机，在下半年，三星通常会在 8 月份发布 Note 系列新机。不过今年的「Note 9」可能会比以往来得更早一些——根据外媒爆料，传闻中的 Note 9 可能会提前于 7 月 29 日正式发布。

作为与 Galaxy S 系列同等级的旗舰产品线，Note 系列同样会采用三星的最新研发的技术。我们来盘点一下有可能会出现在 Note 9 上的新变化。

最受期待的屏下指纹功能，可能并不会配备在 Note 9 上

屏下指纹是传闻中 Note 9 最大的亮点，之前媒体普遍猜测 Note 9 会是首部采用屏下指纹技术的主流品牌智能手机，但是最近消息人士认为这种可能性并不高。

消息称，三星和苹果都曾经尝试开发屏下指纹技术，但是研发期间的进展都并不顺利，苹果直接放弃了屏下指纹技术研发，而受影响的三星 S8 则选择了备选方案，指纹模块后置。

如今 Note 9 可能也无法配备屏下指纹技术，消息称三星开发的基于超声波技术方案的指纹芯片已经直接跳过了 Note 9，目标是尽可能在 Galaxy X（S10）上实现商用。
', N'/Content/InfoDemo/img/Info/三星屏下指纹.jpg', CAST(0x0000A8EF00000000 AS DateTime), 1, 10)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (17, N'999 元起售，小米推出 4 款电视新品                                                                                ', N'5 月 24 日，小米正式发布了小米电视 4S 55 英寸（曲面）、小米电视 4X 55 英寸、小米电视 4S 43 英寸、小米电视 4C 32 英寸等 4 款新品，官方略开玩笑的将这一组合戏称为「小米电视 F4」。

而据悉，「小米电视 F4」在售价上覆盖了从 999 元到 3299 元的多个档位。

小米电视 4S 55 英寸（曲面）是这 4 款新品中唯一的曲面电视。官网数据显示，其屏幕分辨率为 3840 × 2160，采用直下式背光，曲度为 4000R，可视角度为 178 度，屏幕响应时间为 8 毫秒，支持 60Hz 刷新率。
', N'/Content/InfoDemo/img/Info/小米电视.jpg', CAST(0x0000A8EF00000000 AS DateTime), 4, NULL)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (18, N'Essential 公司寻求出售，新机型开发项目或被取消                                                                        ', N'据彭博社报道，消息人士称「安卓之父」安迪·鲁宾（Andy Rubin）创办的 Essential Product 已经开始寻求出售。Essential 目前已经委托瑞信处理潜在的收购要约，目前有至少一位买家有意。

这家由鲁宾的 Playground Global 孵化器孵化的初创企业在 2017 年 8 月融资超过 3 亿美元，投资方包括亚马逊、腾讯和红点创投，在此轮融资之外，Essential 还接受过鸿海的投资。在一年之前，非上市公司股票交易平台 Equidate 对 Essential 的估值区间为 9 亿美元到 10 亿美元，如今沦落到待贾而沽的境地令人唏嘘。

尽管曾经被寄予厚望，但是 Essential 推出的首部智能手机 Essential Phone 的销量遭遇滑铁卢。这款手机自 2015 年 5 月发布之后，频繁出现各种质量问题，2017 年全年的销量甚至不足 9 万部。但是据彭博社引述相关人士称，Essential Phone 的开发费用超过了 1 亿美元。', N'/Content/InfoDemo/img/Info/essential.jpg', CAST(0x0000A8EF0063F9C0 AS DateTime), 1, NULL)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (19, N'6GB + 128GB 版本售价 5888 元，HTC U12+ 国行版正式发布                                                            ', N'U12+ 国内正式发布，6GB + 128GB 版本售价 5888 元

本次在国内单独发布之前，HTC U12+ 已经于 5 月 23 日正式公布，这款 HTC 年度旗舰配备 6 英寸的窄边框屏幕和前后双摄像头，搭载骁龙 845 处理器，拥有 6GB + 64GB 和 6GB + 128GB 两种存储方案，国外售价分别为 799 美元（约合 5105 人民币）和 849 美元（约合 5425 人民币）。', N'/Content/InfoDemo/img/Info/HTC U12.jpg', CAST(0x0000A8EF00000000 AS DateTime), 1, NULL)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (20, N'重量不足 1 公斤，宏碁发布新款 Swift 5 超薄笔电                                                                       ', N'
接口方面，14 英寸与 15.6 英寸型号均提供 1 个 USB Tpye-C 接口、2 个 USB 3.1 标准接口、1 个 HDMI 接口，以及 1 个 SD 卡插槽。

新款 Swift 3 笔电 14 英寸版本的起售价为 599 欧元（约合 4479 人民币），15.6 英寸版本的起售价为 799 欧元（约合 5975 人民币），但具体发售日暂未公布。', N'/Content/InfoDemo/img/Info/宏碁.jpg', CAST(0x0000A8EF009450C0 AS DateTime), 3, NULL)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (21, N'发布近两年后，iPhone 7 Plus 仍是美国用户最满意的智能手机                                                                 ', N'近日，ACSI（American Customer Satisfaction Index，美国消费者满意指数）发布了 2018 年度的美国电信业消费者满意度报告，根据报告，美国消费者依旧对 2016 年发布的 iPhone 7 Plus 的满意度最高。

这份报告由 ACSI 的调研 45292 名消费者之后发布。根据报告评分，iPhone 7 Plus 以 85 分位列所有被调查机型的首位，三星 Galaxy S8+ 紧随其后，评分为 84 分。', N'/Content/InfoDemo/img/Info/Iphone7.jpg', CAST(0x0000A8EF007128C0 AS DateTime), 1, NULL)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (25, N'索尼的王牌                                                                                               ', N'<p>如果我不说，或许大部分人可能并不知道，索尼在「 4K UHD 蓝光机」领域它们是有所建树的，毕竟它并没有将这系列产品带入中国市场。但实际上，不论是口碑还是性能方面，已经得到了海外诸多用户和媒体的认可。<br/><br/>我在去年的时候评测过索尼超高性价比 4K UHD 蓝光机「 UBP-X800」，获得了巨大的反响，事实上，这台机除了音质方面的表现略微比 OPPO UDP-203 有所欠缺以外，其他方面其实完全不输 UDP-203，然而价格方面却是 203 的一半还少，说是性价比之选不足为过。</p><p><br/><a href="http://www.dgtle.com/thread-740082-1-1.html" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: transparent;">SONY UBP-X800 - 这可能是目前性价比最高的 4K UHD 蓝光播放机</a><br/><br/>那么，与 OPPO UDP-203 抗衡的是 UBP-X800，与 UDP-205 抗衡的是哪款呢？<br/><br/><strong style="word-wrap: break-word; box-sizing: border-box;">答案就是今天我们要说的这台「 UBP-X1000ES」。<br/></strong><br/>价位比 X800 更高，定位也同样要高一些，不过是不是能与 UDP-205 抗衡，这个我们就细细分解吧。<br/></p><p><br/></p>', N'/UploadInfoImg/2018/6/9f190443-8fe9-4918-b66d-911d8d5ac969.jpg', CAST(0x0000A90B016E88E3 AS DateTime), 1, 2)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (26, N'彭博社：苹果将于 2019 年推出「降噪防水版」AirPods                                                                     ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">彭博社近日</span><a href="https://www.bloomberg.com/news/articles/2018-06-25/apple-is-said-to-amplify-its-audio-device-strategy-in-2019" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: rgb(250, 250, 250); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal;">爆料</a><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">称，苹果将在加大音频设备方面的投入，并计划于 2019 年推出</span><strong style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal; background-color: rgb(250, 250, 250);">「高端版」AirPods</strong><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">、</span><strong style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal; background-color: rgb(250, 250, 250);">新款 HomePod</strong><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">，以及</span><strong style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal; background-color: rgb(250, 250, 250);">全新耳罩式耳机</strong><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">三款音频产品。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">彭博社援引知情人士的消息称，苹果目前正在研发具备降噪和防水功能的新款 AirPods，并试图为其增大无线连接范围；如果该产品顺利推出，AirPods 或许会演变出与 iPhone 相似的多条产线。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">此外，根据彭博社此前的</span><a href="https://www.bloomberg.com/news/articles/2018-02-22/apple-is-said-to-plan-upgrades-to-popular-airpods-headphones" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: rgb(250, 250, 250); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal;">报道</a><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">，苹果还可能会在 2018 年底研发出支持 Siri 免提激活功能的 AirPods 芯片。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">消息人士还透露，这款「高端版」AirPods 预计于 2019 年发售，售价可能会高于目前 AirPods 的 159 美元；苹果公司内部还讨论了将更多生物识别传感器引入 AirPods 的计划，例如增加心率传感器，以让 AirPods 具备与 Apple Watch 相似的健康监测功能等。此外，支持在 AirPower 无线充电器上使用的 AirPods 的无线充电盒，目前也在研发过程中。</span></p>', N'/UploadInfoImg/2018/6/7bc280a1-c36c-47aa-8d12-86a31d5967a4.jpg', CAST(0x0000A90B016F2EAF AS DateTime), 1, 3)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (27, N'大秀黑科技」的 vivo NEX 正式发售，市场评价几何                                                                        ', N'<p><span style="font-size:24px">媒体评论</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">媒体评价方面，我们节选了知名外媒对其的评价，虽然 vivo NEX 目前仅在中国地区发售，不过这并不妨碍国外媒体对其投以较高的关注度，其实从另一方面来说，这也使得他们的评价或许能更加「客观」一些。</span><br/><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p><strong style="word-wrap: break-word; box-sizing: border-box;">「迄今为止，无边框智能手机所能达到的极致」——The Verge</strong><br/></p></li></ul><p><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">The Verge 认为，vivo NEX 是一款极具创意的设备，它给出了现目前几乎最合理的无边框手机设计方案，并搭载了旗舰级的配置，其唯一的问题或许是那 199 克的净重。不过好在有 7.98 毫米机身厚度的加持，让 vivo NEX 比它的「原型机」vivo APEX 看起来更时尚些。</span><br/><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p><strong style="word-wrap: break-word; box-sizing: border-box;">「他们做到了，将 vivo APEX 变成了一款真正可以买到的手机」——CNET</strong><br/></p></li></ul><p><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">CNET 则惊叹于 vivo 将「疯狂概念手机」APEX 转化为量产机型 NEX 的做法。CNET 称赞了 vivo NEX 采用的无「刘海」凹槽，无扬声器格栅，以及升降式前置摄像头设计，但机身正面的「小下巴」或许是唯一的遗憾。</span><br/><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p><strong style="word-wrap: break-word; box-sizing: border-box;">「它有着令人印象深刻的 91.24% 屏占比」——Engedget</strong><br/></p></li></ul><p><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">Engedget 认为，vivo NEX 的升降式前置摄像头设计，解决了人们目前对于如何解决「刘海」凹槽问题的烦恼，它能在一秒内弹出，并在完成拍摄工作后迅速回收，大部分情况下应该不会耽误到自拍时机。</span></p><p><br/></p>', N'/UploadInfoImg/2018/6/eb50ba9a-00c1-437e-ae96-abac537fe377.png', CAST(0x0000A90B016FDE06 AS DateTime), 1, 10)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (28, N'上下对称无刘海，黄章透露更多魅族 16 屏幕信息                                                                            ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">黄章称，魅族 16 的屏幕比例将在魅族 15 的基础上增加，在目前的技术条件下，他认为 18:9 是最合适的屏幕比例，18.5:9 可以接受、18.7:9 是屏幕比例极限，所以魅族 16 的屏幕比例应该在 18:9 和 18.7:9 这一区间内。</span></p><p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">在细节方面，黄章表示魅族 16 将不再采用实体 Home 键的设计，但是会保留 mBack 的交互方式；因为屏幕上下边框收窄，魅族 16 的前置镜头将不再延续魅族 15 的居中设计。</span></p>', N'/UploadInfoImg/2018/6/22a9e44a-659d-439a-b2a4-4a8a865e00d9.png', CAST(0x0000A90B01704D1B AS DateTime), 2, 4)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (29, N'苹果 iOS 12macOS Mojave 首个公测版正式推送                                                                     ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">iOS 12 是苹果于 WWDC 2018 上发布的最新移动端操作系统，其主打的特色包括提升系统运行速度、加入 ARKit 2 框架等等。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">官方介绍称，在安装 iOS 12 后，现有 iOS 设备在高负载下 App 启动速度可提升约 2 倍，键盘启动速度提升 50%，在部分旧设备上，相机应用的启动速度甚至能提升 70％。</span><br/><br/></p><hr/><p><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">对 iOS 12 实际使用体验好奇的尾巴们，也可以参考我们之前基于「iOS 首个开发者预览版」所作的</span><a href="http://www.dgtle.com/article-23653-1.html" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: rgb(250, 250, 250); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal;">上手体验</a><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">此外，如果用户此前更新过「iOS 12 开发者预览版」，那么在更新「公开测试版」前需要前按照</span><a href="https://beta.apple.com/sp/zh/betaprogram/restore?locale=zh#ios" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: rgb(250, 250, 250); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal;">苹果官网</a><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">的步骤，先将设备恢复到正式版本的 iOS（目前为 iOS 11.4），安装完新的描述文件后，才能成功收到「公开测试版」的更新推送。不过，用户也可以选择继续使用「iOS 12 开发者预览版」。</span></p><p><br/></p>', N'/UploadInfoImg/2018/6/05958cf9-0e2c-4163-9055-c65af7b25c65.png', CAST(0x0000A90B01713613 AS DateTime), 2, 4)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (30, N'《Limbo》《Inside》将于 6 月 28 日登陆任天堂 Switch 平台                                                           ', N'<p><img src="http://img.baidu.com/hi/jx2/j_0037.gif"/></p><p class="forum-viewthread-article" style="word-wrap: break-word; box-sizing: border-box; margin: 0px auto; padding: 0px; width: 835px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal; background-color: rgb(250, 250, 250);">来自丹麦的独立游戏工作室 Playdead 近日向日本 Fami 通透露，旗下广受好评的 2D 动作解谜游戏《Limbo》和《Playdead’s Inside》将于 6 月 28 日登陆任天堂 Switch 平台。<br/><br/>《Limbo》最早于 2010 年 7 月 21 日在 Xbox 360 平台发售，游戏运用大量的黑白配色构图，塑造出了一个兼具神秘感与压抑氛围的游戏世界，并由于在关卡方面的精湛设计，《Limbo》曾荣获了多个游戏设计奖项。<br/><br/></p><p></p><p><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">《Playdead’s Inside》则最早于 2016 年 6 月 29 日在 Xbox One 平台发售，该作是 Playdead 的第二款作品，在艺术风格上几乎延续了《Limbo》的神秘与压抑感。《Playdead’s Inside》曾被 IGN、Polygon 等游戏游戏媒体评价为「2016 年最值得期待的电子游戏」。</span><br/><br/></p><p></p><p><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">这两款游戏在发售后都陆续登陆了包括 PC、iOS、Android、Xbox One 在内的多个平台，而 6 月 28 日之后，任天堂 Switch 的用户也可以畅玩它们了。</span></p><p><br/></p>', N'/UploadInfoImg/2018/6/6f66ea0d-afd1-443f-9dae-7d2c5e312ef4.png', CAST(0x0000A90B0171D461 AS DateTime), 2, 5)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (31, N'《宝可梦探险寻宝》将于 6 月 28 日登陆手机平台                                                                          ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">苹果 iOS App Store 与 Google Play 商店近期宣布，来自 The Pokemon Company 的休闲类冒险游戏《宝可梦探险寻宝》将于 6 月 28 日正式登陆 iOS 与 Android 平台。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">因为其相对独特的艺术风格，《宝可梦探险寻宝》常被玩家们戏称为「方块宝可梦」。游戏将《精灵宝可梦》系列经典的培养与对战元素融入了需要闯关冒险的「方可乐岛」中，而玩家所要做的，就是在岛上一路披荆斩棘猎获最后的宝物。</span></p>', N'/UploadInfoImg/2018/6/cf494b25-569c-44b0-b4c3-784cb04d5189.jpg', CAST(0x0000A90B017209C5 AS DateTime), 2, 5)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (32, N'三大运营商宣布，7 月 1 日起正式取消流量「漫游」费                                                                         ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">在今年 3 月 5 日，国务院总理李克强曾在《政府工作报告》提出了电信网络「提速降费」政策，其明细条文罗列出了加大网络提速降费力度、实现高速宽带城乡全覆盖、扩大公共场所免费上网范围、明显降低家庭宽带/企业宽带和专线使用费、取消流量「漫游」费，移动网络流量资费年内至少降低 30% 等多项内容。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">而针对「提速降费」的新政策，工信部曾在 4 月 25 日公开表示，已督促相关企业在加班并行工作，确保在 7 月 1 日前正式取消流量「漫游」费；并针对政策的其余几个方面，明确了相应的工作方向：</span><br/><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>加大不限流量或大流量资费方案的推出力度；<br/></p></li></ul><p><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>开展流量套餐的扩容降费，对主流套餐推出优惠销售，赠送用户一定的通信费，对套餐里面所含的一些流量再进行加大扩容；<br/></p></li></ul><p><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>根据用户使用习惯推出特色流量产品，持续推出流量月包、假日流量包、流量日包，降低流量消费门槛；<br/></p></li></ul><p><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>推广流量放心用的惠民服务，流量超出后，自动的一些叠加的优惠流量安心包，以及快到接近的时候及时提醒用户流量的使用情况；<br/></p></li></ul><p><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>推出宽带优惠的资费方案，并开展一些「提速不提价」项目，加大固定融合套餐的推广力度；<br/></p></li></ul><p><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>进一步降低专线专线的价格，今年预计能够下降 10% 到 15%，并针对中小企业推出特色产品；<br/></p></li></ul><p><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>2018 年工信部宽带提速的引导目标是「希望超过一半的家庭宽带用户都能够使用 100 兆以上的宽带速率」。</p></li></ul><p><br/></p>', N'/UploadInfoImg/2018/6/0e1fa845-bdea-4fa1-ae52-e5ac94d991e2.jpg', CAST(0x0000A90B017256B0 AS DateTime), 2, 6)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (33, N'苹果确认 MacBook 蝶式键盘可能发生故障并推出免费保修计划                                                                    ', N'<p class="forum-viewthread-article" style="word-wrap: break-word; box-sizing: border-box; margin: 0px auto; padding: 0px; width: 835px; color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal; background-color: rgb(250, 250, 250);">虽然 MacBook 和 MacBook Pro 的蝶式键盘的手感广受诟病，并且故障率相当高，但是苹果之前一直并未回应相关问题。直到 6 月 22 日，苹果在官网<a href="https://www.apple.com/cn/support/keyboard-service-program-for-macbook-and-macbook-pro/" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: transparent;">发布公告</a>，正式确认部分型号的 MacBook 和 MacBook Pro 的键盘可能会出故障，并推出了相关的售后维修计划。<br/><br/>被苹果划为键盘可能发生故障并归为保修范围之内的机型包括：<br/><br/></p><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>MacBook (Retina, 12-inch, Early 2015)</p></li><li><p>MacBook (Retina, 12-inch, Early 2016)</p></li><li><p>MacBook (Retina, 12-inch, 2017)</p></li><li><p>MacBook Pro (13-inch, 2016, Two Thunderbolt 3 Ports)</p></li><li><p>MacBook Pro (13-inch, 2017, Two Thunderbolt 3 Ports)</p></li><li><p>MacBook Pro (13-inch, 2016, Four Thunderbolt 3 Ports)</p></li><li><p>MacBook Pro (13-inch, 2017, Four Thunderbolt 3 Ports)</p></li><li><p>MacBook Pro (15-inch, 2016)</p></li><li><p>MacBook Pro (15-inch, 2017)<br/></p></li></ul><p><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">苹果称，如果设备属于以上机型并出现键盘连击、无法输入、按键粘滞 / 反馈不一，可以在 Apple Store 或者授权售后服务商发起售后维修请求；如果在公告发布之前已经对键盘进行过售后维修，苹果将补偿维修款项。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">苹果这一键盘保修计划的有效时间为 4 年，也就是说自 MacBook 和 MacBook Pro 购买之日起 4 年内，属于这一保修范畴的键盘故障都可以在官方渠道内免费保修。</span></p><p><br/></p>', N'/UploadInfoImg/2018/6/9c59ece0-2014-43a3-8fcd-ba54e676d6c4.jpg', CAST(0x0000A90B0173D5BE AS DateTime), 2, 6)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (34, N'售价 999 元起，刘海屏红米 6 Pro 正式发布                                                                          ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">红米 6 Pro 已经于 6 月 25 日在小米商城正式上线，这是继 6 月 12 日发布红米 6 和红米 6A 之后小米再度发布新机。升级版的红米 6 Pro 采用了更流行的刘海屏，而且对设计细节和硬件配置进行了升级。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">相比于红米 6，红米 6 Pro 外观上最大的变化是采用了异形全面屏的设计。「刘海屏」红米 6 Pro 升级为 5.84 英寸 19:9 的 2280 x 1080 分辨率屏幕，屏幕边缘作弧形处理，更接近于「3D」屏幕效果，所以即使尺寸增大为 149.33 × 71.68 × 8.75mm，其握持手感相比于红米 6 反倒有所提升。</span></p>', N'/UploadInfoImg/2018/6/58206e08-06be-4104-b953-b7c22b1b61e1.jpg', CAST(0x0000A90B01744EE2 AS DateTime), 3, 7)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (35, N'iPhone 能当「学生卡」？美国一所大学已经这样做了                                                                         ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">而近期外媒 Tuscaloosa News 还</span><a href="http://www.tuscaloosanews.com/news/20180617/univ-of-alabama-students-can-use-id-card-on-apple-watch" target="_blank" style="word-wrap: break-word; box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; background-color: rgb(250, 250, 250); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; white-space: normal;">报道</a><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">称，即将首批支持「学生 ID 卡」功能的一所美国高校——阿拉巴马大学，已经提前使用上了该功能。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">该高校的总裁 Stewart Bell 表示，阿拉巴马大学与苹果已经合作开发「学生 ID 卡」功能有约一年的时间，而自即日起，已经更新了测试版 iOS 12/watchOS 5 的设备便可以在校园内使用该功能了。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">据悉，「学生 ID 卡」功能还将于今年 9 月逐步推广到杜克大学、俄克拉何马大学和阿拉巴马大学，并在年底前推广到约翰霍普金斯大学、圣克拉拉大学和天普大学等美国高校。</span></p>', N'/UploadInfoImg/2018/6/53cb5142-ee9c-4037-887d-841fe048b56f.jpg', CAST(0x0000A90B017507B0 AS DateTime), 3, 8)
INSERT [dbo].[Info] ([Info_ID], [Info_Title], [Info_Content], [Info_Img], [Info_Time], [InfoClass_ID], [ICC_ID]) VALUES (36, N'999 欧元！OPPO Find X 登场：93.8% 屏占比 + 3D 人脸识别                                                           ', N'<p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">藉由「双轨潜望结构」，Find X 的机身正反面都实现了「无开孔设计」，其正面为 6.42 英寸全曲面屏幕，采用了与苹果 iPhone X 类似的 COP 封装工艺制造，将整体屏占比提升至 93.8% 的同时，也让下部边框的宽度缩短至为 3.4mm。</span><br/><br/><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Arial, Helvetica, &quot;WenQuanYi Micro Hei&quot;, &quot;tohoma,sans-serif&quot;; background-color: rgb(250, 250, 250);">Find X 的机身背面则采用了名为「3D 叠层流光点彩工艺」的特殊工艺制造，据称能让手机在不同光线下呈现「灵动优雅」的光影流转。</span></p>', N'/UploadInfoImg/2018/6/6cadbe0c-7a81-4423-9327-1d201f0fcaf7.jpg', CAST(0x0000A90B01754B71 AS DateTime), 3, 7)
SET IDENTITY_INSERT [dbo].[Info] OFF
SET IDENTITY_INSERT [dbo].[InfoClass] ON 

INSERT [dbo].[InfoClass] ([InfoClass_ID], [Info_Class]) VALUES (1, N'手机')
INSERT [dbo].[InfoClass] ([InfoClass_ID], [Info_Class]) VALUES (2, N'平板')
INSERT [dbo].[InfoClass] ([InfoClass_ID], [Info_Class]) VALUES (3, N'笔记本')
INSERT [dbo].[InfoClass] ([InfoClass_ID], [Info_Class]) VALUES (4, N'其他')
SET IDENTITY_INSERT [dbo].[InfoClass] OFF
SET IDENTITY_INSERT [dbo].[InfoComment] ON 

INSERT [dbo].[InfoComment] ([IC_ID], [Info_ID], [IC_Content], [IC_Time], [UserInfo_ID]) VALUES (13, 10, N'很不错', CAST(0x0000A90B0156B264 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[InfoComment] OFF
SET IDENTITY_INSERT [dbo].[InfoCommentAgainst] ON 

INSERT [dbo].[InfoCommentAgainst] ([ICA_ID], [Info_ID], [UserInfo_ID]) VALUES (4, 16, 2)
INSERT [dbo].[InfoCommentAgainst] ([ICA_ID], [Info_ID], [UserInfo_ID]) VALUES (5, 10, 2)
SET IDENTITY_INSERT [dbo].[InfoCommentAgainst] OFF
SET IDENTITY_INSERT [dbo].[InfoCommentSupport] ON 

INSERT [dbo].[InfoCommentSupport] ([ICS_ID], [Info_ID], [UserInfo_ID]) VALUES (13, 12, 3)
INSERT [dbo].[InfoCommentSupport] ([ICS_ID], [Info_ID], [UserInfo_ID]) VALUES (14, 13, 3)
INSERT [dbo].[InfoCommentSupport] ([ICS_ID], [Info_ID], [UserInfo_ID]) VALUES (15, 14, 3)
INSERT [dbo].[InfoCommentSupport] ([ICS_ID], [Info_ID], [UserInfo_ID]) VALUES (29, 12, 2)
INSERT [dbo].[InfoCommentSupport] ([ICS_ID], [Info_ID], [UserInfo_ID]) VALUES (31, 16, 2)
INSERT [dbo].[InfoCommentSupport] ([ICS_ID], [Info_ID], [UserInfo_ID]) VALUES (33, 10, 2)
SET IDENTITY_INSERT [dbo].[InfoCommentSupport] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserInfo_ID], [UserInfo_Img], [UserInfo_Name], [UserInfo_Password], [UserInfo_Email], [UserInfo_Phone]) VALUES (1, N'/FileUploadImage/2018/6/5/03c1086f-fc3f-4530-8b15-11b6399382cf.jpg', N'we        ', N'123456              ', N'dsf@qq.com', N'1651123')
INSERT [dbo].[UserInfo] ([UserInfo_ID], [UserInfo_Img], [UserInfo_Name], [UserInfo_Password], [UserInfo_Email], [UserInfo_Phone]) VALUES (2, N'/FileUploadImage/2018/6/10/a0e104e6-f03d-4295-9f47-465e344a2667.jpg', N'wa        ', N'123456              ', N'dsfas@SDF.COM', N'DSFSA')
INSERT [dbo].[UserInfo] ([UserInfo_ID], [UserInfo_Img], [UserInfo_Name], [UserInfo_Password], [UserInfo_Email], [UserInfo_Phone]) VALUES (3, N'/FileUploadImage/2018/6/10/da626469-d8e1-4594-91aa-515b959b071f.jpg', N'wer       ', N'123456              ', N'gfsdf@qq.com', N'sdfsad')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (1, N'一加6漫威版 现场体验                                                                                         ', N'/UploadVideo/2018/6/4b3588ae-0109-4835-8080-6dd680bee999.mp4', N'/UploadImg/2018/6/f4a8e00a-b0ef-4dcd-9082-1257d67cafb5.png', 1, CAST(0x0000A90B01248171 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (12, N'2000亿像素有多恐怖，望眼欲穿！太震撼了！                                                                              ', N'/UploadVideo/2018/6/8e570110-16a6-4878-bf21-36811bf9f7df.Mp4', N'/UploadImg/2018/6/f52cefce-8830-401f-947a-edf9b5605918.png', 1, CAST(0x0000A90B0127FD4B AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (16, N'这台手机改变了一切 Oppo Find X                                                                               ', N'/UploadVideo/2018/6/4690758b-9a56-46c5-88da-0ac277bd6fff.Mp4', N'/UploadImg/2018/6/7148e937-d628-4390-bea3-87be82cb0a94.png', 1, CAST(0x0000A90B012FF233 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (17, N'王者归来！全面屏旗舰 OPPO Find X                                                                              ', N'/UploadVideo/2018/6/46cb63ee-bd19-4dc6-b33f-541076226e03.Mp4', N'/UploadImg/2018/6/5933d834-8a70-4641-8c12-8a374894f85d.png', 1, CAST(0x0000A90B0130AF39 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (18, N'【new ipad2018】开箱+上手体验（能当电脑用的平板？                                                                     ', N'/UploadVideo/2018/6/ec89f657-8de0-40b4-b206-e2ac62262eeb.Mp4', N'/UploadImg/2018/6/844bde8b-3459-4bb3-ab04-de72237e1410.jpg', 2, CAST(0x0000A90B014238B6 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (19, N'【爱电子产品】华为MediaPad M5、M5 pro平板电脑上手体验（搬运自PhoneArena）                                                  ', N'/UploadVideo/2018/6/37d5af2a-4274-4241-b98d-1da8ca4c3b7a.Mp4', N'/UploadImg/2018/6/4fc12f30-d0fe-4550-8159-e81e9245dade.jpg', 2, CAST(0x0000A90B0142D157 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (20, N'墙裂推荐 学生党超便宜平板电脑                                                                                     ', N'/UploadVideo/2018/6/9df58396-2703-4d26-94a2-6611d935e2d2.Mp4', N'/UploadImg/2018/6/2b330e49-f0dc-49ea-900a-c9ef00fed9a5.jpg', 2, CAST(0x0000A90B01430628 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (21, N'搞机零距离：实测用坚果TNT工作站在办公室工作同事反应如何？结果令人震惊                                                                ', N'/UploadVideo/2018/6/9d39a438-2cd7-47dd-be8c-ee7d1d2c38dd.Mp4', N'/UploadImg/2018/6/5986dc56-9313-4aa2-becd-ac079f77ada2.jpg', 2, CAST(0x0000A90B01434AFC AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (22, N'2018笔记本质量报告：苹果电脑质量第一，华硕垫底！                                                                          ', N'/UploadVideo/2018/6/99428f11-f1f4-4cae-b094-4e05fac4233d.Mp4', N'/UploadImg/2018/6/efa0a895-6453-44ad-8009-6a4e89f4abc7.jpg', 3, CAST(0x0000A90B01437AD4 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (23, N'某鱼135品牌平板，安全讨到手？                                                                                    ', N'/UploadVideo/2018/6/43ce676c-37cb-4956-84f2-960a53d7113a.Mp4', N'/UploadImg/2018/6/f875f3f2-fd25-4324-8ce0-4d6ad68d297e.jpg', 2, CAST(0x0000A90B0143AF27 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (24, N'三千多的笔记本也能轻松吃鸡？联想Y50-70性价比游戏本测评                                                                      ', N'/UploadVideo/2018/6/3b719bab-8f0f-48b0-ba5e-51a125bd23c9.Mp4', N'/UploadImg/2018/6/4fdad656-8bff-4315-82ec-417260a2e64d.jpg', 3, CAST(0x0000A90B0143E73F AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (25, N'我为什么选择5000元价位的笔记本电脑？好用且实惠！                                                                          ', N'/UploadVideo/2018/6/47bddd9c-23a8-4496-9dd3-db3e6ba7c503.Mp4', N'/UploadImg/2018/6/fd00ec55-aeca-4c55-9d2b-6a2f3bf59bc3.jpg', 3, CAST(0x0000A90B014434A3 AS DateTime))
INSERT [dbo].[Video] ([Video_ID], [Video_Title], [Video_Url], [Video_Img], [VideoClass_ID], [Video_Time]) VALUES (26, N'听说你想买到便宜的笔记本？                                                                                       ', N'/UploadVideo/2018/6/7e0cefb2-24ee-4a3b-a427-c71ccf49664c.Mp4', N'/UploadImg/2018/6/917af97a-c17d-4ab1-9e10-dde7f2676ebb.jpg', 3, CAST(0x0000A90B01446A8C AS DateTime))
SET IDENTITY_INSERT [dbo].[Video] OFF
SET IDENTITY_INSERT [dbo].[VideoClass] ON 

INSERT [dbo].[VideoClass] ([VideoClass_ID], [Video_Class]) VALUES (1, N'手机')
INSERT [dbo].[VideoClass] ([VideoClass_ID], [Video_Class]) VALUES (2, N'平板')
INSERT [dbo].[VideoClass] ([VideoClass_ID], [Video_Class]) VALUES (3, N'笔记本')
INSERT [dbo].[VideoClass] ([VideoClass_ID], [Video_Class]) VALUES (4, N'科技相对论')
SET IDENTITY_INSERT [dbo].[VideoClass] OFF
SET IDENTITY_INSERT [dbo].[VideoComment] ON 

INSERT [dbo].[VideoComment] ([VC_ID], [Video_ID], [VC_Content], [VC_Time], [UserInfo_ID]) VALUES (3, 1, N'风过有痕', CAST(0x0000A90B014C4071 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[VideoComment] OFF
SET IDENTITY_INSERT [dbo].[VideoCommentSupport] ON 

INSERT [dbo].[VideoCommentSupport] ([VCS_ID], [Video_ID], [UserInfo_ID]) VALUES (3, 1, 2)
INSERT [dbo].[VideoCommentSupport] ([VCS_ID], [Video_ID], [UserInfo_ID]) VALUES (4, 12, 2)
SET IDENTITY_INSERT [dbo].[VideoCommentSupport] OFF
ALTER TABLE [dbo].[Border]  WITH CHECK ADD  CONSTRAINT [FK_Border_GoodsType] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[GoodsType] ([Type_ID])
GO
ALTER TABLE [dbo].[Border] CHECK CONSTRAINT [FK_Border_GoodsType]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_Goods] FOREIGN KEY([Goods_ID])
REFERENCES [dbo].[Goods] ([Goods_ID])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_Goods]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_UserInfo]
GO
ALTER TABLE [dbo].[GetGoods]  WITH CHECK ADD  CONSTRAINT [FK_GetGoods_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[GetGoods] CHECK CONSTRAINT [FK_GetGoods_UserInfo]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Border] FOREIGN KEY([Border_ID])
REFERENCES [dbo].[Border] ([Border_ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Border]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_GoodsType] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[GoodsType] ([Type_ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_GoodsType]
GO
ALTER TABLE [dbo].[GoodsComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodsComment_GoodsComment] FOREIGN KEY([Goods_ID])
REFERENCES [dbo].[Goods] ([Goods_ID])
GO
ALTER TABLE [dbo].[GoodsComment] CHECK CONSTRAINT [FK_GoodsComment_GoodsComment]
GO
ALTER TABLE [dbo].[GoodsComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodsComment_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[GoodsComment] CHECK CONSTRAINT [FK_GoodsComment_UserInfo]
GO
ALTER TABLE [dbo].[GoodsSave]  WITH CHECK ADD  CONSTRAINT [FK_GoodsSave_Goods] FOREIGN KEY([Goods_ID])
REFERENCES [dbo].[Goods] ([Goods_ID])
GO
ALTER TABLE [dbo].[GoodsSave] CHECK CONSTRAINT [FK_GoodsSave_Goods]
GO
ALTER TABLE [dbo].[ICC]  WITH CHECK ADD  CONSTRAINT [FK_ICC_InfoClass] FOREIGN KEY([InfoClass_ID])
REFERENCES [dbo].[InfoClass] ([InfoClass_ID])
GO
ALTER TABLE [dbo].[ICC] CHECK CONSTRAINT [FK_ICC_InfoClass]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_ICC] FOREIGN KEY([ICC_ID])
REFERENCES [dbo].[ICC] ([ICC_ID])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_ICC]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_InfoClass] FOREIGN KEY([InfoClass_ID])
REFERENCES [dbo].[InfoClass] ([InfoClass_ID])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_InfoClass]
GO
ALTER TABLE [dbo].[InfoComment]  WITH CHECK ADD  CONSTRAINT [FK_InfoComment_Info] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Info] ([Info_ID])
GO
ALTER TABLE [dbo].[InfoComment] CHECK CONSTRAINT [FK_InfoComment_Info]
GO
ALTER TABLE [dbo].[InfoComment]  WITH CHECK ADD  CONSTRAINT [FK_InfoComment_InfoComment] FOREIGN KEY([IC_ID])
REFERENCES [dbo].[InfoComment] ([IC_ID])
GO
ALTER TABLE [dbo].[InfoComment] CHECK CONSTRAINT [FK_InfoComment_InfoComment]
GO
ALTER TABLE [dbo].[InfoComment]  WITH CHECK ADD  CONSTRAINT [FK_InfoComment_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[InfoComment] CHECK CONSTRAINT [FK_InfoComment_UserInfo]
GO
ALTER TABLE [dbo].[InfoCommentAgainst]  WITH CHECK ADD  CONSTRAINT [FK_InfoCommentAgainst_Info] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Info] ([Info_ID])
GO
ALTER TABLE [dbo].[InfoCommentAgainst] CHECK CONSTRAINT [FK_InfoCommentAgainst_Info]
GO
ALTER TABLE [dbo].[InfoCommentAgainst]  WITH CHECK ADD  CONSTRAINT [FK_InfoCommentAgainst_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[InfoCommentAgainst] CHECK CONSTRAINT [FK_InfoCommentAgainst_UserInfo]
GO
ALTER TABLE [dbo].[InfoCommentBack]  WITH CHECK ADD  CONSTRAINT [FK_InfoCommentBack_InfoComment] FOREIGN KEY([IC_ID])
REFERENCES [dbo].[InfoComment] ([IC_ID])
GO
ALTER TABLE [dbo].[InfoCommentBack] CHECK CONSTRAINT [FK_InfoCommentBack_InfoComment]
GO
ALTER TABLE [dbo].[InfoCommentBack]  WITH CHECK ADD  CONSTRAINT [FK_InfoCommentBack_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[InfoCommentBack] CHECK CONSTRAINT [FK_InfoCommentBack_UserInfo]
GO
ALTER TABLE [dbo].[InfoCommentSupport]  WITH CHECK ADD  CONSTRAINT [FK_InfoCommentSupport_Info1] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Info] ([Info_ID])
GO
ALTER TABLE [dbo].[InfoCommentSupport] CHECK CONSTRAINT [FK_InfoCommentSupport_Info1]
GO
ALTER TABLE [dbo].[InfoCommentSupport]  WITH CHECK ADD  CONSTRAINT [FK_InfoCommentSupport_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[InfoCommentSupport] CHECK CONSTRAINT [FK_InfoCommentSupport_UserInfo]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Goods] FOREIGN KEY([Goods_ID])
REFERENCES [dbo].[Goods] ([Goods_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Goods]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInfo]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Video] FOREIGN KEY([VideoClass_ID])
REFERENCES [dbo].[VideoClass] ([VideoClass_ID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Video]
GO
ALTER TABLE [dbo].[VideoComment]  WITH CHECK ADD  CONSTRAINT [FK_VideoComment_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[VideoComment] CHECK CONSTRAINT [FK_VideoComment_UserInfo]
GO
ALTER TABLE [dbo].[VideoComment]  WITH CHECK ADD  CONSTRAINT [FK_VideoComment_Video] FOREIGN KEY([Video_ID])
REFERENCES [dbo].[Video] ([Video_ID])
GO
ALTER TABLE [dbo].[VideoComment] CHECK CONSTRAINT [FK_VideoComment_Video]
GO
ALTER TABLE [dbo].[VideoCommentAgainst]  WITH CHECK ADD  CONSTRAINT [FK_VideoCommentAgainst_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[VideoCommentAgainst] CHECK CONSTRAINT [FK_VideoCommentAgainst_UserInfo]
GO
ALTER TABLE [dbo].[VideoCommentAgainst]  WITH CHECK ADD  CONSTRAINT [FK_VideoCommentAgainst_Video] FOREIGN KEY([Video_ID])
REFERENCES [dbo].[Video] ([Video_ID])
GO
ALTER TABLE [dbo].[VideoCommentAgainst] CHECK CONSTRAINT [FK_VideoCommentAgainst_Video]
GO
ALTER TABLE [dbo].[VideoCommentBack]  WITH CHECK ADD  CONSTRAINT [FK_VideoCommentBack_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[VideoCommentBack] CHECK CONSTRAINT [FK_VideoCommentBack_UserInfo]
GO
ALTER TABLE [dbo].[VideoCommentBack]  WITH CHECK ADD  CONSTRAINT [FK_VideoCommentBack_VideoComment] FOREIGN KEY([VC_ID])
REFERENCES [dbo].[VideoComment] ([VC_ID])
GO
ALTER TABLE [dbo].[VideoCommentBack] CHECK CONSTRAINT [FK_VideoCommentBack_VideoComment]
GO
ALTER TABLE [dbo].[VideoCommentSupport]  WITH CHECK ADD  CONSTRAINT [FK_VideoCommentSupport_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([UserInfo_ID])
GO
ALTER TABLE [dbo].[VideoCommentSupport] CHECK CONSTRAINT [FK_VideoCommentSupport_UserInfo]
GO
ALTER TABLE [dbo].[VideoCommentSupport]  WITH CHECK ADD  CONSTRAINT [FK_VideoCommentSupport_Video] FOREIGN KEY([Video_ID])
REFERENCES [dbo].[Video] ([Video_ID])
GO
ALTER TABLE [dbo].[VideoCommentSupport] CHECK CONSTRAINT [FK_VideoCommentSupport_Video]
GO
/****** Object:  Trigger [dbo].[TRIGER_ICC_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--级联删除
Create TRIGGER [dbo].[TRIGER_ICC_Delete]
   ON  [dbo].[ICC]
  instead of Delete  
AS   
BEGIN  
   declare @ICC_ID int  
   select @ICC_ID =ICC_ID from deleted   

--删除收藏  
     
--删除反对  
delete Info where ICC_ID =@ICC_ID
delete ICC where ICC_ID =@ICC_ID 
END


GO
/****** Object:  Trigger [dbo].[TRIGER_Info_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--新闻资讯级联删除
Create TRIGGER [dbo].[TRIGER_Info_Delete] 
   ON  [dbo].[Info]  
  instead of Delete  
AS   
BEGIN  
   declare @Info_Id int  
   select @Info_Id =Info_ID from deleted   
--删除评论回复  
delete InfoCommentBack where IC_ID in (select IC_ID from InfoComment where Info_ID =@Info_Id )  
--删除评论  
delete InfoComment where Info_ID =@Info_Id  
--删除反对  
delete InfoCommentAgainst where Info_ID =@Info_Id      
--删除支持  
delete InfoCommentSupport where Info_ID =@Info_Id       
--删除 
delete Info where Info_ID =@Info_Id 
END

GO
/****** Object:  Trigger [dbo].[TRIGER_InfoClass_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[TRIGER_InfoClass_Delete]
   ON  [dbo].[InfoClass] 
  instead of Delete  
AS   
BEGIN  
   declare @InfoClass_ID int  
   select @InfoClass_ID =InfoClass_ID from deleted   

--删除收藏  
delete ICC where InfoClass_ID =@InfoClass_ID       
--删除反对  
delete Info where InfoClass_ID =@InfoClass_ID 
--删除新闻 
delete InfoClass where InfoClass_ID =@InfoClass_ID  
END

GO
/****** Object:  Trigger [dbo].[TRIGER_InfoComment_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--级联删除
Create TRIGGER [dbo].[TRIGER_InfoComment_Delete]
   ON  [dbo].[InfoComment]
  instead of Delete  
AS   
BEGIN  
   declare @IC_ID int  
   select @IC_ID =IC_ID from deleted   

--删除收藏  
     
--删除反对  
delete InfoCommentBack where IC_ID =@IC_ID
delete InfoComment where IC_ID =@IC_ID 
END


GO
/****** Object:  Trigger [dbo].[TRIGER_Video_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--视频评测级联删除
Create TRIGGER [dbo].[TRIGER_Video_Delete] 
   ON  [dbo].[Video]  
  instead of Delete  
AS   
BEGIN  
   declare @Video_ID int  
   select @Video_ID =Video_ID from deleted   
--删除评论回复  
delete VideoCommentBack where VC_ID in (select VC_ID from VideoComment where  Video_ID =@Video_ID  )  
--删除评论  
delete VideoComment where Video_ID =@Video_ID 
--删除反对  
delete VideoCommentAgainst where  Video_ID =@Video_ID 
--删除支持  
delete VideoCommentSupport where Video_ID =@Video_ID     
--删除 
delete Video where  Video_ID =@Video_ID 
END

GO
/****** Object:  Trigger [dbo].[TRIGER_VideoClass_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[TRIGER_VideoClass_Delete] 
   ON  [dbo].[VideoClass]  
  instead of Delete  
AS   
BEGIN  
   declare @VideoClass_ID int  
   select @VideoClass_ID =VideoClass_ID  from deleted   
--删除支持  
delete Video where VideoClass_ID =@VideoClass_ID   

--删除 
delete VideoClass where  VideoClass_ID =@VideoClass_ID
END

GO
/****** Object:  Trigger [dbo].[TRIGER_VideoComment_Delete]    Script Date: 2018/6/26 星期二 23:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--级联删除
Create TRIGGER [dbo].[TRIGER_VideoComment_Delete]
   ON  [dbo].[VideoComment]
  instead of Delete  
AS   
BEGIN  
   declare @VC_ID int  
   select @VC_ID =VC_ID from deleted   

--删除收藏  
     
--删除反对  
delete VideoCommentBack where VC_ID =@VC_ID
delete VideoComment where VC_ID =@VC_ID 
END

GO
USE [master]
GO
ALTER DATABASE [CT] SET  READ_WRITE 
GO
