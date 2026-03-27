Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    TabularCharSet =128
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =6236
    DatasheetFontHeight =11
    ItemSuffix =11
    Right =14172
    Bottom =11568
    RecSrcDt = Begin
        0xc541a593813be640
    End
    Caption ="新規登録_確定申告"
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
        Begin FormHeader
            Height =907
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
                    Left =288
                    Top =288
                    Width =4488
                    Height =456
                    FontSize =18
                    Name ="lblTitle"
                    Caption ="新規登録 (確定申告分類)"
                    GroupTable =1
                    LayoutCachedLeft =288
                    LayoutCachedTop =288
                    LayoutCachedWidth =4776
                    LayoutCachedHeight =744
                    LayoutGroup =1
                    ThemeFontIndex =0
                    BorderThemeColorIndex =2
                    BorderTint =100.0
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                    GroupTable =1
                End
            End
        End
        Begin Section
            Height =5159
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
                    Tag ="日付,IsDate"

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
                    Tag ="内容,Required"

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
                    IMEMode =1
                    Left =2271
                    Top =2391
                    Width =3402
                    TabIndex =4
                    Name ="txtMemo"
                    Format ="@"
                    Tag ="メモ,NA"

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
                    Left =2265
                    Top =3060
                    Width =3402
                    TabIndex =5
                    Name ="txtFurikae"
                    DefaultValue ="0"
                    Tag ="振替,Required"

                    LayoutCachedLeft =2265
                    LayoutCachedTop =3060
                    LayoutCachedWidth =5667
                    LayoutCachedHeight =3330
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =564
                            Top =3060
                            Width =525
                            Height =270
                            Name ="ラベル7"
                            Caption ="振替"
                            LayoutCachedLeft =564
                            LayoutCachedTop =3060
                            LayoutCachedWidth =1089
                            LayoutCachedHeight =3330
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMEMode =1
                    Left =2265
                    Top =3400
                    Width =3402
                    ColumnWidth =5715
                    TabIndex =6
                    Name ="txtID"
                    Format ="@"
                    Tag ="ID,NA"

                    LayoutCachedLeft =2265
                    LayoutCachedTop =3400
                    LayoutCachedWidth =5667
                    LayoutCachedHeight =3670
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =564
                            Top =3400
                            Width =285
                            Height =270
                            Name ="ラベル8"
                            Caption ="ID"
                            LayoutCachedLeft =564
                            LayoutCachedTop =3400
                            LayoutCachedWidth =849
                            LayoutCachedHeight =3670
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =3458
                    Top =3911
                    Width =2268
                    Height =567
                    TabIndex =7
                    Name ="cmdEnter"
                    Caption ="確定"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =3458
                    LayoutCachedTop =3911
                    LayoutCachedWidth =5726
                    LayoutCachedHeight =4478
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
                    Name ="cmbKamoku"
                    RowSourceType ="Table/Query"
                    RowSource ="勘定科目"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    Tag ="勘定科目,Required"
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
                            Width =1362
                            Height =270
                            Name ="ラベル4"
                            Caption ="勘定科目"
                            LayoutCachedLeft =570
                            LayoutCachedTop =1710
                            LayoutCachedWidth =1932
                            LayoutCachedHeight =1980
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =1
                    ColumnCount =2
                    Left =2265
                    Top =2040
                    Width =3402
                    Height =252
                    TabIndex =2
                    BoundColumn =1
                    Name ="txtKinyu"
                    RowSourceType ="Table/Query"
                    RowSource ="金融機関"
                    ColumnWidths ="0;1701"
                    Tag ="保有金融機関,Required"
                    Format ="@"

                    LayoutCachedLeft =2265
                    LayoutCachedTop =2040
                    LayoutCachedWidth =5667
                    LayoutCachedHeight =2292
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =564
                            Top =2040
                            Width =1425
                            Height =270
                            Name ="ラベル3"
                            Caption ="保有金融機関"
                            LayoutCachedLeft =564
                            LayoutCachedTop =2040
                            LayoutCachedWidth =1989
                            LayoutCachedHeight =2310
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =5102
                    Top =4592
                    Width =567
                    Height =567
                    TabIndex =8
                    Name ="cmdClose"
                    OnClick ="[Event Procedure]"
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000082c2ea0982c2ea4b82c2ea90 ,
                        0x82c2eade00000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000082c2ea2182c2ea7582c2eab782c2eaf982c2eaff82c2eaff ,
                        0x82c2eaff00000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffa500000000000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffc000000000b17d4a90b17d4affb17d4af0b17d4a36 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffedffffff30b17d4a87b17d4affb17d4af0b17d4a3600000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaffffffffffd7ecf8ff82c2eaff ,
                        0x82c2eaffffffff30b17d4a81b17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4aff82c2eaff82c2eaff82c2eaffdceef9ffc4e2f5ff82c2eaff ,
                        0x82c2eaffffffff27b17d4a7eb17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4aff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffe4ffffff27b17d4a84b17d4affb17d4af0b17d4a3900000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffbd00000000b17d4a8db17d4affb17d4af0b17d4a39 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffa500000000000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2ea2182c2ea6f82c2eab782c2eaf982c2eaff82c2eaff ,
                        0x82c2eaff00000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000082c2ea0982c2ea4e82c2ea96 ,
                        0x82c2eae400000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =5102
                    LayoutCachedTop =4592
                    LayoutCachedWidth =5669
                    LayoutCachedHeight =5159
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =2267
                    Top =1247
                    Height =252
                    TabIndex =9
                    Name ="txtKingakuView"
                    Tag ="View,Required"

                    LayoutCachedLeft =2267
                    LayoutCachedTop =1247
                    LayoutCachedWidth =3968
                    LayoutCachedHeight =1499
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =50
                            Left =566
                            Top =1247
                            Width =1008
                            Height =252
                            Name ="ラベル10"
                            Caption ="金額（円）"
                            LayoutCachedLeft =566
                            LayoutCachedTop =1247
                            LayoutCachedWidth =1574
                            LayoutCachedHeight =1499
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =737
                    Top =4025
                    Width =954
                    TabIndex =10
                    Name ="txtKingaku"
                    Format ="General Number"
                    Tag ="金額,NA"

                    LayoutCachedLeft =737
                    LayoutCachedTop =4025
                    LayoutCachedWidth =1691
                    LayoutCachedHeight =4295
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
CodeBehindForm
' See "frmSinput.cls"
