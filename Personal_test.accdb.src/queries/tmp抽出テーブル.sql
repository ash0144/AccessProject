SELECT
  MoneyForward.日付,
  MoneyForward.内容,
  MoneyForward.金額,
  MoneyForward.保有金融機関,
  MoneyForward.中項目CD,
  中項目.勘定科目CD,
  MoneyForward.ID
FROM
  中項目
  INNER JOIN MoneyForward ON 中項目.中項目CD = MoneyForward.中項目CD
WHERE
  (
    (
      (中項目.確定申告)= True
    )
    AND (
      (MoneyForward.計算対象)= 1
    )
  );
