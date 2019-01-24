-- Host: Neptune\SQL2016
-- Database: [AdventureWorks]
-- Table: [Sales].[SalesOrderHeader]
-- Column(s) SalesOrderNumber,TotalDue are not included in this script because they are of type(s) text, ntext, varchar(max), nvarchar(max), varbinary(max), image, timestamp, or xml. Columns of these types cannot be updated by tablediff utility scripts; therefore non-convergence of data can still occur after this script has been applied. If the tablediff utility output references any of these columns, you must update the columns manually if you want them to converge.
SET IDENTITY_INSERT [Sales].[SalesOrderHeader] ON
UPDATE [Sales].[SalesOrderHeader] SET [Freight]=500.0000 WHERE [SalesOrderID] = 43659
SET IDENTITY_INSERT [Sales].[SalesOrderHeader] OFF
