Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

Private Sub cmdEnter_Click()
    On Error GoTo ErrHandler
    If MsgBox("上記を登録します。よろしいですか？", vbYesNo + vbQuestion, "確認") = vbNo Then Exit Sub

    Dim reg As New clsRegister

    reg.Init Me  ' 自分(フォーム)をクラスに渡す

    ' 検証してOKなら登録実行
    If reg.IsValid Then
        reg.Register "MoneyForward"
        MsgBox "登録が完了しました。", vbInformation
        ClearControls
    End If

    Exit Sub

ErrHandler:
    ' クラスから通知されたエラーをここで表示する
    MsgBox "システムエラーが発生しました。" & vbCrLf & _
           "内容: " & Err.Description, vbCritical

End Sub

Private Sub ClearControls()
    Dim ctl As Variant
    For Each ctl In Array(Me!txtHizuke, Me!txtNaiyo, Me!txtKingakuView, Me!txtKingaku, Me!cmbKamoku, Me!txtMemo, Me!txtKinyu)
        ctl.Value = Null
    Next ctl
End Sub
