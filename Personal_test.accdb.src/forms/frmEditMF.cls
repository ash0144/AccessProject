Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private mFormatter As clsFormFormat

Private Sub Form_Load()
    Set mFormatter = New clsFormFormat
    mFormatter.SetupItemForm Me
    mFormatter.OnLoad
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If Not mFormatter Is Nothing Then
        mFormatter.OnUnload
        Set mFormatter = Nothing
    End If
End Sub

Private Sub btnSearch_Click()
    mFormatter.Search
End Sub

Private Sub btnClear_Click()
    mFormatter.ClearSearch
End Sub

Private Sub cboLargeCategory_AfterUpdate()
    mFormatter.LargeCategoryAfterUpdate
End Sub

Private Sub btnAdd_Click()
    mFormatter.AddNew
End Sub

Private Sub btnEdit_Click()
    mFormatter.EditCurrent
End Sub

Private Sub btnDelete_Click()
    mFormatter.DeleteCurrent
End Sub

Private Sub btnConfirm_Click()
    mFormatter.ConfirmEdit
End Sub

Public Sub RefreshSelectedInfo()
    If Not mFormatter Is Nothing Then
        mFormatter.ShowCurrentRecord
    End If
End Sub
