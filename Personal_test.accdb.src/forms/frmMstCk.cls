Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdCancel_Click()

    DoCmd.Close acForm, Me.name

End Sub

Private Sub cmdEnter_Click()

    Me.Requery
    Call ApplyDiff("中項目", "中項目Wk", "中項目CD")

End Sub
