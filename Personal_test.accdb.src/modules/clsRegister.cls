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

' 初期化時にフォームをセット
Public Sub Init(frm As Form)
    Set pForm = frm
End Sub

' 【検証ロジック】エラーがあればメッセージを返し、True/Falseで結果を戻す
Public Function IsValid() As Boolean
    Dim ctl As Control
    Dim errMsg As String

    For Each ctl In pForm.Controls
        ' タグに "Required" が含まれていて空欄の場合
        If InStr(ctl.Tag, "Required") > 0 Then
            If IsNull(ctl.Value) Or ctl.Value = "" Then
                errMsg = errMsg & "・" & ctl.name & " は必須項目です" & vbCrLf
            End If
        End If

        ' タグに "IsDate" があり、値が入っているが日付でない場合
        If InStr(ctl.Tag, "IsDate") > 0 And Not IsNull(ctl.Value) Then
            If Not IsDate(ctl.Value) Then
                errMsg = errMsg & "・" & ctl.name & " は日付形式で入力してください" & vbCrLf
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

' 【登録ロジック】
Public Sub Register(TableName As String)

    Dim db As DAO.Database: Set db = CurrentDb
    Dim rs As DAO.Recordset
    Dim ctl As Control
    Dim fldN As String

    Set rs = db.OpenRecordset(TableName, dbOpenDynaset)

    rs.AddNew
    For Each ctl In frm.Controls
        '対象コントロールのTagは、「フィールド名,ルール」
        fldN = Split(ctl.Tag, ",")(0)
        ' Tagプロパティにフィールド名が入っているコントロールのみ対象
        If ctl.Tag <> "" Then
            rs.Fields(fldN).Value = ctl.Value
        End If
    Next ctl
    rs.Update: rs.Close
    MsgBox "登録を実行します"
End Sub
