USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 31.10.2024 14:44:54 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameRole]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameRole](
	[id] [int] NOT NULL,
	[idRole] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] NOT NULL,
	[idOrderProduct] [int] NOT NULL,
	[idArt] [int] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[id] [int] NOT NULL,
	[dateOrder] [date] NOT NULL,
	[dateDel] [date] NOT NULL,
	[idPP] [int] NOT NULL,
	[idTown] [int] NOT NULL,
	[idStreet] [int] NOT NULL,
	[Home] [int] NULL,
	[idRole] [int] NULL,
	[Code] [int] NOT NULL,
	[idStatus] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickPoint]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickPoint](
	[id] [int] NOT NULL,
	[IndexOrder] [int] NOT NULL,
	[idTown] [int] NOT NULL,
	[idStreet] [int] NOT NULL,
	[Home] [int] NULL,
 CONSTRAINT [PK_PickPoint] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[Articul] [nvarchar](50) NOT NULL,
	[idProductName] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[Sale] [int] NOT NULL,
	[idManufacturer] [int] NOT NULL,
	[idPost] [int] NOT NULL,
	[idCategory] [int] NOT NULL,
	[NowSale] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Text] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[id] [int] NOT NULL,
	[street] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Town]    Script Date: 31.10.2024 14:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([id], [Category]) VALUES (1, N'Для животных')
INSERT [dbo].[Category] ([id], [Category]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Category] ([id], [Category]) VALUES (3, N'Товары для собак')
GO
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (10, N'Triol')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (11, N'trixie')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufacturer] ([id], [Name]) VALUES (13, N'ZooM')
GO
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (1, 2, N'Волкова Эмилия Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (2, 3, N'Денисов Михаил Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (3, 1, N'Игнатьева Алина Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (4, 3, N'Соловьев Ярослав Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (5, 1, N'Суслов Илья Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (6, 3, N'Тимофеев Михаил Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (7, 2, N'Филимонов Роберт Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (8, 2, N'Чистякова Виктория Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (9, 2, N'Шилова Майя Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[NameRole] ([id], [idRole], [FIO], [login], [password]) VALUES (10, 1, N'Яковлева Ярослава Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67')
GO
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (1, 1, 1, 15)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (2, 6, 5, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (3, 4, 6, 2)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (4, 5, 7, 10)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (5, 3, 10, 10)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (6, 2, 11, 15)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (7, 4, 12, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (8, 1, 13, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (9, 7, 15, 2)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (10, 6, 17, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (11, 8, 20, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (12, 9, 21, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (13, 10, 22, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (14, 7, 23, 2)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (15, 5, 24, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (16, 3, 26, 10)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (17, 9, 28, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (18, 8, 28, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (19, 10, 29, 1)
INSERT [dbo].[Order] ([id], [idOrderProduct], [idArt], [count]) VALUES (20, 2, 30, 15)
GO
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 25, 1, 8, 47, NULL, 601, 2)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 20, 1, 4, 28, NULL, 602, 2)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (3, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 22, 1, 23, 46, 2, 603, 1)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (4, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 24, 1, 23, 30, NULL, 604, 1)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (5, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, 1, 8, 47, NULL, 605, 1)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 28, 1, 25, 8, 2, 606, 1)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (7, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 36, 1, 22, 25, NULL, 607, 2)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (8, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 32, 1, 1, NULL, NULL, 608, 2)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (9, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 34, 1, 28, 24, 2, 609, 2)
INSERT [dbo].[OrderProduct] ([id], [dateOrder], [dateDel], [idPP], [idTown], [idStreet], [Home], [idRole], [Code], [idStatus]) VALUES (10, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 36, 1, 22, 25, 2, 610, 1)
GO
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (1, 125061, 1, 17, 8)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (2, 125703, 1, 15, 49)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (3, 125837, 1, 28, 40)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (4, 190949, 1, 9, 26)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (5, 344288, 1, 26, 1)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (6, 394060, 1, 24, 43)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (7, 394242, 1, 6, 43)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (8, 394782, 1, 26, 3)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (9, 400562, 1, 5, 32)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (10, 410172, 1, 21, 13)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (11, 410542, 1, 20, 46)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (12, 410661, 1, 27, 50)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (13, 420151, 1, 2, 32)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (14, 426030, 1, 8, 44)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (15, 443890, 1, 6, 1)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (16, 450375, 1, 5, 44)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (17, 450558, 1, 11, 30)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (18, 450983, 1, 7, 26)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (19, 454311, 1, 13, 19)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (20, 603002, 1, 4, 28)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (21, 603036, 1, 19, 4)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (22, 603379, 1, 23, 46)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (23, 603721, 1, 3, 41)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (24, 614164, 1, 23, 30)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (25, 614510, 1, 8, 47)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (26, 614611, 1, 10, 50)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (27, 614753, 1, 18, 35)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (28, 620839, 1, 25, 8)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (29, 625283, 1, 16, 46)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (30, 625560, 1, 12, 12)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (31, 625590, 1, 6, 20)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (32, 625683, 1, 1, NULL)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (33, 630201, 1, 7, 17)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (34, 630370, 1, 28, 24)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (35, 660007, 1, 14, 19)
INSERT [dbo].[PickPoint] ([id], [IndexOrder], [idTown], [idStreet], [Home]) VALUES (36, 660540, 1, 22, 25)
GO
INSERT [dbo].[Post] ([id], [Name]) VALUES (1, N'PetShop')
INSERT [dbo].[Post] ([id], [Name]) VALUES (2, N'ZooMir')
GO
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (1, N'A112T4', 3, N'123 ₽', 30, 4, 1, 2, 3, 6, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'А112Т4.png', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (2, N'B427R5', 5, N'400 ₽', 15, 10, 2, 1, 4, 5, N'Миска для животных Triol "Стрекоза", 450 мл', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (3, N'D356R4', 6, N'600 ₽', 15, 11, 1, 3, 2, 16, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (4, N'D563F4', 1, N'600 ₽', 10, 10, 1, 3, 5, 5, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (5, N'D643B5', 7, N'4 100 ₽', 30, 1, 1, 2, 4, 9, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (6, N'E345R4', 1, N'199 ₽', 5, 5, 2, 2, 5, 7, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (7, N'E431R5', 3, N'170 ₽', 5, 10, 2, 3, 5, 5, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'E431R5.png', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (8, N'E434U6', 3, N'140 ₽', 20, 9, 2, 3, 3, 19, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (9, N'E466T6', 2, N'3 500 ₽', 30, 10, 2, 3, 5, 3, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (10, N'E532Q5', 3, N'166 ₽', 15, 9, 1, 3, 5, 18, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (11, N'F432F4', 7, N'1 200 ₽', 10, 8, 2, 2, 3, 15, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (12, N'G345E4', 6, N'300 ₽', 5, 6, 2, 3, 3, 19, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (13, N'G453T5', 8, N'149 ₽', 15, 12, 2, 1, 2, 7, N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (14, N'G542F5', 7, N'2 190 ₽', 30, 8, 1, 3, 4, 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (15, N'H342F5', 1, N'510 ₽', 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (16, N'H432F4', 5, N'385 ₽', 10, 10, 2, 1, 2, 17, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (17, N'H436R4', 1, N'300 ₽', 15, 10, 1, 3, 2, 15, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (18, N'H542R6', 3, N'177 ₽', 15, 10, 2, 3, 3, 15, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (19, N'H643W2', 5, N'292 ₽', 25, 10, 1, 1, 3, 13, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (20, N'K436T5', 6, N'100 ₽', 5, 10, 2, 3, 4, 21, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (21, N'K452T5', 4, N'800 ₽', 25, 13, 2, 3, 2, 17, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (22, N'M356R4', 3, N'50 ₽', 5, 9, 2, 3, 4, 6, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (23, N'Q245F5', 1, N'510 ₽', 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (24, N'R356F4', 5, N'234 ₽', 10, 7, 1, 3, 3, 17, N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (25, N'S245R4', 7, N'280 ₽', 15, 1, 2, 2, 3, 8, N'Сухой корм для кошек CAT CHOW', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (26, N'T432F4', 7, N'1 700 ₽', 25, 2, 2, 3, 2, 5, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (27, N'V352R4', 7, N'1 700 ₽', 25, 2, 1, 3, 4, 9, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (28, N'V527T5', 1, N'640 ₽', 5, 10, 1, 3, 5, 4, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (29, N'W548O7', 7, N'600 ₽', 15, 3, 1, 3, 5, 15, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL, NULL)
INSERT [dbo].[Product] ([id], [Articul], [idProductName], [Price], [Sale], [idManufacturer], [idPost], [idCategory], [NowSale], [Count], [Text], [Image], [ImageName]) VALUES (30, N'Y324F4', 3, N'86 ₽', 5, 9, 1, 3, 4, 17, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'Y324F4.jpg', NULL)
GO
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[ProductName] ([id], [Name]) VALUES (8, N'Щетка-варежка')
GO
INSERT [dbo].[Role] ([id], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([id], [Role]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([id], [Role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Status] ([id], [Status]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([id], [Status]) VALUES (2, N'Новый ')
GO
INSERT [dbo].[Street] ([id], [street]) VALUES (1, N'ул. 8 Марта')
INSERT [dbo].[Street] ([id], [street]) VALUES (2, N'ул. Вишневая')
INSERT [dbo].[Street] ([id], [street]) VALUES (3, N'ул. Гоголя')
INSERT [dbo].[Street] ([id], [street]) VALUES (4, N'ул. Дзержинского')
INSERT [dbo].[Street] ([id], [street]) VALUES (5, N'ул. Зеленая')
INSERT [dbo].[Street] ([id], [street]) VALUES (6, N'ул. Коммунистическая')
INSERT [dbo].[Street] ([id], [street]) VALUES (7, N'ул. Комсомольская')
INSERT [dbo].[Street] ([id], [street]) VALUES (8, N'ул. Маяковского')
INSERT [dbo].[Street] ([id], [street]) VALUES (9, N'ул. Мичурина')
INSERT [dbo].[Street] ([id], [street]) VALUES (10, N'ул. Молодежная')
INSERT [dbo].[Street] ([id], [street]) VALUES (11, N'ул. Набережная')
INSERT [dbo].[Street] ([id], [street]) VALUES (12, N'ул. Некрасова')
INSERT [dbo].[Street] ([id], [street]) VALUES (13, N'ул. Новая')
INSERT [dbo].[Street] ([id], [street]) VALUES (14, N'ул. Октябрьская')
INSERT [dbo].[Street] ([id], [street]) VALUES (15, N'ул. Партизанская')
INSERT [dbo].[Street] ([id], [street]) VALUES (16, N'ул. Победы')
INSERT [dbo].[Street] ([id], [street]) VALUES (17, N'ул. Подгорная')
INSERT [dbo].[Street] ([id], [street]) VALUES (18, N'ул. Полевая')
INSERT [dbo].[Street] ([id], [street]) VALUES (19, N'ул. Садовая')
INSERT [dbo].[Street] ([id], [street]) VALUES (20, N'ул. Светлая')
INSERT [dbo].[Street] ([id], [street]) VALUES (21, N'ул. Северная')
INSERT [dbo].[Street] ([id], [street]) VALUES (22, N'ул. Солнечная')
INSERT [dbo].[Street] ([id], [street]) VALUES (23, N'ул. Спортивная')
INSERT [dbo].[Street] ([id], [street]) VALUES (24, N'ул. Фрунзе')
INSERT [dbo].[Street] ([id], [street]) VALUES (25, N'ул. Цветочная')
INSERT [dbo].[Street] ([id], [street]) VALUES (26, N'ул. Чехова')
INSERT [dbo].[Street] ([id], [street]) VALUES (27, N'ул. Школьная')
INSERT [dbo].[Street] ([id], [street]) VALUES (28, N'ул. Шоссейная')
INSERT [dbo].[Street] ([id], [street]) VALUES (29, N'ул. Степная')
INSERT [dbo].[Street] ([id], [street]) VALUES (30, N'ул. Клубная')
GO
INSERT [dbo].[Town] ([id], [Name]) VALUES (1, N' г. Нефтеюганск')
GO
ALTER TABLE [dbo].[NameRole]  WITH CHECK ADD  CONSTRAINT [FK_NameRole_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[NameRole] CHECK CONSTRAINT [FK_NameRole_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderProduct] FOREIGN KEY([idOrderProduct])
REFERENCES [dbo].[OrderProduct] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderProduct]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([idArt])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_PickPoint] FOREIGN KEY([idPP])
REFERENCES [dbo].[PickPoint] ([id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_PickPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Role]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Status] FOREIGN KEY([idStatus])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Status]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Street] FOREIGN KEY([idStreet])
REFERENCES [dbo].[Street] ([id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Street]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Town] FOREIGN KEY([idTown])
REFERENCES [dbo].[Town] ([id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Town]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_Street] FOREIGN KEY([idStreet])
REFERENCES [dbo].[Street] ([id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_Street]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_Town] FOREIGN KEY([idTown])
REFERENCES [dbo].[Town] ([id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_Town]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([idManufacturer])
REFERENCES [dbo].[Manufacturer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Post] FOREIGN KEY([idPost])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Post]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([idProductName])
REFERENCES [dbo].[ProductName] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
