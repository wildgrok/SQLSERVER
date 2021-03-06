SET NOCOUNT ON
SELECT 'CREATE LOGIN [' + loginname + '] WITH PASSWORD= ',
cast(password AS varbinary(256)) , ' HASHED, DEFAULT_DATABASE=[' + dbname + '], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF'
FROM syslogins
WHERE name NOT IN ('sa')
AND name NOT LIKE ('##%')
AND isntname = 0


--Sample:
--CREATE LOGIN [JESSICAY]  WITH PASSWORD= 0x01005D5D5C24114200475A1BF57870DC7605F341CF3C0055702E  HASHED ,DEFAULT_DATABASE=[SIEBELDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF   