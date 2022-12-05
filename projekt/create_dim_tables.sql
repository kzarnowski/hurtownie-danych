use project_prod;

CREATE TABLE [dbo].[DIMCustomer] (
	[CustomerKey] int IDENTITY(1,1),
	[id] [varchar](50) NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[street] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[EffStartDate] date,
	[EffEndDate] date
)

CREATE TABLE [dbo].[DIMCarrier] (
	[CarrierKey] int IDENTITY(1,1),
	[carrier_id] [varchar](50) NULL,
	[carrier_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[tax_id] [varchar](50) NULL,
	[contact_person] [varchar](50) NULL,
	[EffStartDate] date,
	[EffEndDate] date
)

--------------------------------------------

USE [project_prod]

CREATE TABLE dbo.DIMDate (
 [DateKey] int NOT NULL,
 [Date] DATE NOT NULL,
 [Day] TINYINT NOT NULL,
 [WeekOfYear] TINYINT NOT NULL,
 [Month] TINYINT NOT NULL,
 [Quarter] TINYINT NOT NULL,
 [Year] INT NOT NULL
 )
DECLARE @CurrentDate DATE = '2005-01-01'
DECLARE @EndDate DATE = DATEADD(DAY, -1, DATEADD(YEAR, 20, @CurrentDate));
WHILE @CurrentDate < @EndDate
BEGIN
 INSERT INTO [dbo].[DimDate] (
 [DateKey],
 [Date],
 [Day],
 [WeekOfYear],
 [Month],
 [Quarter],
 [Year]
 )
 SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 +
DAY(@CurrentDate),
 DATE = @CurrentDate,
 Day = DAY(@CurrentDate),
 [WeekofYear] = DATEPART(wk, @CurrentDate),
 [Month] = MONTH(@CurrentDate),
 [Quarter] = DATEPART(q, @CurrentDate),
 [Year] = YEAR(@CurrentDate)
 SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END

