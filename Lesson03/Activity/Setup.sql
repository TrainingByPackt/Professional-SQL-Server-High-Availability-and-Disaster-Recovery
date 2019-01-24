:setvar Subscriber "Neptune\SQL2014"
:setvar Publisher "Neptune\SQL2016"
:setvar DatabaseName "AdventureWorks"

:CONNECT $(Subscriber)

use $(DatabaseName)
GO


INSERT INTO Sales.Currency VALUES ('TST','Test Currency',Getdate())
GO

:CONNECT $(Publisher)

use $(DatabaseName)
GO

INSERT INTO Sales.Currency VALUES ('TST','Test Currency',Getdate())
