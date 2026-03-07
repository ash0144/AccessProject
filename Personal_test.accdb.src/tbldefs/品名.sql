CREATE TABLE [品名] (
  [品名CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [品名] VARCHAR (255),
  [収納場所CD] LONG,
  [使用場所CD] LONG CONSTRAINT [用途キャンプ用品] REFERENCES [使用場所] ([使用場所CD]),
  [用途CD] LONG CONSTRAINT [分類キャンプ用品] REFERENCES [用途] ([用途CD]),
  [備考] VARCHAR (255)
)
