USE [master]
GO

/****** Object:  LinkedServer [GENESIS_UATCDT1]    Script Date: 5/29/2019 4:52:06 PM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'GENESIS_UATCDT1', @srvproduct=N'UATCDT1', @provider=N'OraOLEDB.Oracle', @datasrc=N'UATCDT1'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'GENESIS_UATCDT1',@useself=N'False',@locallogin=NULL,@rmtuser=N'genesis',@rmtpassword='Carnival_2019'

GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'GENESIS_UATCDT1', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


