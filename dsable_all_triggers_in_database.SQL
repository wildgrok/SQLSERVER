/*
https://jesspomfret.com/disable-all-triggers/
*/
/*
Hi.
 It looks like an elegant solution for this scenario and I like Powershell, but here the question: Why do you perform it by Powershell and not via T-SQL?
 I would imagine a simple T-SQL batch from SSMS before going through Powershell, something like the following:
— Select Active Triggers and prepare Disable and Enable T-SQL Statement and put into Temp Table
*/

 SELECT ‘ALTER TABLE [‘ + sc.name + ‘].[‘ + ta.name + ‘] DISABLE TRIGGER [‘ + tr.name + ‘];’ AS DisableTriggerStatement,
‘ALTER TABLE [‘ + sc.name + ‘].[‘ + ta.name + ‘] ENABLE TRIGGER [‘ + tr.name + ‘];’ AS EnableTriggerStatement
 INTO #Triggers
 FROM sys.triggers tr
 INNER JOIN sys.tables ta ON ta.object_id = tr.parent_id
 INNER JOIN sys.schemas sc ON sc.schema_id = ta.schema_id
 WHERE tr.is_disabled = 0;

— Perpare Variable Script for Execution
 DECLARE @Disable_Statement nvarchar(max) = (SELECT tmp.DisableTriggerStatement + CHAR(10) AS ‘data()’
FROM #Triggers tmp
 FOR XML PATH(”));

— Execute SQL
 EXECUTE sys.sp_executesql @Disable_Statement;

— Perpare Variable Script for Execution
 DECLARE @Enable_Statement nvarchar(max) = ( SELECT tmp.DisableTriggerStatement + CHAR(10) AS ‘data()’
FROM #Triggers tmp
 FOR XML PATH(”));

— Execute SQL
 EXECUTE sys.sp_executesql @Enable_Statement;

DROP TABLE #Triggers;
