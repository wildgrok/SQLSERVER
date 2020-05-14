SELECT path AS [Default Trace File]
	,max_size AS [Max File Size of Trace File]
	,max_files AS [Max No of Trace Files]
	,start_time AS [Start Time]
	,last_event_time AS [Last Event Time]
FROM sys.traces
WHERE is_default = 1
GO