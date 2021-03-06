USE [aap];
GO

-- List all statistics on the table
SELECT	s.object_id, s.name, s.auto_created,
		COL_NAME(s.object_id, sc.column_id) AS col_name
FROM	sys.stats AS s
		INNER JOIN sys.stats_columns AS sc
		ON s.stats_id = sc.stats_id
			AND s.object_id = sc.object_id
WHERE   s.object_id = OBJECT_ID('dbo.ACCRUAL');

-- Show an overview of one specified statistic object
DBCC SHOW_STATISTICS(N'dbo.ACCRUAL', IX_ACCRUAL_STATUSID)
WITH STAT_HEADER;
GO

-- Show the detailed histogram of one specified statistic object
DBCC SHOW_STATISTICS(N'dbo.ACCRUAL', IX_ACCRUAL_STATUSID)
WITH HISTOGRAM;
GO