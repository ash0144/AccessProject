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

'属性によって分類した各クラスモジュールをPrivateで保持

Private pPeriod  As New clsPeriodManager
Private pSelector As New clsDataSelector
Private pRegistry As New clsDataRegistry
Private pForm As New clsFormFormat

' フォームからは、ここの窓口を通して各機能を呼び出す

Public Property Get Period() As clsPeriodManager
    Set Period = pPeriod
End Property

Public Property Get Selector() As clsDataSelector
    Set Selector = pSelector
End Property

Public Property Get Registry() As clsDataRegistry
    Set Registry = pRegistry
End Property

Public Property Get FormF() As clsFormFormat
    Set FormF = pForm
End Property
