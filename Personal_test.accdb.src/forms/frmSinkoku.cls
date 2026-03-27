Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private btnGroup As New Collection ' ボタンクラスをまとめて入れておく袋

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

Private Sub Form_Open(Cancel As Integer)
    Dim mainCDs As Variant
    Dim i As Integer
    Dim mCD As Long
    Dim btnHandler As clsMyButton

    Me.txtRange = Me.OpenArgs
    Me.txtGokei = DSum("金額", "抽出テーブル")

    mainCDs = GetCategoryList("Sinkoku")

    If IsEmpty(mainCDs) Then Exit Sub

    For i = 1 To UBound(mainCDs)
        If i > 37 Then Exit For

        mCD = mainCDs(i)
        ' コントロールの初期設定
        Me("lblCkomoku" & i) = Nz(DLookup("勘定科目", "勘定科目", "勘定科目CD=" & mCD), "")
        Me("txtCkomoku" & i) = Nz(DSum("金額", "抽出テーブル", "勘定科目CD=" & mCD), "")
        Me("cmdMeisai" & i).Visible = True

        ' --- ここでイベントを共通化 ---
        Set btnHandler = New clsMyButton
        ' ボタン、ID、自分自身(Me)をクラスに渡して袋に入れる
        btnHandler.Setup Me("cmdMeisai" & i), mCD, Me
        btnGroup.Add btnHandler
    Next i
End Sub

' クラスから呼び出される共通メソッド
' ※ Publicにする必要があります
Public Sub ShowMeisaiFromClass(targetCD As Long)
    CreateMeisai targetCD, "勘定科目CD"
    Me!subMeisai.Visible = True
    Me!subMeisai.Requery
End Sub
