--SELECT t.name AS tableName, 
--       s.name SchemaName 
--FROM   sys.tables AS t 
--       INNER JOIN sys.schemas AS s 
--               ON t.[schema_id] = s.[schema_id] 

SELECT  s.name + '.' + t.name AS tableName 
       --s.name SchemaName 
FROM   sys.tables AS t 
       INNER JOIN sys.schemas AS s 
               ON t.[schema_id] = s.[schema_id] 


 