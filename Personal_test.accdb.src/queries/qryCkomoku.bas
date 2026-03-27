Operation =1
Option =2
Where ="(((抽出テーブル.大項目CD)=[forms]![frmKSmenu]![cmbDkomoku]))"
Begin InputTables
    Name ="抽出テーブル"
End
Begin OutputColumns
    Expression ="抽出テーブル.中項目CD"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="抽出テーブル.中項目CD"
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
    Bottom =533
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="抽出テーブル"
        Name =""
    End
End
