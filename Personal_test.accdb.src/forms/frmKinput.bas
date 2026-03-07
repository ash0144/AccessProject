Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    TabularCharSet =128
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =6236
    DatasheetFontHeight =11
    ItemSuffix =10
    Right =14640
    Bottom =11568
    RecSrcDt = Begin
        0xc541a593813be640
    End
    Caption ="手動入力"
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
            Height =450
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
        Begin ComboBox
            AddColon = NotDefault
            TextFontCharSet =128
            BorderLineStyle =0
            Width =1701
            Height =270
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
        Begin Section
            Height =5102
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMEMode =2
                    Left =2271
                    Top =570
                    Name ="txtHizuke"
                    Format ="Short Date"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =570
                    LayoutCachedWidth =3972
                    LayoutCachedHeight =840
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =570
                            Width =525
                            Height =270
                            Name ="ラベル0"
                            Caption ="日付"
                            LayoutCachedLeft =570
                            LayoutCachedTop =570
                            LayoutCachedWidth =1095
                            LayoutCachedHeight =840
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMEMode =1
                    Left =2271
                    Top =910
                    Width =3402
                    TabIndex =1
                    Name ="txtNaiyo"
                    Format ="@"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =910
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =1180
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =910
                            Width =525
                            Height =270
                            Name ="ラベル1"
                            Caption ="内容"
                            LayoutCachedLeft =570
                            LayoutCachedTop =910
                            LayoutCachedWidth =1095
                            LayoutCachedHeight =1180
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMEMode =2
                    Left =2271
                    Top =1250
                    Width =3402
                    TabIndex =2
                    Name ="txtKingaku"
                    Format ="General Number"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =1250
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =1520
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =1250
                            Width =990
                            Height =270
                            Name ="ラベル2"
                            Caption ="金額（円）"
                            LayoutCachedLeft =570
                            LayoutCachedTop =1250
                            LayoutCachedWidth =1560
                            LayoutCachedHeight =1520
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMEMode =1
                    Left =2271
                    Top =3454
                    Width =3402
                    TabIndex =5
                    Name ="txtKinyu"
                    Format ="@"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =3454
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =3724
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =570
                            Top =3454
                            Width =1425
                            Height =270
                            Name ="ラベル3"
                            Caption ="保有金融機関"
                            LayoutCachedLeft =570
                            LayoutCachedTop =3454
                            LayoutCachedWidth =1995
                            LayoutCachedHeight =3724
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMEMode =1
                    Left =2271
                    Top =2391
                    Width =3402
                    TabIndex =6
                    Name ="txtMemo"
                    Format ="@"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =2391
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =2661
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =2391
                            Width =435
                            Height =270
                            Name ="ラベル6"
                            Caption ="メモ"
                            LayoutCachedLeft =570
                            LayoutCachedTop =2391
                            LayoutCachedWidth =1005
                            LayoutCachedHeight =2661
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =2271
                    Top =2775
                    Width =3402
                    TabIndex =7
                    Name ="txtFurikae"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =2775
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =3045
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =570
                            Top =2775
                            Width =525
                            Height =270
                            Name ="ラベル7"
                            Caption ="振替"
                            LayoutCachedLeft =570
                            LayoutCachedTop =2775
                            LayoutCachedWidth =1095
                            LayoutCachedHeight =3045
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMEMode =1
                    Left =2271
                    Top =3115
                    Width =3402
                    ColumnWidth =5715
                    TabIndex =8
                    Name ="txtID"
                    Format ="@"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =3115
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =3385
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =570
                            Top =3115
                            Width =285
                            Height =270
                            Name ="ラベル8"
                            Caption ="ID"
                            LayoutCachedLeft =570
                            LayoutCachedTop =3115
                            LayoutCachedWidth =855
                            LayoutCachedHeight =3385
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =3405
                    Top =3975
                    Width =2268
                    Height =567
                    TabIndex =9
                    Name ="cmdEnter"
                    Caption ="確定"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =3405
                    LayoutCachedTop =3975
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =4542
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    ColumnCount =2
                    Left =2271
                    Top =1710
                    Width =3402
                    TabIndex =3
                    Name ="cmbDkomoku"
                    RowSourceType ="Table/Query"
                    RowSource ="大項目"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    Format ="@"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =1710
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =1980
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =1710
                            Width =750
                            Height =270
                            Name ="ラベル4"
                            Caption ="大項目"
                            LayoutCachedLeft =570
                            LayoutCachedTop =1710
                            LayoutCachedWidth =1320
                            LayoutCachedHeight =1980
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =2271
                    Top =2051
                    Width =3402
                    TabIndex =4
                    Name ="cmbCkomoku"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701"
                    Format ="@"

                    LayoutCachedLeft =2271
                    LayoutCachedTop =2051
                    LayoutCachedWidth =5673
                    LayoutCachedHeight =2321
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =570
                            Top =2051
                            Width =750
                            Height =270
                            Name ="ラベル5"
                            Caption ="中項目"
                            LayoutCachedLeft =570
                            LayoutCachedTop =2051
                            LayoutCachedWidth =1320
                            LayoutCachedHeight =2321
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "frmKinput.cls"
