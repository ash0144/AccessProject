Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private FormF As New clsFormFormat
Private blnFormInitialized As Boolean
Private strMasterTblN As String
Private strWorkTblN As String
Private blnDirtyWork As Boolean   'ワークテーブル未確定フラグ
Private blnPendingChanges As Boolean

'----------------------------------------
' プロパティ
'----------------------------------------
'Getのみのプロパティは外から読取専用、代入は不可
Public Property Get MasterTblN() As String
    MasterTblN = "MoneyForward"
End Property

Public Property Get WorkTblN() As String
    WorkTblN = "MoneyForwardWk"
End Property

' 外からTrueを代入されると確定ボタンが使用可能に
Public Property Let PendingState(ByVal v As Boolean)
    blnDirtyWork = v
    Me!cmdConfirm.Enabled = v
End Property

Public Property Get PendingState() As Boolean
    PendingState = blnDirtyWork
End Property

'----------------------------------------
' 初期化
'----------------------------------------
Public Sub InitializeForm()
    Debug.Print "=== InitializeForm START ==="
    Debug.Print "Me.Name       = " & Me.name
    Debug.Print "strMasterTblN = " & strMasterTblN
    Debug.Print "strWorkTblN   = " & strWorkTblN

    FormF.SetupItemForm Me
    FormF.OnLoad

    blnFormInitialized = True
    Me.PendingState = False

    Debug.Print "=== InitializeForm END ==="
End Sub

Private Sub cmdClose_Click()

    Dim ret As VbMsgBoxResult

    If Me.PendingState Then
        ret = MsgBox( _
            "未確定の変更があります。" & vbCrLf & _
            "このまま閉じると、本テーブルには反映されません。" & vbCrLf & vbCrLf & _
            "閉じますか？", _
            vbYesNo + vbExclamation + vbDefaultButton2, _
            "未確定変更")

        If ret = vbNo Then Exit Sub
    End If

    DoCmd.Close acForm, Me.name

End Sub

'----------------------------------------
' Load時は何もしない
'----------------------------------------
Private Sub Form_Load()
    Debug.Print "Form_Load : " & Me.name
End Sub

'----------------------------------------
' 終了時
'----------------------------------------
Private Sub Form_Unload(Cancel As Integer)

    If blnFormInitialized Then
        FormF.OnUnload
    End If

End Sub

Private Sub cmdSearch_Click()
    FormF.Search
End Sub

Private Sub cmdClear_Click()
    FormF.ClearSearch
End Sub

Private Sub cmbDkomoku_AfterUpdate()
    FormF.DkomokuAfterUpdate
End Sub

Private Sub cmdEdit_Click()
    FormF.EditCurrent
End Sub

Private Sub cmdDelete_Click()
    FormF.DeleteCurrent
End Sub

Private Sub cmdConfirm_Click()
    Debug.Print "cmdConfirm_Click"
    Debug.Print "  Me.MasterTblN = " & Me.MasterTblN
    Debug.Print "  Me.WorkTblN   = " & Me.WorkTblN

    FormF.ConfirmEdit
End Sub

Public Sub RefreshSelectedInfo()
    FormF.ShowCurrentRecord
End Sub
