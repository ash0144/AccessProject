Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdAll_Click()
'"項目別一覧"/"勘定科目別一覧"の出力

    Dim dF As Date: dF = GetMinDate(Me!txtFrom)  '日付（From）を検索用に整形
    Dim dT As Date: dT = GetMaxDate(Me!txtTo)    '日付（To）を検索用に整形
    Dim optB As Integer                                     '家計簿/確定申告の分類

    optB = Me!optBunrui

    ToPickUpTable dF, dT, optB            '検索条件で抽出テーブルに出力

    If optB = 1 Then
        DoCmd.OpenForm "frmZenkomoku", , , , , , GetString(dF, dT) '家計簿分類の大項目別一覧（明細：中項目）
    Else
        DoCmd.OpenForm "frmSinkoku", , , , , , GetString(dF, dT)   '確定申告分類の勘定科目別一覧（明細：中項目）
    End If

End Sub

Private Sub cmdEdit_Click()
'編集画面の表示

    LoadWorkTable "MoneyForward", "MoneyForwardWk", True
    DoCmd.OpenForm "frmEditMF"

    Forms!frmEditMF.InitializeForm

End Sub

Private Sub cmdKomoku_Click()
'"項目明細"/"勘定科目明細"の出力

    Dim dF As Date: dF = GetMinDate(Me!txtFrom)
    Dim dT As Date: dT = GetMaxDate(Me!txtTo)
    Dim optB As Integer

    optB = Me!optBunrui

    If IsNull(Me!cmbDkomoku) Or Me!cmbDkomoku = "" Then
        If optB = 1 Then
            MsgBox "項目を選択してください"
        Else
            MsgBox "科目を選択してください"
        End If
        Exit Sub
    End If

    ToPickUpTable dF, dT, optB, Me!cmbDkomoku

    DoCmd.OpenForm IIf(optB = 1, "frmKomokubetu", "frmKamokubetu"), , , , , , Me!cmbDkomoku & "," & GetString(dF, dT)

End Sub

Private Sub cmdImpMF_Click()
'Excelファイル(MoneyForward出力）の取込
'クラス側でエラーメッセージが出るので、ここでは成功時のみメッセージ

    If ImportMFData() Then
        Me.Requery
        MsgBox "完了しました"
    End If

End Sub

Private Sub cmdClr_Click()
'MoneyForwardデータのクリア

    Call tblClr("MoneyForward")
    MsgBox "MoneyForwardデータをクリアしました"

End Sub

Private Sub cmdInput_Click()
'手動入力フォームの表示

    DoCmd.OpenForm IIf(optBunrui = 1, "frmKinput", "frmSinput")

End Sub

Private Sub cmdClose_Click()

    DoCmd.Quit

End Sub

Private Sub cmdMstCk_Click()

    LoadWorkTable "中項目", "中項目Wk"

    DoCmd.OpenForm "frmMstCk"

End Sub

Private Sub cmdMstDk_Click()

    LoadWorkTable "大項目", "大項目Wk"

    DoCmd.OpenForm "frmMstDk"

End Sub

Private Sub cmdMstKb_Click()

    LoadWorkTable "勘定分類", "勘定分類Wk"

    DoCmd.OpenForm "frmMstKb"

End Sub

Private Sub cmdMstKk_Click()

    LoadWorkTable "勘定科目", "勘定科目Wk"

    DoCmd.OpenForm "frmMstKk"

End Sub

Private Sub optBunrui_AfterUpdate()
'家計簿分類/確定申告分類の切り替え

    cmdEdit.Visible = IIf(optBunrui = 1, True, False)
    cmdAll.Caption = IIf(optBunrui = 1, "項目別一覧", "勘定科目別一覧")
    cmdKomoku.Caption = IIf(optBunrui = 1, "項目明細", "勘定科目明細")
    lblDkomoku.Caption = IIf(optBunrui = 1, "項目：", "勘定科目：")
    cmbDkomoku.RowSource = IIf(optBunrui = 1, "大項目", "勘定科目")
    cmbDkomoku.Value = Null

End Sub
