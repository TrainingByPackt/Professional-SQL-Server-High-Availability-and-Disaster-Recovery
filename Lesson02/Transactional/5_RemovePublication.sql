DECLARE @Database AS sysname;
DECLARE @Publication AS sysname;
SET @Database = N'AdventureWorks'; 
SET @Publication = N'AdventureWorks-Tran_Pub'; 

-- Remove Publication
USE [AdventureWorks]

EXEC sp_droppublication 
	@publication = @publication;

-- Remove replication objects from the database.
USE [master]
EXEC sp_replicationdboption 
  @dbname = @Database, 
  @optname = N'publish', 
  @value = N'false';
GO