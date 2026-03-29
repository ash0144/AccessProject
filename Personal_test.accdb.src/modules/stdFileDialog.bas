Attribute VB_Name = "stdFileDialog"
Option Compare Database
Option Explicit

Dim strSql As String

Private Const C_DELIMITER   As String = ","

'***************************************************************************
'名称　：GetFileName
'機能　：ファイル選択ダイアログ
'引数　：vInitialFileName       (I )    String  初期ファイル名
'　　　：vTitle                 (I )    String  ダイアログ標題
'　　　：vFilter                (I )    Variant フィルタ拡張子
'　　　：vbAllowMultiSelect     (I )    Boolean True = 複数選択
'戻り値：ファイル名（MultiSelectの場合カンマ区切り）
'作成　：2018/07/01 kinacco
'更新　：
'***************************************************************************

Public Function GetFileName(ByVal vInitialFileName As String _
                          , ByVal vTitle As String, ByVal vFilter As Variant _
                 , Optional ByRef vbAllowMultiSelect As Boolean = False) As String
Dim lvSelectedFile  As Variant
Dim lvArray         As Variant
Dim lsFileBaseName  As String
Dim lsExtension     As String
Dim lsReturn        As String
Dim llFilterIndex   As Long
Dim i As Long, j As Long

    '--- 初期値セット ---
    lsReturn = ""
    lsExtension = ""

    '--- 初期フォルダの設定 ---
    If vInitialFileName = "" Then
        vInitialFileName = CurrentProject.path
    Else
        '--- 拡張子を取り出す ---
        If InStr(1, vInitialFileName, ".", vbTextCompare) > 0 Then
            lsExtension = mID(vInitialFileName, InStrRev(vInitialFileName, "."))
        End If
    End If

    '--- フィルタ文字列を取得 ---
    lvArray = Split(msGetFileFilter(vFilter), C_DELIMITER)

    With Application.FileDialog(msoFileDialogFilePicker)

        If vTitle = "" Then
            .Title = "ファイルを選択してください"
        Else
            .Title = vTitle
        End If
        If vbAllowMultiSelect Then
            .Title = .Title & "(複数選択)"
        End If
        .ButtonName = "選択"
        .AllowMultiSelect = vbAllowMultiSelect

        llFilterIndex = 0

        '--- フィルタ文字列を設定する ---
        .Filters.Clear
        For i = LBound(lvArray) To UBound(lvArray) - 1 Step 2
            .Filters.Add lvArray(i), Trim(lvArray(i + 1))
            If lsExtension <> "" Then
                If InStr(1, Trim(lvArray(i + 1)), lsExtension, vbTextCompare) > 0 Then
                    llFilterIndex = .Filters.Count
                End If
            End If
        Next i

        '--- FilterIndexの設定 ---
        If llFilterIndex > 0 Then
            .FilterIndex = llFilterIndex
        Else
            .FilterIndex = 1
        End If

        '--- ファイルのベース名を取得 ---
        lsFileBaseName = mID(vInitialFileName, InStrRev(vInitialFileName, "\") + 1)
        lsFileBaseName = Left(lsFileBaseName, InStr(lsFileBaseName, ".") - 1)
        If lsFileBaseName = "*" Then
            '--- ベース名が"*"の場合フィルタが無効になるのを回避 ---
            .InitialFileName = Left(vInitialFileName, InStrRev(vInitialFileName, "\"))
        Else
            .InitialFileName = vInitialFileName
        End If
        .InitialView = msoFileDialogViewDetails
        If CBool(.Show) Then
            If .SelectedItems.Count >= 1 Then
            '--- 戻り値用の変数に出力 ---
            For Each lvSelectedFile In .SelectedItems
                If lsReturn <> "" Then lsReturn = lsReturn & C_DELIMITER
                lsReturn = lsReturn & CStr(lvSelectedFile)
            Next lvSelectedFile
            End If
        Else
            '--- キャンセルボタンがクリックされた場合 ---
            lsReturn = ""
        End If
    End With

    GetFileName = lsReturn

End Function

'***************************************************************************
'名称　：msGetFileFilter
'機能　：フィルタ文字列作成
'引数　：vsFilter               (I )    String
'戻り値：フィルタ文字列(カンマ区切り)
'作成　：2018/07/01 kinacco
'更新　：
'***************************************************************************
Private Function msGetFileFilter(ByVal vArrFilter As Variant) As String
On Error GoTo ERR_SEC
Dim lbHitxlsx       As Boolean
Dim lbHitxls        As Boolean
Dim lsMsg           As String
Dim lsWork          As String
Dim lsFilter        As String
Dim lsReturn        As String
Dim lvArrFilter     As Variant
Dim i As Long, j As Long

    '--- 初期値セット ---
    lsMsg = ""
    lsReturn = "すべてのファイル,*.*"
    lbHitxlsx = False
    lbHitxls = False

    '--- 省略時はALL設定 ---
    If vArrFilter = "" Then GoTo EXIT_SEC

    '--- 配列に分割 ---
    lvArrFilter = Split(vArrFilter, ",")

    '--- 拡張子に対応するタイトルを設定する ---
    lsFilter = ""
    For i = LBound(lvArrFilter) To UBound(lvArrFilter)
        lsWork = LCase(Trim(lvArrFilter(i)))

        Select Case True
            ' Excel
            Case Right(lsWork, 5) = ".xlsx", Right(lsWork, 4) = ".xls"
                If Not lbHitxlsx And Not lbHitxls Then
                    For j = i To UBound(lvArrFilter)
                        If Right(lvArrFilter(j), 5) = ".xlsx" Then
                            lbHitxlsx = True
                        End If
                        If Right(lvArrFilter(j), 4) = ".xls" Then
                            lbHitxls = True
                        End If
                        If lbHitxlsx And lbHitxls Then Exit For
                    Next j
                    If lbHitxlsx And lbHitxls Then
                        If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                        lsFilter = lsFilter & "Excelファイル (xlsx/xls)" & C_DELIMITER & "*.xlsx;*.xls"
                    ElseIf lbHitxlsx Then
                        If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                        lsFilter = lsFilter & "Excelファイル (xlsx)" & C_DELIMITER & "*.xlsx"
                    ElseIf lbHitxls Then
                        If Len(lsFilter) > 0 Then lsFilter = lsFilter & ","
                        lsFilter = lsFilter & "Excel97-2003ファイル (xls)" & C_DELIMITER & "*.xls"
                    End If
                End If
            ' Excelマクロ有効Book
            Case Right(lsWork, 5) = ".xlsm"
                If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                lsFilter = lsFilter & "Excelマクロ有効Book, *.xlsm"
            ' CSV
            Case Right(lsWork, 4) = ".csv"
                If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                lsFilter = lsFilter & "CSVファイル, *.csv"
            ' txt
            Case Right(lsWork, 4) = ".txt"
                If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                lsFilter = lsFilter & "テキストァイル, *.txt"
            ' ZIP
            Case Right(lsWork, 4) = ".zip"
                If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                lsFilter = lsFilter & "ZIPファイル, *.zip"
            ' その他
            Case Else
                If Len(lsFilter) > 0 Then lsFilter = lsFilter & C_DELIMITER
                lsFilter = lsFilter & Replace(lsWork, ".", "") & "ファイル" & C_DELIMITER & "*" & lsWork
        End Select
    Next i

    If Len(lsFilter) > 0 Then
        lsReturn = lsFilter & C_DELIMITER & lsReturn
    End If

EXIT_SEC:
On Error Resume Next

    msGetFileFilter = lsReturn

    Exit Function

ERR_SEC:
    lsMsg = "予期せぬエラーが発生しました。" & vbCrLf & _
            "プロシージャ名：msGetFileFilter" & vbCrLf & _
            "エラー番号：" & Err.Number & vbCrLf & _
            "エラー内容：" & Err.Description
    MsgBox lsMsg, vbOKOnly + vbExclamation, "エラー"

    Resume EXIT_SEC
End Function
