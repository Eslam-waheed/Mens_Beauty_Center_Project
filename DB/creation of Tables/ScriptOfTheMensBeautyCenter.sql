USE [Mens_Beauty_Center]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[EmployeeID] [char](14) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[NationalID] [char](14) NOT NULL,
	[ExpenseMoney] [decimal](9, 2) NULL,
	[ArrivalTime] [datetime] NULL,
	[DepartureTime] [datetime] NULL,
	[DailyPocketMoney] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[NationalID] [char](14) NOT NULL,
	[PhoneNumber] [varchar](11) NOT NULL,
	[FixedSalary] [decimal](9, 2) NOT NULL,
	[Type] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NationalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Month] [nvarchar](10) NULL,
	[TotalAmountOfMonth] [decimal](18, 2) NULL,
	[ProfitPercentage] [decimal](2, 1) NULL,
	[Bonus]  AS (([TotalAmountOfMonth]*[ProfitPercentage])/(100)),
	[NationalID] [char](14) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageCustomer]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageCustomer](
	[CustomerId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[Deposit] [decimal](9, 2) NOT NULL,
	[TakeDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serve]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[serve](
	[NationalID] [char](14) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Servedate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NationalID] ASC,
	[CustomerId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 8/18/2024 11:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Emp_Account] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([NationalID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Emp_Account]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Employee_NationalID] FOREIGN KEY([NationalID])
REFERENCES [dbo].[Employee] ([NationalID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Employee_NationalID]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Employee] FOREIGN KEY([NationalID])
REFERENCES [dbo].[Employee] ([NationalID])
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_Employee]
GO
ALTER TABLE [dbo].[PackageCustomer]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Code])
GO
ALTER TABLE [dbo].[PackageCustomer]  WITH CHECK ADD FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([ID])
GO
ALTER TABLE [dbo].[serve]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Code])
GO
ALTER TABLE [dbo].[serve]  WITH CHECK ADD FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[serve]  WITH CHECK ADD  CONSTRAINT [FK_Employee_NationalID_serve] FOREIGN KEY([NationalID])
REFERENCES [dbo].[Employee] ([NationalID])
GO
ALTER TABLE [dbo].[serve] CHECK CONSTRAINT [FK_Employee_NationalID_serve]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD CHECK  ((len([EmployeeID])=(14) AND [EmployeeID] like '[0-9]%'))
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  ((len([NationalID])=(14) AND [NationalId] like '[0-9]%'))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_PhoneNumber_Validation] CHECK  ((len([PhoneNumber])=(11) AND [PhoneNumber] like '01[0125][0-9]%'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_PhoneNumber_Validation]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  ((len([NationalID])=(14)))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  ((len([PhoneNumber])=(11) AND [PhoneNumber] like '01[0125][0-9]%'))
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD CHECK  ((len([NationalID])=(14) AND [NationalID] like '[0-9]%'))
GO
ALTER TABLE [dbo].[serve]  WITH CHECK ADD CHECK  ((len([NationalID])=(14) AND [NationalId] like '[0-9]%'))
GO
