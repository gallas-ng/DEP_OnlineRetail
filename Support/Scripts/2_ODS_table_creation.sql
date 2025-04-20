IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DEP_ODS')
    CREATE DATABASE DEP_ODS;

USE DEP_ODS

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ODS_OnlineRetail')
BEGIN
	CREATE TABLE [ODS_OnlineRetail] (
		[InvoiceNo] float,
		[StockCode] nvarchar(10),
		[Description] nvarchar(255),
		[Quantity] float,
		[InvoiceDate] datetime,
		[UnitPrice] float,
		[CustomerID] int,
		[Country] nvarchar(20),
		[TotalPrice] float
	);
END