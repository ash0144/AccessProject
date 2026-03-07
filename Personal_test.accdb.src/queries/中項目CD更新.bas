Operation =4
Option =0
Begin InputTables
    Name ="MoneyForward"
    Name ="中項目"
End
Begin OutputColumns
    Name ="MoneyForward.中項目CD"
    Expression ="[中項目].[中項目CD]"
End
Begin Joins
    LeftTable ="MoneyForward"
    RightTable ="中項目"
    Expression ="MoneyForward.中項目 = 中項目.中項目"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbBoolean "FailOnError" ="0"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="MoneyForward.中項目CD"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1241
    Bottom =860
    Left =-1
    Top =-1
    Right =1221
    Bottom =580
    Left =0
    Top =0
    ColumnsShown =579
    Begin
        Left =395
        Top =123
        Right =575
        Bottom =428
        Top =0
        Name ="MoneyForward"
        Name =""
    End
    Begin
        Left =761
        Top =135
        Right =941
        Bottom =315
        Top =0
        Name ="中項目"
        Name =""
    End
End
