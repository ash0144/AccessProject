Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As New clsAppStore

Private strMasterTblN As String
Private strWorkTblN As String

'----------------------------------------
' プロパティ
'----------------------------------------
Public Property Let MasterTblN(ByVal v As String)
    strMasterTblN = v
End Property

Public Property Get MasterTblN() As String
    MasterTblN = strMasterTblN
End Property

Public Property Let WorkTblN(ByVal v As String)
    strWorkTblN = v
End Property

Public Property Get WorkTblN() As String
    WorkTblN = strWorkTblN
End Property

'----------------------------------------
' 初期化
'----------------------------------------
Public Sub InitializeForm()

    If App.FormF Is Nothing Then
        App.FormF.SetupItemForm Me
    End If

    App.FormF.OnLoad

End Sub

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

Private Sub Form_Load()
    App.FormF.SetupItemForm Me
    App.FormF.OnLoad
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If Not App.FormF Is Nothing Then
        App.FormF.OnUnload
    End If
End Sub

Private Sub cmdSearch_Click()
    App.FormF.Search
End Sub

Private Sub cmdClear_Click()
    App.FormF.ClearSearch
End Sub

Private Sub cmbDkomoku_AfterUpdate()
    App.FormF.DkomokuAfterUpdate
End Sub

Private Sub cmdAdd_Click()
    App.FormF.AddNew
End Sub

Private Sub cmdEdit_Click()
    App.FormF.EditCurrent
End Sub

Private Sub cmdDelete_Click()
    App.FormF.DeleteCurrent
End Sub

Private Sub cmdConfirm_Click()
    App.FormF.ConfirmEdit
End Sub

Public Sub RefreshSelectedInfo()
    If Not App.FormF Is Nothing Then
        App.FormF.ShowCurrentRecord
    End If
End Sub
