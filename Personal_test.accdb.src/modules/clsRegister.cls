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
'新規登録は単票フォームで行う
'対象コントロールのTagは、「フィールド名,ルール」

Public Sub Register(tblN As String)
    On Error GoTo ErrorHandler

    Dim ws As DAO.Workspace
    Dim db As DAO.Database
    Dim rs As DAO.Recordset
    Dim ctl As Control
    Dim fldN As String
    ' DLookupがNullを返す可能性があるため、VariantにするかNzを使用する必要がある
    Dim ckomokuCD As Variant, dkomokuCD As Variant
    Dim inTrans As Boolean
    Dim strSql As String
    Dim lngDkomoku As Long

    Set ws = DBEngine.Workspaces(0)
    Set db = CurrentDb

    If pForm.name = "frmSinput" Then
        strSql = "SELECT C.大項目CD FROM 勘定科目 AS K " & _
                 "INNER JOIN 中項目 AS C ON K.中項目CD = C.中項目CD " & _
                 "WHERE K.勘定科目CD = " & pForm.Controls("cmbKamoku") & ";"
        Set rs = db.OpenRecordset(strSql)

        lngDkomoku = rs!大項目CD
        rs.Close: Set rs = Nothing
        If lngDkomoku <> 1 Then
            pForm.Controls("txtKingaku") = -Abs(pForm.Controls("txtKingakuView"))
        Else
            pForm.Controls("txtKingaku") = Abs(pForm.Controls("txtKingakuView"))
        End If
    Else
        If pForm.Controls("cmbDkomoku") <> 1 Then
            pForm.Controls("txtKingaku") = -Abs(pForm.Controls("txtKingakuView"))
        Else
            pForm.Controls("txtKingaku") = Abs(pForm.Controls("txtKingakuView"))
        End If
    End If

    ws.BeginTrans
    inTrans = True

    Set rs = db.OpenRecordset(tblN, dbOpenDynaset)

    rs.AddNew


    For Each ctl In pForm.Controls
        ' Tagプロパティにフィールド名が入っているコントロールのみ対象
        If ctl.Tag <> "" Then
            fldN = Split(ctl.Tag, ",")(0)
            Select Case fldN
                Case "勘定科目"
                    ' Nz関数でNull回避。値がない場合は0などをセットして後続のエラーを防ぐか、条件分岐する
                    ckomokuCD = Nz(DLookup("中項目CD", "勘定科目", "勘定科目CD=" & Nz(ctl.Value, 0)), 0)
                    rs!中項目CD = CLng(ckomokuCD)

                    ' 中項目CDが取得できた場合のみ後続を検索
                    If ckomokuCD <> 0 Then
                        rs!中項目 = DLookup("中項目", "中項目", "中項目CD=" & ckomokuCD)
                        dkomokuCD = Nz(DLookup("大項目CD", "中項目", "中項目CD=" & ckomokuCD), 0)
                        rs!大項目 = DLookup("大項目", "大項目", "大項目CD=" & dkomokuCD)
                    End If

                Case "中項目"
                    ckomokuCD = Nz(DLookup("中項目CD", "中項目", "中項目='" & Replace(Nz(ctl.Value, ""), "'", "''") & "'"), 0)
                    rs!中項目CD = CLng(ckomokuCD)
                    rs!中項目 = ctl.Value
                Case "大項目"
                    rs!大項目 = ctl.Column(1)
                Case "ID"
                    rs!ID = GetID
                Case "View"
                    '表示だけの金額のTagはView,Required → 何もしない
                Case Else
                    rs.Fields("[" & fldN & "]").Value = ctl.Value
            End Select
        End If
    Next ctl
    rs.Update

    ws.CommitTrans
    inTrans = False

    ' 成功メッセージはUI（フォーム）側で出すため、ここでは何もしない
    Exit Sub

ErrorHandler:
    ' クリーンアップ処理でErr情報が消える可能性があるため退避する
    Dim lngErrNum As Long: lngErrNum = Err.Number
    Dim strErrDesc As String: strErrDesc = Err.Description
    Dim strErrSource As String: strErrSource = Err.Source

    If inTrans Then
        ws.Rollback
    End If

    ' 呼び出し元（フォーム）にエラーを通知する
    Err.Raise lngErrNum, strErrSource, strErrDesc
End Sub
