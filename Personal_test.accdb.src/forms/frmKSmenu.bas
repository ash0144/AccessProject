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
    Width =8333
    DatasheetFontHeight =11
    ItemSuffix =28
    Right =20460
    Bottom =11820
    RecSrcDt = Begin
        0x2d1d1047d67fe640
    End
    RecordSource ="履歴"
    Caption ="家計簿/確定申告"
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
        Begin Line
            BorderLineStyle =0
            Width =1701
            BorderThemeColorIndex =0
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
        Begin OptionButton
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
            Width =1701
            Height =1701
            BackThemeColorIndex =1
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
        Begin ListBox
            TextFontCharSet =128
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="ＭＳ Ｐゴシック"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
            Height =8390
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    Left =1134
                    Top =3804
                    Width =1134
                    Height =270
                    Name ="lblRange"
                    Caption ="出力期間："
                    LayoutCachedLeft =1134
                    LayoutCachedTop =3804
                    LayoutCachedWidth =2268
                    LayoutCachedHeight =4074
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =2493
                    Top =3807
                    Width =1418
                    Name ="txtFrom"
                    Format ="Short Date"

                    LayoutCachedLeft =2493
                    LayoutCachedTop =3807
                    LayoutCachedWidth =3911
                    LayoutCachedHeight =4077
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =4478
                    Top =3807
                    Width =1418
                    TabIndex =1
                    Name ="txtTo"
                    Format ="Short Date"

                    LayoutCachedLeft =4478
                    LayoutCachedTop =3807
                    LayoutCachedWidth =5896
                    LayoutCachedHeight =4077
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4077
                    Top =3810
                    Width =285
                    Height =270
                    Name ="lblNyoro"
                    Caption ="～"
                    LayoutCachedLeft =4077
                    LayoutCachedTop =3810
                    LayoutCachedWidth =4362
                    LayoutCachedHeight =4080
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =1134
                    Top =4656
                    Width =2268
                    Height =567
                    TabIndex =2
                    Name ="cmdAll"
                    Caption ="項目別一覧"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =1134
                    LayoutCachedTop =4656
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =5223
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    ColumnCount =2
                    ListRows =20
                    Left =2493
                    Top =4201
                    Width =3402
                    TabIndex =3
                    Name ="cmbDkomoku"
                    RowSourceType ="Table/Query"
                    RowSource ="大項目"
                    ColumnWidths ="0;1701"
                    Format ="@"

                    LayoutCachedLeft =2493
                    LayoutCachedTop =4201
                    LayoutCachedWidth =5895
                    LayoutCachedHeight =4471
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =3663
                    Top =4656
                    Width =2268
                    Height =567
                    TabIndex =4
                    Name ="cmdKomoku"
                    Caption ="項目明細"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =3663
                    LayoutCachedTop =4656
                    LayoutCachedWidth =5931
                    LayoutCachedHeight =5223
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    Left =1134
                    Top =4201
                    Width =1125
                    Height =270
                    Name ="lblDkomoku"
                    Caption ="項目："
                    LayoutCachedLeft =1134
                    LayoutCachedTop =4201
                    LayoutCachedWidth =2259
                    LayoutCachedHeight =4471
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =6804
                    Top =7368
                    Width =567
                    Height =567
                    TabIndex =5
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

                    LayoutCachedLeft =6804
                    LayoutCachedTop =7368
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =7935
                End
                Begin OptionGroup
                    OverlapFlags =85
                    Left =2556
                    Top =2556
                    Width =2822
                    Height =619
                    TabIndex =6
                    Name ="optBunrui"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="1"

                    LayoutCachedLeft =2556
                    LayoutCachedTop =2556
                    LayoutCachedWidth =5378
                    LayoutCachedHeight =3175
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =215
                            TextFontFamily =50
                            Left =2676
                            Top =2436
                            Width =964
                            Height =252
                            FontWeight =600
                            Name ="lblBunrui"
                            Caption ="分類方法"
                            LayoutCachedLeft =2676
                            LayoutCachedTop =2436
                            LayoutCachedWidth =3640
                            LayoutCachedHeight =2688
                            BackThemeColorIndex =-1
                        End
                        Begin OptionButton
                            SpecialEffect =2
                            OverlapFlags =87
                            Left =4030
                            Top =2795
                            OptionValue =2
                            Name ="optSinkoku"

                            LayoutCachedLeft =4030
                            LayoutCachedTop =2795
                            LayoutCachedWidth =4290
                            LayoutCachedHeight =3035
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =4260
                                    Top =2766
                                    Width =936
                                    Height =252
                                    Name ="lblSinkoku"
                                    Caption ="確定申告"
                                    LayoutCachedLeft =4260
                                    LayoutCachedTop =2766
                                    LayoutCachedWidth =5196
                                    LayoutCachedHeight =3018
                                End
                            End
                        End
                        Begin OptionButton
                            SpecialEffect =2
                            OverlapFlags =87
                            Left =2742
                            Top =2794
                            TabIndex =1
                            OptionValue =1
                            Name ="optKakeibo"

                            LayoutCachedLeft =2742
                            LayoutCachedTop =2794
                            LayoutCachedWidth =3002
                            LayoutCachedHeight =3034
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =2972
                                    Top =2766
                                    Width =720
                                    Height =252
                                    Name ="lblKakeibo"
                                    Caption ="家計簿"
                                    LayoutCachedLeft =2972
                                    LayoutCachedTop =2766
                                    LayoutCachedWidth =3692
                                    LayoutCachedHeight =3018
                                End
                            End
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =1134
                    Top =1128
                    Width =2268
                    Height =567
                    TabIndex =7
                    Name ="cmdImpMF"
                    Caption ="MoneyForward 読込"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =1134
                    LayoutCachedTop =1128
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =1695
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =2
                    TextFontFamily =50
                    Left =3621
                    Top =1191
                    Width =1247
                    Height =227
                    FontSize =10
                    Name ="ラベル1"
                    Caption ="最終更新日"
                    LayoutCachedLeft =3621
                    LayoutCachedTop =1191
                    LayoutCachedWidth =4868
                    LayoutCachedHeight =1418
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextAlign =2
                    TextFontFamily =50
                    IMEMode =2
                    Left =3621
                    Top =1418
                    Width =1247
                    Height =227
                    FontSize =10
                    TabIndex =8
                    Name ="テキスト2"
                    ControlSource ="MoneyForward読込日"

                    LayoutCachedLeft =3621
                    LayoutCachedTop =1418
                    LayoutCachedWidth =4868
                    LayoutCachedHeight =1645
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =1134
                    Top =6228
                    Width =2268
                    Height =567
                    TabIndex =9
                    Name ="cmdInput"
                    Caption ="手動入力"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =1134
                    LayoutCachedTop =6228
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =6795
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =2831
                    Top =1754
                    Width =567
                    Height =227
                    FontSize =9
                    TabIndex =10
                    Name ="cmdClr"
                    Caption ="クリア"
                    OnClick ="[Event Procedure]"

                    LayoutCachedLeft =2831
                    LayoutCachedTop =1754
                    LayoutCachedWidth =3398
                    LayoutCachedHeight =1981
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =50
                    Left =744
                    Top =672
                    Width =492
                    Height =240
                    FontSize =10
                    FontWeight =700
                    Name ="ラベル19"
                    Caption ="読込"
                    LayoutCachedLeft =744
                    LayoutCachedTop =672
                    LayoutCachedWidth =1236
                    LayoutCachedHeight =912
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =50
                    Left =732
                    Top =3348
                    Width =492
                    Height =240
                    FontSize =10
                    FontWeight =700
                    Name ="ラベル20"
                    Caption ="出力"
                    LayoutCachedLeft =732
                    LayoutCachedTop =3348
                    LayoutCachedWidth =1224
                    LayoutCachedHeight =3588
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    TextFontFamily =50
                    Left =744
                    Top =5772
                    Width =492
                    Height =240
                    FontSize =10
                    FontWeight =700
                    Name ="ラベル22"
                    Caption ="入力"
                    LayoutCachedLeft =744
                    LayoutCachedTop =5772
                    LayoutCachedWidth =1236
                    LayoutCachedHeight =6012
                End
                Begin Line
                    BorderWidth =1
                    OverlapFlags =93
                    Left =564
                    Top =7140
                    Width =6804
                    Name ="直線23"
                    LayoutCachedLeft =564
                    LayoutCachedTop =7140
                    LayoutCachedWidth =7368
                    LayoutCachedHeight =7140
                    BorderThemeColorIndex =2
                End
                Begin Line
                    BorderWidth =1
                    OverlapFlags =95
                    Left =7367
                    Top =564
                    Width =0
                    Height =6576
                    Name ="直線24"
                    LayoutCachedLeft =7367
                    LayoutCachedTop =564
                    LayoutCachedWidth =7367
                    LayoutCachedHeight =7140
                    BorderThemeColorIndex =2
                End
                Begin Line
                    BorderWidth =1
                    OverlapFlags =95
                    Left =564
                    Top =2268
                    Width =6804
                    Name ="直線25"
                    LayoutCachedLeft =564
                    LayoutCachedTop =2268
                    LayoutCachedWidth =7368
                    LayoutCachedHeight =2268
                    BorderThemeColorIndex =2
                End
                Begin Line
                    BorderWidth =1
                    OverlapFlags =95
                    Left =564
                    Top =564
                    Width =6804
                    Name ="直線26"
                    LayoutCachedLeft =564
                    LayoutCachedTop =564
                    LayoutCachedWidth =7368
                    LayoutCachedHeight =564
                    BorderThemeColorIndex =2
                End
                Begin Line
                    BorderWidth =1
                    OverlapFlags =87
                    Left =564
                    Top =564
                    Width =0
                    Height =6576
                    Name ="直線27"
                    LayoutCachedLeft =564
                    LayoutCachedTop =564
                    LayoutCachedWidth =564
                    LayoutCachedHeight =7140
                    BorderThemeColorIndex =2
                End
            End
        End
    End
End
CodeBehindForm
' See "frmKSmenu.cls"
