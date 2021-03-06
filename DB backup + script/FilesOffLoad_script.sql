USE [master]
GO
/****** Object:  Database [FilesOffloadDB]    Script Date: 4/17/2018 1:26:35 AM ******/
CREATE DATABASE [FilesOffloadDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFilesOffLoad', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbFilesOffLoad.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbFilesOffLoad_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbFilesOffLoad_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FilesOffloadDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilesOffloadDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilesOffloadDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FilesOffloadDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FilesOffloadDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FilesOffloadDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FilesOffloadDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FilesOffloadDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FilesOffloadDB] SET  MULTI_USER 
GO
ALTER DATABASE [FilesOffloadDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FilesOffloadDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FilesOffloadDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FilesOffloadDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FilesOffloadDB]
GO
/****** Object:  Table [dbo].[Cabinet]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabinet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CabinetCode] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[NumberOfDrawers] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Cabinet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CabinetUser]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CabinetUser](
	[ID] [int] NOT NULL,
	[CabinetId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_CabinetUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[CompanyId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drawer]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drawer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DrawerCode] [nvarchar](50) NULL,
	[CabinetId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Drawer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[File]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[DrawerId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_File] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/17/2018 1:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserType] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[Picture] [image] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cabinet] ON 

INSERT [dbo].[Cabinet] ([ID], [CabinetCode], [DepartmentId], [NumberOfDrawers], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'cxxcxc', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cabinet] ([ID], [CabinetCode], [DepartmentId], [NumberOfDrawers], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'897', NULL, 5, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cabinet] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [Name], [Description]) VALUES (1, N'IVS 1', N'IVS FilesOffload 1')
INSERT [dbo].[Company] ([ID], [Name], [Description]) VALUES (2, N'IVS 2', N'IVS FilesOffload 1')
INSERT [dbo].[Company] ([ID], [Name], [Description]) VALUES (3, N'ABC', N'New One')
INSERT [dbo].[Company] ([ID], [Name], [Description]) VALUES (4, N'ABC 2', N'New One 2')
INSERT [dbo].[Company] ([ID], [Name], [Description]) VALUES (12, N'qqq', N'www')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Name], [Description], [CompanyId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Finance', N'dd1', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [Name], [Description], [CompanyId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'HR', N'fsdsdd', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [Name], [Description], [CompanyId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'dept 1', N'two deparmtent', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [Name], [Description], [CompanyId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'HR', N'Humman Resource', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [Name], [Description], [CompanyId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'jjjjjjjjjjj', N'kkkkkkkkkk', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Drawer] ON 

INSERT [dbo].[Drawer] ([ID], [DrawerCode], [CabinetId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'1', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Drawer] ([ID], [DrawerCode], [CabinetId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'2', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Drawer] ([ID], [DrawerCode], [CabinetId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'3', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Drawer] ([ID], [DrawerCode], [CabinetId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'4', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Drawer] ([ID], [DrawerCode], [CabinetId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'5', 4, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Drawer] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [FirstName], [LastName], [UserType], [Email], [Password], [DepartmentId], [Picture], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Muhammad', N'Abis', N'admin', N'abis@abis.com', N'abis', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [UserType], [Email], [Password], [DepartmentId], [Picture], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Ali', N'Abbas', N'attendant', N'ali@abis.com', N'ali', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [UserType], [Email], [Password], [DepartmentId], [Picture], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, NULL, NULL, NULL, N't@t.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [UserType], [Email], [Password], [DepartmentId], [Picture], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [UserType], [Email], [Password], [DepartmentId], [Picture], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'n', N'a', N'aa', N'abc@abc.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tb_Compa__9BCE05DCF299587B]    Script Date: 4/17/2018 1:26:35 AM ******/
ALTER TABLE [dbo].[Company] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_tb_Department_tb_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_tb_Department_tb_Company]
GO
ALTER TABLE [dbo].[Drawer]  WITH CHECK ADD  CONSTRAINT [FK_tb_Drawer_tb_Cabinet] FOREIGN KEY([CabinetId])
REFERENCES [dbo].[Cabinet] ([ID])
GO
ALTER TABLE [dbo].[Drawer] CHECK CONSTRAINT [FK_tb_Drawer_tb_Cabinet]
GO
ALTER TABLE [dbo].[File]  WITH CHECK ADD  CONSTRAINT [FK_tb_File_tb_Drawer] FOREIGN KEY([DrawerId])
REFERENCES [dbo].[Drawer] ([ID])
GO
ALTER TABLE [dbo].[File] CHECK CONSTRAINT [FK_tb_File_tb_Drawer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_tb_User_tb_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_tb_User_tb_Department]
GO
USE [master]
GO
ALTER DATABASE [FilesOffloadDB] SET  READ_WRITE 
GO
