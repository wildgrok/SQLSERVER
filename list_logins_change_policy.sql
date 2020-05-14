set nocount on
go
select '--servername:' 
select '--' + @@servername


SELECT 'ALTER LOGIN ' + QuoteName(name) + ' WITH CHECK_POLICY = ON;' 
FROM sys.server_principals
WHERE [type] = 'S' -- SQL Server Logins only
and left(name, 2) <> '##'
AND principal_id > 1  -- not sa - omit this line if you want to include it
order by name