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
'期間設定など、表示と内部処理が異なるデータ加工など

Option Compare Database
Option Explicit

Public Function GetMinDate(val As Variant) As Date: GetMinDate = CDate(IIf(IsNull(val), "2000/01/01", val)): End Function
'開始が未入力の場合、2000/01/01と仮に設定

Public Function GetMaxDate(val As Variant) As Date: GetMaxDate = CDate(IIf(IsNull(val), "2100/12/31", val)): End Function
'終了が未入力の場合、2100/12/31と仮に設定

Public Function GetString(dFrom As Date, dTo As Date) As String
'表示用日付範囲を生成（上の仮設定を見せないため）

    Dim sF As String: sF = Format(dFrom, "yyyy/mm/dd")
    Dim sT As String: sT = Format(dTo, "yyyy/mm/dd")

    If sF = "2000/01/01" Then
        GetString = IIf(sT = "2100/12/31", "", "～" & sT)
    Else
        GetString = IIf(sT = "2100/12/31", sF & "～", sF & "～" & sT)
    End If

End Function
