INSERT INTO 抽出テーブル (
  日付, 内容, 金額（円）, 保有金融機関, 中項目CD, 勘定科目CD,
  ID, 勘定科目, 勘定分類CD
)
SELECT
  tmp抽出テーブル.日付,
  tmp抽出テーブル.内容,
  tmp抽出テーブル.金額（円）,
  tmp抽出テーブル.保有金融機関,
  tmp抽出テーブル.中項目CD,
  tmp抽出テーブル.勘定科目CD,
  tmp抽出テーブル.ID,
  勘定科目.勘定科目,
  勘定科目.勘定分類CD
FROM
  勘定科目
  INNER JOIN tmp抽出テーブル ON 勘定科目.勘定科目CD = tmp抽出テーブル.勘定科目CD
ORDER BY
  勘定科目.勘定分類CD;
