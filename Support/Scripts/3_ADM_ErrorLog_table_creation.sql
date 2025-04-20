IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DEP_ADM')
    CREATE DATABASE DEP_ADM;

USE DEP_ADM

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ErrorLog_OnlineRetail')
BEGIN
	CREATE TABLE ErrorLog_OnlineRetail (
		ErrorID INT IDENTITY(1,1) PRIMARY KEY,
		ErrorCode INT,
		ErrorColumn INT,
		ErrorDescription NVARCHAR(1000),
		InvoiceNo NVARCHAR(20),
		StockCode NVARCHAR(10),
		Description NVARCHAR(255),
		Quantity INT,
		InvoiceDate DATETIME,
		UnitPrice DECIMAL(10, 2),
		CustomerID INT,
		Country NVARCHAR(20),
		ErrorDateTime DATETIME DEFAULT GETDATE()
	);
END