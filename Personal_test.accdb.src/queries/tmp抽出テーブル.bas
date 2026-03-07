Operation =1
Option =0
Where ="(((中項目.確定申告)=True) AND ((MoneyForward.計算対象)=1))"
Begin InputTables
    Name ="MoneyForward"
    Name ="中項目"
End
Begin OutputColumns
    Expression ="MoneyForward.日付"
    Expression ="MoneyForward.内容"
    Expression ="MoneyForward.金額（円）"
    Expression ="MoneyForward.保有金融機関"
    Expression ="MoneyForward.中項目CD"
    Expression ="中項目.勘定科目CD"
    Expression ="MoneyForward.ID"
End
Begin Joins
    LeftTable ="中項目"
    RightTable ="MoneyForward"
    Expression ="中項目.中項目CD = MoneyForward.中項目CD"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="MoneyForward.保有金融機関"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MoneyForward.日付"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MoneyForward.内容"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MoneyForward.金額（円）"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MoneyForward.中項目CD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MoneyForward.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="中項目.勘定科目CD"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1705
    Bottom =860
    Left =-1
    Top =-1
    Right =1685
    Bottom =496
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =37
        Top =19
        Right =229
        Bottom =430
        Top =0
        Name ="MoneyForward"
        Name =""
    End
    Begin
        Left =777
        Top =96
        Right =957
        Bottom =355
        Top =0
        Name ="中項目"
        Name =""
    End
End
