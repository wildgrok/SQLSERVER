SELECT  TE.* ,t.*, sp.*
FROM    sys.fn_trace_gettable
(CONVERT(VARCHAR(150), (SELECT TOP 1 f.[value] FROM sys.fn_trace_getinfo(NULL) f WHERE f.property = 2) ), DEFAULT) T
 JOIN sys.trace_events TE ON T.EventClass = TE.trace_event_id
--WHERE   te.name = 'ErrorLog'
join sys.sysprocesses sp on
	sp.spid = t.spid
--where t.textdata is not null