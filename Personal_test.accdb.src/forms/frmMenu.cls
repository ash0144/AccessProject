Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub cmdKakeibo_Click()

DoCmd.OpenForm "frmKSmenu"

End Sub

Private Sub cmdQuit_Click()

DoCmd.Quit

End Sub

Private Sub cmdSPEC_Click()

DoCmd.OpenForm "frmSPEC"

End Sub
