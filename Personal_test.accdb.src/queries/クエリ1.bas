Operation =3
Name ="抽出テーブル"
Option =0
Begin InputTables
    Name ="勘定科目"
    Name ="tmp抽出テーブル"
End
Begin OutputColumns
    Name ="日付"
    Expression ="tmp抽出テーブル.日付"
    Name ="内容"
    Expression ="tmp抽出テーブル.内容"
    Name ="金額（円）"
    Expression ="tmp抽出テーブル.金額（円）"
    Name ="保有金融機関"
    Expression ="tmp抽出テーブル.保有金融機関"
    Name ="中項目CD"
    Expression ="tmp抽出テーブル.中項目CD"
    Name ="勘定科目CD"
    Expression ="tmp抽出テーブル.勘定科目CD"
    Name ="ID"
    Expression ="tmp抽出テーブル.ID"
    Name ="勘定科目"
    Expression ="勘定科目.勘定科目"
    Name ="勘定分類CD"
    Expression ="勘定科目.勘定分類CD"
End
Begin Joins
    LeftTable ="勘定科目"
    RightTable ="tmp抽出テーブル"
    Expression ="勘定科目.勘定科目CD = tmp抽出テーブル.勘定科目CD"
    Flag =1
End
Begin OrderBy
    Expression ="勘定科目.勘定分類CD"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "UseTransaction" ="-1"
dbByte "Orientation" ="0"
Begin
    Begin
        dbText "Name" ="tmp抽出テーブル.日付"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmp抽出テーブル.中項目CD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmp抽出テーブル.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="勘定科目.勘定科目CD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="勘定科目.勘定科目"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="勘定科目.勘定分類CD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmp抽出テーブル.内容"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmp抽出テーブル.金額（円）"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmp抽出テーブル.保有金融機関"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="勘定科目.中項目CD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tmp抽出テーブル.勘定科目CD"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1405
    Bottom =860
    Left =-1
    Top =-1
    Right =1385
    Bottom =559
    Left =0
    Top =0
    ColumnsShown =651
    Begin
        Left =611
        Top =94
        Right =791
        Bottom =274
        Top =0
        Name ="勘定科目"
        Name =""
    End
    Begin
        Left =123
        Top =51
        Right =303
        Bottom =468
        Top =0
        Name ="tmp抽出テーブル"
        Name =""
    End
End
