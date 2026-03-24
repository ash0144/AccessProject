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

'フォーム回り、インターフェースなど
'コントロール名など、各フォーム共通部分をセットアップして、同様の処理を集約できる

Private frmMain As Form         'メインフォーム

Private strSubCtrN As String    'サブフォームのコントロール名

Private valSearchFlds As Variant    '検索するフィールド
Private strKeyFldN As String        'キーフィールド名
Private strDisplayN As String    '表示フィールド名
Private str1stFocusCtrN As String   '最初にフォーカスするコントロール名
Private strDefaultOrder As String   '既定の並び順

Private strRelatedTblN As String    'リレーションテーブル名
Private strRelatedFldN As String    'リレーションフィールド名

Private strDkomokuCmbN As String    '大項目コンボボックス名
Private strCkomokuCmbN As String    '中項目コンボボックス名

'----------------------------------------
' 共通セットアップ
'----------------------------------------
Public Sub SetupItemForm(ByVal frmM As Form)

    Set frmMain = frmM
    strSubCtrN = "subList"
    valSearchFlds = Array("内容", "メモ")   'フォームによって分岐で切り替える
    strKeyFldN = "ID"                       'フォームによって分岐で切り替える
    strDisplayN = "内容"                    'フォームによって分岐で切り替える
    str1stFocusCtrN = "txtDate"             'フォームによって分岐で切り替える
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
    Set SubFrm = frmMain.Controls(strSubCtrN).Form
End Property

Private Property Get MasterTblN() As String
    MasterTblN = frmMain.MasterTblN
End Property

Private Property Get WorkTblN() As String
    WorkTblN = frmMain.WorkTblN
End Property

'----------------------------------------
' 起動時
'----------------------------------------
Public Sub OnLoad()
    '確定以外のボタンを使用可能にする
    SetButtonMode False

    'サブフォームのプロパティ設定
    With SubFrm
        .AllowEdits = False
        .AllowAdditions = True
        .AllowDeletions = False
        .OrderBy = strDefaultOrder
        .OrderByOn = True
    End With

    '現在選択中レコードの情報を左下に表示
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

    frmMain!cmdEdit.Enabled = Not isEditing
    frmMain!cmdDelete.Enabled = Not isEditing
    frmMain!cmdSearch.Enabled = Not isEditing
    frmMain!cmdClear.Enabled = Not isEditing

    frmMain!cmdConfirm.Enabled = isEditing
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

    frmMain!txtFrom = Null
    frmMain!txtTo = Null
    frmMain.Controls(strDkomokuCmbN) = Null
    frmMain.Controls(strCkomokuCmbN) = Null
    frmMain!txtItemName = Null

    frmMain.Controls(strCkomokuCmbN).Requery

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

    Set cmbD = frmMain.Controls(strDkomokuCmbN)
    Set cmbC = frmMain.Controls(strCkomokuCmbN)

    cmbC = Null

    cmbC.RowSource = GetCkomokuRowSource(cmbD.Value)
    cmbC.Requery
End Sub

'----------------------------------------
' 編集
'----------------------------------------
Public Sub EditCurrent()

    If SubFrm.NewRecord Then Exit Sub

    SetButtonMode True

    SubFrm.AllowEdits = True

    frmMain.Controls(strSubCtrN).SetFocus
    SubFrm.Controls(str1stFocusCtrN).SetFocus

    frmMain.PendingState = True   ' ←追加

    ShowCurrentRecord
End Sub

'----------------------------------------
' 確定
'----------------------------------------
Public Sub ConfirmEdit()
    Dim strSQL As String
    Dim qdf As DAO.QueryDef

    Debug.Print "=== clsFormFormat.ConfirmEdit START ==="
    Debug.Print "frmMain.Name       = " & frmMain.name
    Debug.Print "frmMain.MasterTblN = " & frmMain.MasterTblN
    Debug.Print "frmMain.WorkTblN   = " & frmMain.WorkTblN

    If Not frmMain.PendingState Then Exit Sub

    With SubFrm
        If .Dirty Then .Dirty = False
        .Requery
        .AllowEdits = False
    End With

    '新規入力があった場合、計算対象とIDを自動入力
    strSQL = "UPDATE [" & WorkTblN & "] SET [" & WorkTblN & "].計算対象 = 1, [" & WorkTblN & "].ID = [tmpID] " & _
            "WHERE ([" & WorkTblN & "].計算対象 IS NULL) AND ([" & WorkTblN & "].ID IS NULL OR [" & WorkTblN & "].ID = '');"

    Set qdf = CurrentDb.CreateQueryDef("", strSQL)
    qdf.Parameters("tmpID").Value = GetID
    qdf.Execute dbFailOnError
    Set qdf = Nothing

    If frmMain.PendingState Then
        Call ApplyDiff(frmMain.MasterTblN, frmMain.WorkTblN, strKeyFldN)
    End If

    frmMain.PendingState = False   ' ←ここがポイント

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

    If frmMain.name <> "frmEditMF" Then
        If strRelatedTblN <> "" And strRelatedFldN <> "" Then
            If HasRelatedRecord(strRelatedTblN, strRelatedFldN, SubFrm.Controls(strKeyFldN)) Then
                MsgBox "関連データで使用中のため削除できません。", vbExclamation
                Exit Sub
            End If
        End If
    End If

    msg = "以下のレコードを削除します。" & vbCrLf & vbCrLf & _
          strKeyFldN & " : " & Nz(SubFrm.Controls(strKeyFldN), "") & vbCrLf & _
          strDisplayN & " : " & Nz(SubFrm.Controls(strDisplayN), "") & vbCrLf & vbCrLf & _
          "よろしいですか？"

    If MsgBox(msg, vbYesNo + vbQuestion + vbDefaultButton2, "削除確認") = vbNo Then
        Exit Sub
    End If

    SubFrm.AllowDeletions = True
    frmMain.Controls(strSubCtrN).SetFocus
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

    frmMain.PendingState = True   ' ←追加

    ShowCurrentRecord
End Sub

'----------------------------------------
' 選択中表示
'----------------------------------------
Public Sub ShowCurrentRecord()
    On Error GoTo EH

    With SubFrm
        If .RecordsetClone.RecordCount = 0 Then
            frmMain!txtSelInfo = ""
        ElseIf .NewRecord Then
            frmMain!txtSelInfo = "新規レコード入力中"
        Else
            If frmMain.name = "frmEditMF" Then
                frmMain!txtSelInfo = Nz(.Controls("日付"), "") & " / " & _
                Nz(.Controls(strDisplayN), "")
            Else
                frmMain!txtSelInfo = Nz(.Controls(strKeyFldN), "") & " / " & _
                Nz(.Controls(strDisplayN), "")
            End If
        End If
    End With

    Exit Sub
EH:
    frmMain!txtSelInfo = ""

End Sub

'----------------------------------------
' WHERE句作成
'----------------------------------------
Private Function BuildSearchWhere() As String

    Dim sWhere As String
    Dim sTextCondition As String
    Dim MinD As Date, MaxD As Date

    MinD = GetMinDate(frmMain!txtFrom)
    MaxD = GetMinDate(frmMain!txtTo)

    sWhere = ""
    If Not IsNull(frmMain!txtFrom) And frmMain!txtFrom <> "" Then
        AddWhere sWhere, "[日付] >=" & MinD
    End If

    If Not IsNull(frmMain!txtTo) And frmMain!txtTo <> "" Then
        AddWhere sWhere, "[日付] < " & DateAdd("d", 1, MaxD)
    End If

    If Nz(frmMain.Controls("cmbDkomoku"), "") <> "" Then
        AddWhere sWhere, "[大項目] = " & _
                         "'" & frmMain.Controls("cmbDkomoku").Column(1) & "'"
    End If

    If Nz(frmMain.Controls("cmbCkomoku"), "") <> "" Then
        AddWhere sWhere, "[中項目] = " & _
                         "'" & frmMain.Controls("cmbCkomoku").Column(1) & "'"
    End If

    sTextCondition = BuildTextSearchCondition(Nz(frmMain!txtItemName, ""))

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
