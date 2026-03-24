Attribute VB_Name = "modFormIO"
Option Compare Database
Option Explicit

'MoneyForwadから出力したExcelファイルのインポート
'大項目、中項目がコード化されていないことに留意
'中項目CDはインポート後に追記

Public Function ImportMFData() As Boolean

    On Error GoTo Err_Handler
    Dim strFilename As String, strFn As String, arr() As String, i As Integer
    Dim db As DAO.Database: Set db = CurrentDb

    strFilename = GetFileName(Nz(DLookup("MoneyForwardフォルダ", "履歴"), ""), "", ".xls", True)
    If strFilename = "" Then Exit Function

    arr = Split(strFilename, ",")
    For i = LBound(arr) To UBound(arr)
        strFn = arr(i)

        '一時テーブル(TmpMF)として新規作成
        'ここにはExcelの列だけが入る
        On Error Resume Next: db.Execute "DROP TABLE TmpMF": On Error GoTo Err_Handler
        DoCmd.TransferSpreadsheet acImport, acSpreadsheetTypeExcel12, "TmpMF", strFn, True

        '一時テーブルから本番テーブルへ、存在する列だけを流し込む
        '[中項目CD] はこの時点では空のままでOK
        db.Execute "INSERT INTO MoneyForward ( 計算対象, 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, メモ, 振替, ID ) " & _
                   "SELECT 1, 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, メモ, 振替, ID FROM TmpMF;", dbFailOnError
    Next i

    ' 3. 最後に「中項目CD更新」クエリで、空の [中項目CD] を一括で埋める
    Call QUERYrun("中項目CD更新")

    ImportMFData = True

Err_Handler:
    MsgBox "インポートエラー: " & Err.Description, vbCritical
    ImportMFData = False

    Exit Function

End Function

'抽出テーブルへのインサート
'optBは家計簿/確定申告の分類、dKomokuCDは抽出に用いる大項目CD/勘定科目CD

Public Sub ToPickUpTable(dFrom As Date, dTo As Date, optB As Integer, Optional dkomokuCD As Variant = Null)

    Dim db As DAO.Database: Set db = CurrentDb
    Dim qdf As DAO.QueryDef
    Dim strSQL As String

    tblClr "抽出テーブル"

    If optB = 1 Then
        strSQL = "INSERT INTO 抽出テーブル ( 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, 大項目CD, 中項目CD, ID ) " & _
                 "SELECT 日付, 内容, [金額（円）], 保有金融機関, M.大項目, M.中項目, C.大項目CD, M.中項目CD, ID " & _
                 "FROM MoneyForward AS M " & _
                 "INNER JOIN (大項目 AS D INNER JOIN 中項目 AS C ON D.大項目CD = C.大項目CD) ON M.中項目 = C.中項目 " & _
                 "WHERE (日付 Between [pFrom] And [pTo]) AND (計算対象=1) AND (C.家計簿=True) "
        If Not IsNull(dkomokuCD) Then strSQL = strSQL & "AND (C.大項目CD = [pCD]) "
    Else
        strSQL = "INSERT INTO 抽出テーブル ( 日付, 内容, [金額（円）], 保有金融機関, 中項目CD, 中項目, 勘定科目CD, 勘定科目, 勘定分類CD, ID ) " & _
                 "SELECT 日付, 内容, [金額（円）], 保有金融機関, M.中項目CD, M.中項目, K.勘定科目CD, K.勘定科目, K.勘定分類CD, ID " & _
                 "FROM MoneyForward AS M " & _
                 "INNER JOIN (勘定科目 AS K INNER JOIN 中項目 AS C ON K.中項目CD = C.中項目CD) ON M.中項目CD = K.中項目CD " & _
                 "WHERE (日付 Between [pFrom] And [pTo]) AND (計算対象=1) AND (C.確定申告=True) "
        If Not IsNull(dkomokuCD) Then strSQL = strSQL & "AND (C.勘定科目CD = [pCD]) "
    End If

    Set qdf = db.CreateQueryDef("", strSQL)
    qdf.Parameters("pFrom").Value = dFrom
    qdf.Parameters("pTo").Value = dTo
    If Not IsNull(dkomokuCD) Then qdf.Parameters("pCD").Value = CLng(dkomokuCD)

    qdf.Execute dbFailOnError

    Set qdf = Nothing: Set db = Nothing

End Sub

Public Sub LoadWorkTable(fromTable As String, toTable As String)
'ワークテーブルにすべてのフィールドをコピー
'同じ構成であることが要件

    Dim db As DAO.Database: Set db = CurrentDb
    Dim strSQL As String

    tblClr toTable

    strSQL = "INSERT INTO [" & toTable & "] SELECT * FROM [" & fromTable & "];"
    db.Execute strSQL, dbFailOnError

    Set db = Nothing

End Sub
