USE [master]
GO
/****** Object:  Database [Wallet]    Script Date: 9/23/2021 10:03:05 PM ******/
CREATE DATABASE [Wallet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wallet', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Wallet.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Wallet_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Wallet_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Wallet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wallet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wallet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wallet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Wallet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Wallet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wallet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wallet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wallet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wallet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wallet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wallet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wallet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wallet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wallet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wallet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wallet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wallet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wallet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wallet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wallet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wallet] SET  MULTI_USER 
GO
ALTER DATABASE [Wallet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wallet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wallet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wallet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Wallet]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addresses](
	[Address_Number] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [uniqueidentifier] NULL,
	[Country] [varchar](25) NOT NULL,
	[Town_City] [varchar](25) NOT NULL,
	[State_Province] [varchar](25) NOT NULL,
	[Woreda] [int] NULL,
	[Kebele] [int] NULL,
	[Cellphone_1] [int] NOT NULL,
	[Cellphone_2] [int] NULL,
	[Other_Details] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[authentification]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authentification](
	[Authentification_ID] [uniqueidentifier] NOT NULL,
	[Wallet_ID] [uniqueidentifier] NULL,
	[Authentification_Code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Authentification_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[banks]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[banks](
	[Bank_ID] [uniqueidentifier] NOT NULL,
	[Bank_Details] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Bank_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[device]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[device](
	[Device_ID] [uniqueidentifier] NOT NULL,
	[Address_Number] [int] NULL,
	[Device_Type_Code] [int] NULL,
	[Device_Status_Code] [int] NULL,
	[Installer_ID] [uniqueidentifier] NULL,
	[Merchant_ID] [uniqueidentifier] NULL,
	[Transaction_Number] [int] NULL,
	[Wallet_ID] [uniqueidentifier] NULL,
	[QR_Code] [uniqueidentifier] NOT NULL,
	[Device_Serial_Key] [uniqueidentifier] NOT NULL,
	[Device_Warranty_Expire_Date] [datetime] NOT NULL,
	[Device_Purchased] [datetime] NOT NULL,
	[Device_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Device_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[installer]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[installer](
	[Installer_ID] [uniqueidentifier] NOT NULL,
	[Installer_FName] [varchar](25) NOT NULL,
	[Installer_MName] [varchar](25) NOT NULL,
	[Installer_LName] [varchar](25) NOT NULL,
	[Installer_Age] [int] NOT NULL,
	[Installer_Sex] [char](1) NOT NULL,
	[Installer_Salary] [decimal](10, 0) NOT NULL,
	[Installer_Qualification_Documentation] [varchar](100) NOT NULL,
	[Installer_Position] [varchar](25) NOT NULL,
	[Installer_Cellphone_1] [int] NOT NULL,
	[Installer_Cellphone_2] [int] NULL,
	[Installer_Status_Code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Installer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[merchant]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[merchant](
	[Merchant_ID] [uniqueidentifier] NOT NULL,
	[User_ID] [uniqueidentifier] NULL,
	[Merchant_UserName] [varchar](25) NOT NULL,
	[Merchant_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Merchant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_device_status]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_device_status](
	[Device_Status_Code] [int] NOT NULL,
	[Device_Status_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Device_Status_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_device_type]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_device_type](
	[Device_Type_Code] [int] NOT NULL,
	[Device_Type_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Device_Type_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_installer_status]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_installer_status](
	[Installer_Status_Code] [int] NOT NULL,
	[Installer_Status_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Installer_Status_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_transaction_status]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_transaction_status](
	[Transaction_Status_Code] [int] NOT NULL,
	[Transaction_Status_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Status_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_transaction_type]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_transaction_type](
	[Transaction_Type_Code] [int] NOT NULL,
	[Transaction_Type_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Type_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_user_status]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_user_status](
	[User_Status_Code] [int] NOT NULL,
	[User_Status_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Status_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_wallet_status]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_wallet_status](
	[Wallet_Status_Code] [int] NOT NULL,
	[Wallet_Status_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Wallet_Status_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ref_wallet_type]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ref_wallet_type](
	[Wallet_Type_Code] [int] NOT NULL,
	[Wallet_Type_Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Wallet_Type_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[Transaction_Number] [int] IDENTITY(1,1) NOT NULL,
	[Wallet_ID] [uniqueidentifier] NULL,
	[Merchant_ID] [uniqueidentifier] NULL,
	[Transaction_Type_Code] [int] NULL,
	[Transaction_Status_Code] [int] NULL,
	[Transaction_Amount] [decimal](10, 0) NOT NULL,
	[Transaction_TimeStamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_type_0]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_type_0](
	[IU_Ref_Number] [int] IDENTITY(1,1) NOT NULL,
	[IU_First_Name] [varchar](25) NOT NULL,
	[IU_Middle_Name] [varchar](25) NOT NULL,
	[IU_Last_Name] [varchar](25) NOT NULL,
	[IU_Documentation_Path] [varchar](200) NULL,
	[IU_Reg_TimeStamp] [datetime] NOT NULL,
	[IU_Email] [varchar](50) NOT NULL,
	[IU_Age] [int] NOT NULL,
	[IU_Sex] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IU_Ref_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_type_1]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_type_1](
	[NIU_Ref_Number] [int] IDENTITY(1,1) NOT NULL,
	[NIU_Name] [varchar](25) NOT NULL,
	[NIU_Details] [varchar](100) NOT NULL,
	[NIU_Documentation_Path] [varchar](200) NOT NULL,
	[NIU_Reg_TimeStamp] [datetime] NOT NULL,
	[NIU_Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NIU_Ref_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[User_ID] [uniqueidentifier] NOT NULL,
	[User_Type] [int] NULL,
	[User_Status_Code] [int] NULL,
	[User_Type_Description] [varchar](100) NOT NULL,
	[Signiture] [char](30) NOT NULL,
	[IP_Address] [decimal](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wallet]    Script Date: 9/23/2021 10:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wallet](
	[Wallet_ID] [uniqueidentifier] NOT NULL,
	[Wallet_UserName] [varchar](25) NOT NULL,
	[Wallet_TimeStamp] [datetime] NOT NULL,
	[Wallet_Ballance] [decimal](10, 0) NOT NULL,
	[Wallet_Type_Code] [int] NULL,
	[Wallet_Status_Code] [int] NULL,
	[Bank_ID] [uniqueidentifier] NULL,
	[Address_Number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Wallet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[addresses] ADD  DEFAULT ('Ethiopia') FOR [Country]
GO
ALTER TABLE [dbo].[addresses] ADD  DEFAULT (NULL) FOR [Woreda]
GO
ALTER TABLE [dbo].[addresses] ADD  DEFAULT (NULL) FOR [Kebele]
GO
ALTER TABLE [dbo].[addresses] ADD  DEFAULT (NULL) FOR [Cellphone_2]
GO
ALTER TABLE [dbo].[authentification] ADD  DEFAULT (newid()) FOR [Authentification_ID]
GO
ALTER TABLE [dbo].[banks] ADD  DEFAULT (newid()) FOR [Bank_ID]
GO
ALTER TABLE [dbo].[device] ADD  DEFAULT (newid()) FOR [Device_ID]
GO
ALTER TABLE [dbo].[device] ADD  DEFAULT (NULL) FOR [Wallet_ID]
GO
ALTER TABLE [dbo].[installer] ADD  DEFAULT (newid()) FOR [Installer_ID]
GO
ALTER TABLE [dbo].[installer] ADD  DEFAULT (NULL) FOR [Installer_Cellphone_2]
GO
ALTER TABLE [dbo].[merchant] ADD  DEFAULT (newid()) FOR [Merchant_ID]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT (getdate()) FOR [Transaction_TimeStamp]
GO
ALTER TABLE [dbo].[user_type_0] ADD  DEFAULT (getdate()) FOR [IU_Reg_TimeStamp]
GO
ALTER TABLE [dbo].[user_type_1] ADD  DEFAULT (getdate()) FOR [NIU_Reg_TimeStamp]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (newid()) FOR [User_ID]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [User_Type]
GO
ALTER TABLE [dbo].[wallet] ADD  DEFAULT (newid()) FOR [Wallet_ID]
GO
ALTER TABLE [dbo].[wallet] ADD  DEFAULT (getdate()) FOR [Wallet_TimeStamp]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[users] ([User_ID])
GO
ALTER TABLE [dbo].[authentification]  WITH CHECK ADD FOREIGN KEY([Wallet_ID])
REFERENCES [dbo].[wallet] ([Wallet_ID])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Address_Number])
REFERENCES [dbo].[addresses] ([Address_Number])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Device_Status_Code])
REFERENCES [dbo].[ref_device_status] ([Device_Status_Code])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Device_Type_Code])
REFERENCES [dbo].[ref_device_type] ([Device_Type_Code])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Installer_ID])
REFERENCES [dbo].[installer] ([Installer_ID])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Merchant_ID])
REFERENCES [dbo].[merchant] ([Merchant_ID])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Transaction_Number])
REFERENCES [dbo].[transactions] ([Transaction_Number])
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD FOREIGN KEY([Wallet_ID])
REFERENCES [dbo].[wallet] ([Wallet_ID])
GO
ALTER TABLE [dbo].[installer]  WITH CHECK ADD FOREIGN KEY([Installer_Status_Code])
REFERENCES [dbo].[ref_installer_status] ([Installer_Status_Code])
GO
ALTER TABLE [dbo].[merchant]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[users] ([User_ID])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([Merchant_ID])
REFERENCES [dbo].[merchant] ([Merchant_ID])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([Transaction_Type_Code])
REFERENCES [dbo].[ref_transaction_type] ([Transaction_Type_Code])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([Transaction_Status_Code])
REFERENCES [dbo].[ref_transaction_status] ([Transaction_Status_Code])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([Wallet_ID])
REFERENCES [dbo].[wallet] ([Wallet_ID])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([User_Status_Code])
REFERENCES [dbo].[ref_user_status] ([User_Status_Code])
GO
ALTER TABLE [dbo].[wallet]  WITH CHECK ADD FOREIGN KEY([Address_Number])
REFERENCES [dbo].[addresses] ([Address_Number])
GO
ALTER TABLE [dbo].[wallet]  WITH CHECK ADD FOREIGN KEY([Bank_ID])
REFERENCES [dbo].[banks] ([Bank_ID])
GO
ALTER TABLE [dbo].[wallet]  WITH CHECK ADD FOREIGN KEY([Wallet_Status_Code])
REFERENCES [dbo].[ref_wallet_status] ([Wallet_Status_Code])
GO
ALTER TABLE [dbo].[wallet]  WITH CHECK ADD FOREIGN KEY([Wallet_Type_Code])
REFERENCES [dbo].[ref_wallet_type] ([Wallet_Type_Code])
GO
USE [master]
GO
ALTER DATABASE [Wallet] SET  READ_WRITE 
GO
