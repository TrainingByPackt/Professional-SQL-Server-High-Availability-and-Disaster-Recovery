USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'Alerts', 
		@enabled=1, 
		@weekday_pager_start_time=80000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=80000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=80000, 
		@sunday_pager_end_time=180000, 
		@pager_days=127, 
		@email_address=N'dba-group@dataplatformlabs.com'
GO
