
--Get Backup File list information (NOTE: path may need to be updated each time)
RESTORE FILELISTONLY 
   FROM DISK = '\\Cclprddtsdb1d\sqlbackups\SQLBackupUser\CCL_Guest_Loyalty_backup_2019_06_24_000000_3665709 .bak'
GO

SET NOCOUNT ON RESTORE HEADERONLY 
FROM DISK  = '\\Cclprddtsdb1d\sqlbackups\SQLBackupUser\CCL_Guest_Loyalty_backup_2019_06_24_000000_3665709 .bak'