SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.Util_ListIndexes', 'U') IS NOT NULL DROP PROCEDURE dbo.Util_ListIndexes
GO

/**
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
Util_ListIndexes.sql
By Jesse Roberge - YeshuaAgapao@Yahoo.com

Lists details for all indexes on one or more tables / schemas, including row count and size.
If you want data types and other column information and one row per index instead of one row per member column,
  then use Util_ListIndexes_Columns instead.

Required Input Parameters
	none

Optional Input Parameters
	@SchemaName sysname=''		Filters to a single schema.  Can use LIKE wildcards.  All schemas if blank.  Accepts LIKE Wildcards.
	@TableName sysname=''		Filters to a single table.  Can use LIKE wildcards.  All tables if blank.  Accepts LIKE Wildcards.

Usage
	EXECUTE Util_ListIndexes 'dbo', 'Cart'

Copyright:
	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    see <http://www.fsf.org/licensing/licenses/lgpl.html> for the license text.

*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
**/

CREATE PROCEDURE dbo.Util_ListIndexes
	@SchemaName sysname='',
	@TableName sysname=''
AS

SELECT
	sys.schemas.schema_id, sys.schemas.name AS schema_name,
	sys.objects.object_id, sys.objects.name AS object_name,
	sys.indexes.index_id, ISNULL(sys.indexes.name,'---') AS index_name,
	sys.indexes.type, sys.indexes.type_desc,
	partitions.Rows, partitions.SizeMB,
	sys.indexes.is_unique, sys.indexes.is_primary_key, sys.indexes.is_unique_constraint,
	ISNULL(Index_Columns.index_columns_key, '---') AS index_columns_key,
	ISNULL(Index_Columns.index_columns_include, '---') AS index_columns_include
FROM
	sys.objects
	JOIN sys.schemas ON sys.objects.schema_id=sys.schemas.schema_id
	JOIN sys.indexes ON sys.objects.object_id=sys.indexes.object_id
	JOIN (
		SELECT
			object_id, index_id, SUM(row_count) AS Rows,
			CONVERT(numeric(19,3), CONVERT(numeric(19,3), SUM(in_row_reserved_page_count+lob_reserved_page_count+row_overflow_reserved_page_count))/CONVERT(numeric(19,3), 128)) AS SizeMB
		FROM sys.dm_db_partition_stats
		GROUP BY object_id, index_id
	) AS partitions ON sys.indexes.object_id=partitions.object_id AND sys.indexes.index_id=partitions.index_id
	CROSS APPLY (
		SELECT
			LEFT(index_columns_key, LEN(index_columns_key)-1) AS index_columns_key,
			LEFT(index_columns_include, LEN(index_columns_include)-1) AS index_columns_include
		FROM
			(
				SELECT
					(
						SELECT sys.columns.name + ', '
						FROM
							sys.index_columns
							JOIN sys.columns ON
								sys.index_columns.column_id=sys.columns.column_id
								AND sys.index_columns.object_id=sys.columns.object_id
						WHERE
							sys.index_columns.is_included_column=0
							AND sys.indexes.object_id=sys.index_columns.object_id AND sys.indexes.index_id=sys.index_columns.index_id
						ORDER BY key_ordinal
						FOR XML PATH('')
					) AS index_columns_key,
					(
						SELECT sys.columns.name + ', '
						FROM
							sys.index_columns
							JOIN sys.columns ON
								sys.index_columns.column_id=sys.columns.column_id
								AND sys.index_columns.object_id=sys.columns.object_id
						WHERE
							sys.index_columns.is_included_column=1
							AND sys.indexes.object_id=sys.index_columns.object_id AND sys.indexes.index_id=sys.index_columns.index_id
						ORDER BY index_column_id
						FOR XML PATH('')
					) AS index_columns_include
			) AS Index_Columns
	) AS Index_Columns
WHERE
	sys.schemas.name LIKE CASE WHEN @SchemaName='' THEN sys.schemas.name ELSE @SchemaName END
	AND sys.objects.name LIKE CASE WHEN @TableName='' THEN sys.objects.name ELSE @TableName END
ORDER BY sys.schemas.name, sys.objects.name, sys.indexes.name
GO

--*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=

