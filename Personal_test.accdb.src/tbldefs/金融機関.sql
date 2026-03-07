CREATE TABLE [金融機関] (
  [金融機関コード] VARCHAR (255),
  [支店コード] VARCHAR (255),
  [金融機関名] VARCHAR (255),
  [支店名] VARCHAR (255),
  [口座種別種別] VARCHAR (255),
  [口座番号] VARCHAR (255),
  [口座名義] VARCHAR (255),
  [暗証番号] VARCHAR (255),
  [Web] VARCHAR (255),
  [ID] VARCHAR (255),
  [PW] VARCHAR (255),
  [備考] VARCHAR (255),
   CONSTRAINT [PrimaryKey] PRIMARY KEY ([金融機関コード], [支店コード])
)
