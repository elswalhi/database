USE [master]
GO
/****** Object:  Database [reservation mangment system]    Script Date: 5/21/2020 5:09:10 AM ******/
CREATE DATABASE [reservation mangment system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reservation mangment system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\reservation mangment system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'reservation mangment system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\reservation mangment system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [reservation mangment system] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reservation mangment system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reservation mangment system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reservation mangment system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reservation mangment system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reservation mangment system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reservation mangment system] SET ARITHABORT OFF 
GO
ALTER DATABASE [reservation mangment system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [reservation mangment system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reservation mangment system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reservation mangment system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reservation mangment system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reservation mangment system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reservation mangment system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reservation mangment system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reservation mangment system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reservation mangment system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [reservation mangment system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reservation mangment system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reservation mangment system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reservation mangment system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reservation mangment system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reservation mangment system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reservation mangment system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reservation mangment system] SET RECOVERY FULL 
GO
ALTER DATABASE [reservation mangment system] SET  MULTI_USER 
GO
ALTER DATABASE [reservation mangment system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reservation mangment system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reservation mangment system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reservation mangment system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [reservation mangment system] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'reservation mangment system', N'ON'
GO
ALTER DATABASE [reservation mangment system] SET QUERY_STORE = OFF
GO
USE [reservation mangment system]
GO
/****** Object:  Table [dbo].[guest]    Script Date: 5/21/2020 5:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guest](
	[guest_id] [int] IDENTITY(1,1) NOT NULL,
	[guest_name] [nvarchar](max) NOT NULL,
	[country] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[room_id] [int] NULL,
 CONSTRAINT [PK_guest] PRIMARY KEY CLUSTERED 
(
	[guest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 5/21/2020 5:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] NOT NULL,
	[reservation_id] [int] NOT NULL,
	[guest_id] [int] NOT NULL,
	[room_price] [float] NOT NULL,
	[visacard_number] [int] NULL,
	[cash_payed] [float] NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 5/21/2020 5:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[guest_id] [int] NOT NULL,
	[check_in_date] [date] NOT NULL,
	[check_out_date] [date] NULL,
 CONSTRAINT [PK_reservation] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 5/21/2020 5:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[room_id] [int] NOT NULL,
	[room_type] [nvarchar](max) NOT NULL,
	[beds_number] [int] NOT NULL,
	[room_price] [money] NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_guest] FOREIGN KEY([guest_id])
REFERENCES [dbo].[guest] ([guest_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_guest]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_reservation] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_reservation]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_guest] FOREIGN KEY([guest_id])
REFERENCES [dbo].[guest] ([guest_id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_guest]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_room] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([room_id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_room]
GO
USE [master]
GO
ALTER DATABASE [reservation mangment system] SET  READ_WRITE 
GO
