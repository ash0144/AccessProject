CREATE TABLE [勘定科目] (
  [勘定科目CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [勘定科目] VARCHAR (255),
  [勘定分類CD] LONG CONSTRAINT [勘定分類勘定科目] REFERENCES [勘定分類] ([勘定分類CD]),
  [中項目CD] LONG
)
