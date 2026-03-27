CREATE TABLE [MoneyForward] (
  [計算対象] LONG,
  [日付] DATETIME,
  [内容] VARCHAR (255),
  [金額] DOUBLE,
  [保有金融機関] VARCHAR (255),
  [大項目] VARCHAR (255),
  [中項目] VARCHAR (255),
  [メモ] VARCHAR (255),
  [振替] LONG,
  [ID] VARCHAR (255) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [中項目CD] LONG
)
