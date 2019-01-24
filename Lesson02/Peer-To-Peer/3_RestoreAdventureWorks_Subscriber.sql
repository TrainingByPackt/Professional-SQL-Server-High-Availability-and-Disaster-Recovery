-- Restore AdventureWorks on Subscriber  
USE [master] 
GO
RESTORE DATABASE [AdventureWorks] FROM DISK = 
N'C:\Code\Lesson03\Backup\AdventureWorks_Publisher.bak' WITH FILE = 1, 
MOVE N'AdventureWorks2014_Data' TO N'E:\AdventureWorks\AdventureWorks2016_subs_Data.mdf', 
MOVE N'AdventureWorks2014_Log' TO N'E:\AdventureWorks\AdventureWorks2016_subs_Log.ldf', 
stats = 10 





