USE AdventureWorks
GO
IF OBJECT_ID('Sales.usp_Del_SalesOrderDetail') IS NOT NULL
BEGIN
DROP PROCEDURE Sales.usp_Del_SalesOrderDetail
END;
GO
CREATE PROCEDURE Sales.usp_Del_SalesOrderDetail
AS
WITH Del AS 
(
	SELECT TOP(100000) * FROM Sales.SalesOrderDetail
	ORDER BY SalesOrderDetailID, SalesOrderID
) 
DELETE FROM Del

