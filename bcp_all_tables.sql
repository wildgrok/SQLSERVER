set nocount on

DECLARE @Commands TABLE(CommandText NVARCHAR(4000));
DECLARE @SQL NVARCHAR(4000);

INSERT INTO @Commands
SELECT 'EXEC xp_cmdshell ''bcp '           --bcp
+  QUOTENAME(DB_NAME())+ '.'               --database name
+  QUOTENAME(SCHEMA_NAME(SCHEMA_ID))+ '.'  -- schema
+  QUOTENAME(name)                         -- table
+ ' out c:\temp\'                          -- output directory
+  REPLACE(SCHEMA_NAME(schema_id),' ','') + '_'
+  REPLACE(name,' ','')                    -- file name
+ '.txt -T -c'''   -- extension, security
FROM sys.tables


WHILE (SELECT COUNT(*) FROM @Commands) > 0
BEGIN --Command Processing
    SET @SQL = (SELECT TOP 1 CommandText FROM @Commands)
    PRINT (@SQL)
    --EXEC (@SQL)
    DELETE FROM @Commands WHERE CommandText = @SQL
END