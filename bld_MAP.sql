USE [master]
GO
/****** Object:  Database [MAP]    Script Date: 07/01/2016 12:21:37 ******/
CREATE DATABASE [MAP] ON  PRIMARY 
( NAME = N'MAP', FILENAME = N'M:\SQLData\MAP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MAP_log', FILENAME = N'N:\SQLLogs\MAP_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MAP] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MAP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MAP] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MAP] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MAP] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MAP] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MAP] SET ARITHABORT OFF
GO
ALTER DATABASE [MAP] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MAP] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MAP] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MAP] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MAP] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MAP] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MAP] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MAP] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MAP] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MAP] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MAP] SET  DISABLE_BROKER
GO
ALTER DATABASE [MAP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MAP] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MAP] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MAP] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MAP] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MAP] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MAP] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MAP] SET  READ_WRITE
GO
ALTER DATABASE [MAP] SET RECOVERY FULL
GO
ALTER DATABASE [MAP] SET  MULTI_USER
GO
ALTER DATABASE [MAP] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MAP] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'MAP', N'ON'
GO
USE [MAP]
GO
/****** Object:  User [SAMI_DB]    Script Date: 07/01/2016 12:21:37 ******/
CREATE USER [SAMI_DB] FOR LOGIN [SAMI_DB] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AMED\robert.g.clark]    Script Date: 07/01/2016 12:21:37 ******/
CREATE USER [AMED\robert.g.clark] FOR LOGIN [AMED\robert.g.clark] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ServerLog]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ServerSessionID] [varchar](36) NULL,
	[ClientSessionID] [varchar](36) NULL,
	[ServerTime] [datetime] NULL,
	[RecordType] [varchar](50) NULL,
	[RecordValue] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportText]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportText](
	[ReportTextID] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [varchar](30) NULL,
	[Binding] [varchar](100) NULL,
	[Binding_Value] [varchar](100) NULL,
	[Text] [varchar](500) NULL,
 CONSTRAINT [PK_ReportTextID] PRIMARY KEY CLUSTERED 
(
	[ReportTextID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientLog]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ClientSessionID] [varchar](36) NULL,
	[ClientTime] [datetime] NULL,
	[User] [varchar](500) NULL,
	[RecordType] [varchar](50) NULL,
	[RecordValue] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataSource]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSource](
	[DataSourceID] [int] IDENTITY(1,1) NOT NULL,
	[EntityID] [int] NOT NULL,
	[SourceName] [varchar](50) NULL,
	[SourceType] [char](1) NULL,
 CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED 
(
	[DataSourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConnectionString]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConnectionString](
	[ConnectionStringID] [int] NOT NULL,
	[EntityID] [int] NULL,
	[Environment] [varchar](10) NULL,
	[ConnectionString] [varchar](200) NULL,
 CONSTRAINT [PK_ConnectionStringID] PRIMARY KEY CLUSTERED 
(
	[ConnectionStringID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductLine]    Script Date: 07/01/2016 12:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductLine](
	[ProductLineID] [int] IDENTITY(1,1) NOT NULL,
	[EntityID] [int] NOT NULL,
	[Active] [int] NULL,
	[Icon] [varchar](50) NULL,
	[IconClass] [varchar](50) NULL,
	[HasPII] [int] NULL,
	[Module] [varchar](50) NULL,
	[ModuleName] [varchar](50) NULL,
 CONSTRAINT [PK_ProductLine] PRIMARY KEY CLUSTERED 
(
	[ProductLineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_InsServerLog]    Script Date: 07/01/2016 12:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grieb, Lance
-- Create date: 28-JUN-2016
-- Description:	Capture server log data for MAP Application
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsServerLog]
	-- parameters 
	(
	@ServerSessionID varchar(36),
    @ClientSessionID varchar(36),
    @RecordType varchar(50),
    @RecordValue varchar(max)
    )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statement
INSERT INTO [MAP].[dbo].[ServerLog]
           (
			[ServerSessionID],
            [ClientSessionID],
            [RecordType],
            [RecordValue]
            )
     VALUES
           (
           @ServerSessionID,
           @ClientSessionID,
           @RecordType,
           @RecordValue
           )

END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsClientLog]    Script Date: 07/01/2016 12:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grieb, Lance
-- Create date: 28-JUN-2016
-- Description:	Capture server log data for MAP Application
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsClientLog]
	-- parameters 
	(
	@ClientSessionID varchar(36),
	@ClientTime datetime,
	@User varchar(500),
    @RecordType varchar(50),
    @RecordValue varchar(max)
    )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statement
INSERT INTO [MAP].[dbo].[ClientLog]
           (
			[ClientSessionID],
			ClientTime,
			[User],
            [RecordType],
            [RecordValue]
            )
     VALUES
           (
			@ClientSessionID,
			@ClientTime,
			@User ,
			@RecordType,
			@RecordValue
           )

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductLine]    Script Date: 07/01/2016 12:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetProductLine]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT E.Code, E.Name, P.Active, P.Icon, P.IconClass, P.HasPII,  P.Module, P.ModuleName
  FROM [MAP].[dbo].[ProductLine] P
  JOIN [MAP].dbo.Entity E
  ON E.EntityID = P.EntityID
    ORDER BY 2


END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetConnectionString]    Script Date: 07/01/2016 12:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Grieb, Lance
-- Create date: 27-JUN-2016
-- Description:	Get Connectivity info.
-- =============================================

CREATE PROCEDURE [dbo].[usp_GetConnectionString]
	-- Add the parameters for the stored procedure here
	(
	@EntityCode varchar(20),
	@Environment varchar(10)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.Code, c.ConnectionStringID, c.Environment, c.ConnectionString
	FROM dbo.ConnectionString c
	JOIN dbo.Entity e
	ON c.EntityID = e.EntityID
	WHERE e.Code = @EntityCode
	AND c.Environment=@Environment
	
END
GO
/****** Object:  Table [dbo].[Report]    Script Date: 07/01/2016 12:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ProductLineID] [int] NOT NULL,
	[GUID] [varchar](30) NULL,
	[User] [varchar](50) NULL,
	[Report_Name] [varchar](50) NULL,
	[Report_Type] [varchar](50) NULL,
	[JSON] [varchar](max) NULL,
	[AuditDate] [datetime] NULL,
 CONSTRAINT [PK_ReportID] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataSourceParameter]    Script Date: 07/01/2016 12:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSourceParameter](
	[DataSourceParameterID] [int] IDENTITY(1,1) NOT NULL,
	[DataSourceID] [int] NOT NULL,
	[ParameterName] [varchar](50) NULL,
	[DataType] [varchar](50) NULL,
 CONSTRAINT [PK_DataSourceParameter] PRIMARY KEY CLUSTERED 
(
	[DataSourceParameterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_DATEAudit]    Script Date: 07/01/2016 12:21:39 ******/
ALTER TABLE [dbo].[ServerLog] ADD  CONSTRAINT [DF_DATEAudit]  DEFAULT (getdate()) FOR [ServerTime]
GO
/****** Object:  Default [DF_Date]    Script Date: 07/01/2016 12:21:40 ******/
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Date]  DEFAULT (getdate()) FOR [AuditDate]
GO
/****** Object:  ForeignKey [FK_DataSourceEntityID]    Script Date: 07/01/2016 12:21:39 ******/
ALTER TABLE [dbo].[DataSource]  WITH CHECK ADD  CONSTRAINT [FK_DataSourceEntityID] FOREIGN KEY([EntityID])
REFERENCES [dbo].[Entity] ([EntityID])
GO
ALTER TABLE [dbo].[DataSource] CHECK CONSTRAINT [FK_DataSourceEntityID]
GO
/****** Object:  ForeignKey [FK_ConnectionStringEntityID]    Script Date: 07/01/2016 12:21:39 ******/
ALTER TABLE [dbo].[ConnectionString]  WITH CHECK ADD  CONSTRAINT [FK_ConnectionStringEntityID] FOREIGN KEY([EntityID])
REFERENCES [dbo].[Entity] ([EntityID])
GO
ALTER TABLE [dbo].[ConnectionString] CHECK CONSTRAINT [FK_ConnectionStringEntityID]
GO
/****** Object:  ForeignKey [FK_EntityID]    Script Date: 07/01/2016 12:21:39 ******/
ALTER TABLE [dbo].[ProductLine]  WITH CHECK ADD  CONSTRAINT [FK_EntityID] FOREIGN KEY([EntityID])
REFERENCES [dbo].[Entity] ([EntityID])
GO
ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [FK_EntityID]
GO
/****** Object:  ForeignKey [FK_ProdLineID]    Script Date: 07/01/2016 12:21:40 ******/
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_ProdLineID] FOREIGN KEY([ProductLineID])
REFERENCES [dbo].[ProductLine] ([ProductLineID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_ProdLineID]
GO
/****** Object:  ForeignKey [FK_DataSourceID]    Script Date: 07/01/2016 12:21:40 ******/
ALTER TABLE [dbo].[DataSourceParameter]  WITH CHECK ADD  CONSTRAINT [FK_DataSourceID] FOREIGN KEY([DataSourceID])
REFERENCES [dbo].[DataSource] ([DataSourceID])
GO
ALTER TABLE [dbo].[DataSourceParameter] CHECK CONSTRAINT [FK_DataSourceID]
GO
