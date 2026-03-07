CREATE TABLE [スーパー] (
  [スーパーCD] LONG CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [店名] VARCHAR (255),
  [店舗規模] VARCHAR (255),
  [特徴] VARCHAR (255),
  [個人的評価] LONG
)
