Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

' 中項目コンボボックスの連動
Private Sub cmbDkomoku_AfterUpdate()
    ' パラメータを安全に結合（Nz関数などでNULL対策するとより堅牢です）
    Me!cmbCkomoku.RowSource = "SELECT 中項目 FROM 中項目 WHERE 大項目CD=" & Nz(Me!cmbDkomoku, 0) & ";"
End Sub

' 登録ボタン
Private Sub cmdEnter_Click()
    If MsgBox("表示内容を手動登録します" & vbCrLf & "よろしいですか？", vbYesNo + vbQuestion, "確認") = vbNo Then Exit Sub

    ' クラスに処理を委譲
    If App.Registry.RegisterManualEntry(Me!txtHizuke, Me!txtNaiyo, Me!txtKingaku, _
                              Me!cmbDkomoku, Me!cmbCkomoku, Me!txtMemo) Then

        ' 登録成功ならコントロールを掃除
        ClearControls
        MsgBox "登録しました。", vbInformation
    End If
End Sub

' 入力欄のクリア処理
Private Sub ClearControls()
    Me!txtHizuke = Null
    Me!txtNaiyo = Null
    Me!txtKingaku = Null
    Me!cmbDkomoku = Null
    Me!cmbCkomoku = Null
    Me!txtMemo = Null
End Sub
