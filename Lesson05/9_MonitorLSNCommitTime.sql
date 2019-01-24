-- Monitor the redo queue at the secondary replica
SELECT 
	ag.name AS AvailabilityGroup,
	ar.replica_server_name AS ReplicaName,
	ars.role_desc,
	d.name AS DatabaseName,
	drs.log_send_queue_size,
	drs.log_send_rate,
	drs.redo_queue_size,
	drs.redo_rate,
	drs.last_commit_lsn,
	drs.last_commit_time,
	drs.secondary_lag_seconds
FROM 
sys.availability_groups ag join sys.availability_replicas ar 
on ag.group_id=ar.group_id
join sys.dm_hadr_availability_replica_states ars 
on ars.replica_id=ars.replica_id
join sys.dm_hadr_database_replica_states drs
on ar.replica_id=drs.replica_id and drs.replica_id = ars.replica_id
join sys.databases d 
on d.database_id=drs.database_id 
WHERE d.name = 'Sales' 