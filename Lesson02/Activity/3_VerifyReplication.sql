USE AdventureWorks
GO
-- Run at the publisher
SELECT [Status] from Sales.SalesOrderHeader WHERE SalesOrderID=43659

GO

Update Sales.SalesOrderHeader SET [Status]=3 WHERE SalesOrderID=43659

GO

SELECT [Status] from Sales.SalesOrderHeader WHERE SalesOrderID=43659

GO

-- Run at the subscriber
-- The status should be changed to 3.
USE AdventureWorks
GO
SELECT [Status] from Sales.SalesOrderHeader WHERE SalesOrderID=43659

GO