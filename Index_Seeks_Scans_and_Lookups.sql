use <mydatabase>
go

select		o.name as 'Table'
,			i.name as 'Index'
,			i.rowcnt as 'Est Rows'
,			u.user_seeks as 'Seeks'
,			u.user_scans as 'Scans'
,			u.user_lookups as 'Lookups'
from		sys.dm_db_index_usage_stats as u
inner join	sys.sysobjects as o
				on u.object_id = o.id
				and o.xtype = 'U'
inner join	sys.sysindexes as i
				on u.index_id = i.indid
				and o.id = i.id
where		u.user_scans > 0
and			i.rowcnt >= 1000
order by	u.user_scans desc
go