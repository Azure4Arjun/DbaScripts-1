
SELECT [schema] = s.name, [table] = t.name
, [Rows] = SUM(p.row_count)
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
  ON s.schema_id = t.schema_id
INNER JOIN sys.dm_db_partition_stats AS p
  ON p.object_id = t.object_id
    AND p.index_id <= 1
GROUP BY s.name, t.name
ORDER BY [schema], [table]