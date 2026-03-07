VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsMyButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' WithEventsキーワードにより、クラス内でボタンのイベントをキャッチできる
Private WithEvents MyBtn As Access.CommandButton
Attribute MyBtn.VB_VarHelpID = -1
Private mID As Long         ' ボタンに関連付けるID（中項目CDなど）
Private mParentForm As Object ' 呼び出し元のフォームを保持

' 初期化：ボタン本体とIDをセットする
Public Sub Setup(TargetBtn As Access.CommandButton, TargetID As Long, ParentForm As Object)
    Set MyBtn = TargetBtn
    mID = TargetID
    Set mParentForm = ParentForm
    ' 実行時にイベントを拾えるように[イベント 手続き]をONにする
    MyBtn.OnClick = "[Event Procedure]"
End Sub

' ★ここが共通イベント！どのボタンが押されてもここが動く
Private Sub MyBtn_Click()
    ' 親フォームの共通メソッドを呼び出す（引数に自分のIDを渡す）
    Call mParentForm.ShowMeisaiFromClass(mID)
End Sub
