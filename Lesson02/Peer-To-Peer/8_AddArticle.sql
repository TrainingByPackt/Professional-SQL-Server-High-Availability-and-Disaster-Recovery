-- Node 1: Neptune\SQL2014
:setvar Publisher "Neptune\SQL2014"
-- Node 2: Neptune\SQL2016
:setvar Subscriber "Neptune\SQL2016"
:setvar DatabaseName "AdventureWorks"
:setvar PublicationName "P2P_AdventureWorks"
:setvar Article "SalesOrderDetail"
:setvar ArticleOwner "Sales"

-- Add the article from Node 1
:CONNECT $(Publisher)

USE $(DatabaseName)

GO

EXEC sp_addarticle 
  @publication = "$(PublicationName)", 
  @article = "$(Article)", 
  @source_owner = "$(ArticleOwner)", 
  @source_object = "$(Article)", 
  @destination_table = "$(Article)", 
  @destination_owner = "$(ArticleOwner)"

GO

EXEC sp_addsubscription 
  @publication = "$(PublicationName)", 
  @subscriber = "$(Subscriber)", 
  @destination_db = "$(DatabaseName)", 
  @reserved='Internal' 

GO

WAITFOR DELAY '00:00:5'

GO

-- Add the article from Node 2

:CONNECT $(Subscriber)

USE $(DatabaseName)

GO

EXEC sp_addarticle 
  @publication = "$(PublicationName)", 
  @article = "$(Article)", 
  @source_owner = "$(ArticleOwner)", 
  @source_object = "$(Article)", 
  @destination_table = "$(Article)", 
  @destination_owner = "$(ArticleOwner)"

GO

EXEC sp_addsubscription 
  @publication = "$(PublicationName)", 
  @subscriber = "$(Publisher)", 
  @destination_db = "$(DatabaseName)", 
  @reserved='Internal' 
