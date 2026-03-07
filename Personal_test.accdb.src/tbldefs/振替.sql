CREATE TABLE [振替] (
  [振替CD] VARCHAR (255) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [内容] VARCHAR (255),
  [支払先] VARCHAR (255),
  [支払分類] VARCHAR (255),
  [支払方法] VARCHAR (255),
  [金融機関コード] VARCHAR (255),
  [契約番号] VARCHAR (255),
  [支払日] VARCHAR (255),
  [目安金額] LONG
)
