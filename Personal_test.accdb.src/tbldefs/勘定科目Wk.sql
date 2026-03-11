CREATE TABLE [勘定科目Wk] (
  [勘定科目CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [勘定科目] VARCHAR (255),
  [勘定分類CD] LONG,
  [中項目CD] LONG
)
