Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private insEdit As New clsEdit

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

    insEdit.SetupItemForm Me
    insEdit.OnLoad

    blnFormInitialized = True
    Me.PendingState = False

End Sub

Private Sub cmdClose_Click()

    Dim ret As VbMsgBoxResult
    Dim hasUnconfirmed As Boolean

    hasUnconfirmed = Me.PendingState

    If Not hasUnconfirmed Then
        If Me.subList.Form.Dirty Then
            hasUnconfirmed = True
        End If
    End If

    If hasUnconfirmed Then
        ret = MsgBox( _
            "未確定の変更があります。" & vbCrLf & _
            "このまま閉じると、本テーブルには反映されません。" & vbCrLf & vbCrLf & _
            "閉じますか？", _
            vbYesNo + vbExclamation + vbDefaultButton2, _
            "未確定変更")

        If ret = vbNo Then Exit Sub

        insEdit.ResetEditState
        Me.PendingState = False
    End If

    DoCmd.Close acForm, Me.name

End Sub

Private Sub cmdSearch_Click()
    insEdit.Search
End Sub

Private Sub cmdClear_Click()
    insEdit.ClearSearch
End Sub

Private Sub cmbDkomoku_AfterUpdate()
    insEdit.DkomokuAfterUpdate
End Sub

Private Sub cmdEdit_Click()
    insEdit.EditCurrent
End Sub

Private Sub cmdDelete_Click()
    insEdit.DeleteCurrent
End Sub

Private Sub cmdConfirm_Click()
    insEdit.ConfirmEdit

    '金額の＋－入れ替えを行っているので念のため
    Me!subList.Requery
End Sub

Public Sub RefreshSelectedInfo()
    insEdit.ShowCurrentRecord
End Sub
