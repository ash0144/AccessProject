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

Private App As New clsAppStore

Private frmMainForm As Form         'メインフォーム

Private strSubFormCtrN As String    'サブフォームのコントロール名

Private strDateFldN As String       '日付のフィールド名
Private strDkomokuFldN As String    '大項目のフィールド名
Private strCkomokuFldN As String    '中項目のフィールド名
Private valSearchFlds As Variant    '検索するフィールド
Private strKeyFldN As String        'キーフィールド名
Private strDisplayFldN As String    '表示フィールド名
Private str1stFocusCtrN As String   '最初にフォーカスするコントロール名
Private strDefaultOrder As String   '既定の並び順

Private strRelatedTblN As String    'リレーションテーブル名
Private strRelatedFldN As String    'リレーションフィールド名

Private strDkomokuCmbN As String    '大項目コンボボックス名
Private strCkomokuCmbN As String    '中項目コンボボックス名

'----------------------------------------
' 共通セットアップ
'----------------------------------------
Public Sub SetupItemForm(ByVal frmMain As Form)

    Set frmMainForm = frmMain

    strSubFormCtrN = "subList"

    strDateFldN = "日付"
    strDkomokuFldN = "大項目"
    strCkomokuFldN = "中項目"
    valSearchFlds = Array("内容", "備考")

    strKeyFldN = "ID"
    strDisplayFldN = "内容"
    str1stFocusCtrN = "txtDate"

    strDefaultOrder = "[日付] DESC, [中項目CD] ASC"

    strRelatedTblN = "中項目"
    strRelatedFldN = "中項目CD"

    strDkomokuCmbN = "cmbDkomoku"
    strCkomokuCmbN = "cmbCkomoku"

End Sub

'----------------------------------------
' フォーム参照
'----------------------------------------
Private Property Get SubFrm() As Form
    Set SubFrm = frmMainForm.Controls(strSubFormCtrN).Form
End Property

Private Property Get MasterTblN() As String
    MasterTblN = frmMainForm.MasterTblN
End Property

Private Property Get WorkTblN() As String
    WorkTblN = frmMainForm.WorkTblN
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
        .OrderBy = strDefaultOrder
        .OrderByOn = True
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

    frmMainForm!cmdAdd.Enabled = Not isEditing
    frmMainForm!cmdEdit.Enabled = Not isEditing
    frmMainForm!cmdDelete.Enabled = Not isEditing
    frmMainForm!cmdSearch.Enabled = Not isEditing
    frmMainForm!cmdClear.Enabled = Not isEditing

    frmMainForm!cmdConfirm.Enabled = isEditing
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

    frmMainForm!txtDateFrom = Null
    frmMainForm!txtDateTo = Null
    frmMainForm.Controls(strDkomokuCmbN) = Null
    frmMainForm.Controls(strCkomokuCmbN) = Null
    frmMainForm!txtItemName = Null

    frmMainForm.Controls(strCkomokuCmbN).Requery

    With SubFrm
        .FilterOn = False
        .Filter = ""
        .Requery
        .OrderBy = strDefaultOrder
        .OrderByOn = True
    End With

    ShowCurrentRecord
End Sub

'----------------------------------------
' メインフォームの大分類変更時
'----------------------------------------
Public Sub DkomokuAfterUpdate()
    Dim cmbD As Control
    Dim cmbC As Control

    Set cmbD = frmMainForm.Controls(strDkomokuCmbN)
    Set cmbC = frmMainForm.Controls(strCkomokuCmbN)

    cmbC = Null

    cmbC.RowSource = GetCkomokuRowSource(cmbD.Value)
    cmbC.Requery
End Sub

'----------------------------------------
' 新規
'----------------------------------------
Public Sub AddNew()

    SetButtonMode True

    With SubFrm
        .AllowEdits = True
        .AllowAdditions = True
    End With

    frmMainForm.Controls(strSubFormCtrN).SetFocus
    DoCmd.GoToRecord , , acNewRec
    SubFrm.Controls(str1stFocusCtrN).SetFocus

    frmMainForm.HasPendingChanges = True   ' ←追加

    ShowCurrentRecord
End Sub

'----------------------------------------
' 編集
'----------------------------------------
Public Sub EditCurrent()

    If SubFrm.NewRecord Then Exit Sub

    SetButtonMode True

    SubFrm.AllowEdits = True

    frmMainForm.Controls(strSubFormCtrN).SetFocus
    SubFrm.Controls(str1stFocusCtrN).SetFocus

    frmMainForm.HasPendingChanges = True   ' ←追加

    ShowCurrentRecord
End Sub

'----------------------------------------
' 確定
'----------------------------------------
Public Sub ConfirmEdit()
    Dim strSQL As String
    Dim qdf As DAO.QueryDef

    Debug.Print "=== clsFormFormat.ConfirmEdit START ==="
    Debug.Print "frmMainForm.Name       = " & frmMainForm.name
    Debug.Print "frmMainForm.MasterTblN = " & frmMainForm.MasterTblN
    Debug.Print "frmMainForm.WorkTblN   = " & frmMainForm.WorkTblN

    If Not frmMainForm.HasPendingChanges Then Exit Sub

    With SubFrm
        If .Dirty Then .Dirty = False
        .Requery
        .AllowEdits = False
    End With

    '新規入力があった場合、計算対象とIDを自動入力
    strSQL = "UPDATE MoneyForwardWk SET MoneyForwardWk.計算対象 = 1, MoneyForwardWk.ID = [tmpID] " & _
            "WHERE (MoneyForwardWk.計算対象 IS NULL) AND (MoneyForwardWk.ID IS NULL OR MoneyForwardWk.ID = '');"

    Set qdf = CurrentDb.CreateQueryDef("", strSQL)
    qdf.Parameters("tmpID").Value = GetID
    qdf.Execute dbFailOnError
    Set qdf = Nothing

    If frmMainForm.HasPendingChanges Then
        Call App.Selector.ApplyDiff(frmMainForm.MasterTblN, frmMainForm.WorkTblN, strKeyFldN)
    End If

    frmMainForm.HasPendingChanges = False   ' ←ここがポイント

    SetButtonMode False
    ShowCurrentRecord

    Debug.Print "=== clsFormFormat.ConfirmEdit END ==="

End Sub

'----------------------------------------
' 削除
'----------------------------------------
Public Sub DeleteCurrent()
    Dim msg As String
    Dim strSQL As String

    If SubFrm.NewRecord Then Exit Sub

'    If strRelatedTblN <> "" And strRelatedFldN <> "" Then
'        If HasRelatedRecord(strRelatedTblN, strRelatedFldN, SubFrm.Controls(strKeyFldN)) Then
'            MsgBox "関連データで使用中のため削除できません。", vbExclamation
'            Exit Sub
'        End If
'    End If

    msg = "以下のレコードを削除します。" & vbCrLf & vbCrLf & _
          strKeyFldN & " : " & Nz(SubFrm.Controls(strKeyFldN), "") & vbCrLf & _
          strDisplayFldN & " : " & Nz(SubFrm.Controls(strDisplayFldN), "") & vbCrLf & vbCrLf & _
          "よろしいですか？"

    If MsgBox(msg, vbYesNo + vbQuestion + vbDefaultButton2, "削除確認") = vbNo Then
        Exit Sub
    End If

    SubFrm.AllowDeletions = True
    frmMainForm.Controls(strSubFormCtrN).SetFocus
    SubFrm.Controls(str1stFocusCtrN).SetFocus

    strSQL = "DELETE FROM [" & WorkTblN & "] WHERE [" & strKeyFldN & "] = "

    If strKeyFldN = "ID" Then
        strSQL = strSQL & "'" & SubFrm.Controls(strKeyFldN) & "';"
    Else
        strSQL = strSQL & SubFrm.Controls(strKeyFldN) & ";"
    End If

    CurrentDb.Execute strSQL, dbFailOnError

    SubFrm.Requery

    SubFrm.AllowDeletions = False

    frmMainForm.HasPendingChanges = True   ' ←追加

    ShowCurrentRecord
End Sub

'----------------------------------------
' 選択中表示
'----------------------------------------
Public Sub ShowCurrentRecord()
    On Error GoTo EH

    With SubFrm
        If .RecordsetClone.RecordCount = 0 Then
            frmMainForm!txtSelInfo = ""
        ElseIf .NewRecord Then
            frmMainForm!txtSelInfo = "新規レコード入力中"
        Else
            If frmMainForm.name = "frmEditMF" Then
                frmMainForm!txtSelInfo = Nz(.Controls(strDateFldN), "") & " / " & _
                Nz(.Controls(strDisplayFldN), "")
            Else
                frmMainForm!txtSelInfo = Nz(.Controls(strKeyFldN), "") & " / " & _
                Nz(.Controls(strDisplayFldN), "")
            End If
        End If
    End With

    Exit Sub

EH:
    frmMainForm!txtSelInfo = ""
End Sub

'----------------------------------------
' WHERE句作成
'----------------------------------------
Private Function BuildSearchWhere() As String
    Dim sWhere As String
    Dim sTextCondition As String

    sWhere = ""

    If Not IsNull(frmMainForm!txtDateFrom) And frmMainForm!txtDateFrom <> "" Then
        AddWhere sWhere, "[" & strDateFldN & "] >= #" & _
                         Format(frmMainForm!txtDateFrom, "yyyy/mm/dd") & "#"
    End If

    If Not IsNull(frmMainForm!txtDateTo) And frmMainForm!txtDateTo <> "" Then
        AddWhere sWhere, "[" & strDateFldN & "] < #" & _
                         Format(DateAdd("d", 1, frmMainForm!txtDateTo), "yyyy/mm/dd") & "#"
    End If

    If Nz(frmMainForm.Controls(strDkomokuCmbN), "") <> "" Then
        AddWhere sWhere, "[" & strDkomokuFldN & "] = " & _
                         frmMainForm.Controls(strDkomokuCmbN)
    End If

    If Nz(frmMainForm.Controls(strCkomokuCmbN), "") <> "" Then
        AddWhere sWhere, "[" & strCkomokuFldN & "] = " & _
                         frmMainForm.Controls(strCkomokuCmbN)
    End If

    sTextCondition = BuildTextSearchCondition(Nz(frmMainForm!txtItemName, ""))
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

    If IsArray(valSearchFlds) Then
        For i = LBound(valSearchFlds) To UBound(valSearchFlds)
            If sOr <> "" Then sOr = sOr & " OR "
            sOr = sOr & "[" & CStr(valSearchFlds(i)) & "] Like '*" & s & "*'"
        Next i
    Else
        sOr = "[" & CStr(valSearchFlds) & "] Like '*" & s & "*'"
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
