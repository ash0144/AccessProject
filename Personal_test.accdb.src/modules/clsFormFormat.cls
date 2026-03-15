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

Private mFrmMain As Form

Private mSubFormControlName As String

Private mDateFieldName As String
Private mLargeCategoryFieldName As String
Private mMiddleCategoryFieldName As String
Private mTextSearchFields As Variant

Private mKeyFieldName As String
Private mDisplayFieldName As String
Private mFirstFocusControlName As String

Private mDefaultOrderBy As String

Private mRelatedTableName As String
Private mRelatedFieldName As String

Private mLargeCategoryComboName As String
Private mMiddleCategoryComboName As String

'----------------------------------------
' この画面専用セットアップ
'----------------------------------------
Public Sub SetupItemForm(ByVal frmMain As Form)

    Set mFrmMain = frmMain

    mSubFormControlName = "subList"

    mDateFieldName = "対象日"
    mLargeCategoryFieldName = "大分類ID"
    mMiddleCategoryFieldName = "中分類ID"
    mTextSearchFields = Array("項目名", "項目コード", "備考")

    mKeyFieldName = "項目ID"
    mDisplayFieldName = "項目名"
    mFirstFocusControlName = "項目名"

    mDefaultOrderBy = "[対象日] DESC, [項目ID] ASC"

    mRelatedTableName = "T_明細"
    mRelatedFieldName = "項目ID"

    mLargeCategoryComboName = "cboLargeCategory"
    mMiddleCategoryComboName = "cboMiddleCategory"

End Sub

'----------------------------------------
' サブフォーム取得
'----------------------------------------
Private Property Get SubFrm() As Form
    Set SubFrm = mFrmMain.Controls(mSubFormControlName).Form
End Property

'----------------------------------------
' 起動時
'----------------------------------------
Public Sub OnLoad()

    SetButtonMode False

    With SubFrm
        .AllowEdits = False
        .AllowAdditions = True
        .AllowDeletions = False

        If mDefaultOrderBy <> "" Then
            .OrderBy = mDefaultOrderBy
            .OrderByOn = True
        End If
    End With

    ShowCurrentRecord

End Sub

'----------------------------------------
' 閉じるとき
'----------------------------------------
Public Sub OnUnload()
    On Error Resume Next

    With SubFrm
        If .Dirty Then .Undo
        .AllowEdits = False
    End With
End Sub

'----------------------------------------
' ボタン状態
'----------------------------------------
Private Sub SetButtonMode(ByVal isEditing As Boolean)
    On Error Resume Next

    mFrmMain!btnAdd.Enabled = Not isEditing
    mFrmMain!btnEdit.Enabled = Not isEditing
    mFrmMain!btnDelete.Enabled = Not isEditing
    mFrmMain!btnSearch.Enabled = Not isEditing
    mFrmMain!btnClear.Enabled = Not isEditing

    mFrmMain!btnConfirm.Enabled = isEditing
End Sub

'----------------------------------------
' 検索
'----------------------------------------
Public Sub Search()
    Dim sWhere As String

    sWhere = BuildSearchWhere()

    With SubFrm
        If sWhere <> "" Then
            .Filter = sWhere
            .FilterOn = True
        Else
            .FilterOn = False
            .Filter = ""
        End If

        .Requery
    End With

    ShowCurrentRecord
End Sub

'----------------------------------------
' 検索クリア
'----------------------------------------
Public Sub ClearSearch()
    On Error Resume Next

    mFrmMain!txtDateFrom = Null
    mFrmMain!txtDateTo = Null
    mFrmMain.Controls(mLargeCategoryComboName) = Null
    mFrmMain.Controls(mMiddleCategoryComboName) = Null
    mFrmMain!txtItemName = Null

    mFrmMain.Controls(mMiddleCategoryComboName).Requery

    With SubFrm
        .FilterOn = False
        .Filter = ""
        .Requery

        If mDefaultOrderBy <> "" Then
            .OrderBy = mDefaultOrderBy
            .OrderByOn = True
        End If
    End With

    ShowCurrentRecord
End Sub

'----------------------------------------
' 大分類変更時
'----------------------------------------
Public Sub LargeCategoryAfterUpdate()
    On Error Resume Next

    mFrmMain.Controls(mMiddleCategoryComboName) = Null
    mFrmMain.Controls(mMiddleCategoryComboName).Requery
End Sub

'----------------------------------------
' 新規
'----------------------------------------
Public Sub AddNew()

    SetButtonMode True

    With SubFrm
        .AllowEdits = True
        .AllowAdditions = True
        .SetFocus
        DoCmd.GoToRecord , , acNewRec
        .Controls(mFirstFocusControlName).SetFocus
    End With

    ShowCurrentRecord
End Sub

'----------------------------------------
' 編集
'----------------------------------------
Public Sub EditCurrent()

    If SubFrm.NewRecord Then Exit Sub

    SetButtonMode True

    With SubFrm
        .AllowEdits = True
        .SetFocus
        .Controls(mFirstFocusControlName).SetFocus
    End With

    ShowCurrentRecord
End Sub

'----------------------------------------
' 確定
'----------------------------------------
Public Sub ConfirmEdit()

    With SubFrm
        If .Dirty Then .Dirty = False
        .Requery
        .AllowEdits = False
    End With

    SetButtonMode False
    ShowCurrentRecord
End Sub

'----------------------------------------
' 削除
'----------------------------------------
Public Sub DeleteCurrent()
    Dim msg As String
    Dim frmSub As Form

    Set frmSub = SubFrm

    If frmSub.NewRecord Then Exit Sub

    If mRelatedTableName <> "" And mRelatedFieldName <> "" Then
        If HasRelatedRecord(mRelatedTableName, mRelatedFieldName, frmSub.Controls(mKeyFieldName)) Then
            MsgBox "関連データで使用中のため削除できません。", vbExclamation
            Exit Sub
        End If
    End If

    msg = "以下のレコードを削除します。" & vbCrLf & vbCrLf & _
          mKeyFieldName & " : " & Nz(frmSub.Controls(mKeyFieldName), "") & vbCrLf & _
          mDisplayFieldName & " : " & Nz(frmSub.Controls(mDisplayFieldName), "") & vbCrLf & vbCrLf & _
          "よろしいですか？"

    If MsgBox(msg, vbYesNo + vbQuestion + vbDefaultButton2, "削除確認") = vbNo Then
        Exit Sub
    End If

    frmSub.SetFocus
    DoCmd.RunCommand acCmdDeleteRecord
    frmSub.Requery

    SetButtonMode False
    ShowCurrentRecord
End Sub

'----------------------------------------
' 選択中表示
'----------------------------------------
Public Sub ShowCurrentRecord()
    On Error GoTo EH

    With SubFrm
        If .RecordsetClone.RecordCount = 0 Then
            mFrmMain!txtSelInfo = ""
        ElseIf .NewRecord Then
            mFrmMain!txtSelInfo = "新規レコード入力中"
        Else
            mFrmMain!txtSelInfo = _
                Nz(.Controls(mKeyFieldName), "") & " / " & _
                Nz(.Controls(mDisplayFieldName), "")
        End If
    End With

    Exit Sub

EH:
    mFrmMain!txtSelInfo = ""
End Sub

'----------------------------------------
' WHERE句作成
'----------------------------------------
Private Function BuildSearchWhere() As String
    Dim sWhere As String
    Dim sTextCondition As String

    sWhere = ""

    If Not IsNull(mFrmMain!txtDateFrom) And mFrmMain!txtDateFrom <> "" Then
        AddWhere sWhere, "[" & mDateFieldName & "] >= #" & _
                         Format(mFrmMain!txtDateFrom, "yyyy/mm/dd") & "#"
    End If

    If Not IsNull(mFrmMain!txtDateTo) And mFrmMain!txtDateTo <> "" Then
        AddWhere sWhere, "[" & mDateFieldName & "] < #" & _
                         Format(DateAdd("d", 1, mFrmMain!txtDateTo), "yyyy/mm/dd") & "#"
    End If

    If Nz(mFrmMain.Controls(mLargeCategoryComboName), "") <> "" Then
        AddWhere sWhere, "[" & mLargeCategoryFieldName & "] = " & _
                         mFrmMain.Controls(mLargeCategoryComboName)
    End If

    If Nz(mFrmMain.Controls(mMiddleCategoryComboName), "") <> "" Then
        AddWhere sWhere, "[" & mMiddleCategoryFieldName & "] = " & _
                         mFrmMain.Controls(mMiddleCategoryComboName)
    End If

    sTextCondition = BuildTextSearchCondition(Nz(mFrmMain!txtItemName, ""))
    If sTextCondition <> "" Then
        AddWhere sWhere, sTextCondition
    End If

    BuildSearchWhere = sWhere
End Function

'----------------------------------------
' 文字検索条件
'----------------------------------------
Private Function BuildTextSearchCondition(ByVal SearchText As String) As String
    Dim i As Long
    Dim s As String
    Dim sOr As String

    s = Trim$(Nz(SearchText, ""))
    If s = "" Then Exit Function

    s = EscapeText(s)

    If IsArray(mTextSearchFields) Then
        For i = LBound(mTextSearchFields) To UBound(mTextSearchFields)
            If sOr <> "" Then sOr = sOr & " OR "
            sOr = sOr & "[" & CStr(mTextSearchFields(i)) & "] Like '*" & s & "*'"
        Next i
    Else
        sOr = "[" & CStr(mTextSearchFields) & "] Like '*" & s & "*'"
    End If

    If sOr <> "" Then
        BuildTextSearchCondition = "(" & sOr & ")"
    End If
End Function

'----------------------------------------
' WHERE追加
'----------------------------------------
Private Sub AddWhere(ByRef sWhere As String, ByVal sCondition As String)
    If sWhere <> "" Then
        sWhere = sWhere & " AND "
    End If
    sWhere = sWhere & sCondition
End Sub

'----------------------------------------
' 文字列エスケープ
'----------------------------------------
Private Function EscapeText(ByVal s As String) As String
    EscapeText = Replace(s, "'", "''")
End Function
