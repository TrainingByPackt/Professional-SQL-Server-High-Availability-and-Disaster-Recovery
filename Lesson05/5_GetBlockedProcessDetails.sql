-- To be run at DPLDR
-- Returns blocked process details
SELECT 
	session_id AS blocked_session_id, 
	blocking_Session_id, 
	command as blocked_session_command,
	wait_type as blocked_session_wait_type,
	db_name(database_id) AS database_name, 
	wait_resource
FROM sys.dm_exec_requests where blocking_session_id>0


