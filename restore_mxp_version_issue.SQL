Jorge,
     Please follow these short-term steps to get the MXP database restored on the new UAT Shared DB Server.
 
(1)    RDP into CCLUATDTSDB5  (Carnival.com UAT 5 server)
(2)    Launch the NetBackup Client (Please right-click and run as Administrator, otherwise you will get errors)
(3)    Restore from CCLPRDSHRD2CL1 – The AG name will come up and you can choose the MXP database
(4)    Restore the MXP database to the CCLUATDTSDB5 server temporarily – This server has space and is on the same version of SQL Server (SQL 2016 SP2-CU7)
(5)    Then you can make a compressed backup of this MXP database and copy  this backup to the final destination server CCLUATSHRD2DB1 
(6)    Once the restoration is done at the final location, please drop the MXP database and the backup from the CCLUATDTSDB5 Server 
 
