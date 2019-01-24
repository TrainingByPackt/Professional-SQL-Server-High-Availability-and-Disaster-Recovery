param
(
[Parameter(Mandatory=$True)]
[String]$SubscriberServer,
[Parameter(Mandatory=$True)]
[String]$SubscriberDB,
[Parameter(Mandatory=$True)]
[String]$SQLUserName,
[Parameter(Mandatory=$True)]
[String]$SQLUserPassword
)

$Query = "IF OBJECT_ID('vw_orders','V') IS NOT NULL
BEGIN
DROP VIEW vw_orders
END
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
CREATE UNIQUE CLUSTERED INDEX ix_vw_orders_customerid ON vw_orders(customerid)"

TRY
{
    Invoke-Sqlcmd -ServerInstance $SubscriberServer -Database $SubscriberDB -Username $SQLUserName -Password $SQLUserPassword -Query $Query -ErrorAction Stop | Out-Null
    CD C:\
}
Catch
{
Write-Host $
}
