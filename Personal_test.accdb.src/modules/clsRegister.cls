VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsRegister"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private pForm As Form

'初期化時にフォームをセット
Public Sub Init(frm As Form)
    Set pForm = frm
End Sub

'【検証ロジック】エラーがあればメッセージを返し、True/Falseで結果を戻す
'対象コントロールのTagは、「フィールド名,ルール」

Public Function IsValid() As Boolean
    Dim ctl As Control
    Dim errMsg As String

    For Each ctl In pForm.Controls
        ' タグに "Required" が含まれていて空欄の場合
        If InStr(ctl.Tag, "Required") > 0 Then
            If IsNull(ctl.Value) Or ctl.Value = "" Then
                errMsg = errMsg & "・" & Split(ctl.Tag, ",")(0) & " は必須項目です" & vbCrLf
            End If
        End If

        ' タグに "IsDate" があり、値が入っているが日付でない場合
        If InStr(ctl.Tag, "IsDate") > 0 Then
            If Not IsDate(ctl.Value) Then
                errMsg = errMsg & "・" & Split(ctl.Tag, ",")(0) & " は日付形式で入力してください" & vbCrLf
            End If
        End If
    Next ctl

    If errMsg <> "" Then
        MsgBox "入力内容に不備があります：" & vbCrLf & errMsg, vbExclamation
        IsValid = False
    Else
        IsValid = True
    End If
End Function

'【登録ロジック】
'対象コントロールのTagは、「フィールド名,ルール」

Public Sub Register(tblN As String)

    Dim db As DAO.Database: Set db = CurrentDb
    Dim rs As DAO.Recordset
    Dim ctl As Control
    Dim fldN As String
    Dim ckomokuCD As Long, dkomokuCD As Long

    Set rs = db.OpenRecordset(tblN, dbOpenDynaset)

    rs.AddNew
    For Each ctl In pForm.Controls
        ' Tagプロパティにフィールド名が入っているコントロールのみ対象
        If ctl.Tag <> "" Then
            fldN = Split(ctl.Tag, ",")(0)
            Select Case fldN
                Case "勘定科目"
                    ckomokuCD = DLookup("中項目CD", "勘定科目", "勘定科目CD=" & ctl.Value)
                    rs!中項目CD = ckomokuCD
                    rs!中項目 = DLookup("中項目", "中項目", "中項目CD=" & ckomokuCD)
                    dkomokuCD = DLookup("大項目CD", "中項目", "中項目CD=" & ckomokuCD)
                    rs!大項目 = DLookup("大項目", "大項目", "大項目CD=" & dkomokuCD)
                Case "中項目"
                    ckomokuCD = DLookup("中項目CD", "中項目", "中項目='" & ctl.Value & "'")
                    rs!中項目CD = ckomokuCD
                    rs!中項目 = ctl.Value
                Case "大項目"
                    rs!大項目 = ctl.Column(1)
                Case "ID"
                    rs!ID = GetID
                Case Else
                    rs.Fields(fldN).Value = ctl.Value
            End Select
        End If
    Next ctl
    rs.Update: rs.Close
    MsgBox "登録が完了しました"
End Sub
