IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Stg')
EXEC sys.sp_executesql N'CREATE SCHEMA [Stg]'
GO