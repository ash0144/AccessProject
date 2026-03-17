Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private App As clsAppStore

Private strMasterTblN As String
Private strWorkTblN As String
Private blnDirtyWork As Boolean   'ワークテーブル未確定フラグ
Private blnPendingChanges As Boolean

'----------------------------------------
' プロパティ
'----------------------------------------
Public Property Let MasterTblN(ByVal v As String)
    Debug.Print "Let MasterTblN = " & v
    strMasterTblN = v
End Property

Public Property Get MasterTblN() As String
    Debug.Print "Get MasterTblN = " & strMasterTblN
    MasterTblN = strMasterTblN
End Property

Public Property Let WorkTblN(ByVal v As String)
    Debug.Print "Let WorkTblN = " & v
    strWorkTblN = v
End Property

Public Property Get WorkTblN() As String
    Debug.Print "Get WorkTblN = " & strWorkTblN
    WorkTblN = strWorkTblN
End Property

Public Property Let HasPendingChanges(ByVal v As Boolean)
    blnDirtyWork = v

    Debug.Print "HasPendingChanges = " & v

    ' 確定ボタンだけここで制御
    Me!cmdConfirm.Enabled = v
End Property

Public Property Get HasPendingChanges() As Boolean
    HasPendingChanges = blnDirtyWork
End Property

'----------------------------------------
' 初期化
'----------------------------------------
Public Sub InitializeForm()

    Debug.Print "=== InitializeForm START ==="
    Debug.Print "Me.Name       = " & Me.name
    Debug.Print "strMasterTblN = " & strMasterTblN
    Debug.Print "strWorkTblN   = " & strWorkTblN

    If App Is Nothing Then
        Debug.Print "Create clsAppStore"
        Set App = New clsAppStore
    End If

    App.FormF.SetupItemForm Me
    App.FormF.OnLoad

    Me.HasPendingChanges = False

    Debug.Print "=== InitializeForm END ==="

End Sub

Private Sub cmdClose_Click()
    DoCmd.Close acForm, Me.name
End Sub

'----------------------------------------
' Load時は何もしない
'----------------------------------------
Private Sub Form_Load()
    Debug.Print "Form_Load : " & Me.name
End Sub

Private Sub Form_Open(Cancel As Integer)
    Set App = New clsAppStore
End Sub

'----------------------------------------
' 終了時
'----------------------------------------
Private Sub Form_Unload(Cancel As Integer)
    Debug.Print "Form_Unload : " & Me.name

    Dim ret As VbMsgBoxResult

    If Me.HasPendingChanges Then
        ret = MsgBox( _
            "未確定の変更があります。" & vbCrLf & _
            "このまま閉じると、本テーブルには反映されません。" & vbCrLf & vbCrLf & _
            "閉じますか？", _
            vbYesNo + vbExclamation + vbDefaultButton2, _
            "未確定変更")

        If ret = vbNo Then
            Cancel = True
            Exit Sub
        End If
    End If


    If Not App Is Nothing Then
        If Not App.FormF Is Nothing Then
            App.FormF.OnUnload
        End If
        Set App = Nothing
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
    Debug.Print "cmdConfirm_Click"
    Debug.Print "  Me.MasterTblN = " & Me.MasterTblN
    Debug.Print "  Me.WorkTblN   = " & Me.WorkTblN

    App.FormF.ConfirmEdit
End Sub

Public Sub RefreshSelectedInfo()
    If Not App Is Nothing Then
        If Not App.FormF Is Nothing Then
            App.FormF.ShowCurrentRecord
        End If
    End If
End Sub
