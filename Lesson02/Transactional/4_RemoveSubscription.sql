DECLARE @publication AS sysname;
DECLARE @subscriber AS sysname;
SET @publication = N'AdventureWorks-Tran_Pub';
SET @subscriber = 'Neptune\SQL2014';

USE [AdventureWorks]

EXEC sp_dropsubscription 
  @publication = @publication, 
  @article = N'all',
  @subscriber = @subscriber;
GO