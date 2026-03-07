Attribute VB_Name = "ExpImp"
Option Compare Database
Option Explicit

Private Const SRC_ROOT As String = "C:\Documents\AccPrg\Personal\src\"   '←ここ変更

'========================
' Export / Import (All)
'========================
Public Function ExportAll()
    EnsureDirDeep SRC_ROOT
    ExportForms
    ExportReports
    ExportQueries
    ExportModules
    ExportMacros
    MsgBox "Export complete"
End Function

Public Function ImportAll()
    ' 依存関係を考慮：まずコード→クエリ→フォーム→レポート
    ImportModules
    ImportQueries
    ImportForms
    ImportReports
    ImportMacros
    MsgBox "Import complete"
End Function

'========================
' Export (by kind)
'========================
Private Sub ExportForms()
    Dim path As String: path = SRC_ROOT & "Forms\"
    EnsureDirDeep path

    Dim ao As AccessObject
    For Each ao In CurrentProject.AllForms
        If Not IsSystemLike(ao.name) Then
            SaveSafe acForm, ao.name, path & ao.name & ".txt"
        End If
    Next
End Sub

Private Sub ExportReports()
    Dim path As String: path = SRC_ROOT & "Reports\"
    EnsureDirDeep path

    Dim ao As AccessObject
    For Each ao In CurrentProject.AllReports
        If Not IsSystemLike(ao.name) Then
            SaveSafe acReport, ao.name, path & ao.name & ".txt"
        End If
    Next
End Sub

Private Sub ExportQueries()
    Dim path As String: path = SRC_ROOT & "Queries\"
    EnsureDirDeep path

    Dim qd As DAO.QueryDef
    For Each qd In CurrentDb.QueryDefs
        ' ここは「MSys?」や「~sq_」等を避ける
        If Not IsSystemQuery(qd.name) Then
            SaveSafe acQuery, qd.name, path & SafeFileName(qd.name) & ".txt"
        End If
    Next
End Sub

Private Sub ExportModules()
    Dim path As String: path = SRC_ROOT & "Modules\"
    EnsureDirDeep path

    Dim ao As AccessObject
    For Each ao In CurrentProject.AllModules
        If Not IsSystemLike(ao.name) Then
            ' AccessのAllModulesにはクラスっぽいものも混ざる場合があるので safe 実行
            SaveSafe acModule, ao.name, path & ao.name & ".txt"
        End If
    Next
End Sub

Private Sub ExportMacros()
    Dim path As String: path = SRC_ROOT & "Macros\"
    EnsureDirDeep path

    Dim ao As AccessObject
    For Each ao In CurrentProject.AllMacros
        If Not IsSystemLike(ao.name) Then
            SaveSafe acMacro, ao.name, path & ao.name & ".txt"
        End If
    Next
End Sub

'========================
' Import (by kind)
'========================
Private Sub ImportForms()
    ImportFolder acForm, SRC_ROOT & "Forms\"
End Sub

Private Sub ImportReports()
    ImportFolder acReport, SRC_ROOT & "Reports\"
End Sub

Private Sub ImportQueries()
    ImportFolder acQuery, SRC_ROOT & "Queries\"
End Sub

Private Sub ImportModules()
    ImportFolder acModule, SRC_ROOT & "Modules\"
End Sub

Private Sub ImportMacros()
    ImportFolder acMacro, SRC_ROOT & "Macros\"
End Sub

Private Sub ImportFolder(ByVal objType As AcObjectType, ByVal folderPath As String)
    If Dir(folderPath, vbDirectory) = "" Then Exit Sub

    Dim f As String, objName As String, fullPath As String
    f = Dir$(folderPath & "*.txt")
    Do While Len(f) > 0
        fullPath = folderPath & f
        objName = Left$(f, Len(f) - 4) ' .txt除去

        ' Queriesはファイル名をSafeFileNameで書き換えている場合があるので注意
        ' （この版では Query名に "/" 等があるときだけファイル名が変わる。通常はそのまま）
        ' 必要なら「ファイル名→実名」マップ方式に改造できます。

        DeleteSafe objType, objName
        LoadSafe objType, objName, fullPath

        f = Dir$()
    Loop
End Sub

'========================
' Safe wrappers / Utilities
'========================
Private Sub SaveSafe(ByVal objType As AcObjectType, ByVal objName As String, ByVal outPath As String)
    On Error GoTo EH
    Application.SaveAsText objType, objName, outPath
    Exit Sub
EH:
    ' 失敗しても全体を止めない（個人運用で便利）
    Debug.Print "SaveAsText failed: type=" & objType & " name=" & objName & " err=" & Err.Number & " " & Err.Description
    Err.Clear
End Sub

Private Sub LoadSafe(ByVal objType As AcObjectType, ByVal objName As String, ByVal inPath As String)
    On Error GoTo EH
    Application.LoadFromText objType, objName, inPath
    Exit Sub
EH:
    Debug.Print "LoadFromText failed: type=" & objType & " name=" & objName & " err=" & Err.Number & " " & Err.Description
    Err.Clear
End Sub

Private Sub DeleteSafe(ByVal objType As AcObjectType, ByVal objName As String)
    On Error Resume Next
    DoCmd.DeleteObject objType, objName
    On Error GoTo 0
End Sub

Private Function IsSystemLike(ByVal name As String) As Boolean
    ' MSys 系など
    IsSystemLike = (Left$(name, 4) = "MSys")
End Function

Private Function IsSystemQuery(ByVal name As String) As Boolean
    ' Accessが内部で作るものを避ける（必要に応じて追加）
    IsSystemQuery = (Left$(name, 4) = "MSys") _
                    Or (Left$(name, 4) = "~sq_") _
                    Or (Left$(name, 1) = "~")
End Function

Private Function SafeFileName(ByVal s As String) As String
    ' クエリ名にファイル名NG文字が入っている場合の保険
    Dim bad As Variant, i As Long
    bad = Array("\", "/", ":", "*", "?", """", "<", ">", "|")
    For i = LBound(bad) To UBound(bad)
        s = Replace(s, bad(i), "_")
    Next
    SafeFileName = s
End Function

Private Sub EnsureDirDeep(ByVal path As String)
    ' ネストしたフォルダも作る（MkDirは1階層ずつ必要）
    Dim p As String, i As Long
    path = Replace(path, "/", "\")
    If Right$(path, 1) <> "\" Then path = path & "\"

    p = ""
    For i = 1 To Len(path)
        p = Left$(path, i)
        If Right$(p, 1) = "\" Then
            If Len(p) >= 3 Then ' C:\ を避ける
                If Dir(p, vbDirectory) = "" Then MkDir p
            End If
        End If
    Next
End Sub
