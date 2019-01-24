-- Run at publisher
USE AdventureWorks

-- backup the table for reuse 
SELECT * INTO dbo.salesorderdetail FROM sales.salesorderdetail
GO
DELETE TOP(100000) FROM Sales.SalesOrderDetail