-- Node 1: Neptune\SQL2014
:setvar Publisher "Neptune\SQL2014"
-- Node 2: Neptune\SQL2016
:setvar Subscriber "Neptune\SQL2016"
:setvar DatabaseName "AdventureWorks"
:setvar PublicationName "P2P_AdventureWorks"

:CONNECT $(Publisher)

USE $(DatabaseName)
go
sp_helparticle @publication = "$(PublicationName)"

GO

:CONNECT $(Subscriber)

USE $(DatabaseName)
GO
sp_helparticle @publication = "$(PublicationName)"