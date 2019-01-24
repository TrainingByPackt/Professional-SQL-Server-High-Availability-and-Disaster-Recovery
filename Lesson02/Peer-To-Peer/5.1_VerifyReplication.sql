-- Node 1: Neptune\SQL2014
:setvar Publisher "Neptune\SQL2014"
-- Node 2: Neptune\SQL2016
:setvar Subscriber "Neptune\SQL2016"
:setvar DatabaseName "AdventureWorks"

-- Update a record at Node 1: Publisher
:CONNECT $(Subscriber)

USE $(DatabaseName)

PRINT 'Set OrderQty=11 at the publisher'

GO

UPDATE Sales.SalesOrderDetail SET OrderQty=110 WHERE SalesOrderDetailID=1

GO

SELECT @@ServerName As ServerName,OrderQty FROM Sales.SalesOrderDetail WHERE SalesOrderDetailID=1

GO


-- Give 5 seconds to replicate the transaction to the subscriber Node 2
WAITFOR DELAY '00:00:10'


:CONNECT $(Publisher)

USE $(DatabaseName)

GO

PRINT 'Get OrderQty at the publisher'

SELECT @@ServerName As ServerName,OrderQty FROM Sales.SalesOrderDetail WHERE SalesOrderDetailID=1

