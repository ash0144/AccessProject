Attribute VB_Name = "modTool"
Option Compare Database
Option Explicit

Private strSQL As String

Public Sub tblClr(tgtTbl As String)

strSQL = "DELETE * FROM [" & tgtTbl & "];"
Call SQLrun(strSQL)

End Sub

Public Sub SQLrun(tgtSQL As String)

DoCmd.SetWarnings False
DoCmd.RunSQL tgtSQL
DoCmd.SetWarnings True

End Sub

Public Sub QUERYrun(tgtQL As String)

DoCmd.SetWarnings False
DoCmd.OpenQuery tgtQL
DoCmd.SetWarnings True

End Sub

Public Sub CheckFields(tableName As String)
'テスト用：指定テーブルのフィールド名とデータ型を書き出す

    Dim db As DAO.Database: Set db = CurrentDb
    Dim tdf As DAO.TableDef: Set tdf = db.TableDefs(tableName)
    Dim fld As DAO.Field

    Debug.Print "--- テーブルのフィールド名一覧 ---"
    For Each fld In tdf.Fields
        Debug.Print "[" & fld.name & "]" & vbTab & FieldTypeName(fld.Type)
    Next fld
End Sub

Function FieldTypeName(fldType As Long) As String
'データ型（数値）を文字列として取得する
    Dim tpn As String
    Select Case fldType
        Case dbBigInt:      tpn = "dbBigInt"
        Case dbBinary:      tpn = "dbBinary"
        Case dbBoolean:     tpn = "dbBoolean"
        Case dbByte:        tpn = "dbByte"
        Case dbChar:        tpn = "dbChar"
        Case dbCurrency:    tpn = "dbCurrency"
        Case dbDate:        tpn = "dbDate"
        Case dbDecimal:     tpn = "dbDecimal"
        Case dbDouble:      tpn = "dbDouble"
        Case dbFloat:       tpn = "dbFloat"
        Case dbGUID:        tpn = "dbGUID"
        Case dbInteger:     tpn = "dbInteger"
        Case dbLong:        tpn = "dbLong"
        Case dbLongBinary:  tpn = "dbLongBinary"
        Case dbMemo:        tpn = "dbMemo"
        Case dbNumeric:     tpn = "dbNumeric"
        Case dbSingle:      tpn = "dbSingle"
        Case dbText:        tpn = "dbText"
        Case dbTime:        tpn = "dbTime"
        Case dbTimeStamp:   tpn = "dbTimeStamp"
        Case dbVarBinary:   tpn = "dbVarBinary"
        Case Else:          tpn = "不明: " & fldType
    End Select
    FieldTypeName = tpn
End Function

Public Function HasRelatedRecord( _
    ByVal tableName As String, _
    ByVal FieldName As String, _
    ByVal KeyValue As Variant) As Boolean
'リレーションテーブルを調べる

    Dim sWhere As String

    If IsNull(KeyValue) Then
        HasRelatedRecord = False
        Exit Function
    End If

    If IsNumeric(KeyValue) Then
        sWhere = "[" & FieldName & "]=" & KeyValue
    Else
        sWhere = "[" & FieldName & "]='" & Replace(KeyValue, "'", "''") & "'"
    End If

    HasRelatedRecord = (DCount("*", tableName, sWhere) > 0)

End Function

Public Function GetCkomokuRowSource(ByVal vDkomoku As Variant) As String
'中項目コンボボックスのソース設定

    If Nz(vDkomoku, "") = "" Then
        GetCkomokuRowSource = _
            "SELECT 中項目CD, 中項目 " & _
            "FROM 中項目 " & _
            "ORDER BY 中項目CD;"
    Else
        GetCkomokuRowSource = _
            "SELECT 中項目CD, 中項目 " & _
            "FROM 中項目 " & _
            "WHERE 大項目CD = " & vDkomoku & " " & _
            "ORDER BY 中項目CD;"
    End If

End Function

Public Function GetID() As String
'新規登録に用いるIDのランダム生成

    Dim strID As String
    Dim i As Long

    Randomize
    For i = 1 To 100
        strID = CStr(Int((999999999 * Rnd) + 1))
        If DCount("*", "MoneyForward", "ID='" & strID & "'") = 0 Then
            Exit For
        End If
    Next i

    GetID = strID

End Function

'----------------------------------------
' 文字列エスケープ
'----------------------------------------
Public Function EscapeText(ByVal s As String) As String
    EscapeText = Replace(s, "'", "''")
End Function
