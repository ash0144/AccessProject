Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

Private Sub cmdCancel_Click()

    If MsgBox("表示の内容をキャンセルして閉じます" & vbCrLf & "よろしいですか？", vbYesNo) = vbYes Then
        DoCmd.Close acForm, Me.name
    End If

End Sub
