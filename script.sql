USE [master]
GO
/****** Object:  Database [EvaluacionTecnicaDB]    Script Date: 22/06/2021 22:25:17 ******/
CREATE DATABASE [EvaluacionTecnicaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvaluacionTecnicaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EvaluacionTecnicaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EvaluacionTecnicaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EvaluacionTecnicaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvaluacionTecnicaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET  MULTI_USER 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvaluacionTecnicaDB', N'ON'
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET QUERY_STORE = OFF
GO
USE [EvaluacionTecnicaDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 22/06/2021 22:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 22/06/2021 22:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nchar](5) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[FechaAlta] [date] NULL,
	[TipoDocumentoId] [int] NULL,
	[NumeroDocumento] [int] NULL,
 CONSTRAINT [PK_dbo.Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 22/06/2021 22:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106230019080_InitialMigration', N'EvaluacionTecnica.Services.Migrations.Configuration', 0x1F8B0800000000000400ED59CD6EE33610BE17E83B083A1659CBC9A2406BD8BB489DA408BAF941E42C7A0B6869EC10A54895A40C1B8B3E590F7DA4BE4287B2244BA46C2BCE0FB645914B24CD7CF3C399E1CCF8EF3FFF1A7E5C26CC5B805454F0917FDCEBFB1EF048C494CF477EA667EF7EF03F7EF8F69BE1799C2CBDCF25DD7B43879C5C8DFC47ADD34110A8E81112A27A098DA45062A67B914802128BE0A4DFFF31383E0E00217CC4F2BCE15DC6354D207FC0C7B1E011A43A23EC4AC4C054F11EBF8439AA774D1250298960E49F2F08CB48846A4C20E23422BD10E48246A07CEF9451821A85C066BE4738179A68241CDC2B08B5147C1EA6F882B0C92A05A49B11A6A0B063B021EF6A52FFC498146C184BA828535A244F043C7E5FF828B0D90FF2B45FF910BD788EDED62B6375EE4974629232400EDFB3850DC64C1AC236479F2121E53D8316931854AF8439F2B6111F553183A165FE8EBC71C6742661C421D392B023EF369B321AFD02AB89F80DF888678CD5B547FDF15BE305BEBA952205A95777302B6CBA8C7D2F68F2053663C556E3595B7BC9F5FB13DFBB46E164CAA00A8E9A67422D24FC0C1C24D110DF12AD41728301B97B1DE996AC3126D55C94F2301E31C57CEF8A2C3F019FEBC791FFBDEF5DD025C4E573A1C13DBA13B362E46B99418B86BBA59EA6C0188D77CAEDBF86E06B914C25BCB9D80B881EC929D3A4947C868735C15AB38F7142537126A22CC1D3144E5CECB115B9E4867B37EF3559D0791E51BB34F0BD3B6039957AA4E9BAA655F9F660915E4891DC09564BEC26C54328321999C3103BC92644CE4137351E069BEAB1B3A6583A3DABB034B0FEAF2E1DAACB19A848D234CAEF8B57CDB96D0171AA9488686E8C75CB58E1DAB4E39CC75EB7D85D1B55CF03B40D8F9BA678C0A8D0C8FFCEF1D25EF432E46BE856203745F47BBD63470A860948734E84612BA330F028D76E4C511ED194B04E0A59DC1D63D29C4E25C7FE72062970134E9DFCDD4501A766BADA5442ADDCD9E7B261508B27B7EE208F460E9065A8D915C210C052B7D4216C068B52A48A78B743C60808415B518CFDE526F09D4074E2AE09623CA56A41E520594167C1D57CE12A66DF0635E2DDF7867D589D53B1B2AEE11DE7F03B275F0DCF76945D739B9E68294B55646C8688603D4594D346B065DC185E9134C58A591B3F8A375EB89E3DC6EFC2A737E3C91A2388544B4F5E695B49C26B80CCC1FA9A778F7041A5D2D8CF90293145791C270ED9D63CD8129EA5583BD4DDA32CE3B5E430FF6FC9BD6A22DBE4875B4D0A9C0BB4D61C756E38B40496CB9A8F858411D972DD8E05CB12BEBD3C6EE72EDBF33A42F9AE3BCAA6DDAEE36CDE76472AFBE73A4EF9AE3B4AAD1DAE03D55E77C772AA7D1D71EF55B0C352BB7B6E986C7F74718781154BCE25E444AF5554EC74E8942C56A57AA18CD959A13BA4CD1EFED7C99D46F35987697C78E393732E049BA4925E5D0CD605302C8AF1FEA594539DD724BE878E5AD0D854E670A534243D43D00B7F676346D1DE0DC115E174064AAFA714FFA47F7C62EDB3BE9EDD52A054CC3A2E98DE7CD4A2C6AB7B87A9276E159ABB1B8EC553DAAB9B67EE65F8824817B6FFCCB5CB4BA13A5B9518FD5A4759CF8D076D58F20373BAF44B1C1A9623FF4BCE3BF02E7F7DB0D88FBC1B897933F0FADE1F4FD564CBBE26D76417D281BB90FF460EB46C180E0BAF575B205873D0B3467A777639700371D06E605F17F06ABB807FD9D8EF4E45DD66F99DA3FCFAEEC61A373567BE0EE3270DFA4F98F3DB647D5DAB8056835A5ACD2EE37FEBE6E075667CB775C3E0ABFDEA8819A0E87C03617E83E41035C2AEA2B9E43351A681A551496215CB2BD004EF48722A359D9148E367ECEE55BE8FFD8CCD7FEE9429C497FC26D369A6D16448A6ACB1E63559B44B7EBEC868EA3CBC49F39F0C5EC20454939A6BFE86FF945116577A5FB454F42D10263D8B1BC89CA53637D17C55215D0BDE11A8705F55552680C18360EA8687640187E876AFE013CC49B42A3BF0ED20FB0FA2E9F6E1192573491255606CF8F11163384E961FFE019D6225CE7C1F0000, N'6.1.1-30610')
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([Id], [Codigo], [Apellido], [Nombre], [FechaAlta], [TipoDocumentoId], [NumeroDocumento]) VALUES (1, N'1    ', N'Juan Cruz', N'Arzua', CAST(N'2021-06-22' AS Date), 1, 35097995)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 

INSERT [dbo].[TipoDocumento] ([Id], [Descripcion]) VALUES (1, N'DNI')
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
/****** Object:  Index [IX_TipoDocumentoId]    Script Date: 22/06/2021 22:25:18 ******/
CREATE NONCLUSTERED INDEX [IX_TipoDocumentoId] ON [dbo].[Empleado]
(
	[TipoDocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Empleado_dbo.TipoDocumento_TipoDocumentoId] FOREIGN KEY([TipoDocumentoId])
REFERENCES [dbo].[TipoDocumento] ([Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_dbo.Empleado_dbo.TipoDocumento_TipoDocumentoId]
GO
USE [master]
GO
ALTER DATABASE [EvaluacionTecnicaDB] SET  READ_WRITE 
GO
