VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsAppStore"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' --- clsAppStore (総合案内クラス) ---
Option Explicit

' 奥の専門家たちをプライベートで保持
Private pPeriod  As New clsPeriodManager
Private pSelector As New clsDataSelector
Private pRegistry As New clsDataRegistry

' フォームからは、この「窓口」を通して各機能を呼び出す
Public Property Get Period() As clsPeriodManager:   Set Period = pPeriod:     End Property
Public Property Get Selector() As clsDataSelector: Set Selector = pSelector: End Property
Public Property Get Registry() As clsDataRegistry: Set Registry = pRegistry: End Property

' よく使う一連の流れを「セットメニュー」として提供することも可能
Public Sub ExtractAndShow(dFromRaw As Variant, dToRaw As Variant, Optional dCD As Variant = Null)
    Dim dF As Date: dF = pPeriod.GetMinDate(dFromRaw)
    Dim dT As Date: dT = pPeriod.GetMaxDate(dToRaw)

    ' 抽出して、期間表示用文字列をグローバル変数へセット
    pSelector.ExtractToWorkTable dF, dT, dCD
    pubFromTo = pPeriod.GetString(dF, dT)
End Sub
