Version =20
VersionRequired =20
Begin Form
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    TabularCharSet =128
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =18225
    DatasheetFontHeight =11
    ItemSuffix =24
    Right =14172
    Bottom =11568
    RecSrcDt = Begin
        0x757d9670a281e640
    End
    RecordSource ="勘定科目Wk"
    DatasheetFontName ="ＭＳ Ｐゴシック"
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            TextFontCharSet =128
            FontSize =11
            FontName ="ＭＳ Ｐゴシック"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            TextFontCharSet =128
            Width =1701
            Height =396
            FontSize =11
            FontWeight =400
            FontName ="ＭＳ Ｐゴシック"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            TextFontCharSet =128
            BorderLineStyle =0
            Width =1701
            Height =252
            LabelX =-1701
            FontSize =11
            FontName ="ＭＳ Ｐゴシック"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ComboBox
            AddColon = NotDefault
            TextFontCharSet =128
            BorderLineStyle =0
            Width =1701
            Height =252
            LabelX =-1701
            FontSize =11
            FontName ="ＭＳ Ｐゴシック"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =819
            Name ="フォームヘッダー"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =50
                    Left =564
                    Top =36
                    Width =17628
                    Height =456
                    FontSize =18
                    Name ="Auto_Header0"
                    Caption ="勘定科目マスタ"
                    GroupTable =1
                    LayoutCachedLeft =564
                    LayoutCachedTop =36
                    LayoutCachedWidth =18192
                    LayoutCachedHeight =492
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    Left =567
                    Top =566
                    Width =348
                    Height =252
                    Name ="ラベル2"
                    Caption ="CD"
                    LayoutCachedLeft =567
                    LayoutCachedTop =566
                    LayoutCachedWidth =915
                    LayoutCachedHeight =818
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =1134
                    Top =567
                    Width =1134
                    Height =252
                    Name ="ラベル3"
                    Caption ="勘定科目"
                    LayoutCachedLeft =1134
                    LayoutCachedTop =567
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =819
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4535
                    Top =566
                    Width =1134
                    Height =252
                    Name ="ラベル11"
                    Caption ="勘定分類"
                    LayoutCachedLeft =4535
                    LayoutCachedTop =566
                    LayoutCachedWidth =5669
                    LayoutCachedHeight =818
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =6803
                    Top =566
                    Width =1134
                    Height =252
                    Name ="ラベル21"
                    Caption ="中項目"
                    LayoutCachedLeft =6803
                    LayoutCachedTop =566
                    LayoutCachedWidth =7937
                    LayoutCachedHeight =818
                End
            End
        End
        Begin Section
            Height =284
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    Left =567
                    Width =567
                    Height =284
                    Name ="txtCcd"
                    ControlSource ="勘定科目CD"

                    LayoutCachedLeft =567
                    LayoutCachedWidth =1134
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    OverlapFlags =95
                    IMEMode =1
                    Left =1134
                    Width =3405
                    Height =284
                    TabIndex =2
                    Name ="txtC"
                    ControlSource ="勘定科目"

                    LayoutCachedLeft =1134
                    LayoutCachedWidth =4539
                    LayoutCachedHeight =284
                End
                Begin ComboBox
                    OverlapFlags =95
                    TextFontFamily =50
                    IMEMode =1
                    ColumnCount =2
                    ListWidth =2268
                    Left =4535
                    Width =567
                    Height =284
                    TabIndex =1
                    Name ="cmbKcd"
                    ControlSource ="勘定分類CD"
                    RowSourceType ="Table/Query"
                    RowSource ="勘定分類"
                    ColumnWidths ="567;1701"

                    LayoutCachedLeft =4535
                    LayoutCachedWidth =5102
                    LayoutCachedHeight =284
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =95
                    TextFontFamily =50
                    IMEMode =1
                    Left =5102
                    Height =284
                    TabIndex =3
                    Name ="txtD"
                    ControlSource ="=[cmbKcd].[column](1)"

                    LayoutCachedLeft =5102
                    LayoutCachedWidth =6803
                    LayoutCachedHeight =284
                End
                Begin ComboBox
                    OverlapFlags =95
                    TextFontFamily =50
                    IMEMode =1
                    ColumnCount =2
                    ListWidth =2268
                    Left =6803
                    Width =567
                    Height =284
                    TabIndex =4
                    Name ="cmbCcd"
                    ControlSource ="中項目CD"
                    RowSourceType ="Table/Query"
                    RowSource ="中項目"
                    ColumnWidths ="567;3402"

                    LayoutCachedLeft =6803
                    LayoutCachedWidth =7370
                    LayoutCachedHeight =284
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                End
                Begin TextBox
                    Locked = NotDefault
                    OverlapFlags =87
                    TextFontFamily =50
                    IMEMode =1
                    Left =7370
                    Width =3402
                    Height =284
                    TabIndex =5
                    Name ="テキスト23"
                    ControlSource ="=[cmbCcd].[column](1)"

                    LayoutCachedLeft =7370
                    LayoutCachedWidth =10772
                    LayoutCachedHeight =284
                End
            End
        End
        Begin FormFooter
            Height =1133
            Name ="フォームフッター"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin CommandButton
                    OverlapFlags =85
                    Left =566
                    Top =283
                    Height =567
                    Name ="cmdCancel"
                    Caption ="閉じる"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =566
                    LayoutCachedTop =283
                    LayoutCachedWidth =2267
                    LayoutCachedHeight =850
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =2436
                    Top =288
                    Height =567
                    TabIndex =1
                    Name ="cmdEnter"
                    Caption ="確定"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =2436
                    LayoutCachedTop =288
                    LayoutCachedWidth =4137
                    LayoutCachedHeight =855
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "frmMstKk.cls"
