IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DEP_STA')
    CREATE DATABASE DEP_STA;

USE DEP_STA

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'STA_OnlineRetail')
BEGIN
	CREATE TABLE [STA_OnlineRetail] (
		[InvoiceNo] float,
		[StockCode] nvarchar(10),
		[Description] nvarchar(255),
		[Quantity] float,
		[InvoiceDate] datetime,
		[UnitPrice] float,
		[CustomerID] float,
		[Country] nvarchar(20)
	);
END