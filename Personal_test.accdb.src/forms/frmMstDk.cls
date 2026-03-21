Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Selector As New clsDataSelector

Private Sub cmdCancel_Click()

    DoCmd.Close acForm, Me.name

End Sub

Private Sub cmdEnter_Click()

    Me.Requery
    Call Selector.ApplyDiff("大項目", "大項目Wk", "大項目CD")

End Sub
