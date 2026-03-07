CREATE TABLE [収納場所_中分類] (
  [中分類CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [中分類] VARCHAR (255),
  [大分類CD] LONG CONSTRAINT [収納場所_大分類収納場所_中分類] REFERENCES [収納場所_大分類] ([大分類CD])
)
