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
    Width =6576
    DatasheetFontHeight =11
    ItemSuffix =9
    Right =25575
    Bottom =13620
    RecSrcDt = Begin
        0x0a6abd75523ce640
    End
    RecordSource ="SELECT 明細.中項目, Sum(明細.金額（円）) AS 金額（円）の合計 FROM 明細 GROUP BY 明細.中項目, 明細.中項目CD ORDER"
        " BY 明細.中項目CD; "
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
                    OverlapFlags =85
                    TextFontFamily =50
                    Width =4536
                    Height =270
                    ForeColor =4210752
                    Name ="ラベル6"
                    Caption ="中項目"
                    LayoutCachedWidth =4536
                    LayoutCachedHeight =270
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeTint =75.0
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4540
                    Width =1701
                    Height =270
                    ForeColor =4210752
                    Name ="ラベル7"
                    Caption ="金額"
                    LayoutCachedLeft =4540
                    LayoutCachedWidth =6241
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
                    OverlapFlags =85
                    Left =4540
                    Top =57
                    ColumnWidth =2820
                    ColumnOrder =2
                    Name ="金額（円）"
                    ControlSource ="金額（円）の合計"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =4540
                    LayoutCachedTop =57
                    LayoutCachedWidth =6241
                    LayoutCachedHeight =327
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OverlapFlags =85
                    IMEMode =1
                    Top =57
                    Width =4536
                    ColumnWidth =6135
                    ColumnOrder =1
                    TabIndex =1
                    Name ="内容"
                    ControlSource ="中項目"
                    Format ="@"

                    LayoutCachedTop =57
                    LayoutCachedWidth =4536
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
