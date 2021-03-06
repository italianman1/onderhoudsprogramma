USE [master]
GO
/****** Object:  Database [Onderhoud_calibratie]    Script Date: 9-7-2019 16:06:49 ******/
CREATE DATABASE [Onderhoud_calibratie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ondehoud_calibratie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Ondehoud_calibratie.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ondehoud_calibratie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Ondehoud_calibratie_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Onderhoud_calibratie] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Onderhoud_calibratie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Onderhoud_calibratie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Onderhoud_calibratie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Onderhoud_calibratie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Onderhoud_calibratie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Onderhoud_calibratie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Onderhoud_calibratie] SET  MULTI_USER 
GO
ALTER DATABASE [Onderhoud_calibratie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Onderhoud_calibratie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Onderhoud_calibratie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Onderhoud_calibratie] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Onderhoud_calibratie] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Onderhoud_calibratie]
GO
/****** Object:  Table [dbo].[AlgemeenItem]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlgemeenItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[leverancier] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[benaming] [varchar](50) NULL,
	[code_nr] [varchar](50) NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[stamkaart] [varchar](150) NULL,
 CONSTRAINT [PK_Algemeen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bovenloopkraan]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bovenloopkraan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[code_nr] [varchar](50) NULL,
	[locatie] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
	[benaming] [varchar](50) NULL,
	[opdracht_nr] [varchar](50) NULL,
	[fabrieks_nr] [varchar](50) NULL,
	[hijsvermogen] [varchar](50) NULL,
	[stevens] [bit] NULL,
 CONSTRAINT [PK_Bovenloopkraan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compressor]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compressor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[merk] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[product_nr] [varchar](50) NULL,
	[serie_nr] [varchar](50) NULL,
	[benaming] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
 CONSTRAINT [PK_Compressor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hefmiddel]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hefmiddel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[LAM_nr] [int] NULL,
	[code_nr] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[merk] [varchar](50) NULL,
	[benaming] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
 CONSTRAINT [PK_Hefmiddel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hijsmiddel]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hijsmiddel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[reg_nr] [varchar](50) NULL,
	[certi_nr] [varchar](50) NULL,
	[soort] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[certificaat] [varchar](150) NULL,
	[stevens] [bit] NULL,
 CONSTRAINT [PK_Hijsmiddel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ladder]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ladder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[LAM_nr] [int] NULL,
	[code_nr] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[merk] [varchar](50) NULL,
	[benaming] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
 CONSTRAINT [PK_Ladder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lasapparaat]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lasapparaat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[benaming] [varchar](50) NULL,
	[merk] [varchar](50) NULL,
	[locatie] [varchar](50) NULL,
	[leverancier] [varchar](50) NULL,
	[LAM_nr] [int] NULL,
	[code_nr] [varchar](50) NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[bouwjaar] [int] NULL,
	[stamkaart] [varchar](150) NULL,
	[stevens] [bit] NULL,
 CONSTRAINT [PK_Lasapparaat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Meetmiddel]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Meetmiddel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[code_nr] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[merk] [varchar](50) NULL,
	[benaming] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
 CONSTRAINT [PK_Meetmiddel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Oplegger]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Oplegger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[code_nr] [varchar](50) NULL,
	[kenteken] [varchar](50) NULL,
	[locatie] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
	[benaming] [varchar](50) NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_Oplegger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Valbeveiliging]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Valbeveiliging](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[omschrijving] [varchar](50) NULL,
	[opdr_nr] [varchar](50) NULL,
	[certi_nr] [varchar](50) NULL,
	[serie_nr] [varchar](50) NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[persoon] [varchar](50) NULL,
	[certificaat] [varchar](150) NULL,
 CONSTRAINT [PK_Valbeveiliging] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Verfpomp]    Script Date: 9-7-2019 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Verfpomp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[datum_gekeurd] [date] NULL,
	[datum_herkeuring] [date] NULL,
	[code_nr] [varchar](50) NULL,
	[bouwjaar] [int] NULL,
	[leverancier] [varchar](50) NULL,
	[merk] [varchar](50) NULL,
	[benaming] [varchar](50) NULL,
	[stamkaart] [varchar](150) NULL,
 CONSTRAINT [PK_Verfpomp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AlgemeenItem] ON 

INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (1, N'Alarmpoint', 2000, N'Brandalarm', NULL, CAST(N'2017-01-07' AS Date), CAST(N'2018-01-07' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\brandmeldsysteem.doc')
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (2, N'Alarmpoint', 2000, N'Inbraakalarm', NULL, CAST(N'2017-01-07' AS Date), CAST(N'2018-01-07' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\inbraakbeveiliging.doc')
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (3, N'Kemtec', 0, N'Verwarmingsinstallatie', NULL, CAST(N'2018-06-01' AS Date), CAST(N'2019-06-01' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\verwarming.doc')
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (4, NULL, 0, N'Brandblussers', NULL, CAST(N'2019-03-21' AS Date), CAST(N'2020-03-21' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\brandblussers.doc')
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (5, N'Novoferm', 2000, N'Overheaddeur 1', N'613651-01-9995', CAST(N'2017-10-30' AS Date), CAST(N'2018-10-30' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\01 overheaddeur.doc')
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (6, N'Novoferm', 2000, N'Overheaddeur 2', N'613651-02-9995', CAST(N'2017-10-30' AS Date), CAST(N'2018-10-30' AS Date), NULL)
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (7, N'Novoferm', 2000, N'Overheaddeur 3', N'613651-03-9995', CAST(N'2017-10-30' AS Date), CAST(N'2018-10-30' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\03 overheaddeur.doc')
INSERT [dbo].[AlgemeenItem] ([Id], [leverancier], [bouwjaar], [benaming], [code_nr], [datum_gekeurd], [datum_herkeuring], [stamkaart]) VALUES (8, N'Novoferm', 2000, N'Overheaddeur 4', N'613651-04-9995', CAST(N'2017-10-30' AS Date), CAST(N'2018-10-30' AS Date), N'M:\Certificaten onderhoudsprogramma\Algemeen\04 overheaddeur.doc')
SET IDENTITY_INSERT [dbo].[AlgemeenItem] OFF
SET IDENTITY_INSERT [dbo].[Bovenloopkraan] ON 

INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (3, CAST(N'2018-12-31' AS Date), CAST(N'2019-12-31' AS Date), N'BMO 3456-005', N'hal 1', 2000, N'Bemo', N'M:\Certificaten onderhoudsprogramma\Kranen\BMO 3456-5.pdf', N'Half portaalkraan', NULL, N'BMO 3456', N'2 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (4, CAST(N'2018-09-01' AS Date), CAST(N'2019-09-01' AS Date), N'1964', N'Stevens', 1990, N'Jamach', N'M:\Certificaten onderhoudsprogramma\Kranen\Jamach 1964.pdf', N'Jamach 1964', NULL, N'245964', N'3.2 ton', 1)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (5, CAST(N'2018-12-31' AS Date), CAST(N'2019-12-31' AS Date), N'BMO 5023', N'Spuithal', 2002, N'Omis', N'M:\Certificaten onderhoudsprogramma\Kranen\BMO 5023.pdf', N'Dubbelligger BMO', NULL, N'14956', N'5 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (6, CAST(N'2018-12-31' AS Date), CAST(N'2019-12-31' AS Date), N'BMO 3456-006', N'hal 2', 2000, N'Bemo Benelux B.V.', N'M:\Certificaten onderhoudsprogramma\Kranen\BMO 3456-6.pdf', N'Halfportaalkraan', N'6', N'BMO 3456-006', N'2 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (7, CAST(N'2018-12-31' AS Date), CAST(N'2019-12-31' AS Date), N'1617', N'hal 1', 2016, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1617.pdf', N'Elmec 1617', N'20164792', N'Elmec 20164792-1617', N'10 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (8, CAST(N'2018-12-24' AS Date), CAST(N'2019-12-24' AS Date), N'1619', N'hal 1', 2016, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1619.pdf', N'Elmec 1619', N'20164792', N'Elmec 1619 - 20164792', N'10 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (9, CAST(N'2018-12-24' AS Date), CAST(N'2019-12-24' AS Date), N'1620', N'hal 2', 2016, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1620.pdf', N'Elmec 1620', N'20164792', N'', N'5 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (10, CAST(N'2018-12-24' AS Date), CAST(N'2019-12-24' AS Date), N'1621', N'hal 1', 2016, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1621.pdf', N'Elmec 1621', N'20164792', NULL, N'5 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (11, CAST(N'2018-12-24' AS Date), CAST(N'2019-12-24' AS Date), N'1622', N'hal 1', 2016, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1622.pdf', N'Elmec 1622', N'20164792', NULL, N'5 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (12, CAST(N'2018-08-31' AS Date), CAST(N'2019-08-31' AS Date), N'1963', N'Stevens', 1990, N'Jamach', N'M:\Certificaten onderhoudsprogramma\Kranen\Jamach 1963.pdf', N'Jamach 1963', NULL, NULL, N'5 ton', 1)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (13, CAST(N'2018-08-31' AS Date), CAST(N'2019-08-31' AS Date), N'1630', N'Stevens', 1988, N'Jamach', N'M:\Certificaten onderhoudsprogramma\Kranen\Jamach 1630.pdf', N'Jamach 1630', N'469630-1630', NULL, N'5 ton', 1)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (14, CAST(N'2019-03-09' AS Date), CAST(N'2020-03-09' AS Date), N'1673', N'hal 3', 2019, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1673.pdf', N'Elmec 1673', N'1992344', NULL, N'10 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (15, CAST(N'2019-03-09' AS Date), CAST(N'2020-03-09' AS Date), N'1672', N'hal 3', 2019, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1672.pdf', N'Elmec 1672', N'19992341', NULL, N'10 ton', 0)
INSERT [dbo].[Bovenloopkraan] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [opdracht_nr], [fabrieks_nr], [hijsvermogen], [stevens]) VALUES (16, CAST(N'2019-03-09' AS Date), CAST(N'2020-03-09' AS Date), N'1674', N'hal 3', 2019, N'Elmec', N'M:\Certificaten onderhoudsprogramma\Kranen\Elmec 1674.pdf', N'Elmec 1674', N'19992346', NULL, N'5 ton', 0)
SET IDENTITY_INSERT [dbo].[Bovenloopkraan] OFF
SET IDENTITY_INSERT [dbo].[Compressor] ON 

INSERT [dbo].[Compressor] ([Id], [datum_gekeurd], [datum_herkeuring], [merk], [type], [bouwjaar], [leverancier], [product_nr], [serie_nr], [benaming], [stamkaart]) VALUES (5, CAST(N'2019-06-18' AS Date), CAST(N'2020-06-18' AS Date), N'RCB 15', N'10 G2', 2016, N'Creemers Valkenswaard', N'4152007447 ', N'CAI809530', N'Creemers schroefcompressor', N'M:\Certificaten onderhoudsprogramma\Compressoren\Compressor_nieuw.doc')
INSERT [dbo].[Compressor] ([Id], [datum_gekeurd], [datum_herkeuring], [merk], [type], [bouwjaar], [leverancier], [product_nr], [serie_nr], [benaming], [stamkaart]) VALUES (6, CAST(N'2019-06-18' AS Date), CAST(N'2020-06-18' AS Date), N'RCB 11 ', N'10 G2', 2010, N'Creemers Valkenswaard', N'4152007445', N'CAI460064', N'Creemers schroefcompressor', N'M:\Certificaten onderhoudsprogramma\Compressoren\Compressor.doc')
SET IDENTITY_INSERT [dbo].[Compressor] OFF
SET IDENTITY_INSERT [dbo].[Hefmiddel] ON 

INSERT [dbo].[Hefmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (4, CAST(N'2017-04-15' AS Date), CAST(N'2018-04-15' AS Date), 9999, N'1976', 1998, N'Van Deurzen', N'Jungheinrich', N'Stapelaar', N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\vervoer-hijswerktuig\Stapelaar\Jungheinrich EBD 45.doc')
INSERT [dbo].[Hefmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (5, CAST(N'2018-11-07' AS Date), CAST(N'2019-11-07' AS Date), 9999, N'Z1992', 2005, N'Linde', N'T30', N'Stapelaar', N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\vervoer-hijswerktuig\Stapelaar\Linde T30(accu).doc')
INSERT [dbo].[Hefmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (6, CAST(N'2019-05-25' AS Date), CAST(N'2020-05-25' AS Date), 9999, N'18S120039', 2018, N'Van Deurzen', N'Royal', N'Stapelaar', N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\vervoer-hijswerktuig\Stapelaar\Royal S12(accu).doc')
INSERT [dbo].[Hefmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (7, CAST(N'2019-06-17' AS Date), CAST(N'2020-06-17' AS Date), 0, N'351J11078735', 2009, N'van Deurzen heftrucks', N'Linde D50', N'Heftruck', N'M:\Certificaten onderhoudsprogramma\Heftruck\1616911    2112.pdf')
SET IDENTITY_INSERT [dbo].[Hefmiddel] OFF
SET IDENTITY_INSERT [dbo].[Hijsmiddel] ON 

INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (1, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'18367', N'068134', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\18367(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (2, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'21491', N'009287', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\21491(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (3, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'21490', N'009286', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\21490(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (4, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'21492', N'009288', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\21492(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (5, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'18366', N'007544', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\18366(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (6, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'3793', N'011545', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\3793(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (7, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'3795', N'011546', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\3795(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (8, CAST(N'2017-08-29' AS Date), CAST(N'2018-08-29' AS Date), N'011558', N'3832', N'Kettingtweesprong', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\3832(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (9, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'33179', N'035933', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\33179(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (10, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'41410', N'051061', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\41410(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (11, CAST(N'2017-12-19' AS Date), CAST(N'2018-12-19' AS Date), N'16628', N'006388', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\16628(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (12, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'57739', N'083746', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\57739(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (13, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'57740', N'083747', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\57740(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (14, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'34463', N'038193', N'Kettingviersprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingviersprongen\34463(kettingviersprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (15, CAST(N'2019-04-23' AS Date), CAST(N'2020-04-23' AS Date), N'19386', N'007978', N'Pallethaak', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Pallethaken\19386(pallethaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (16, CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'19387', N'007979', N'Pallethaak', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Pallethaken\19387(pallethaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (17, CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'19457', N'008019', N'Pallethaak', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Pallethaken\19457(pallethaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (18, CAST(N'2015-12-17' AS Date), CAST(N'2016-12-17' AS Date), N'61371', N'090533', N'Pallethaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Pallethaken\61371(pallethaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (19, CAST(N'2013-04-11' AS Date), CAST(N'2014-04-11' AS Date), N'330-17', N'069689', N'Montagepen 17mm', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagepennen\330-17(montagepen).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (20, CAST(N'2013-04-11' AS Date), CAST(N'2014-04-11' AS Date), N'330-21', N'069714', N'Montagepen 21mm', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagepennen\330-21(montagepen).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (21, CAST(N'2013-04-11' AS Date), CAST(N'2014-04-11' AS Date), N'174-21', N'001690', N'Montagepen 21mm', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagepennen\174-21(montagepen).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (22, CAST(N'2017-07-27' AS Date), CAST(N'2018-07-27' AS Date), N'328-21', N'128308', N'Montagepen 21mm', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagepennen\328-21(montagepen).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (23, CAST(N'2013-04-11' AS Date), CAST(N'2014-04-11' AS Date), N'174-17', N'001670', N'Montagepen 17mm', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagepennen\174-17(montagepen).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (24, CAST(N'2017-01-06' AS Date), CAST(N'2018-01-06' AS Date), N'1368', N'067569', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\1368(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (25, CAST(N'2017-01-06' AS Date), CAST(N'2018-01-06' AS Date), N'356', N'030671', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\356(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (26, CAST(N'2017-04-05' AS Date), CAST(N'2018-04-05' AS Date), N'1458', N'077951', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\1458(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (27, CAST(N'2017-01-06' AS Date), CAST(N'2018-01-06' AS Date), N'1425', N'075780', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\1425(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (28, CAST(N'2017-04-05' AS Date), CAST(N'2018-04-05' AS Date), N'1467', N'077960', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\1467(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (29, CAST(N'2017-01-06' AS Date), CAST(N'2018-01-06' AS Date), N'600', N'030961', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\600(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (30, CAST(N'2017-01-06' AS Date), CAST(N'2018-01-06' AS Date), N'010', N'063968', N'Montagetang', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Montagetangen\010(montagetang).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (31, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'31131', N'111195', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\31131(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (32, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'31130', N'134211', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\31130(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (33, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'22597', N'134210', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\22597(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (34, CAST(N'2018-03-27' AS Date), CAST(N'2019-03-27' AS Date), N'37478', N'134214', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\37478(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (35, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'37479', N'098216', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\37479(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (36, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'37480', N'098215', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\37480(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (37, CAST(N'2018-03-27' AS Date), CAST(N'2019-03-27' AS Date), N'31133', N'134213', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\31133(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (38, CAST(N'2018-03-27' AS Date), CAST(N'2019-03-27' AS Date), N'31134', N'134212', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\31134(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (39, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'31135', N'098212', N'Kogelkophijshaak', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\31135(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (40, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'31136', N'098214', N'Kogelkophijshaak', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\31136(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (41, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'47651', N'111196', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\47651(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (42, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'47650', N'134057', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\47650(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (43, CAST(N'2018-03-26' AS Date), CAST(N'2019-03-26' AS Date), N'47649', N'134059', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\47469(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (44, CAST(N'2017-05-18' AS Date), CAST(N'2018-05-18' AS Date), N'47468', N'078904', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\47468(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (45, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'47647', N'098213', N'Kogelkophijshaak', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kogelkophijshaken\47467(kogelkophijshaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (46, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'32861', N'035392', N'Kettingvoorloper', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\32861(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (47, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'3833', N'011559', N'Kettingvoorloper', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\3833(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (48, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'34291', N'037992', N'Kettingvoorloper', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\34291(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (49, CAST(N'2019-01-03' AS Date), CAST(N'2020-01-03' AS Date), N'52959', N'073628', N'Kettingvoorloper', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\52959(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (50, CAST(N'2019-01-03' AS Date), CAST(N'2020-01-03' AS Date), N'52960', N'073629', N'Kettingvoorloper', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\52960(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (51, CAST(N'2019-01-03' AS Date), CAST(N'2020-01-03' AS Date), N'52961', N'073630', N'Kettingvoorloper', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\52961(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (52, CAST(N'2019-01-03' AS Date), CAST(N'2020-01-03' AS Date), N'52962', N'073631', N'Kettingvoorloper', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\52962(kettingvoorloper).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (53, CAST(N'2019-06-25' AS Date), CAST(N'2020-06-25' AS Date), N'37473', N'043944', N'Hijssleutel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hijssleutels\37473(hijssleutel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (54, CAST(N'2019-06-25' AS Date), CAST(N'2020-06-25' AS Date), N'37474', N'068133', N'Hijssleutel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hijssleutels\37474(hijssleutel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (55, CAST(N'2018-05-16' AS Date), CAST(N'2019-05-16' AS Date), N'37475', N'043943', N'Hijssleutel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hijssleutels\37475(hijssleutel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (56, CAST(N'2018-03-26' AS Date), CAST(N'2019-03-26' AS Date), N'37476', N'118079', N'Hijssleutel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hijssleutels\37476(hijssleutel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (57, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'43368', N'054376', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\43368(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (58, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'43352', N'054325', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\43352(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (59, CAST(N'2016-04-15' AS Date), CAST(N'2017-04-15' AS Date), N'10035', N'015719', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\10035(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (60, CAST(N'2019-06-27' AS Date), CAST(N'2020-06-27' AS Date), N'43353', N'054326', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\43353(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (61, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'52955', N'073624', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\52955(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (62, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'52958', N'073627', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\52958(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (63, CAST(N'2019-06-27' AS Date), CAST(N'2020-06-27' AS Date), N'52957', N'073626', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\52957(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (64, CAST(N'2019-06-27' AS Date), CAST(N'2020-06-27' AS Date), N'52956', N'073625', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\52956(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (65, CAST(N'2018-03-26' AS Date), CAST(N'2019-03-26' AS Date), N'57741', N'083748', N'Platenklem', N'Niet gevonden', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\57741(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (66, CAST(N'2017-08-29' AS Date), CAST(N'2018-08-29' AS Date), N'57742', N'083749', N'Platenklem', N'Certificaat onderweg', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\57742(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (67, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'57743', N'083750', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\57743(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (68, CAST(N'2019-06-12' AS Date), CAST(N'2020-06-12' AS Date), N'70023', N'108329', N'Vloerplatenklem', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Vloerplatenklemmen\70023(vloerplatenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (69, CAST(N'2019-06-12' AS Date), CAST(N'2020-06-12' AS Date), N'70024', N'108330', N'Vloerplatenklem', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Vloerplatenklemmen\70024(vloerplatenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (70, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'71031', N'110317', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\71031(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (71, CAST(N'2019-05-17' AS Date), CAST(N'2020-05-17' AS Date), N'83516', N'010815', N'Vloerplatenklem', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Vloerplatenklemmen\83516(vloerplatenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (72, CAST(N'2019-05-17' AS Date), CAST(N'2020-05-17' AS Date), N'83517', N'134063', N'Vloerplatenklem', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Vloerplatenklemmen\83517(vloerplatenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (73, CAST(N'2017-06-27' AS Date), CAST(N'2018-06-27' AS Date), N'80824', N'127550', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\80824(platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (74, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'80990', N'128296', N'Horizontale platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Horizontale platenklemmen\80990(horizontale platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (75, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'80991', N'128297', N'Horizontale platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Horizontale platenklemmen\80991(horizontale platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (76, CAST(N'2017-11-01' AS Date), CAST(N'2018-11-01' AS Date), N'83994', NULL, N'Platenklem', N'Op de werkplaats', NULL, 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (77, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'57744', N'083751', N'Balkenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Balkenklemmen\57744(balkenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (78, CAST(N'2017-01-27' AS Date), CAST(N'2018-01-27' AS Date), N'66284', N'100120', N'Balkenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Balkenklemmen\66284(balkenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (79, CAST(N'2016-08-15' AS Date), CAST(N'2017-08-15' AS Date), N'18765', N'007711', N'Kantelklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kantelklemmen\18765(kantelklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (80, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'22641', N'010113', N'Kantelklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kantelklemmen\22641(kantelklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (81, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'50002', N'067331', N'Hefmagneet', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hefmagneten\50002(hefmagneet).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (82, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'50210', N'067859', N'Hefmagneet', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hefmagneten\50210(hefmagneet).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (83, CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'52963', N'073632', N'Hefmagneet', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hefmagneten\52963(hefmagneet).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (84, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'84959', N'136532', N'Hefmagneet', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hefmagneten\84959(hefmagneet).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (85, CAST(N'2017-10-31' AS Date), CAST(N'2018-10-31' AS Date), N'71075', N'110385', N'Rateltakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\71075(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (86, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'70108', N'108544', N'Rateltakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\70108(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (87, CAST(N'2015-02-27' AS Date), CAST(N'2016-02-27' AS Date), N'70269', N'108851', N'Rateltakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\70269(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (88, CAST(N'2016-03-09' AS Date), CAST(N'2017-03-09' AS Date), N'70272', N'108924', N'Rateltakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\70272(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (89, CAST(N'2017-10-31' AS Date), CAST(N'2018-10-31' AS Date), N'70273', N'108925', N'Rateltakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\70273(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (90, CAST(N'2019-06-25' AS Date), CAST(N'2020-06-25' AS Date), N'57668', N'083301', N'Rateltakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\57668(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (91, CAST(N'2019-06-25' AS Date), CAST(N'2020-06-25' AS Date), N'65702', N'098533', N'Handtakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Handtakels\65702(handtakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (92, CAST(N'2016-02-12' AS Date), CAST(N'2017-02-12' AS Date), N'32947', N'035583', N'Elektrische takel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Electr. Takel\32947(Elec. takel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (93, CAST(N'2017-02-01' AS Date), CAST(N'2018-02-01' AS Date), N'79388', NULL, N'Domme kracht', N'Op de werkplaats', NULL, 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (94, CAST(N'2018-03-27' AS Date), CAST(N'2019-03-27' AS Date), N'79389', N'124767', N'Domme kracht', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Domme krachten\79389(domme kracht).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (95, CAST(N'2018-12-31' AS Date), CAST(N'2019-12-31' AS Date), N'79390', N'124768', N'Domme kracht', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Domme krachten\79390(domme kracht).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (96, CAST(N'2011-10-14' AS Date), CAST(N'2012-10-14' AS Date), N'90201', N'43744', N'Domme kracht', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Domme krachten\43744(domme kracht).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (97, CAST(N'2012-04-04' AS Date), CAST(N'2013-04-04' AS Date), N'27435', N'020818', N'Domme kracht', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Domme krachten\27435(domme kracht).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (99, CAST(N'2012-02-24' AS Date), CAST(N'2013-02-24' AS Date), N'60341', N'088783', N'Domme kracht', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Domme krachten\60341(domme kracht).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (100, CAST(N'2016-10-16' AS Date), CAST(N'2017-10-16' AS Date), N'62080', NULL, N'Domme kracht', N'Op de werkplaats', NULL, 0)
GO
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (101, CAST(N'2018-05-16' AS Date), CAST(N'2019-05-16' AS Date), N'32948', N'035584', N'Loopkat', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Loopkatten\32948(loopkat).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (102, CAST(N'2018-03-26' AS Date), CAST(N'2019-03-26' AS Date), N'74394', N'118191', N'Loopkat', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Loopkatten\74394(loopkat).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (103, CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'27393', N'020827', N'Handtakel', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Handtakels\27393(handtakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (105, CAST(N'2012-02-06' AS Date), CAST(N'2016-02-06' AS Date), N'60261', N'088957', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\60261(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (106, CAST(N'2012-02-06' AS Date), CAST(N'2016-02-06' AS Date), N'60262', N'088958', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\60262(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (107, CAST(N'2012-02-06' AS Date), CAST(N'2016-02-06' AS Date), N'60263', N'088959', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\60263(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (108, CAST(N'2012-02-06' AS Date), CAST(N'2016-02-06' AS Date), N'60264', N'088960', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\60264(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (109, CAST(N'2016-04-22' AS Date), CAST(N'2020-04-22' AS Date), N'74388', N'118192', N'H-sluiting + moerbout', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\74388(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (110, CAST(N'2016-04-22' AS Date), CAST(N'2020-04-22' AS Date), N'74389', N'118193', N'H-sluiting + moerbout', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\74389(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (111, CAST(N'2016-04-22' AS Date), CAST(N'2020-04-22' AS Date), N'74391', N'118195', N'H-sluiting + moerbout', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\74391(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (112, CAST(N'2016-04-21' AS Date), CAST(N'2020-04-21' AS Date), N'74392', N'118196', N'H-sluiting + moerbout', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\74392(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (113, CAST(N'2013-12-16' AS Date), CAST(N'2017-12-16' AS Date), N'66285', N'100121', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\66285(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (114, CAST(N'2016-02-12' AS Date), CAST(N'2020-02-12' AS Date), N'66286', N'100122', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\66286(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (115, CAST(N'2017-04-05' AS Date), CAST(N'2018-04-05' AS Date), N'66287', N'100123', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\66287(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (116, CAST(N'2017-04-05' AS Date), CAST(N'2018-04-05' AS Date), N'66288', N'100124', N'H-sluiting + moerbout', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\66288(H-sluiting met moerbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (117, CAST(N'2016-07-28' AS Date), CAST(N'2017-07-28' AS Date), N'71658', N'111832', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\71658(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (118, CAST(N'2016-07-28' AS Date), CAST(N'2017-07-28' AS Date), N'71659', N'111833', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\71659(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (119, CAST(N'2017-08-29' AS Date), CAST(N'2018-08-29' AS Date), N'71660', N'111834', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\71660(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (120, CAST(N'2015-07-31' AS Date), CAST(N'2016-07-31' AS Date), N'111835', N'71661', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\71661(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (121, CAST(N'2016-04-22' AS Date), CAST(N'2017-04-22' AS Date), N'74390', N'118194', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\74390(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (122, CAST(N'2017-08-29' AS Date), CAST(N'2018-08-29' AS Date), N'74393', N'119190', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\74393(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (123, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'80502', N'126830', N'H-sluiting + borstbout', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\80502(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (124, CAST(N'2018-03-26' AS Date), CAST(N'2019-03-26' AS Date), N'83514', N'134055', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\83514(H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (125, CAST(N'2018-03-26' AS Date), CAST(N'2019-03-26' AS Date), N'83515', N'134056', N'H-sluiting + moerbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting moerbouten\83515(H-sluiting met moerbout of shackle).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (126, CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'80000', N'125954', N'Horizontale platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Horizontale platenklemmen\80000(horizontale platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (127, CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'80001', N'125955', N'Horizontale platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Horizontale platenklemmen\80001(horizontale platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (128, CAST(N'2019-04-23' AS Date), CAST(N'2020-04-23' AS Date), N'79791', N'125655', N'Tirfor', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Tirfor\79791(tirfor).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (129, CAST(N'2019-04-23' AS Date), CAST(N'2020-04-23' AS Date), N'79792', N'125656', N'Tirfor', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Tirfor\79792(tirfor).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (130, CAST(N'2019-04-23' AS Date), CAST(N'2020-04-23' AS Date), N'79793', N'125657', N'Staalkabel', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Staalkabels\79793 (Staaldraad).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (131, CAST(N'2019-04-23' AS Date), CAST(N'2020-04-23' AS Date), N'79794', N'125658', N'Staalkabel', N'Schrot/Montagehok', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Staalkabels\79794 (Staaldraad).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (132, CAST(N'2018-05-30' AS Date), CAST(N'2019-05-30' AS Date), N'54116', N'075908', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\54116(kettingtweesprong).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (133, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'42467', N'053121', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\42467(kettingtweesprong).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (134, CAST(N'2018-05-30' AS Date), CAST(N'2019-05-30' AS Date), N'42468', N'053122', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\42468(kettingtweesprong).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (135, CAST(N'2015-10-13' AS Date), CAST(N'2016-10-13' AS Date), N'68289', N'103849', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\68289(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (136, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'67789', N'103193', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\67789(kettingtweesprong).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (137, CAST(N'2015-10-13' AS Date), CAST(N'2016-10-13' AS Date), N'68290', N'103850', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\68290(kettingtweesprong).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (138, CAST(N'2017-05-23' AS Date), CAST(N'2018-05-23' AS Date), N'80225', N'126700', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\80225(platenklem).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (139, CAST(N'2018-03-30' AS Date), CAST(N'2019-03-30' AS Date), N'49228', N'065989', N'Kettingvoorloper', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingvoorlopers\49228(kettingvoorloper).pdf', 1)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (140, CAST(N'2018-07-23' AS Date), CAST(N'2019-07-23' AS Date), N'85491', N'137690', N'Draaibaar hijsoog', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Draaibare hijsogen\85491(Draaibaar hijsoog).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (141, CAST(N'2018-07-23' AS Date), CAST(N'2019-07-23' AS Date), N'85492', N'137691', N'Draaibaar hijsoog', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Draaibare hijsogen\85492(Draaibaar hijsoog).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (142, CAST(N'2018-07-23' AS Date), CAST(N'2019-07-23' AS Date), N'85493', N'137692', N'Draaibaar hijsoog', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Draaibare hijsogen\85493(Draaibaar hijsoog).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (143, CAST(N'2018-07-23' AS Date), CAST(N'2019-07-23' AS Date), N'85494', N'137693', N'Draaibaar hijsoog', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Draaibare hijsogen\85494(Draaibaar hijsoog).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (144, CAST(N'2018-08-13' AS Date), CAST(N'2019-08-13' AS Date), N'85682', N'138249', N'Platenklem', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Platenklemmen\85682(Platenklem).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (145, CAST(N'2019-06-27' AS Date), CAST(N'2020-06-27' AS Date), N'18368', N'007546', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\18368(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (146, CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'3832', N'011558', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\3832(kettingtweesprong).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (147, CAST(N'2015-07-31' AS Date), CAST(N'2019-07-31' AS Date), N'71661', N'111835', N'H-sluiting + borstbout', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\H-sluiting borstbouten\71661 (H-sluiting met borstbout).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (148, CAST(N'2018-12-10' AS Date), CAST(N'2019-12-10' AS Date), N'86943', NULL, N'Domme kracht', N'Op de werkplaats', NULL, 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (149, CAST(N'2019-01-03' AS Date), CAST(N'2020-01-03' AS Date), N'19458', N'008021', N'Pallethaak', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Pallethaken\19458(pallethaak).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (150, CAST(N'2019-01-09' AS Date), CAST(N'2020-01-09' AS Date), N'87497', N'142165', N'Rateltakel', N'In bus V-492-KL', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Rateltakels\87497(rateltakel).pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (151, CAST(N'2019-02-19' AS Date), CAST(N'2020-02-19' AS Date), N'1230461', N'K19055', N'Kettingtweesprong', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Kettingtweesprongen\K19055.pdf', 0)
INSERT [dbo].[Hijsmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [reg_nr], [certi_nr], [soort], [status], [certificaat], [stevens]) VALUES (152, CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'88930', N'145522', N'Hefmagneet', N'Op de werkplaats', N'M:\Certificaten onderhoudsprogramma\Hijsmiddelen\Hefmagneten\88930(hefmagneet).pdf', 0)
SET IDENTITY_INSERT [dbo].[Hijsmiddel] OFF
SET IDENTITY_INSERT [dbo].[Ladder] ON 

INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (3, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 5, N'LAM 05', 0, NULL, N'Alga/ enkele ladder', N'Ladder 1x9 trede', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (4, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 6, N'LAM 06', 2015, N'Solide', N'PT-6', N'Ladder', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (5, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 10, N'LAM 10', 0, NULL, N'Solide Reformladder 3x12 ', N'Ladder', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (6, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 12, N'LAM 12', 0, NULL, N'Solide Reformladder 3x12 ', N'Ladder', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (7, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 13, N'LAM 13', 0, NULL, N'Solide 177584', N'Reformladder 2x12 trede', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (8, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 24, N'LAM 24', 0, NULL, N'Altrex TGB4', N'Enkele ladder 1x4', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (9, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 26, N'LAM 26', 0, NULL, N'ALGA RL314 an G', N'Enkele ladder 3x 14', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (10, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 29, N'LAM 29', 0, NULL, N'Altrex Mounter', N'Ladder 3x12', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (11, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 31, N'LAM 31', 0, NULL, N'Altrex TGB4', N'Enkele ladder 1x4', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (12, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 32, N'LAM 32', 0, NULL, N'Altrex TGB6', N'Enkele ladder 1x6', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (13, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 33, N'LAM 33', 0, NULL, N'Altrex Mounter', N'Reformladder 3x10', NULL)
INSERT [dbo].[Ladder] ([Id], [datum_gekeurd], [datum_herkeuring], [LAM_nr], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (14, CAST(N'2017-10-21' AS Date), CAST(N'2018-10-21' AS Date), 1, NULL, 0, NULL, N' Altrex', N'Rolsteiger 135x305      ', NULL)
SET IDENTITY_INSERT [dbo].[Ladder] OFF
SET IDENTITY_INSERT [dbo].[Lasapparaat] ON 

INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (2, N'Lastrafo waterkoel', N'Re-On380/387605', N'Hal 1', N'Saanen Lastechniek', 16, N'387605', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 1987, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Validatie Certificaat - 387605.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (3, N'Lastrafo waterkoel', N'Re-On380-EW/3881002', N'Hal 1', N'Saanen lastechniek', 13, N'38881002', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 1988, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Validatie Certificaat - 38881002.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (4, N'Lastrafo waterkoel', N'Re-On420/10133', N'Hal 1', N'Saanen lastechniek', 52, N'10183', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 1993, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Validatie Certificaat - 10183.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (7, N'Lastrafo waterkoel', N'Re-On380/38911102', N'Hal 1', N'Saanen Lastechniek', 51, N'38911103', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 1991, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Validatie Certificaat - 38911103.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (8, N'Lastrafo waterkoel', N'Re-On520/10242', N'Hal 1', N'Saanen Lastechniek', 54, N'10242', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 1994, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Validatie Certificaat - 10242.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (9, N'Lastrafo watergekoeld', N're-on mig 525', N'Hal 1', N'saanen lastechniek', 17, N'11674', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 2001, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Kalibratie Certificaat - 11674.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (10, N'Lastrafo watergekoeld', N'Re-On Mig 525EW/8M', N'Hal 1', N'Re-On Mig 525EW/8M', 88, N'12259', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 2002, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Kalibratie Certificaat - 12259.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (11, N'Lastrafo watergekoeld', N'Re-On Mig 525EW/8M', N'Hal 1', N'Saanen Lastechniek', 102, N'12344', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 2002, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Kalibratie Certificaat - 12344.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (12, N'Lastrafo watergekoeld', N'Re-On Mig 525EW/8M', N'Hal 1', N'Saanen Lastechniek', 103, N'12343', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 2002, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Kalibratie Certificaat - 12343.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (13, N'Lorch lasapparaat', N'Lorch P5000', N'Hal 1', N'Saanen Lastechniek', 226, N'508-1740-001', CAST(N'2018-09-25' AS Date), CAST(N'2019-09-25' AS Date), 1994, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Kalibratie Certificaat - 508-1740-001.xlsx', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (14, N'Lasrobot', N'Miller Subarc DC1250', N'Hal 1', NULL, 509, NULL, CAST(N'2018-10-04' AS Date), CAST(N'2019-10-04' AS Date), 2014, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Lasrobot.pdf', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (15, N'Lastrafo luchtkoel', N'Re-On320', N'Hal 1', N'Saanen Lastechniek', 537, N'10265', CAST(N'2017-09-28' AS Date), CAST(N'2018-09-28' AS Date), 2015, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Validatie Certificaat - 10265.pdf', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (16, N'Lastrafo luchtkoel', N'Re-On320/10265', N'Hal 1', N'Saanen Lastechniek', 538, NULL, CAST(N'2015-03-14' AS Date), CAST(N'2016-03-14' AS Date), 2015, N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\lasappar\Lastrafo LAM538.doc', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (17, N'Huur apparaat 1', N'Re-On320/10265', N'Hal 1', N'Saanen Lastechniek', 9999, N'Huur 1', CAST(N'2015-04-18' AS Date), CAST(N'2016-04-18' AS Date), 2015, N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\lasappar\Huur apparaat 1.doc', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (18, N'Huur apparaat 2', N'Re-On320/10265', N'Hal 1', N'Saanen Lastechniek', 99991, N'Huur 2', CAST(N'2015-04-25' AS Date), CAST(N'2016-04-25' AS Date), 2015, N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\lasappar\Huur apparaat 2.doc', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (19, N'Kemppi lasapparaat', N'Kemppi 4500SW', N'Hal 1', N'De wit', 539, NULL, CAST(N'2015-04-18' AS Date), CAST(N'2016-04-18' AS Date), 0, N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\lasappar\Kemppi.doc', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (20, N'Re-On mig 520', N'', N'Hal 1', N'Saanen lastechniek', 573, N'15829', CAST(N'2019-04-04' AS Date), CAST(N'2020-04-04' AS Date), 0, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Testrapport kalibratie 15829.xls', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (21, N'Re-On mig 520', N'Lastrafo', N'Hal 1', N'Saanen lastechniek', 574, N'15832', CAST(N'2019-04-04' AS Date), CAST(N'2020-04-04' AS Date), 0, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Testrapport kalibratie 15832.xls', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (22, N'Reon Mig 520', N'Lastrafo', N'Hal 1', N'Saanen Lastechniek', 575, N'15831', CAST(N'2019-04-04' AS Date), CAST(N'2020-04-04' AS Date), 2019, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Testrapport kalibratie 15831.xls', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (23, N'Reon mig 520', N'Lastrafo', N'Hal 1', N'Saanen lastechniek', 576, N'15828', CAST(N'2019-04-04' AS Date), CAST(N'2020-04-04' AS Date), 2019, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Testrapport kalibratie 15828.xls', 0)
INSERT [dbo].[Lasapparaat] ([Id], [benaming], [merk], [locatie], [leverancier], [LAM_nr], [code_nr], [datum_gekeurd], [datum_herkeuring], [bouwjaar], [stamkaart], [stevens]) VALUES (24, N'Reon Mig 520', N'Lastrafo', N'Hal 1', N'Saanen lastechniek', 577, N'15830', CAST(N'2019-04-04' AS Date), CAST(N'2020-04-04' AS Date), 2019, N'M:\Certificaten onderhoudsprogramma\Lasapparaten\Testrapport kalibratie 15830.xls', 0)
SET IDENTITY_INSERT [dbo].[Lasapparaat] OFF
SET IDENTITY_INSERT [dbo].[Meetmiddel] ON 

INSERT [dbo].[Meetmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (5, CAST(N'2019-06-01' AS Date), CAST(N'2020-06-01' AS Date), N'R41-0057', 2000, N'Nieaf Smitt', N'Nieaf instruments', N'PATS 3140S', N'M:\Certificaten onderhoudsprogramma\Meetmiddelen\Kalibratiecertificaat PATS3140S.pdf')
INSERT [dbo].[Meetmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (6, CAST(N'2018-03-14' AS Date), CAST(N'2019-03-14' AS Date), N'X79808', 2012, N'De wit bouwmachines', N'Topcon RLH-4C', N'Laser Rob Maas', N'M:\Certificaten onderhoudsprogramma\Meetmiddelen\Laserinstrument Rob.pdf')
INSERT [dbo].[Meetmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (7, CAST(N'2018-01-17' AS Date), CAST(N'2019-01-17' AS Date), N'036993', 2018, N'De wit bouwmachines', N'GEO Fennel No.10', N'Laser Jeroen v Deurzen', N'M:\Certificaten onderhoudsprogramma\Meetmiddelen\Laserinstrument Jeroen.pdf')
INSERT [dbo].[Meetmiddel] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (8, CAST(N'2016-05-03' AS Date), CAST(N'2017-05-03' AS Date), N'750068 (body) / 218613 (meter)', 2014, N'Kohlerwoodcap', N'Positector 6000', N'Laagdiktemeter', N'M:\Certificaten onderhoudsprogramma\Meetmiddelen\Kalibratiecertificaat laagdiktemeter.pdf')
SET IDENTITY_INSERT [dbo].[Meetmiddel] OFF
SET IDENTITY_INSERT [dbo].[Oplegger] ON 

INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (3, CAST(N'2018-11-16' AS Date), CAST(N'2019-11-16' AS Date), N'XLDTXD33900036369', N'OD-78-VB', N'Buitenterrein ', 1996, N'Trailer verkoop Breda B.V.', N'M:\Certificaten onderhoudsprogramma\Opleggers\OD-78-VB (Oplegger 08).pdf', N'Oplegger 08', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (4, CAST(N'2018-08-28' AS Date), CAST(N'2019-08-28' AS Date), N'L020129', N'OD-11-ZL', N'Buitenterrein', 1990, N'Nooteboom Trailers Occasion Sales B.V.', N'M:\Certificaten onderhoudsprogramma\Opleggers\OD-11-ZL (Oplegger 11).pdf', N'Oplegger 11', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (5, CAST(N'2019-03-19' AS Date), CAST(N'2020-03-19' AS Date), N'YE13B2014AA053771', N'OG-55-KK', N'Buitenterrein', 2000, N'Van Hool N.V.', N'M:\Certificaten onderhoudsprogramma\Opleggers\OG-55-KK (Oplegger 12).pdf', N'Oplegger 12', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (6, CAST(N'2019-02-28' AS Date), CAST(N'2020-02-28' AS Date), N'YE13B2014AA053764', N'OG-13-KR', N'Buitenterrein', 2000, N'Van Hool N.V.', N'M:\Certificaten onderhoudsprogramma\Opleggers\OG-13-KR (Oplegger 13).pdf', N'Oplegger 13', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (7, CAST(N'2018-12-04' AS Date), CAST(N'2019-12-18' AS Date), N'YE13B2014AA053455', N'OG-26-HT', N'Buitenterrein', 2000, N'Van Hool N.V.', N'M:\Certificaten onderhoudsprogramma\Opleggers\OG-26-HT (Oplegger 14).pdf', N'Oplegger 14', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (8, CAST(N'2018-08-28' AS Date), CAST(N'2019-08-28' AS Date), N'XL9000000S0023823', N'OK-64-XJ', N'Buitenterrein', 1996, NULL, N'M:\Certificaten onderhoudsprogramma\Opleggers\OK-64-XJ (Oplegger 15).pdf', N'Oplegger 15', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (9, CAST(N'2018-11-14' AS Date), CAST(N'2019-11-14' AS Date), N'XL9000000S0023722', N'OD-57-TP', N'Buitenterrein', 1996, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OD-57-TP (Oplegger 16).pdf', N'Oplegger 16', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (10, CAST(N'2018-11-23' AS Date), CAST(N'2019-11-23' AS Date), N'88.02.0144', N'OH-76-94', N'Buitenterrein', 2014, N'Allers bedrijfswagens', N'M:\Certificaten onderhoudsprogramma\Opleggers\OH-76-94 (Oplegger 17).pdf', N'Oplegger 17', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (11, CAST(N'2018-09-06' AS Date), CAST(N'2019-09-06' AS Date), N'XMR0VB00060000578', N'OP-59-JY', N'Buitenterrein', 2006, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OVB-42-03V (Oplegger 18).pdf', N'Oplegger 18', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (12, CAST(N'2018-08-23' AS Date), CAST(N'2019-08-23' AS Date), N'XMR0VB000Y00000643', N'OG-53-LL', N'Buitenterrein', 2001, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OG-53-LL (Oplegger 19).pdf', N'Oplegger 19', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (13, CAST(N'2019-04-18' AS Date), CAST(N'2020-04-18' AS Date), N'XL9000000S0023542', N'OP-85-RZ', N'Buitenterrein', 1996, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OP-85-RZ (Oplegger 20).pdf', N'Oplegger 20', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (14, CAST(N'2019-04-02' AS Date), CAST(N'2020-04-02' AS Date), N'YA9UKS34796175049', N'OF-78-BX', N'Buitenterrein', 1997, N'Tweedehands', N'M:\Certificaten onderhoudsprogramma\Opleggers\OF-78-BX (Oplegger 21).pdf', N'Oplegger 21', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (15, CAST(N'2019-04-04' AS Date), CAST(N'2020-04-04' AS Date), N'YA9UKS34796175048', N'OF-43-BK', N'Buitenterrein', 1996, N'Tweedehands', N'M:\Certificaten onderhoudsprogramma\Opleggers\OF-43-BK (Oplegger 22).pdf', N'Oplegger 22', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (16, CAST(N'2018-01-22' AS Date), CAST(N'2019-01-22' AS Date), N'YA5B302N439B57103', N'OH-33-TH', N'Buitenterrein', 2005, N'Tweedehands', N'M:\Certificaten onderhoudsprogramma\Opleggers\OH-33-TH (Oplegger 23).pdf', N'Oplegger 23', N'Geschorst')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (17, CAST(N'2018-08-14' AS Date), CAST(N'2019-08-14' AS Date), N'XMR0VB00070000185', N'OJ-01-TZ', N'Buitenterrein', 2007, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OJ-01-TZ (Oplegger 24).pdf', N'Oplegger 24', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (18, CAST(N'2018-10-02' AS Date), CAST(N'2019-10-02' AS Date), N'XMR0VB00010000890', N'OR-02-NS', N'Buitenterrein ', 2001, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OR-02-NS (Oplegger 25).pdf', N'Oplegger 25', N'In gebruik')
INSERT [dbo].[Oplegger] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [kenteken], [locatie], [bouwjaar], [leverancier], [stamkaart], [benaming], [status]) VALUES (19, CAST(N'2019-01-23' AS Date), CAST(N'2020-01-23' AS Date), N'OVB-48-03V', N'OR-99-SG', N'Buitenterrein', 2019, N'Nooteboom', N'M:\Certificaten onderhoudsprogramma\Opleggers\OG-55-KK (Oplegger 26).pdf', N'Oplegger 26', N'In gebruik')
SET IDENTITY_INSERT [dbo].[Oplegger] OFF
SET IDENTITY_INSERT [dbo].[Valbeveiliging] ON 

INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (1, N'Harnas', N'49805', N'105961', N'20430935/084', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Jeffrey', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\49805(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (3, N'Positielijn', N'41997', N'099658', N'10547313', CAST(N'2017-06-29' AS Date), CAST(N'2018-06-29' AS Date), N'Jeroen van Deurzen', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\41997(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (4, N'Harnas', N'53581', N'117612', N'14625940', CAST(N'2017-06-29' AS Date), CAST(N'2018-06-29' AS Date), N'Jeroen van Deurzen', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\53581(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (5, N'Valstopapparaat', N'33034', N'069399', N'8443919', CAST(N'2019-05-17' AS Date), CAST(N'2020-05-17' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\33034(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (6, N'Positielijn', N'39397', N'081342', N'8865835', CAST(N'2019-05-17' AS Date), CAST(N'2020-05-17' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\39397(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (7, N'Valstopapparaat', N'41599', N'086175', N'10295272', CAST(N'2019-06-27' AS Date), CAST(N'2020-06-27' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\41599(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (8, N'Positielijn', N'41607', N'086185', N'10524642', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Jelle Kwant', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\41607(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (10, N'Harnas', N'49266', N'103822', N'20430935/090', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Jelle Kwant', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\49266(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (11, N'Positielijn', N'49267', N'103824', N'20430848/012', CAST(N'2019-05-28' AS Date), CAST(N'2020-05-28' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\49267(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (13, N'Valstopapparaat', N'50133', N'106656', N'20177286/009', CAST(N'2019-06-03' AS Date), CAST(N'2020-06-03' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\50133(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (14, N'Valstopapparaat', N'50134', N'106657', N'20107588/047', CAST(N'2019-06-03' AS Date), CAST(N'2020-06-03' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\50134(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (15, N'Valstopapparaat', N'53778', N'117998', N'1009074', CAST(N'2016-06-14' AS Date), CAST(N'2017-06-14' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\53778(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (17, N'Valstopapparaat', N'56794', N'127040', N'20279913/037', CAST(N'2019-06-27' AS Date), CAST(N'2020-06-27' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\56794(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (19, N'Positielijn', N'41606', N'086184', N'10524637', CAST(N'2016-10-21' AS Date), CAST(N'2017-10-21' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\41606(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (20, N'Verstelbare horizontale werklijn', N'44654', N'092411', N'866', CAST(N'2015-09-11' AS Date), CAST(N'2016-09-11' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Verstelbare horizontale werklijnen\44654(verstelbare horizontale werklijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (21, N'Harnas', N'44655', N'092412', N'07415/42', CAST(N'2014-10-13' AS Date), CAST(N'2015-10-13' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\44655(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (23, N'Rugbandje', N'49807', N'105963', N'20285527/028', CAST(N'2015-09-11' AS Date), CAST(N'2016-09-11' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Rugbandjes\49807(rugbandje).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (24, N'Valstopapparaat', N'52252', N'112713', N'0031', CAST(N'2015-09-08' AS Date), CAST(N'2016-09-08' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\52252(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (25, N'Positielijn', N'52256', N'112836', N'20428103-068', CAST(N'2015-09-11' AS Date), CAST(N'2016-09-11' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\52256(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (26, N'Harnas', N'38765', N'079626', N'9470646', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Roy Geven', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\38765(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (27, N'Harnas', N'51804', N'111407', N'100563505', CAST(N'2017-01-27' AS Date), CAST(N'2018-01-27' AS Date), N'Rob Maas', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\51804(Harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (29, N'Positielijn', N'41999', N'087157', N'10547301', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\41999(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (30, N'Harnas', N'51803', N'111406', N'100563524', CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\51803(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (31, N'Valstopapparaat', N'51805', N'111408', N'12567252', CAST(N'2015-07-14' AS Date), CAST(N'2016-07-14' AS Date), N'Wim Slenders', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valstopapparaten\51805(valstopapparaat).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (32, N'Harnas', N'61424', N'139167', N'17566190', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Simon', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\61424(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (33, N'Harnas', N'61425', N'139168', N'17586196', CAST(N'2018-09-28' AS Date), CAST(N'2019-09-28' AS Date), N'Wim Slenders', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\61425(harnas).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (34, N'Positielijn', N'61426', N'139169', N'16882539', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Onbekend', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\61426(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (35, N'Positielijn', N'61427', N'139170', N'17710262', CAST(N'2018-09-28' AS Date), CAST(N'2019-09-28' AS Date), N'Wim Slenders', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\61427(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (36, N'Positielijn', N'59135', N'133717', N'16882576', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Roy Geven', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\59135(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (37, N'Vallijn met demper', N'44653', N'092422', N'865383', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Valdempers\44653(valdemper).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (38, N'Positielijn', N'49271', N'103830', N'20430848/006', CAST(N'2019-03-28' AS Date), CAST(N'2020-03-28' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\49271(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (39, N'Positielijn', N'63369', N'144999', N'17651903', CAST(N'2019-04-29' AS Date), CAST(N'2020-04-29' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Positielijnen\63369(positielijn).pdf')
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (40, N'Positielijn', N'41605', N'086183', N'10524631', CAST(N'2017-12-19' AS Date), CAST(N'2018-12-19' AS Date), N'Ronnie', NULL)
INSERT [dbo].[Valbeveiliging] ([Id], [omschrijving], [opdr_nr], [certi_nr], [serie_nr], [datum_gekeurd], [datum_herkeuring], [persoon], [certificaat]) VALUES (41, N'Harnas', N'59984', N'135889', N'17312776', CAST(N'2019-05-17' AS Date), CAST(N'2020-05-17' AS Date), N'Magazijn', N'M:\Certificaten onderhoudsprogramma\Valbeveiliging\Harnassen\59984(Harnas).pdf')
SET IDENTITY_INSERT [dbo].[Valbeveiliging] OFF
SET IDENTITY_INSERT [dbo].[Verfpomp] ON 

INSERT [dbo].[Verfpomp] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (3, CAST(N'2018-05-03' AS Date), CAST(N'2019-05-03' AS Date), N'571302', 2018, N'Wiltec', N'Wiltec', N'Wiltec XP70', N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\verfpomp\Wiltec XP70.doc')
INSERT [dbo].[Verfpomp] ([Id], [datum_gekeurd], [datum_herkeuring], [code_nr], [bouwjaar], [leverancier], [merk], [benaming], [stamkaart]) VALUES (4, CAST(N'2019-05-01' AS Date), CAST(N'2020-05-01' AS Date), NULL, 2014, N'Wiltec', N'Wiltec X70', N'Airless spuit', N'M:\Werkvoorbereiding\stamkaarten\Lammers\stamkaarten Lammers\verfpomp\X70.doc')
SET IDENTITY_INSERT [dbo].[Verfpomp] OFF
USE [master]
GO
ALTER DATABASE [Onderhoud_calibratie] SET  READ_WRITE 
GO
