Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Selector As New clsDataSelector
Private btnGroup As New Collection ' ボタン監視インスタンスを保管する袋

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

Private Sub Form_Open(Cancel As Integer)
    Dim subCDs As Variant
    Dim i As Integer
    Dim sCD As Long
    Dim btnHandler As clsMyButton
    Dim args() As String, strRange As String, lngDkomoku As Long

    If Not IsNull(Me.OpenArgs) Then
        args = Split(Me.OpenArgs, ",")
        lngDkomoku = CLng(args(0))
        strRange = args(1)
        Me.txtDkomoku = DLookup("大項目", "大項目", "大項目CD=" & lngDkomoku)
        Me.txtRange = args(1)
        Me!txtGokei = DSum("金額（円）", "抽出テーブル", "大項目CD=" & lngDkomoku)
    End If


    ' 中項目リストを取得
    subCDs = Selector.GetCategoryList("Komokubetu", lngDkomoku)

    If IsEmpty(subCDs) Then Exit Sub

    For i = 1 To UBound(subCDs)
        If i > 15 Then Exit For ' フォームのボタン数に合わせて制限

        sCD = subCDs(i)
        ' ラベルと金額のセット
        Me("lblCkomoku" & i) = Nz(DLookup("中項目", "中項目", "中項目CD=" & sCD), "")
        Me("txtCkomoku" & i) = Nz(DSum("金額（円）", "抽出テーブル", "中項目CD=" & sCD), 0)
        Me("cmdMeisai" & i).Visible = True

        ' --- イベントの共通化登録 ---
        Set btnHandler = New clsMyButton
        ' 第2引数に「中項目CD」を渡してセットアップ
        btnHandler.Setup Me("cmdMeisai" & i), sCD, Me
        btnGroup.Add btnHandler
    Next i
End Sub

' クラス(clsMyButton)から呼び出される共通窓口
' ※名前を共通化しておくと管理が楽です
Public Sub ShowMeisaiFromClass(targetCD As Long)
    ' 抽出担当に中項目CDを渡して明細作成
    Selector.CreateMeisai targetCD, "中項目CD"
    Me!subMeisai.Visible = True
    Me!subMeisai.Requery
End Sub
