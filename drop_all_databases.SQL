-- =============================================
-- Declare and using a READ_ONLY cursor
-- =============================================
DECLARE C1 CURSOR
READ_ONLY
FOR select name from sysdatabases where dbid > 4

DECLARE @name varchar(100)
OPEN C1

FETCH NEXT FROM C1 INTO @name
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
--		PRINT 'add user defined code here'
--		eg.
		DECLARE @message varchar(100)
		SELECT @message = 'DROP DATABASE [' + @name + ']'
		PRINT @message
	END
	FETCH NEXT FROM C1 INTO @name
END

CLOSE C1
DEALLOCATE C1
GO

