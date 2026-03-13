Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

Private Sub cmbDkomoku_Click()
    Me!cmbCkomoku.RowSource = "SELECT 中項目 FROM 中項目 WHERE 大項目CD=" & Nz(Me!cmbDkomoku, 0) & ";"
End Sub

Private Sub cmdCancel_Click()

    DoCmd.Close acForm, Me.name

End Sub

Private Sub cmdEnter_Click()

    Me.Requery
    Call App.Selector.ApplyDiff("中項目", "中項目Wk", "中項目CD")

End Sub
