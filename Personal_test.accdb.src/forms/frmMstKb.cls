Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

Private Sub cmdCancel_Click()

    DoCmd.Close acForm, Me.name

End Sub

Private Sub cmdEnter_Click()

    Me.Requery
    Call App.Selector.ApplyDiff("勘定分類", "勘定分類Wk", "勘定分類CD")

End Sub
