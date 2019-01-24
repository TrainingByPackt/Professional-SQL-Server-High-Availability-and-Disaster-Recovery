USE AdventureWorks
GO
Declare @cnt int = 1
While (@cnt<=50)
BEGIN
UPDATE Sales.SalesOrderHeader SET Freight =  550
WHERE SalesOrderID =43659
set @cnt =  @cnt + 1;
END