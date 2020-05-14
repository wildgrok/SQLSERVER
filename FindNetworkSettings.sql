DECLARE @InstanceName nvarchar(50)
DECLARE @value VARCHAR(100)
DECLARE @value_Out VARCHAR(100)
DECLARE @RegKey_InstanceName nvarchar(500)
DECLARE @RegKey nvarchar(500)

SET @InstanceName=CONVERT(nVARCHAR,isnull(SERVERPROPERTY('INSTANCENAME'),
'MSSQLSERVER'))

CREATE TABLE #SQLServerProtocols
(ProtocolName nvarchar(25),
Value nvarchar(10),
Data bit)

if(SELECT Convert(varchar(1),(SERVERPROPERTY('ProductVersion'))))<>8
BEGIN
SET @RegKey_InstanceName='SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL'

EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey_InstanceName,
  @value_name = @InstanceName,
  @value = @value OUTPUT

SET @RegKey='SOFTWARE\Microsoft\Microsoft SQL Server\'+@value+'\MSSQLServer\SuperSocketNetLib\Sm'
Insert into #SQLServerProtocols (Value,Data)
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'Enabled'
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'DisplayName',
  @value = @value_Out OUTPUT
UPDATE #SQLServerProtocols set ProtocolName=@value_Out 
where ProtocolName is null


SET @RegKey='SOFTWARE\Microsoft\Microsoft SQL Server\'+@value+'\MSSQLServer\SuperSocketNetLib\Np'
Insert into #SQLServerProtocols (Value,Data)
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'Enabled'
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'DisplayName',
  @value = @value_Out OUTPUT
UPDATE #SQLServerProtocols set ProtocolName=@value_Out
where ProtocolName is null

SET @RegKey='SOFTWARE\Microsoft\Microsoft SQL Server\'+@value+'\MSSQLServer\SuperSocketNetLib\TCP'
Insert into #SQLServerProtocols (Value,Data)
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'Enabled'
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'DisplayName',
  @value = @value_Out OUTPUT
UPDATE #SQLServerProtocols set ProtocolName=@value_Out 
where ProtocolName is null

SET @RegKey='SOFTWARE\Microsoft\Microsoft SQL Server\'+@value+'\MSSQLServer\SuperSocketNetLib\Via'
Insert into #SQLServerProtocols (Value,Data)
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'Enabled'
EXECUTE xp_regread
  @rootkey = 'HKEY_LOCAL_MACHINE',
  @key = @RegKey,
  @value_name = 'DisplayName',
  @value = @value_Out OUTPUT
UPDATE #SQLServerProtocols set ProtocolName=@value_Out 
where ProtocolName is null
END

SELECT ProtocolName, IsEnabled=CASE WHEN Data=1 THEN 'Enabled' 
ELSE 'Disabled' END FROM #SQLServerProtocols

DROP TABLE #SQLServerProtocols


/*
Shared Memory	Enabled
Named Pipes	Disabled
TCP/IP	Enabled
VIA	Disabled

*/