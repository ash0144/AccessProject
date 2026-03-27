SELECT
  DISTINCT 抽出テーブル.中項目CD
FROM
  抽出テーブル
WHERE
  (
    (
      (抽出テーブル.大項目CD)= [forms]![frmKSmenu]![cmbDkomoku]
    )
  );
