:setvar Publisher "Neptune\SQL2016"
:setvar Subscriber "Neptune\SQL2014"
:setvar Distributor "Neptune\SQL2016"
:setvar DatabaseName "AdventureWorks"
:setvar PublicationName "AdventureWorks-Tran_Pub"

:CONNECT $(Subscriber)

USE $(DatabaseName)

-- drop the procedure
IF OBJECT_ID('sp_MSins_HumanResourcesShift') IS NOT NULL
DROP PROCEDURE sp_MSins_HumanResourcesShift
GO

:CONNECT $(Publisher)

-- insert a row in shift table 
-- This will result in error as the subscriber procedure doesn't exists.

USE $(DatabaseName)
GO

INSERT INTO [HumanResources].[Shift]
           ([Name]
           ,[StartTime]
           ,[EndTime]
           ,[ModifiedDate]
           ,[IsActive]
           ,[CreateDate])
     VALUES
           ('DN'
           ,'13:00:00.0000000'
           ,'17:00:00.0000000'
           ,GETUTCDATE()
           ,1
           ,GETUTCDATE()
GO

