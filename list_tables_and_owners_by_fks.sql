with        cte (lvl,object_id,name)
            as 
            (
                select      1
                           ,tb.object_id
                           --,tb.name as 'name'
						    ,s.name + '.' + tb.name AS name 
                from        sys.tables as tb
				JOIN sys.schemas AS s 
				ON tb.[schema_id] = s.[schema_id] 
                where       tb.type_desc       = 'USER_TABLE'
                        and tb.is_ms_shipped   = 0
                union all
                select      cte.lvl + 1
                           ,t.object_id
                           --,t.name
						    ,s.name + '.' + t.name AS name 
                from       cte
                join  sys.tables  as t
                on  exists
                (
                     select      null
                     from        sys.foreign_keys    as fk
                     where       fk.parent_object_id     = t.object_id 
                     and fk.referenced_object_id = cte.object_id
                )
				
                and cte.lvl < 30
				JOIN sys.schemas AS s
				ON t.[schema_id] = s.[schema_id] 
                and t.object_id <> cte.object_id
                where       
					t.type_desc = 'USER_TABLE'      
                    and t.is_ms_shipped = 0
            )

select      name
           ,max (lvl)   as dependency_level
from        cte
group by    name
order by    dependency_level
           ,name
;

/*
SELECT  s.name + '.' + tb.name AS name 
FROM   sys.tables AS tb 
       INNER JOIN sys.schemas AS s 
               ON tb.[schema_id] = s.[schema_id] 
*/