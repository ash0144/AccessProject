VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsFormFormat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

'========================================================
' フォーム標準フレームワーク
'========================================================

'----------------------------------------
' 初期表示モード
'----------------------------------------
Public Sub InitFormMode(frm As Form)
    On Error GoTo EH

    frm.AllowAdditions = True
    frm.AllowEdits = False
    frm.AllowDeletions = False

    SetEditButtons frm, False

    Exit Sub

EH:
    MsgBox "フォーム初期化中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 編集モードへ
'----------------------------------------
Public Sub BeginEditMode(frm As Form)
    On Error GoTo EH

    frm.AllowEdits = True
    frm.AllowAdditions = True
    frm.AllowDeletions = False

    SetEditButtons frm, True

    Exit Sub

EH:
    MsgBox "編集モード移行中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' ボタン状態切替
'----------------------------------------
Public Sub SetEditButtons(frm As Form, ByVal isEditing As Boolean)
    On Error Resume Next

    frm.Controls("cmdAdd").Enabled = Not isEditing
    frm.Controls("cmdEdit").Enabled = Not isEditing
    frm.Controls("cmdDelete").Enabled = Not isEditing
'    frm.Controls("btnRefresh").Enabled = Not isEditing
    frm.Controls("cmdPickup").Enabled = Not isEditing
    frm.Controls("cmdClear").Enabled = Not isEditing

    frm.Controls("cmdEnter").Enabled = isEditing
'    frm.Controls("btnCancel").Enabled = isEditing
End Sub

'----------------------------------------
' 新規
'----------------------------------------
Public Sub AddNewRecord(frm As Form, Optional ByVal FirstControlName As String = "")
    On Error GoTo EH

    BeginEditMode frm
    DoCmd.GoToRecord , , acNewRec

    If Len(FirstControlName) > 0 Then
        frm.Controls(FirstControlName).SetFocus
    End If

    Exit Sub

EH:
    MsgBox "新規レコード作成でエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 編集
'----------------------------------------
Public Sub EditCurrentRecord(frm As Form, Optional ByVal FirstControlName As String = "")
    On Error GoTo EH

    If frm.NewRecord Then
        MsgBox "編集するレコードを選択してください。", vbInformation
        Exit Sub
    End If

    BeginEditMode frm

    If Len(FirstControlName) > 0 Then
        frm.Controls(FirstControlName).SetFocus
    End If

    Exit Sub

EH:
    MsgBox "編集処理でエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 保存
'----------------------------------------
Public Function SaveCurrentRecord(frm As Form) As Boolean
    On Error GoTo EH

    If frm.Dirty Then
        frm.Dirty = False
    End If

    InitFormMode frm
    SaveCurrentRecord = True
    Exit Function

EH:
    MsgBox "保存処理でエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
    SaveCurrentRecord = False
End Function

'----------------------------------------
' 取消
'----------------------------------------
Public Function CancelEdit(frm As Form) As Boolean
    On Error GoTo EH

    If frm.Dirty Then
        frm.Undo
    End If

    InitFormMode frm
    CancelEdit = True
    Exit Function

EH:
    MsgBox "取消処理でエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
    CancelEdit = False
End Function

'----------------------------------------
' 再表示
'----------------------------------------
Public Sub RefreshRecordList(frm As Form)
    On Error GoTo EH

    frm.Requery
    InitFormMode frm

    Exit Sub

EH:
    MsgBox "再表示中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 保存確認
'----------------------------------------
Public Function ConfirmSaveIfDirty(frm As Form) As Boolean
    On Error GoTo EH

    Dim ret As VbMsgBoxResult

    If Not frm.Dirty Then
        ConfirmSaveIfDirty = True
        Exit Function
    End If

    ret = MsgBox( _
        "変更内容が保存されていません。" & vbCrLf & _
        "保存しますか？", _
        vbYesNoCancel + vbQuestion, _
        "保存確認")

    Select Case ret
        Case vbYes
            frm.Dirty = False
            InitFormMode frm
            ConfirmSaveIfDirty = True

        Case vbNo
            frm.Undo
            InitFormMode frm
            ConfirmSaveIfDirty = True

        Case vbCancel
            ConfirmSaveIfDirty = False
    End Select

    Exit Function

EH:
    MsgBox "保存確認中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
    ConfirmSaveIfDirty = False
End Function

'----------------------------------------
' 削除
'----------------------------------------
Public Sub DeleteCurrentRecord( _
    ByVal frm As Form, _
    ByVal KeyFieldName As String, _
    ByVal NameFieldName As String, _
    Optional ByVal RelatedTableName As String = "", _
    Optional ByVal RelatedFieldName As String = "")

    On Error GoTo EH

    Dim vKey As Variant
    Dim vName As Variant
    Dim sMsg As String

    If frm.NewRecord Then Exit Sub

    vKey = frm.Controls(KeyFieldName).Value
    vName = frm.Controls(NameFieldName).Value

    If Len(RelatedTableName) > 0 And Len(RelatedFieldName) > 0 Then
        If HasRelatedRecord(RelatedTableName, RelatedFieldName, vKey) Then
            MsgBox "関連データが存在するため削除できません。", vbExclamation, "削除不可"
            Exit Sub
        End If
    End If

    sMsg = "以下のレコードを削除します。" & vbCrLf & vbCrLf & _
           KeyFieldName & " : " & Nz(vKey, "") & vbCrLf & _
           NameFieldName & " : " & Nz(vName, "") & vbCrLf & vbCrLf & _
           "よろしいですか？"

    If MsgBox(sMsg, vbYesNo + vbQuestion + vbDefaultButton2, "削除確認") = vbNo Then
        Exit Sub
    End If

    frm.SetFocus
    DoCmd.RunCommand acCmdDeleteRecord

    InitFormMode frm
    Exit Sub

EH:
    MsgBox "削除処理中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 関連データ存在チェック
'----------------------------------------
Public Function HasRelatedRecord( _
    ByVal TableName As String, _
    ByVal FieldName As String, _
    ByVal KeyValue As Variant) As Boolean

    On Error GoTo EH

    Dim sWhere As String

    If IsNull(KeyValue) Then
        HasRelatedRecord = False
        Exit Function
    End If

    If IsNumeric(KeyValue) Then
        sWhere = "[" & FieldName & "] = " & KeyValue
    Else
        sWhere = "[" & FieldName & "] = '" & Replace(KeyValue, "'", "''") & "'"
    End If

    HasRelatedRecord = (DCount("*", TableName, sWhere) > 0)
    Exit Function

EH:
    MsgBox "関連データ確認中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
    HasRelatedRecord = True
End Function

'========================================================
' 検索・抽出系
'========================================================

'----------------------------------------
' 文字列をSQL安全用に整形
'----------------------------------------
Public Function EscapeLikeValue(ByVal s As String) As String
    Dim tmp As String

    tmp = s
    tmp = Replace(tmp, "'", "''")
    tmp = Replace(tmp, "[", "[[]")
    tmp = Replace(tmp, "*", "[*]")
    tmp = Replace(tmp, "?", "[?]")
    tmp = Replace(tmp, "#", "[#]")

    EscapeLikeValue = tmp
End Function

'----------------------------------------
' WHERE条件を組み立ててFilter適用
' SearchFieldNames : Array("商品名", "商品コード")
'----------------------------------------
Public Sub ApplySearchFilter( _
    ByVal frm As Form, _
    ByVal SearchText As String, _
    ByVal SearchFieldNames As Variant, _
    Optional ByVal ComboFieldName As String = "", _
    Optional ByVal ComboValue As Variant = Null)

    On Error GoTo EH

    Dim sFilter As String
    Dim sOr As String
    Dim i As Long
    Dim sText As String

    sFilter = ""

    sText = Trim$(Nz(SearchText, ""))

    If sText <> "" Then
        sText = EscapeLikeValue(sText)

        For i = LBound(SearchFieldNames) To UBound(SearchFieldNames)
            If sOr <> "" Then sOr = sOr & " OR "
            sOr = sOr & "[" & CStr(SearchFieldNames(i)) & "] Like '*" & sText & "*'"
        Next i

        sFilter = "(" & sOr & ")"
    End If

    If Len(ComboFieldName) > 0 Then
        If Not IsNull(ComboValue) And Nz(ComboValue, "") <> "" Then
            If sFilter <> "" Then sFilter = sFilter & " AND "

            If IsNumeric(ComboValue) Then
                sFilter = sFilter & "[" & ComboFieldName & "] = " & ComboValue
            Else
                sFilter = sFilter & "[" & ComboFieldName & "] = '" & Replace(CStr(ComboValue), "'", "''") & "'"
            End If
        End If
    End If

    If sFilter <> "" Then
        frm.Filter = sFilter
        frm.FilterOn = True
    Else
        frm.FilterOn = False
        frm.Filter = ""
    End If

    Exit Sub

EH:
    MsgBox "抽出処理でエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description & vbCrLf & vbCrLf & _
           "Filter = " & sFilter, vbExclamation
End Sub

'----------------------------------------
' 検索欄クリア
'----------------------------------------
Public Sub ClearSearchControls(frm As Form, _
                               Optional ByVal SearchControlName As String = "txtSearch", _
                               Optional ByVal ComboControlName As String = "cboFilterKubun")
    On Error Resume Next

    frm.Controls(SearchControlName).Value = Null
    frm.Controls(ComboControlName).Value = Null
End Sub

'----------------------------------------
' フィルタ解除＋再表示
'----------------------------------------
Public Sub ClearFilterAndRefresh(frm As Form)
    On Error GoTo EH

    frm.FilterOn = False
    frm.Filter = ""
    frm.Requery
    InitFormMode frm

    Exit Sub

EH:
    MsgBox "フィルタ解除中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 並び替え適用
' SortText例: "[商品ID] ASC", "[更新日] DESC"
'----------------------------------------
Public Sub ApplySort(frm As Form, ByVal SortText As String)
    On Error GoTo EH

    frm.OrderBy = SortText
    frm.OrderByOn = True

    Exit Sub

EH:
    MsgBox "並び替え処理でエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' 並び替え解除
'----------------------------------------
Public Sub ClearSort(frm As Form)
    On Error Resume Next

    frm.OrderByOn = False
    frm.OrderBy = ""
End Sub

'----------------------------------------
' サブフォームコントロールから実フォーム取得
'----------------------------------------
Public Function GetSubForm(ByVal frmMain As Form, _
                           ByVal SubFormControlName As String) As Form
    On Error GoTo EH

    Set GetSubForm = frmMain.Controls(SubFormControlName).Form
    Exit Function

EH:
    MsgBox "サブフォーム取得中にエラーが発生しました。" & vbCrLf & _
           "コントロール名: " & SubFormControlName & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
    Set GetSubForm = Nothing
End Function

'----------------------------------------
' サブフォームに検索適用
'----------------------------------------
Public Sub ApplySearchToSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String, _
    ByVal SearchText As String, _
    ByVal SearchFieldNames As Variant, _
    Optional ByVal ComboFieldName As String = "", _
    Optional ByVal ComboValue As Variant = Null)

    On Error GoTo EH

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    ApplySearchFilter frmSub, SearchText, SearchFieldNames, ComboFieldName, ComboValue
    Exit Sub

EH:
    MsgBox "サブフォーム抽出中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' サブフォームのフィルタ解除＋再表示
'----------------------------------------
Public Sub ClearSubFormFilterAndRefresh( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String)

    On Error GoTo EH

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    ClearFilterAndRefresh frmSub
    Exit Sub

EH:
    MsgBox "サブフォーム再表示中にエラーが発生しました。" & vbCrLf & _
           Err.Number & " : " & Err.Description, vbExclamation
End Sub

'----------------------------------------
' サブフォームの新規
'----------------------------------------
Public Sub AddNewInSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String, _
    Optional ByVal FirstControlName As String = "")

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    AddNewRecord frmSub, FirstControlName
End Sub

'----------------------------------------
' サブフォームの編集
'----------------------------------------
Public Sub EditCurrentInSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String, _
    Optional ByVal FirstControlName As String = "")

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    EditCurrentRecord frmSub, FirstControlName
End Sub

'----------------------------------------
' サブフォームの保存
'----------------------------------------
Public Function SaveCurrentInSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String) As Boolean

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Function

    SaveCurrentInSubForm = SaveCurrentRecord(frmSub)
End Function

'----------------------------------------
' サブフォームの取消
'----------------------------------------
Public Function CancelEditInSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String) As Boolean

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Function

    CancelEditInSubForm = CancelEdit(frmSub)
End Function

'----------------------------------------
' サブフォームの削除
'----------------------------------------
Public Sub DeleteCurrentInSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String, _
    ByVal KeyFieldName As String, _
    ByVal NameFieldName As String, _
    Optional ByVal RelatedTableName As String = "", _
    Optional ByVal RelatedFieldName As String = "")

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    DeleteCurrentRecord frmSub, KeyFieldName, NameFieldName, RelatedTableName, RelatedFieldName
End Sub

'----------------------------------------
' サブフォーム再表示
'----------------------------------------
Public Sub RefreshSubFormList( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String)

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    RefreshRecordList frmSub
End Sub

'----------------------------------------
' サブフォーム並び替え
'----------------------------------------
Public Sub ApplySortToSubForm( _
    ByVal frmMain As Form, _
    ByVal SubFormControlName As String, _
    ByVal SortText As String)

    Dim frmSub As Form

    Set frmSub = GetSubForm(frmMain, SubFormControlName)
    If frmSub Is Nothing Then Exit Sub

    ApplySort frmSub, SortText
End Sub
