Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Form_Current()
    On Error Resume Next
    Me.Parent.RefreshSelectedInfo
End Sub

Private Sub Form_BeforeUpdate(Cancel As Integer)
    If Nz(Me!項目名, "") = "" Then
        MsgBox "項目名を入力してください。", vbExclamation
        Me!項目名.SetFocus
        Cancel = True
    End If
End Sub
