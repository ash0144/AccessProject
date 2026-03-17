Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

Private Sub cmdAll_Click()
'"項目別一覧"/"勘定科目別一覧"の出力

    Dim dF As Date: dF = App.Period.GetMinDate(Me!txtFrom)
    Dim dT As Date: dT = App.Period.GetMaxDate(Me!txtTo)
    Dim optB As Integer

    optB = Me!optBunrui

    pubFromTo = App.Period.GetString(dF, dT)
    App.Selector.ExtractToWorkTable dF, dT, optB

    If optB = 1 Then
        DoCmd.OpenForm "frmZenkomoku"
    Else
        DoCmd.OpenForm "frmSinkoku"
    End If

End Sub

Private Sub cmdEdit_Click()
'編集画面の表示

App.Selector.OpenWorkEditForm "frmEditMF", "MoneyForward", "MoneyForwardWk"

End Sub

Private Sub cmdKomoku_Click()
'"項目明細"/"勘定科目明細"の出力

    Dim dF As Date: dF = App.Period.GetMinDate(Me!txtFrom)
    Dim dT As Date: dT = App.Period.GetMaxDate(Me!txtTo)
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

    App.Selector.ExtractToWorkTable dF, dT, optB, Me!cmbDkomoku

    pubDkomoku = Me!cmbDkomoku
    pubFromTo = App.Period.GetString(dF, dT)

    If optB = 1 Then
        DoCmd.OpenForm "frmKomokubetu"
    Else
        DoCmd.OpenForm "frmKamokubetu"
    End If

End Sub

Private Sub cmdImpMF_Click()
'Excelファイル(MoneyForward出力）の取込
'クラス側でエラーメッセージが出るので、ここでは成功時のみメッセージ

    If App.Registry.ImportMFData() Then
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

    Call App.Selector.LoadWorkTable("中項目", "中項目Wk")

    DoCmd.OpenForm "frmMstCk"

End Sub

Private Sub cmdMstDk_Click()

    Call App.Selector.LoadWorkTable("大項目", "大項目Wk")

    DoCmd.OpenForm "frmMstDk"

End Sub

Private Sub cmdMstKb_Click()

    Call App.Selector.LoadWorkTable("勘定分類", "勘定分類Wk")

    DoCmd.OpenForm "frmMstKb"

End Sub

Private Sub cmdMstKk_Click()

    Call App.Selector.LoadWorkTable("勘定科目", "勘定科目Wk")

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
