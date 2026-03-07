CREATE TABLE [コーヒー豆] (
  [コーヒー豆CD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [コーヒー豆] VARCHAR (255),
  [焙煎度] VARCHAR (255),
  [特徴] VARCHAR (255),
  [個人的評価] LONG,
  [焙煎日] DATETIME,
  [購入日] DATETIME,
  [評価日] DATETIME,
  [購入店] VARCHAR (255),
  [100g価格] LONG,
  [感想他] VARCHAR (255)
)
