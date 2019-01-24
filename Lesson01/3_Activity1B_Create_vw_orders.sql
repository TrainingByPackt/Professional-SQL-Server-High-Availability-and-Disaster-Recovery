SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW vw_orders
WITH SCHEMABINDING
AS
SELECT 
	O.CustomerID,
	Sum(isnull(ol.Quantity,0)) AS TotalQuantity,
	Sum(isnull(ol.unitprice,0)) as price,
	COUNT_BIG(*) AS row_count
FROM Sales.Orders o 
JOIN Sales.OrderLines ol ON o.OrderID=ol.OrderID
GROUP BY o.CustomerID
GO
CREATE UNIQUE CLUSTERED INDEX ix_vw_orders_customerid ON vw_orders(customerid)