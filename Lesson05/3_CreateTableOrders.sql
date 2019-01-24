-- To be executed at DPLPR
-- Creates a sample Orders table and populates it with dummy data
USE Sales
GO
DROP TABLE IF EXISTS Orders
GO
CREATE TABLE Orders
(
	OrderID int identity, 
	OrderQty int,
	Price int,
	[Description] varchar(100)
)
GO
WITH cte0 AS (SELECT 0 g UNION ALL SELECT 0)
    ,cte1 AS (SELECT 0 g FROM cte0 a CROSS JOIN cte0 b) 
    ,cte2 AS (SELECT 0 g FROM cte1 a CROSS JOIN cte1 b) 
    ,cte3 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte2 b) 
    ,cte4 AS (SELECT 0 g FROM cte3 a CROSS JOIN cte3 b)
	,numbers as (Select ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) as num FROM cte4)
INSERT INTO Orders
(
	OrderQty,
	Price,
	[Description]
)
SELECT 
	num AS OrderQty, 
	num *2 AS Price, 
	'SomeDescription' AS [Description]
FROM numbers
