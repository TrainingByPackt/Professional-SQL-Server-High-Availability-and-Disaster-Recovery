-- Host: Neptune\SQL2014
-- Database: [AdventureWorks]
-- Table: [Sales].[Store]
-- Column(s) Demographics are not included in this script because they are of type(s) text, ntext, varchar(max), 
-- nvarchar(max), varbinary(max), image, timestamp, or xml. Columns of these types cannot be updated by tablediff utility scripts; 
-- therefore non-convergence of data can still occur after this script has been applied. 
-- If the tablediff utility output references any of these columns, you must update the columns manually 
-- if you want them to converge.
INSERT INTO [Sales].[Store] ([BusinessEntityID],[ModifiedDate],[Name],[rowguid],[SalesPersonID]) 
VALUES (292,N'2014-09-12 11:15:07.497',N'Next-Door Bike Store','a22517e3-848d-4ebe-b9d9-7437f3432304',276)
