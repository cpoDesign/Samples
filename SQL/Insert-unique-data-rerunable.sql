DROP TABLE IF EXISTS #NameTableTemp

CREATE TABLE #NameTableTemp
(
 [TempTableKey] nchar(1),
 [ColumnName] nvarchar(255)
)

INSERT INTO #NameTableTemp 
(
 TempTableKey,
 [ColumnName]
)
VALUES 
 (N'Key1', N'Value1'),
 (N'Key1', N'Value2'),

INSERT INTO [Shema].[NameTable] (TempTableKey,
[ColumnName])
 SELECT
     b.TempTableKey,
     b.[ColumnName]
 FROM #NameTableTemp b
 LEFT JOIN [Shema].[NameTable] a
     ON a.[ColumnName] = b.[ColumnName]
         WHERE a.[ColumnName] IS NULL

DROP TABLE IF EXISTS #NameTableTemp

--GO
