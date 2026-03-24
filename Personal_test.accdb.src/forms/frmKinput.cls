Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

' 中項目コンボボックスの連動
Private Sub cmbDkomoku_AfterUpdate()
    ' パラメータを安全に結合（Nz関数などでNULL対策するとより堅牢です）
    Me!cmbCkomoku.RowSource = "SELECT 中項目CD,中項目 FROM 中項目 WHERE 大項目CD=" & Nz(Me!cmbDkomoku, 0) & ";"
End Sub

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

' 登録ボタン
Private Sub cmdEnter_Click()
    If MsgBox("上記を登録します。よろしいですか？", vbYesNo + vbQuestion, "確認") = vbNo Then Exit Sub

    Dim reg As New clsRegister

    reg.Init Me  ' 自分(フォーム)をクラスに渡す

    ' 検証してOKなら登録実行
    If reg.IsValid Then
        reg.Register "MoneyForward"
    Else
        Exit Sub
    End If

    ClearControls
End Sub

' 入力欄のクリア処理
Private Sub ClearControls()
    Me!txtHizuke = Null
    Me!txtNaiyo = Null
    Me!txtKingaku = Null
    Me!cmbDkomoku = Null
    Me!cmbCkomoku = Null
    Me!txtMemo = Null
    Me!txtKinyu = Null
End Sub
