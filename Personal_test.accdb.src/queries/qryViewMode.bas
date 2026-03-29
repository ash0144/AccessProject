Operation =4
Option =0
Begin InputTables
    Name ="MoneyForwardWk"
End
Begin OutputColumns
    Name ="MoneyForwardWk.金額"
    Expression ="Abs([金額])"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbBoolean "FailOnError" ="0"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="MoneyForwardWk.金額"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1666
    Bottom =985
    Left =-1
    Top =-1
    Right =1646
    Bottom =705
    Left =0
    Top =0
    ColumnsShown =579
    Begin
        Left =398
        Top =135
        Right =578
        Bottom =315
        Top =0
        Name ="MoneyForwardWk"
        Name =""
    End
End
