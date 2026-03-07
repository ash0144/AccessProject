CREATE TABLE [収納場所_小分類] (
  [小分類CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [小分類] VARCHAR (255),
  [中分類CD] LONG CONSTRAINT [収納場所_中分類収納場所_小分類] REFERENCES [収納場所_中分類] ([中分類CD]),
  [備考] VARCHAR (255)
)
