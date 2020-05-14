/*
List Tables with Foreign Key Constraint in a SQL Server Database
http://zarez.net/?p=3221
*/


SELECT fk.name AS Foreign_Key,
SCHEMA_NAME(fk.schema_id) AS Schema_Name,
OBJECT_NAME(fk.parent_object_id) AS Table_Name,
SCHEMA_NAME(o.schema_id) Referenced_Schema_Name,
OBJECT_NAME (fk.referenced_object_id) AS Referenced_Table_Name
FROM sys.foreign_keys fk
INNER JOIN sys.objects o ON fk.referenced_object_id = o.object_id
ORDER BY Table_Name