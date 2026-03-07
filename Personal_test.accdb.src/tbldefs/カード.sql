CREATE TABLE [カード] (
  [契約番号] VARCHAR (255) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [カード名] VARCHAR (255),
  [カード種別] VARCHAR (255),
  [名義] VARCHAR (255),
  [期限] VARCHAR (255),
  [セキュリティコード] VARCHAR (255),
  [暗証番号] VARCHAR (255),
  [Web] VARCHAR (255),
  [ID] VARCHAR (255),
  [PW] VARCHAR (255),
  [金融機関コード] VARCHAR (255),
  [支店コード] VARCHAR (255),
  [引落日] VARCHAR (255),
  [備考] VARCHAR (255)
)
