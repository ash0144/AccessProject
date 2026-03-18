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

'検索、抽出、データ加工など

Public Sub ExtractToWorkTable(dFrom As Date, dTo As Date, optB As Integer, Optional dKomokuCD As Variant = Null)
'抽出テーブルへのインサート
'optBは家計簿/確定申告の分類、dKomokuCDは抽出に用いる大項目CD/勘定科目CD

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

    Set qdf = Nothing
    Set db = Nothing

End Sub

Public Function GetCategoryList(strB As String, Optional dKomokuCD As Variant = Null) As Variant
'抽出テーブルに含まれる各項目CDのリストを取得
'strBはフォームの一覧に表示する項目名、dKomokuCDはメニューで指定した抽出に用いる項目

    Dim rs As DAO.Recordset
    Dim qdf As DAO.QueryDef
    Dim strSQL As String
    Dim strCD As String
    Dim result() As Long
    Dim i As Integer
    Dim needParam As Boolean

    Select Case strB
        Case "Zenkomoku"
            strSQL = "SELECT DISTINCT 大項目CD FROM 抽出テーブル ORDER BY 大項目CD;"
            strCD = "大項目CD"
        Case "Komokubetu"
            If IsNull(dKomokuCD) Then Err.Raise vbObjectError + 2, "clsDataSelector", "大項目CDが指定されていません。"
            strSQL = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 大項目CD=[pCD] ORDER BY 中項目CD;"
            strCD = "中項目CD"
            needParam = True
        Case "Sinkoku"
            strSQL = "SELECT DISTINCT 勘定科目CD FROM 抽出テーブル ORDER BY 勘定科目CD;"
            strCD = "勘定科目CD"
        Case "Kamokubetu"
            If IsNull(dKomokuCD) Then Err.Raise vbObjectError + 2, "clsDataSelector", "勘定科目CDが指定されていません。"
            strSQL = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 勘定科目CD=[pCD] ORDER BY 中項目CD;"
            strCD = "中項目CD"
            needParam = True
        Case Else
            Err.Raise vbObjectError + 1, "clsDataSelector", "許可されていない区分です。"
    End Select

    Set qdf = CurrentDb.CreateQueryDef("", strSQL)
    If needParam Then qdf.Parameters("pCD").Value = dKomokuCD
    Set rs = qdf.OpenRecordset()

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

Private Function NormalizeColumnName(strCD As String) As String
'明細用列名検証

    Select Case strCD
        Case "大項目CD", "中項目CD", "勘定科目CD"
            NormalizeColumnName = strCD
        Case Else
            Err.Raise vbObjectError + 1, "clsDataSelector", "許可されていないフィールド名です。"
    End Select

End Function

Public Sub CreateMeisai(CategoryCD As Long, strCD As String)
'明細作成

    Call tblClr("明細")
    Dim strSQL As String
    Dim colName As String
    Dim qdf As DAO.QueryDef

    colName = NormalizeColumnName(strCD)

    strSQL = "INSERT INTO 明細 SELECT * FROM 抽出テーブル WHERE [" & colName & "] = [pValue];"
    Set qdf = CurrentDb.CreateQueryDef("", strSQL)
    qdf.Parameters("pValue").Value = CategoryCD
    qdf.Execute dbFailOnError

    Set qdf = Nothing

End Sub

Public Sub LoadWorkTable(fromTable As String, toTable As String)
'ワークテーブルにすべてのフィールドをコピー
'同じ構成であることが要件

    Dim db As DAO.Database: Set db = CurrentDb
    Dim strSQL As String

    Call tblClr(toTable)

    strSQL = "INSERT INTO [" & toTable & "] SELECT * FROM [" & fromTable & "];"
    db.Execute strSQL, dbFailOnError

    Set db = Nothing

End Sub

Public Sub ApplyDiff(mstTbl As String, wkTbl As String, keyCD As String)
'ワークテーブルから本テーブルへの更新

    Dim ws As DAO.Workspace
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As Field
    Dim rs As DAO.Recordset

    Dim sqlUpd As String, sqlUpd1 As String, sqlUpd2 As String
    Dim sqlIns As String
    Dim sqlDel As String

    Dim fieldList As String
    Dim fieldSelect As String

    Dim cntUpd As Long
    Dim cntIns As Long
    Dim cntDel As Long
    Dim keyFound As Boolean

    If MsgBox("表示内容で更新します" & vbCrLf & "よろしいですか？", _
              vbQuestion + vbYesNo + vbDefaultButton2) = vbNo Then
        Exit Sub
    End If

    Set ws = DBEngine.Workspaces(0)
    Set db = CurrentDb

    '挿入時にカラム順のズレによる誤挿入を防ぐため、明示的にフィールド一覧を指定する
    fieldList = ""
    fieldSelect = ""
    Set tdf = db.TableDefs(mstTbl)
    For Each fld In tdf.Fields
        fieldList = fieldList & "[" & fld.name & "], "
        fieldSelect = fieldSelect & "[" & wkTbl & "].[" & fld.name & "], "
        If fld.name = keyCD Then keyFound = True
    Next
    If Not keyFound Then Err.Raise vbObjectError + 3, "clsDataSelector", "キー列が見つかりません: " & keyCD
    fieldList = Left(fieldList, Len(fieldList) - 2)
    fieldSelect = Left(fieldSelect, Len(fieldSelect) - 2)

    sqlIns = _
    "INSERT INTO [" & mstTbl & "] (" & fieldList & ") " & _
    "SELECT " & fieldSelect & " FROM [" & wkTbl & "] " & _
    "WHERE [" & wkTbl & "].[" & keyCD & "] NOT IN (SELECT [" & keyCD & "] FROM [" & mstTbl & "]);"

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
        If fld.name <> keyCD Then
            sqlUpd1 = sqlUpd1 & _
            "[" & mstTbl & "].[" & fld.name & "]=[" & wkTbl & "].[" & fld.name & "], "

            Select Case fld.Type
                Case dbText, dbMemo, dbChar, dbGUID
                    sqlUpd2 = sqlUpd2 & _
                    "Nz([" & mstTbl & "].[" & fld.name & "],'') <> Nz([" & wkTbl & "].[" & fld.name & "],'') OR "
                Case dbByte, dbInteger, dbLong, dbSingle, dbDouble, dbCurrency, dbDecimal
                    sqlUpd2 = sqlUpd2 & _
                    "Nz([" & mstTbl & "].[" & fld.name & "],0) <> Nz([" & wkTbl & "].[" & fld.name & "],0) OR "
                Case dbDate
                    sqlUpd2 = sqlUpd2 & _
                    "Nz([" & mstTbl & "].[" & fld.name & "],#1900/01/01#) <> Nz([" & wkTbl & "].[" & fld.name & "],#1900/01/01#) OR "
                Case dbBoolean
                    sqlUpd2 = sqlUpd2 & _
                    "Nz([" & mstTbl & "].[" & fld.name & "],False) <> Nz([" & wkTbl & "].[" & fld.name & "],False) OR "
                Case Else
                    sqlUpd2 = sqlUpd2 & _
                    "Nz([" & mstTbl & "].[" & fld.name & "],'') <> Nz([" & wkTbl & "].[" & fld.name & "],'') OR "
            End Select
        End If
    Next

    If Len(sqlUpd1) > 0 Then
        sqlUpd1 = Left(sqlUpd1, Len(sqlUpd1) - 2) & " "
        sqlUpd2 = Left(sqlUpd2, Len(sqlUpd2) - 4) & ";"
        sqlUpd = sqlUpd & sqlUpd1 & "WHERE " & sqlUpd2
    Else
        sqlUpd = ""
    End If

On Error GoTo ErrHandler

    ws.BeginTrans

    If Len(sqlUpd) > 0 Then
        db.Execute sqlUpd, dbFailOnError
        cntUpd = db.RecordsAffected
    End If

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
    MsgBox "エラーのため更新を取り消しました: " & Err.Description, vbExclamation

    Set db = Nothing
    Set ws = Nothing

End Sub


Public Sub OpenWorkEditForm( _
    ByVal frmN As String, _
    ByVal fromTbl As String, _
    ByVal toTbl As String)

    LoadWorkTable fromTbl, toTbl

    DoCmd.OpenForm frmN

    Forms(frmN).MasterTblN = fromTbl
    Forms(frmN).WorkTblN = toTbl
    Forms(frmN).InitializeForm

End Sub
