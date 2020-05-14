select dc.database_name, d.synchronization_health_desc, d.synchronization_state_desc, d.database_state_desc 
from sys.dm_hadr_database_replica_states d join sys.availability_databases_cluster dc on d.group_database_id=dc.group_database_id and d.is_local=1