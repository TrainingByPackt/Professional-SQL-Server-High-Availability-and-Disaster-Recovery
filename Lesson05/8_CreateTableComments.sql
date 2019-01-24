-- To be executed at DPLPR
-- Creates a sample Comments table and populates it with dummy data
USE Sales
GO
DROP TABLE IF EXISTS Comments
GO
CREATE TABLE Comments
(
	ID int, 
	comment char(8000)
)
GO
WITH cte0 AS (SELECT 0 g UNION ALL SELECT 0)
    ,cte1 AS (SELECT 0 g FROM cte0 a CROSS JOIN cte0 b) 
    ,cte2 AS (SELECT 0 g FROM cte1 a CROSS JOIN cte1 b) 
    ,cte3 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte2 b) 
	,cte4 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte3 b) 
	,cte5 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte4 b) 
	,cte6 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte5 b) 
	,cte7 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte6 b) 
	,cte8 AS (SELECT 0 g FROM cte2 a CROSS JOIN cte7 b) 
    ,numbers as (Select ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) as num FROM cte7)
INSERT INTO Comments
(
	ID, comment
)
SELECT 
	num AS ID, 
	'Some comment' AS [comment]
FROM numbers
