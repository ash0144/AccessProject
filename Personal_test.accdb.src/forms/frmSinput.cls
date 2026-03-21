Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Registry As New clsDataRegistry

Private Sub cmbDkomoku_AfterUpdate()
    Me!cmbCkomoku.RowSource = "SELECT 中項目 FROM 中項目 WHERE 大項目CD=" & Nz(Me!cmbDkomoku, 0) & ";"
End Sub

Private Sub cmdEnter_Click()
    If MsgBox("上記を手動登録します。よろしいですか？", vbYesNo + vbQuestion, "確認") = vbNo Then Exit Sub

    ' 第7引数に False を渡して、中項目CDの更新をスキップする
    If Registry.RegisterManualEntry(Me!txtHizuke, Me!txtNaiyo, Me!txtKingaku, _
                              Me!cmbDkomoku, Me!cmbCkomoku, Me!txtMemo, False) Then
        ClearControls
        MsgBox "登録しました。", vbInformation
    End If
End Sub

Private Sub ClearControls()
    Dim ctl As Variant
    For Each ctl In Array(Me!txtHizuke, Me!txtNaiyo, Me!txtKingaku, Me!cmbDkomoku, Me!cmbCkomoku, Me!txtMemo)
        ctl.Value = Null
    Next ctl
End Sub
