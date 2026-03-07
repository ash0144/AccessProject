Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit
Dim strSQL As String

Private Sub cmdClose_Click()

DoCmd.Close acForm, "frmKSmenu"

End Sub

Private Sub cmdImpMF_Click()

Dim strFilename As String
Dim i As Integer
Dim strFoldername As String
Dim datLastday As Date
Dim arr() As String
Dim strFn As String

strFoldername = DLookup("MoneyForwardフォルダ", "履歴")
strFilename = GetFileName(strFoldername, "", ".xls", True)
arr = Split(strFilename, ",")

If strFilename <> "" Then
    For i = LBound(arr) To UBound(arr)
        strFn = arr(i)
        DoCmd.TransferSpreadsheet acImport, acSpreadsheetTypeExcel12, "MoneyForward", strFn, True
    Next i
Else
    Exit Sub
End If

i = InStrRev(strFn, "\")
strFoldername = Left(strFn, i) & "*.xls"
datLastday = DMax("日付", "MoneyForward")

strSQL = "UPDATE 履歴 SET MoneyForward読込日 = #" & datLastday & "#, MoneyForwardフォルダ = '" & strFoldername & "';"

Call SQLrun(strSQL)
Me.Requery

MsgBox "OK"

End Sub

Private Sub cmdInput_Click()

DoCmd.OpenForm "frmKinput"

End Sub

Private Sub cmdOutput_Click()

DoCmd.OpenForm "frmKSmenu_output"

End Sub
