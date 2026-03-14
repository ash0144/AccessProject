Version =20
VersionRequired =20
Begin Form
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    TabularCharSet =128
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =18878
    DatasheetFontHeight =11
    ItemSuffix =71
    Right =14172
    Bottom =11568
    RecSrcDt = Begin
        0x1db95bc7e181e640
    End
    RecordSource ="MoneyForwardWk"
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
        Begin Section
            Height =284
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    IMEMode =1
                    Width =1247
                    Height =284
                    Name ="txtDate"
                    ControlSource ="日付"

                    LayoutCachedWidth =1247
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    OverlapFlags =95
                    IMEMode =1
                    Left =1247
                    Width =3856
                    Height =284
                    TabIndex =2
                    Name ="txtNaiyo"
                    ControlSource ="内容"

                    LayoutCachedLeft =1247
                    LayoutCachedWidth =5103
                    LayoutCachedHeight =284
                End
                Begin ComboBox
                    OverlapFlags =93
                    TextFontFamily =50
                    IMEMode =1
                    ColumnCount =2
                    ListWidth =2268
                    Left =8220
                    Height =284
                    TabIndex =1
                    BoundColumn =1
                    Name ="cmbDcd"
                    ControlSource ="大項目"
                    RowSourceType ="Table/Query"
                    RowSource ="大項目"
                    ColumnWidths ="0;1701"

                    LayoutCachedLeft =8220
                    LayoutCachedWidth =9921
                    LayoutCachedHeight =284
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                End
                Begin ComboBox
                    OverlapFlags =95
                    TextFontFamily =50
                    IMEMode =1
                    ColumnCount =2
                    ListWidth =2268
                    Left =9921
                    Width =1707
                    Height =284
                    TabIndex =3
                    BoundColumn =1
                    Name ="cmbCcd"
                    ControlSource ="中項目"
                    RowSourceType ="Table/Query"
                    RowSource ="中項目"
                    ColumnWidths ="0;1701"

                    LayoutCachedLeft =9921
                    LayoutCachedWidth =11628
                    LayoutCachedHeight =284
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                End
                Begin TextBox
                    OverlapFlags =95
                    Left =5102
                    Width =1418
                    Height =284
                    TabIndex =4
                    Name ="txtPrice"
                    ControlSource ="金額（円）"
                    Format ="General Number"

                    LayoutCachedLeft =5102
                    LayoutCachedWidth =6520
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    OverlapFlags =95
                    IMEMode =1
                    Left =11624
                    Width =3686
                    Height =284
                    TabIndex =5
                    Name ="txtMemo"
                    ControlSource ="メモ"
                    Format ="@"

                    LayoutCachedLeft =11624
                    LayoutCachedWidth =15310
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    Left =17574
                    Width =621
                    Height =284
                    TabIndex =6
                    Name ="振替"
                    ControlSource ="振替"
                    Format ="General Number"

                    LayoutCachedLeft =17574
                    LayoutCachedWidth =18195
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMEMode =1
                    Left =18198
                    Width =393
                    Height =284
                    TabIndex =7
                    Name ="ID"
                    ControlSource ="ID"
                    Format ="@"

                    LayoutCachedLeft =18198
                    LayoutCachedWidth =18591
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =95
                    Left =15307
                    Width =573
                    Height =284
                    TabIndex =8
                    Name ="中項目CD"
                    ControlSource ="=[cmbCcd].[column](0)"

                    LayoutCachedLeft =15307
                    LayoutCachedWidth =15880
                    LayoutCachedHeight =284
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =87
                    Left =15874
                    TabIndex =9
                    Name ="計算対象"
                    ControlSource ="計算対象"
                    Format ="General Number"

                    LayoutCachedLeft =15874
                    LayoutCachedWidth =17575
                    LayoutCachedHeight =252
                End
                Begin TextBox
                    OverlapFlags =87
                    IMEMode =1
                    Left =6521
                    Height =284
                    TabIndex =10
                    Name ="txtKinyu"
                    ControlSource ="保有金融機関"
                    Format ="@"

                    LayoutCachedLeft =6521
                    LayoutCachedWidth =8222
                    LayoutCachedHeight =284
                End
            End
        End
    End
End
CodeBehindForm
' See "frmEditMFsub.cls"
