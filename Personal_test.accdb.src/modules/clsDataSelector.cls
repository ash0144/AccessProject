VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsDataSelector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' --- clsDataSelector ---
Option Explicit

'検索結果の抽出などを行うクラス

'抽出テーブルへのインサート
Public Sub ExtractToWorkTable(dFrom As Date, dTo As Date, optB As Integer, Optional dKomokuCD As Variant = Null)

    Dim db As DAO.Database: Set db = CurrentDb
    Dim qdf As DAO.QueryDef
    Dim strSQL As String

    Call tblClr("抽出テーブル")

    If optB = 1 Then
        strSQL = "INSERT INTO 抽出テーブル ( 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, 大項目CD, 中項目CD, ID ) " & _
                 "SELECT 日付, 内容, [金額（円）], 保有金融機関, M.大項目, M.中項目, C.大項目CD, M.中項目CD, ID " & _
                 "FROM MoneyForward AS M " & _
                 "INNER JOIN (大項目 AS D INNER JOIN 中項目 AS C ON D.大項目CD = C.大項目CD) ON M.中項目 = C.中項目 " & _
                 "WHERE (日付 Between [pFrom] And [pTo]) AND (計算対象=1) AND (C.家計簿=True) "
        If Not IsNull(dKomokuCD) Then strSQL = strSQL & "AND (C.大項目CD = [pCD]) "
    Else
        strSQL = "INSERT INTO 抽出テーブル ( 日付, 内容, [金額（円）], 保有金融機関, 中項目CD, 中項目, 勘定科目CD, 勘定科目, 勘定分類CD, ID ) " & _
                 "SELECT 日付, 内容, [金額（円）], 保有金融機関, M.中項目CD, M.中項目, K.勘定科目CD, K.勘定科目, K.勘定分類CD, ID " & _
                 "FROM MoneyForward AS M " & _
                 "INNER JOIN (勘定科目 AS K INNER JOIN 中項目 AS C ON K.中項目CD = C.中項目CD) ON M.中項目CD = K.中項目CD " & _
                 "WHERE (日付 Between [pFrom] And [pTo]) AND (計算対象=1) AND (C.確定申告=True) "
        If Not IsNull(dKomokuCD) Then strSQL = strSQL & "AND (C.勘定科目CD = [pCD]) "
    End If

    Set qdf = db.CreateQueryDef("", strSQL)
    qdf.Parameters("pFrom").Value = dFrom
    qdf.Parameters("pTo").Value = dTo
    If Not IsNull(dKomokuCD) Then qdf.Parameters("pCD").Value = dKomokuCD

    qdf.Execute dbFailOnError

End Sub

'抽出テーブルに含まれる大項目CD/中項目CD/勘定科目CDのリストを取得
Public Function GetCategoryList(strB As String, Optional dKomokuCD As Variant = Null) As Variant

    Dim rs As DAO.Recordset
    Dim strSQL As String
    Dim strCD As String
    Dim result() As Long
    Dim i As Integer

    Select Case strB
        Case "Zenkomoku"
            strSQL = "SELECT DISTINCT 大項目CD FROM 抽出テーブル ORDER BY 大項目CD;"
            strCD = "大項目CD"
        Case "Komokubetu"
            strSQL = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 大項目CD=" & dKomokuCD & " ORDER BY 中項目CD;"
            strCD = "中項目CD"
        Case "Sinkoku"
            strSQL = "SELECT DISTINCT 勘定科目CD FROM 抽出テーブル ORDER BY 勘定科目CD;"
            strCD = "勘定科目CD"
        Case "Kamokubetu"
            strSQL = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 勘定科目CD=" & dKomokuCD & " ORDER BY 中項目CD;"
            strCD = "中項目CD"
    End Select

    Set rs = CurrentDb.OpenRecordset(strSQL)

    If rs.EOF Then
        GetCategoryList = Empty
    Else
        rs.MoveLast
        ReDim result(1 To rs.RecordCount)
        rs.MoveFirst
        For i = 1 To UBound(result)
            result(i) = rs(strCD)
            rs.MoveNext
        Next i
        GetCategoryList = result
    End If
    rs.Close: Set rs = Nothing

End Function

'明細用列名検証
Private Function NormalizeColumnName(strCD As String) As String

    Select Case strCD
        Case "大項目CD", "中項目CD", "勘定科目CD"
            NormalizeColumnName = strCD
        Case Else
            Err.Raise vbObjectError + 1, "clsDataSelector", "許可されていない列名です。"
    End Select

End Function

'明細作成
Public Sub CreateMeisai(CategoryCD As Long, strCD As String)

    Call tblClr("明細")
    Dim strSQL As String
    Dim colName As String
    Dim qdf As DAO.QueryDef

    colName = NormalizeColumnName(strCD)

    strSQL = "INSERT INTO 明細 SELECT * FROM 抽出テーブル WHERE [" & colName & "] = [pValue];"
    Set qdf = CurrentDb.CreateQueryDef("", strSQL)
    qdf.Parameters("pValue").Value = CategoryCD
    qdf.Execute dbFailOnError

End Sub

Public Sub LoadWorkTable(fromTable As String, toTable As String)
'ワークテーブルにすべてのフィールドをコピー

    Dim db As DAO.Database: Set db = CurrentDb
    Dim strSQL As String

    Call tblClr(toTable)

    strSQL = "INSERT INTO [" & toTable & "] SELECT * FROM [" & fromTable & "];"
    db.Execute strSQL, dbFailOnError

    Set db = Nothing

End Sub

Public Sub ShowDiffCount(mstTbl As String, wkTbl As String, keyCD As String)
'元テーブルとワークテーブルの差分件数を表示

    Dim addCnt As Long
    Dim updCnt As Long
    Dim delCnt As Long
    Dim db As DAO.Database: Set db = CurrentDb
    Dim qdf As DAO.QueryDef
    Dim strSQL As String

    '追加件数
    strSQL = "SELECT [" & wkTbl & "].* FROM [" & mstTbl & "] " & _
        "RIGHT JOIN [" & wkTbl & "] ON [" & mstTbl & "].[" & keyCD & "] = [" & wkTbl & "].[" & keyCD & "] " & _
        "WHERE [" & mstTbl & "].[" & keyCD & "] IS NULL;"
    Set qdf = db.CreateQueryDef("qryTmp", strSQL)
    addCnt = DCount("*", "qryTmp")
    db.QueryDefs.Delete "qryTmp"

    '削除件数
    strSQL = "SELECT [" & mstTbl & "].* FROM [" & wkTbl & "] " & _
        "RIGHT JOIN [" & mstTbl & "] ON [" & wkTbl & "].[" & keyCD & "] = [" & mstTbl & "].[" & keyCD & "] " & _
        "WHERE [" & wkTbl & "].[" & keyCD & "] IS NULL;"
    Set qdf = db.CreateQueryDef("qryTmp", strSQL)
    delCnt = DCount("*", "qryTmp")
    db.QueryDefs.Delete "qryTmp"

    '更新件数
'    updCnt = GetUpdateCount(mstTbl)

    MsgBox _
        "差分件数" & vbCrLf & vbCrLf & _
        "追加: " & addCnt & "件" & vbCrLf & _
        "更新: " & updCnt & "件" & vbCrLf & _
        "削除: " & delCnt & "件", _
        vbInformation

End Sub

Public Sub ApplyDiff(mstTbl As String, wkTbl As String, keyCD As String)

    Dim ws As DAO.Workspace
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As Field

    Dim sqlUpd As String, sqlUpd1 As String, sqlUpd2 As String, sqlUpd3 As String
    Dim sqlIns As String
    Dim sqlDel As String

    Dim cntUpd As Long
    Dim cntIns As Long
    Dim cntDel As Long

    If MsgBox("マスタテーブルを更新します" & vbCrLf & "よろしいですか？", _
              vbQuestion + vbYesNo + vbDefaultButton2) = vbNo Then
        Exit Sub
    End If

    Set ws = DBEngine.Workspaces(0)
    Set db = CurrentDb

    sqlIns = _
    "INSERT INTO [" & mstTbl & "] SELECT * FROM[" & wkTbl & "] " & _
    "LEFT JOIN [" & mstTbl & "] ON [" & wkTbl & "].[" & keyCD & "] = [" & mstTbl & "].[" & keyCD & "] " & _
    "WHERE [" & mstTbl & "].[" & keyCD & "] IS NULL;"

    sqlDel = _
    "DELETE FROM [" & mstTbl & "] " & _
    "WHERE [" & keyCD & "] IN (" & _
    "SELECT [" & mstTbl & "].[" & keyCD & "] " & _
    "FROM [" & mstTbl & "] " & _
    "LEFT JOIN [" & wkTbl & "] ON [" & mstTbl & "].[" & keyCD & "] = [" & wkTbl & "].[" & keyCD & "] " & _
    "WHERE [" & wkTbl & "].[" & keyCD & "] IS NULL);"

    sqlUpd = _
    "UPDATE [" & mstTbl & "] " & _
    "INNER JOIN [" & wkTbl & "] ON [" & mstTbl & "].[" & keyCD & "] = [" & wkTbl & "].[" & keyCD & "] " & _
    "SET "

    Set tdf = db.TableDefs(mstTbl)
    For Each fld In tdf.Fields
        sqlUpd1 = sqlUpd1 & _
            "[" & mstTbl & "].[" & fld.name & "]=[" & wkTbl & "].[" & fld.name & "], "
        sqlUpd2 = sqlUpd2 & _
            "Nz([" & mstTbl & "].[" & fld.name & "],'') <> Nz([" & wkTbl & "].[" & fld.name & "],'') OR "
    Next

    sqlUpd1 = Left(sqlUpd1, Len(sqlUpd1) - 2) & " "
    sqlUpd2 = Left(sqlUpd2, Len(sqlUpd2) - 4) & ";"
    sqlUpd = sqlUpd & sqlUpd1 & "WHERE " & sqlUpd2

On Error GoTo ErrHandler

    ws.BeginTrans

    db.Execute sqlUpd, dbFailOnError
    cntUpd = db.RecordsAffected

    db.Execute sqlIns, dbFailOnError
    cntIns = db.RecordsAffected

    db.Execute sqlDel, dbFailOnError
    cntDel = db.RecordsAffected

    ws.CommitTrans

    MsgBox _
        "反映完了" & vbCrLf & vbCrLf & _
        "更新: " & cntUpd & "件" & vbCrLf & _
        "追加: " & cntIns & "件" & vbCrLf & _
        "削除: " & cntDel & "件", _
        vbInformation

    Set db = Nothing
    Set ws = Nothing
    Exit Sub

ErrHandler:
    ws.Rollback
    MsgBox "エラーのためロールバックしました: " & Err.Description, vbExclamation

    Set db = Nothing
    Set ws = Nothing

End Sub


Private Function GetUpdateCount() As Long

    Dim rs As DAO.Recordset
    Dim sqlText As String

    sqlText = _
        "SELECT Count(*) AS Cnt " & _
        "FROM M_商品 AS M " & _
        "INNER JOIN WK_商品 AS W ON M.商品CD = W.商品CD " & _
        "WHERE " & _
        "Nz(M.商品名,'') <> Nz(W.商品名,'') " & _
        "OR Nz(M.単価,0) <> Nz(W.単価,0) " & _
        "OR Nz(M.分類CD,'') <> Nz(W.分類CD,'') " & _
        "OR Nz(M.仕入先CD,'') <> Nz(W.仕入先CD,'');"

    Set rs = CurrentDb.OpenRecordset(sqlText)

    GetUpdateCount = rs!Cnt

    rs.Close
    Set rs = Nothing

End Function
