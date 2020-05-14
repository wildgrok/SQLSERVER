use [master]

select T.id as [Id],
       case T.status when 0 then N'stopped' else N'running' end as [Status],
       T.path as [Path],
       case T.is_rowset when 0 then N'false' else N'true' end as [Rowset],
       case T.is_shutdown when 0 then N'disabled' else N'enabled' end as [Shutdown option],
       T.start_time as [Start],
       T.stop_time as [Stop]
from sys.traces as T
where T.is_default <> 1;