CREATE TABLE [中項目] (
  [中項目CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [中項目] VARCHAR (255),
  [大項目CD] LONG CONSTRAINT [大項目中項目] REFERENCES [大項目] ([大項目CD]),
  [勘定科目CD] LONG CONSTRAINT [勘定科目中項目] REFERENCES [勘定科目] ([勘定科目CD]),
  [家計簿] BIT,
  [確定申告] BIT
)
