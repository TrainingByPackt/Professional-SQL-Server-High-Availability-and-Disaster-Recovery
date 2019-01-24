:setvar Subscriber "Neptune\SQL2014"
:setvar DatabaseName "AdventureWorks"

:CONNECT $(Subscriber)

use $(DatabaseName)
GO

DELETE FROM Sales.Currency WHERE CurrencyCode='TST'
GO