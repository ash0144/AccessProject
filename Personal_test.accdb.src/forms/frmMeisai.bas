Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowEdits = NotDefault
    AllowDesignChanges = NotDefault
    TabularCharSet =128
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =14456
    DatasheetFontHeight =11
    ItemSuffix =9
    Right =25575
    Bottom =13620
    RecSrcDt = Begin
        0x7182703a9583e640
    End
    RecordSource ="SELECT 明細.日付, 明細.内容, 明細.[金額], 明細.保有金融機関 FROM 明細 ORDER BY 明細.日付 DESC; "
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
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            TextFontCharSet =128
            BorderLineStyle =0
            Width =1701
            Height =270
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
        Begin FormHeader
            Height =283
            Name ="フォームヘッダー"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =93
                    TextFontFamily =50
                    Width =1701
                    Height =270
                    ForeColor =4210752
                    Name ="テキスト4"
                    Caption ="日付"
                    LayoutCachedWidth =1701
                    LayoutCachedHeight =270
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeTint =75.0
                End
                Begin Label
                    OverlapFlags =95
                    TextFontFamily =50
                    Left =1700
                    Width =5616
                    Height =270
                    ForeColor =4210752
                    Name ="ラベル6"
                    Caption ="内容"
                    LayoutCachedLeft =1700
                    LayoutCachedWidth =7316
                    LayoutCachedHeight =270
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeTint =75.0
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =10725
                    Width =1701
                    Height =270
                    ForeColor =4210752
                    Name ="ラベル7"
                    Caption ="金額"
                    LayoutCachedLeft =10725
                    LayoutCachedWidth =12426
                    LayoutCachedHeight =270
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeTint =75.0
                End
                Begin Label
                    OverlapFlags =87
                    TextFontFamily =50
                    Left =7320
                    Width =3396
                    Height =270
                    ForeColor =4210752
                    Name ="ラベル8"
                    Caption ="保有金融機関"
                    LayoutCachedLeft =7320
                    LayoutCachedWidth =10716
                    LayoutCachedHeight =270
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeTint =75.0
                End
            End
        End
        Begin Section
            Height =340
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    IMEMode =1
                    Left =7320
                    Top =57
                    Width =3396
                    ColumnWidth =2970
                    ColumnOrder =3
                    Name ="保有金融機関"
                    ControlSource ="保有金融機関"
                    Format ="@"

                    LayoutCachedLeft =7320
                    LayoutCachedTop =57
                    LayoutCachedWidth =10716
                    LayoutCachedHeight =327
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =10725
                    Top =57
                    TabIndex =2
                    Name ="金額（円）"
                    ControlSource ="金額"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =10725
                    LayoutCachedTop =57
                    LayoutCachedWidth =12426
                    LayoutCachedHeight =327
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OverlapFlags =95
                    IMEMode =1
                    Left =1700
                    Top =57
                    Width =5616
                    ColumnWidth =6135
                    ColumnOrder =1
                    TabIndex =1
                    Name ="内容"
                    ControlSource ="内容"
                    Format ="@"

                    LayoutCachedLeft =1700
                    LayoutCachedTop =57
                    LayoutCachedWidth =7316
                    LayoutCachedHeight =327
                End
                Begin TextBox
                    OverlapFlags =87
                    IMEMode =2
                    Top =57
                    ColumnOrder =0
                    TabIndex =3
                    Name ="日付"
                    ControlSource ="日付"
                    Format ="Short Date"

                    LayoutCachedTop =57
                    LayoutCachedWidth =1701
                    LayoutCachedHeight =327
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="フォームフッター"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
