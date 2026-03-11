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
    ItemSuffix =6
    Right =19740
    Bottom =11568
    RecSrcDt = Begin
        0x5f2e94af9681e640
    End
    RecordSource ="勘定分類Wk"
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
                    Caption ="勘定分類マスタ"
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
                    Caption ="勘定分類"
                    LayoutCachedLeft =1134
                    LayoutCachedTop =567
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =819
                End
            End
        End
        Begin Section
            Height =283
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    Left =567
                    Width =567
                    Name ="大項目CD"
                    ControlSource ="勘定分類CD"

                    LayoutCachedLeft =567
                    LayoutCachedWidth =1134
                    LayoutCachedHeight =252
                End
                Begin TextBox
                    OverlapFlags =87
                    IMEMode =1
                    Left =1134
                    Width =3405
                    TabIndex =1
                    Name ="大項目"
                    ControlSource ="勘定分類"

                    LayoutCachedLeft =1134
                    LayoutCachedWidth =4539
                    LayoutCachedHeight =252
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
                End
            End
        End
    End
End
CodeBehindForm
' See "frmMstKb.cls"
