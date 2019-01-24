-- To be run at DPLDR
-- Simulates a large report that runs at secondary replica
USE Sales
GO
SELECT 
	COUNT_BIG(*) 
FROM orders a, orders b,orders c