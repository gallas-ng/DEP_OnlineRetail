IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DEP_DWH')
    CREATE DATABASE DEP_DWH;

USE DEP_DWH

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DimCustomer')
BEGIN
	CREATE TABLE dbo.DimCustomer (
		CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
		CustomerID INT,
		Country NVARCHAR(20)
	);
END



IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DimProduct')
BEGIN
	CREATE TABLE dbo.DimProduct (
		ProductKey INT IDENTITY(1,1) PRIMARY KEY,
		StockCode NVARCHAR(10),
		Description NVARCHAR(255)
	);
END



IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DimDate')
BEGIN
	CREATE TABLE dbo.DimDate (
		DateKey INT PRIMARY KEY,               
		FullDate DATE,
		Day TINYINT,
		Month TINYINT,
		MonthName NVARCHAR(20),
		Quarter TINYINT,
		Year SMALLINT,
		DayOfWeekName NVARCHAR(20),
		IsWeekend BIT
	);
END



IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DimCountry')
BEGIN
	CREATE TABLE dbo.DimCountry (
		CountryKey INT IDENTITY(1,1) PRIMARY KEY,
		Country NVARCHAR(20)
	);
END


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'FactSales')
BEGIN
CREATE TABLE dbo.FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceNo NVARCHAR(10),
    DateKey INT,
    CustomerKey INT,
    ProductKey INT,
    CountryKey INT,
    Quantity INT,
    UnitPrice FLOAT,
    TotalAmount FLOAT
);
END