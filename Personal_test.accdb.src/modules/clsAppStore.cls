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
'属性によって分類した各クラスモジュールをIntelliSenceで呼び出す仕組み
Option Compare Database
Option Explicit

'インスタンス生成
Private pPeriod  As New clsPeriodManager
Private pSelector As New clsDataSelector
Private pRegistry As New clsDataRegistry
Private pForm As New clsFormFormat

'clsAppStoreのプロパティとして、各インスタンスを取得
'他クラスの先頭に、Private App As New clsAppStore（clsAppStoreのインスタンスとしてAppを生成）
'App.Selector.xxxx の書き方で、各クラスのプロパティ、メソッドを呼び出すことができる
'意味は、AppインスタンスのプロパティSelector（clsDataSelectorのインスタンス）のxxxxメソッド/プロパティ

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
