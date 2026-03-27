Attribute VB_Name = "modFormSelect"
Option Compare Database
Option Explicit

'ワークテーブルから本テーブルへの更新
'メインテーブルでは新規登録を行わない（別建ての単票で行う）ことに注意

Public Sub ApplyDiff(mstTbl As String, wkTbl As String, keyCD As String, _
                     Optional AllowAdd As Boolean = False, Optional fromView As Boolean = False)

    Dim ws As DAO.Workspace: Set ws = DBEngine.Workspaces(0)
    Dim db As DAO.Database: Set db = CurrentDb
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
    Dim msg As String
    Dim strSql As String

    If MsgBox("表示内容で更新します" & vbCrLf & "よろしいですか？", _
              vbQuestion + vbYesNo + vbDefaultButton2) = vbNo Then
        Exit Sub
    End If

    If fromView Then
        strSql = "UPDATE [" & wkTbl & "] INNER JOIN 中項目 ON [" & wkTbl & "].中項目CD = 中項目.中項目CD " & _
        "SET [" & wkTbl & "].[金額] = -[金額] " & _
        "WHERE 中項目.大項目CD<>1;"
        db.Execute strSql, dbFailOnError
    End If

    '挿入時にカラム順のズレによる誤挿入を防ぐため、明示的にフィールド一覧を指定する

    fieldList = ""
    fieldSelect = ""
    Set tdf = db.TableDefs(mstTbl)
    For Each fld In tdf.Fields
        If AllowAdd Then
            fieldList = fieldList & "[" & fld.name & "], "
            fieldSelect = fieldSelect & "[" & wkTbl & "].[" & fld.name & "], "
        End If
        If fld.name = keyCD Then keyFound = True
    Next

    If Not keyFound Then Err.Raise vbObjectError + 3, "clsDataSelector", "キー列が見つかりません: " & keyCD

    If AllowAdd Then
        fieldList = Left(fieldList, Len(fieldList) - 2)
        fieldSelect = Left(fieldSelect, Len(fieldSelect) - 2)
        sqlIns = _
        "INSERT INTO [" & mstTbl & "] (" & fieldList & ") " & _
        "SELECT " & fieldSelect & " FROM [" & wkTbl & "] " & _
        "WHERE [" & wkTbl & "].[" & keyCD & "] NOT IN (SELECT [" & keyCD & "] FROM [" & mstTbl & "]);"
    End If

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

    If AllowAdd Then
        db.Execute sqlIns, dbFailOnError
        cntIns = db.RecordsAffected
    End If

    If DCount("*", "[" & wkTbl & "]") > 0 Then
        db.Execute sqlDel, dbFailOnError
        cntDel = db.RecordsAffected
    Else
        Err.Raise 999, , "ワークテーブルが空です。処理を中断しました"
    End If

    ws.CommitTrans

    msg = "反映完了" & vbCrLf & vbCrLf & _
          "更新: " & cntUpd & "件"

    If AllowAdd Then
        msg = msg & vbCrLf & "追加: " & cntIns & "件"
    Else
        msg = msg & "追加: (スキップ)"
    End If

    msg = msg & vbCrLf & "削除: " & cntDel & "件"

    MsgBox msg, vbInformation

    Set db = Nothing
    Set ws = Nothing
    Exit Sub

ErrHandler:
    ws.Rollback
    MsgBox "エラーのため更新を取り消しました: " & Err.Description, vbExclamation

    Set db = Nothing
    Set ws = Nothing

End Sub

'抽出テーブルに含まれる各項目CDのリストを取得
'strBはフォームの一覧に表示する項目名、dKomokuCDはメニューで指定した抽出に用いる項目

Public Function GetCategoryList(strB As String, Optional dkomokuCD As Variant = Null) As Variant

    Dim rs As DAO.Recordset
    Dim qdf As DAO.QueryDef
    Dim strSql As String
    Dim strCD As String
    Dim result() As Long
    Dim i As Integer
    Dim needParam As Boolean

    Select Case strB
        Case "Zenkomoku"
            strSql = "SELECT DISTINCT 大項目CD FROM 抽出テーブル ORDER BY 大項目CD;"
            strCD = "大項目CD"
        Case "Komokubetu"
            If IsNull(dkomokuCD) Then Err.Raise vbObjectError + 2, "clsDataSelector", "大項目CDが指定されていません。"
            strSql = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 大項目CD=[pCD] ORDER BY 中項目CD;"
            strCD = "中項目CD"
            needParam = True
        Case "Sinkoku"
            strSql = "SELECT DISTINCT 勘定科目CD FROM 抽出テーブル ORDER BY 勘定科目CD;"
            strCD = "勘定科目CD"
        Case "Kamokubetu"
            If IsNull(dkomokuCD) Then Err.Raise vbObjectError + 2, "clsDataSelector", "勘定科目CDが指定されていません。"
            strSql = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 勘定科目CD=[pCD] ORDER BY 中項目CD;"
            strCD = "中項目CD"
            needParam = True
        Case Else
            Err.Raise vbObjectError + 1, "clsDataSelector", "許可されていない区分です。"
    End Select

    Set qdf = CurrentDb.CreateQueryDef("", strSql)
    If needParam Then qdf.Parameters("pCD").Value = dkomokuCD
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

'明細作成

Public Sub CreateMeisai(CategoryCD As Long, strCD As String)

    Call tblClr("明細")
    Dim strSql As String
    Dim colName As String
    Dim qdf As DAO.QueryDef

    colName = NormalizeColumnName(strCD)

    strSql = "INSERT INTO 明細 SELECT * FROM 抽出テーブル WHERE [" & colName & "] = [pValue];"
    Set qdf = CurrentDb.CreateQueryDef("", strSql)
    qdf.Parameters("pValue").Value = CategoryCD
    qdf.Execute dbFailOnError

    Set qdf = Nothing

End Sub

'明細用列名検証

Private Function NormalizeColumnName(strCD As String) As String

    Select Case strCD
        Case "大項目CD", "中項目CD", "勘定科目CD"
            NormalizeColumnName = strCD
        Case Else
            Err.Raise vbObjectError + 1, "clsDataSelector", "許可されていないフィールド名です。"
    End Select

End Function
