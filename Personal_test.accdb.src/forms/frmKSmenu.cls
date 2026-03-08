Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

Private Sub cmdAll_Click()

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
Private Sub cmdKomoku_Click()

    Dim dF As Date: dF = App.Period.GetMinDate(Me!txtFrom)
    Dim dT As Date: dT = App.Period.GetMaxDate(Me!txtTo)
    Dim optB As Integer

    optB = Me!optBunrui

    If IsNull(Me!cmbDkomoku) Then MsgBox "項目を選択してください": Exit Sub

    App.Selector.ExtractToWorkTable dF, dT, optB, Me!cmbDkomoku

    pubDkomoku = Me!cmbDkomoku
    pubFromTo = App.Period.GetString(dF, dT)

    DoCmd.OpenForm "frmKomokubetu"
End Sub

Private Sub cmdImpMF_Click()
    ' クラス側でエラーメッセージが出るので、ここでは成功時のみメッセージを出す
    If App.Registry.ImportMFData() Then
        Me.Requery
        MsgBox "完了しました"
    End If
End Sub

Private Sub cmdClr_Click()
    Call tblClr("MoneyForward")
    MsgBox "MoneyForwardデータをクリアしました"
End Sub

Private Sub cmdInput_Click()
    DoCmd.OpenForm IIf(optBunrui = 1, "frmKinput", "frmSinput")
End Sub

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

Private Sub optBunrui_AfterUpdate()
    Dim isType1 As Boolean: isType1 = (optBunrui = 1)
    cmdAll.Caption = IIf(isType1, "項目別一覧", "勘定科目別一覧")
    lblDkomoku.Visible = isType1
    cmbDkomoku.Visible = isType1
    cmdKomoku.Visible = isType1
End Sub
