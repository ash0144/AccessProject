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

' 抽出テーブルへのインサート
Public Sub ExtractToWorkTable(dFrom As Date, dTo As Date, optB As Integer, Optional dKomokuCD As Variant = Null)

    Dim db As DAO.Database: Set db = CurrentDb
    Dim qdf As DAO.QueryDef
    Dim strSQL As String

    Call tblClr("抽出テーブル")

    If optB = 1 Then
        strSQL = "INSERT INTO 抽出テーブル ( 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, 大項目CD, 中項目CD, ID ) " & _
                 "SELECT 日付, 内容, [金額（円）], 保有金融機関, M.大項目, M.中項目, C.大項目CD, C.中項目CD, ID " & _
                 "FROM MoneyForward AS M " & _
                 "INNER JOIN (大項目 AS D INNER JOIN 中項目 AS C ON D.大項目CD = C.大項目CD) ON M.中項目 = C.中項目 " & _
                 "WHERE (日付 Between [pFrom] And [pTo]) AND (計算対象=1) AND (C.家計簿=True) "
        If Not IsNull(dKomokuCD) Then strSQL = strSQL & "AND (C.大項目CD = [pCD]) "
    Else
        strSQL = "INSERT INTO 抽出テーブル ( 日付, 内容, 金額（円）, 保有金融機関, 中項目CD, 中項目, 勘定科目CD, 勘定科目, 勘定分類CD, ID ) " & _
                 "SELECT 日付, 内容, [金額（円）], 保有金融機関, M.中項目CD, M.中項目, C.勘定科目CD, K.勘定科目, K.勘定分類CD, ID " & _
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

'' 1. 抽出テーブルに含まれる大項目CD/中項目CD/勘定科目CDのリストを取得
'Public Function GetMainCategoryList() As Variant
'    Dim rs As DAO.Recordset
'    Dim strSQL As String
'    Dim result() As Long
'    Dim i As Integer
'
'    strSQL = "SELECT DISTINCT 大項目CD FROM 抽出テーブル ORDER BY 大項目CD;"
'    Set rs = CurrentDb.OpenRecordset(strSQL)
'
'    If rs.EOF Then
'        GetMainCategoryList = Empty
'    Else
'        rs.MoveLast
'        ReDim result(1 To rs.RecordCount)
'        rs.MoveFirst
'        For i = 1 To UBound(result)
'            result(i) = rs!大項目CD
'            rs.MoveNext
'        Next i
'        GetMainCategoryList = result
'    End If
'    rs.Close: Set rs = Nothing
'
'End Function
'
''中項目CDのリストを配列で取得する
'Public Function GetSubCategoryList(dKomokuCD As Variant) As Variant
'    Dim rs As DAO.Recordset
'    Dim strSQL As String
'    Dim result() As Long
'    Dim i As Integer
'
'    strSQL = "SELECT DISTINCT 中項目CD FROM 抽出テーブル WHERE 大項目CD=" & dKomokuCD & " ORDER BY 中項目CD;"
'    Set rs = CurrentDb.OpenRecordset(strSQL)
'
'    If rs.EOF Then
'        GetSubCategoryList = Empty
'    Else
'        rs.MoveLast
'        ReDim result(1 To rs.RecordCount)
'        rs.MoveFirst
'        For i = 1 To UBound(result)
'            result(i) = rs!中項目CD
'            rs.MoveNext
'        Next i
'        GetSubCategoryList = result
'    End If
'    rs.Close: Set rs = Nothing
'
'End Function

' 明細用列名検証
Private Function NormalizeColumnName(strCD As String) As String

    Select Case strCD
        Case "大項目CD", "中項目CD", "勘定科目CD"
            NormalizeColumnName = strCD
        Case Else
            Err.Raise vbObjectError + 1, "clsDataSelector", "許可されていない列名です。"
    End Select

End Function

' 明細作成
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

' ' 大項目用の明細作成 (frmZenkomoku用)
' Public Sub CreateMainMeisai(mainCategoryCD As Long)

'     Call tblClr("明細")
'     Dim strSQL As String

'     strSQL = "INSERT INTO 明細 SELECT * FROM 抽出テーブル WHERE 大項目CD=" & mainCategoryCD & ";"
'     CurrentDb.Execute strSQL, dbFailOnError

' End Sub
