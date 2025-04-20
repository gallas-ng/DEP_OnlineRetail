USE DEP_DWH

--Q1

SELECT 
    d.Year, d.Month, SUM(f.TotalAmount) AS MonthlySales
FROM 
    dbo.FactSales f
JOIN 
    dbo.DimDate d ON f.DateKey = d.DateKey
GROUP BY 
    d.Year, d.Month
ORDER BY 
    d.Year, d.Month;

--Q2

SELECT 
    c.Country, SUM(f.TotalAmount) AS TotalRevenue
FROM 
    dbo.FactSales f
JOIN 
    dbo.DimCountry c ON f.CountryKey = c.CountryKey
GROUP BY 
    c.Country
ORDER BY 
    TotalRevenue DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

--Q3

SELECT 
    cu.CustomerID, SUM(f.TotalAmount) AS CustomerTotal
FROM 
    dbo.FactSales f
JOIN 
    dbo.DimCustomer cu ON f.CustomerKey = cu.CustomerKey
GROUP BY 
    cu.CustomerID
ORDER BY 
    CustomerTotal DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


--Q4

SELECT 
    p.Description, SUM(f.Quantity) AS TotalUnitsSold
FROM 
    dbo.FactSales f
JOIN 
    dbo.DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY 
    p.Description
ORDER BY 
    TotalUnitsSold DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


--Q5

SELECT 
    c.Country,
    cu.CustomerID,
    SUM(f.TotalAmount) AS TotalSpent,
    COUNT(DISTINCT f.SalesKey) AS TotalOrders,
    ROUND(SUM(f.TotalAmount) * 1.0 / COUNT(DISTINCT f.SalesKey), 2) AS AverageOrderValue
FROM 
    dbo.FactSales f
JOIN 
    dbo.DimCustomer cu ON f.CustomerKey = cu.CustomerKey
JOIN 
    dbo.DimCountry c ON f.CountryKey = c.CountryKey
GROUP BY 
    c.Country, cu.CustomerID
ORDER BY 
    AverageOrderValue DESC;

