CREATE TABLE [中項目Wk] (
  [中項目CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [中項目] VARCHAR (255),
  [大項目CD] LONG,
  [勘定科目CD] LONG,
  [家計簿] BIT,
  [確定申告] BIT
)
