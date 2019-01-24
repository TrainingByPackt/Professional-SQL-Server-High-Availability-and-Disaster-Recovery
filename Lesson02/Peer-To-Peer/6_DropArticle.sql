-- Node 1: Neptune\SQL2014
:setvar Publisher "Neptune\SQL2014"
-- Node 2: Neptune\SQL2016
:setvar Subscriber "Neptune\SQL2016"
:setvar DatabaseName "AdventureWorks"
:setvar PublicationName "P2P_AdventureWorks"
:setvar Article "SalesOrderDetail"


-- Drop the article from Node 1
:CONNECT $(Publisher)

USE $(DatabaseName)

GO

sp_dropsubscription
 @publication = "$(PublicationName)",
 @article = "$(Article)",
 @subscriber = "$(Subscriber)",
 @destination_db = "$(DatabaseName)";
GO

EXEC sp_droparticle
 @publication = "$(PublicationName)",
 @article = "$(Article)"


GO

WAITFOR DELAY '00:00:5'

GO

-- Drop the article from Node 2

:CONNECT $(Subscriber)

USE $(DatabaseName)

GO

sp_dropsubscription
 @publication = "$(PublicationName)",
 @article = "$(Article)",
 @subscriber = "$(Publisher)",
 @destination_db = "$(DatabaseName)";
GO

EXEC sp_droparticle
 @publication = "$(PublicationName)",
 @article = "$(Article)" 
