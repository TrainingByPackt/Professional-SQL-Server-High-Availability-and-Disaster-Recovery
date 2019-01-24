-- drop subscription 
-- you'll have to change the @publication and @subscriber parameter values as per your environment
-- execute the below queries at the publisher

-- drop subscription 
DECLARE @publication AS sysname;
DECLARE @subscriber AS sysname;
SET @publication = N'Pub-AdventureWorks';
SET @subscriber = 'Windows10Ent\SQL2014';

USE [AdventureWorks]

EXEC sp_dropsubscription 
  @publication = @publication, 
  @article = N'all',
  @subscriber = @subscriber;
GO

-- drop publication
DECLARE @Database AS sysname;
DECLARE @Publication AS sysname;
SET @Database = N'AdventureWorks'; 
SET @Publication = N'Pub-AdventureWorks'; 

-- Remove Publication
USE [AdventureWorks]

EXEC sp_droppublication 
  @publication = @publication;
