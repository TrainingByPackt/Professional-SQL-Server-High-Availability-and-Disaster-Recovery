:setvar Publisher "WIN2012R2\SQL2016"
:setvar Subscriber "WIN2012R2\SQL2014"
:setvar Distributor "WIN2012R2\SQL2016"
:setvar DatabaseName "AdventureWorks"
:setvar PublicationName "AdventureWorks-Tran_Pub"

-- Drop all subscriptions before dropping publication

-- connect to subscriber and drop the pull subscription
:CONNECT $(Subscriber)

USE $(DatabaseName)
GO
EXECUTE sp_droppullsubscription 
	 @publisher="$(Publisher)"
    ,@publisher_db="$(DatabaseName)"
    ,@publication="$(PublicationName)"

GO
-- Drop the subscription from the publisher and remove metadata from 
-- the distribution database
:CONNECT $(Publisher)

USE $(DatabaseName)
GO
EXECUTE sp_dropsubscription 
	 @publication = "$(PublicationName)"
	,@article = N'all'
	,@subscriber = "$(Subscriber)";

GO


-- stop the log reader agent first
DECLARE @jobname NVARCHAR(200)
SELECT @jobname=name FROM [distribution].[dbo].[MSlogreader_agents]
WHERE [publisher_db]='$(DatabaseName)'

Print 'Stopping the Log Reader Agent ' + @jobname + '....'

EXECUTE msdb.dbo.sp_stop_job @job_name=@jobname

GO

-- drop the publication
Print 'Dropping Publication....' 

EXECUTE sp_droppublication @publication="$(PublicationName)"
