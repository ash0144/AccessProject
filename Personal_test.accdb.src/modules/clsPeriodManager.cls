VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsPeriodManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' --- clsPeriodManager ---
Option Explicit

Public Function GetMinDate(val As Variant) As Date: GetMinDate = CDate(IIf(IsNull(val), "2000/01/01", val)): End Function
Public Function GetMaxDate(val As Variant) As Date: GetMaxDate = CDate(IIf(IsNull(val), "2100/12/31", val)): End Function

Public Function GetString(dFrom As Date, dTo As Date) As String
    Dim sF As String: sF = Format(dFrom, "yyyy/mm/dd")
    Dim sT As String: sT = Format(dTo, "yyyy/mm/dd")
    If sF = "2000/01/01" Then
        GetString = IIf(sT = "2100/12/31", "", "～" & sT)
    Else
        GetString = IIf(sT = "2100/12/31", sF & "～", sF & "～" & sT)
    End If
End Function
