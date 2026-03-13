VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsDataRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' --- clsDataRegistry ---
Option Explicit

'テーブルにデータを登録する処理

'手動登録
Public Function RegisterManualEntry( _
    hizuke As Variant, _
    naiyo As Variant, _
    kingaku As Variant, _
    dKomokuCD As Variant, _
    cKomokuName As Variant, _
    memo As Variant, _
    Optional setSubCD As Boolean = True) As Boolean ' 引数を追加

    On Error GoTo Err_Handler
    Dim db As DAO.Database: Set db = CurrentDb
    Dim rs As DAO.Recordset
    Dim strID As String, i As Integer

    If IsNull(hizuke) Or IsNull(naiyo) Or IsNull(kingaku) Then Exit Function

    Set rs = db.OpenRecordset("MoneyForward", dbOpenDynaset)
    rs.AddNew
        rs!計算対象 = 1
        rs!日付 = hizuke
        rs!内容 = naiyo
        rs![金額（円）] = IIf(dKomokuCD = 1, kingaku, -kingaku)
        rs!保有金融機関 = "財布"
        rs!大項目 = Nz(DLookup("大項目", "大項目", "大項目CD=" & dKomokuCD), "")
        rs!中項目 = cKomokuName
        rs!メモ = memo
        rs!振替 = 0

        ' frmKinputの時はセットし、frmSinputの時はスキップする制御
        If setSubCD Then
            rs!中項目CD = Nz(DLookup("中項目CD", "中項目", "中項目='" & cKomokuName & "'"), 0)
        End If

        Randomize
        For i = 1 To 100
            strID = CStr(Int((999999999 * Rnd) + 1))
            If DCount("*", "MoneyForward", "ID='" & strID & "'") = 0 Then
                rs!ID = strID: Exit For
            End If
        Next i
    rs.Update

    rs.Close: Set rs = Nothing
    RegisterManualEntry = True
    Exit Function

Err_Handler:
    MsgBox "登録エラー: " & Err.Description, vbCritical
    If Not rs Is Nothing Then rs.Close
    RegisterManualEntry = False
End Function

'インポート
Public Function ImportMFData() As Boolean
    On Error GoTo Err_Handler
    Dim strFilename As String, strFn As String, arr() As String, i As Integer
    Dim db As DAO.Database: Set db = CurrentDb

    strFilename = GetFileName(Nz(DLookup("MoneyForwardフォルダ", "履歴"), ""), "", ".xls", True)
    If strFilename = "" Then Exit Function

    '警告を一時的にONにして詳細を見る（テスト用）
'    DoCmd.SetWarnings True

    arr = Split(strFilename, ",")
    For i = LBound(arr) To UBound(arr)
        strFn = arr(i)

        ' 1. 一時テーブル(TmpMF)として新規作成（テーブルがなければ自動で作られる）
        '    ここにはExcelの列だけが入ります。
        On Error Resume Next: db.Execute "DROP TABLE TmpMF": On Error GoTo Err_Handler
        DoCmd.TransferSpreadsheet acImport, acSpreadsheetTypeExcel12, "TmpMF", strFn, True

        ' 2. 一時テーブルから本番テーブルへ、存在する列だけを流し込む
        '    [中項目CD] はこの時点では空のままでOK
        db.Execute "INSERT INTO MoneyForward ( 計算対象, 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, メモ, 振替, ID ) " & _
                   "SELECT 1, 日付, 内容, [金額（円）], 保有金融機関, 大項目, 中項目, メモ, 振替, ID FROM TmpMF;", dbFailOnError
    Next i

    ' 3. 最後に「中項目CD更新」クエリで、空の [中項目CD] を一括で埋める
    Call QUERYrun("中項目CD更新")

    ImportMFData = True
    Exit Function

Err_Handler:
    MsgBox "インポートエラー: " & Err.Description, vbCritical
    ImportMFData = False
End Function
