Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    TabularCharSet =128
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =19994
    DatasheetFontHeight =11
    ItemSuffix =86
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
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BorderShade =65.0
            ShowPageHeaderAndPageFooter =1
        End
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            CanGrow = NotDefault
            Height =2835
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
                    Width =4488
                    Height =456
                    FontSize =18
                    Name ="Auto_Header0"
                    Caption ="MoneyForwardデータ編集"
                    GroupTable =1
                    LayoutCachedLeft =564
                    LayoutCachedTop =36
                    LayoutCachedWidth =5052
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
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =50
                    Left =852
                    Top =2557
                    Width =1247
                    Height =227
                    Name ="lblHiduke"
                    Caption ="日付"
                    LayoutCachedLeft =852
                    LayoutCachedTop =2557
                    LayoutCachedWidth =2099
                    LayoutCachedHeight =2784
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =6631
                    Top =227
                    Width =1418
                    Height =270
                    Name ="txtFrom"
                    Format ="Short Date"

                    LayoutCachedLeft =6631
                    LayoutCachedTop =227
                    LayoutCachedWidth =8049
                    LayoutCachedHeight =497
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =8616
                    Top =227
                    Width =1418
                    Height =270
                    TabIndex =1
                    Name ="txtTo"
                    Format ="Short Date"

                    LayoutCachedLeft =8616
                    LayoutCachedTop =227
                    LayoutCachedWidth =10034
                    LayoutCachedHeight =497
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =8215
                    Top =227
                    Width =285
                    Height =270
                    Name ="lblNyoro"
                    Caption ="～"
                    LayoutCachedLeft =8215
                    LayoutCachedTop =227
                    LayoutCachedWidth =8500
                    LayoutCachedHeight =497
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    ColumnCount =2
                    Left =6630
                    Top =626
                    Width =3402
                    Height =270
                    TabIndex =2
                    Name ="cmbDkomoku"
                    RowSourceType ="Table/Query"
                    RowSource ="大項目"
                    ColumnWidths ="0;1701"
                    OnClick ="[Event Procedure]"
                    Format ="@"

                    LayoutCachedLeft =6630
                    LayoutCachedTop =626
                    LayoutCachedWidth =10032
                    LayoutCachedHeight =896
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            TextFontFamily =50
                            Left =5496
                            Top =626
                            Width =906
                            Height =270
                            Name ="ラベル4"
                            Caption ="大項目："
                            LayoutCachedLeft =5496
                            LayoutCachedTop =626
                            LayoutCachedWidth =6402
                            LayoutCachedHeight =896
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =6630
                    Top =1023
                    Width =3402
                    Height =270
                    TabIndex =3
                    Name ="cmbCkomoku"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="1701"
                    Format ="@"

                    LayoutCachedLeft =6630
                    LayoutCachedTop =1023
                    LayoutCachedWidth =10032
                    LayoutCachedHeight =1293
                    ForeThemeColorIndex =0
                    ForeTint =75.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            TextFontFamily =50
                            Left =5496
                            Top =1023
                            Width =906
                            Height =270
                            Name ="ラベル5"
                            Caption ="中項目："
                            LayoutCachedLeft =5496
                            LayoutCachedTop =1023
                            LayoutCachedWidth =6402
                            LayoutCachedHeight =1293
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =10148
                    Top =228
                    Width =1137
                    Height =561
                    TabIndex =4
                    Name ="cmdPickUp"
                    Caption ="抽出"

                    LayoutCachedLeft =10148
                    LayoutCachedTop =228
                    LayoutCachedWidth =11285
                    LayoutCachedHeight =789
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =10152
                    Top =852
                    Width =1137
                    Height =441
                    TabIndex =5
                    Name ="cmdClear"
                    Caption ="クリア"

                    LayoutCachedLeft =10152
                    LayoutCachedTop =852
                    LayoutCachedWidth =11289
                    LayoutCachedHeight =1293
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =564
                    Top =1704
                    Width =1137
                    Height =567
                    TabIndex =6
                    Name ="cmdAdd"
                    Caption ="新規"

                    LayoutCachedLeft =564
                    LayoutCachedTop =1704
                    LayoutCachedWidth =1701
                    LayoutCachedHeight =2271
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =1812
                    Top =1704
                    Width =1137
                    Height =567
                    TabIndex =7
                    Name ="cmdEdit"
                    Caption ="編集"

                    LayoutCachedLeft =1812
                    LayoutCachedTop =1704
                    LayoutCachedWidth =2949
                    LayoutCachedHeight =2271
                    ForeThemeColorIndex =6
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =3059
                    Top =1704
                    Width =1137
                    Height =567
                    TabIndex =8
                    ForeColor =1643706
                    Name ="cmdDelete"
                    Caption ="削除"

                    LayoutCachedLeft =3059
                    LayoutCachedTop =1704
                    LayoutCachedWidth =4196
                    LayoutCachedHeight =2271
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4824
                    Top =1704
                    Width =1137
                    Height =567
                    FontWeight =700
                    TabIndex =9
                    Name ="cmdEnter"
                    Caption ="確定"

                    LayoutCachedLeft =4824
                    LayoutCachedTop =1704
                    LayoutCachedWidth =5961
                    LayoutCachedHeight =2271
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    TextFontFamily =50
                    Left =2100
                    Top =2556
                    Width =3856
                    Height =227
                    Name ="lblNaiyo"
                    Caption ="内容"
                    LayoutCachedLeft =2100
                    LayoutCachedTop =2556
                    LayoutCachedWidth =5956
                    LayoutCachedHeight =2783
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =50
                    Left =5955
                    Top =2556
                    Width =1418
                    Height =227
                    Name ="lblKingaku"
                    Caption ="金額(円)"
                    LayoutCachedLeft =5955
                    LayoutCachedTop =2556
                    LayoutCachedWidth =7373
                    LayoutCachedHeight =2783
                End
                Begin Label
                    OverlapFlags =93
                    TextAlign =1
                    TextFontFamily =50
                    Left =7378
                    Top =2561
                    Width =1701
                    Height =227
                    Name ="lblKinyu"
                    Caption ="保有金融機関"
                    LayoutCachedLeft =7378
                    LayoutCachedTop =2561
                    LayoutCachedWidth =9079
                    LayoutCachedHeight =2788
                End
                Begin Label
                    OverlapFlags =223
                    TextAlign =1
                    TextFontFamily =50
                    Left =9073
                    Top =2556
                    Width =1701
                    Height =227
                    Name ="lblDkomoku"
                    Caption ="大項目"
                    LayoutCachedLeft =9073
                    LayoutCachedTop =2556
                    LayoutCachedWidth =10774
                    LayoutCachedHeight =2783
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    TextFontFamily =50
                    Left =10771
                    Top =2551
                    Width =1701
                    Height =227
                    Name ="lblCkomoku"
                    Caption ="中項目"
                    LayoutCachedLeft =10771
                    LayoutCachedTop =2551
                    LayoutCachedWidth =12472
                    LayoutCachedHeight =2778
                End
                Begin Label
                    OverlapFlags =87
                    TextAlign =1
                    TextFontFamily =50
                    Left =12472
                    Top =2551
                    Width =1701
                    Height =227
                    Name ="lblMemo"
                    Caption ="メモ"
                    LayoutCachedLeft =12472
                    LayoutCachedTop =2551
                    LayoutCachedWidth =14173
                    LayoutCachedHeight =2778
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    Left =5499
                    Top =226
                    Width =906
                    Height =270
                    Name ="ラベル85"
                    Caption ="日付："
                    LayoutCachedLeft =5499
                    LayoutCachedTop =226
                    LayoutCachedWidth =6405
                    LayoutCachedHeight =496
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =7860
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Subform
                    OverlapFlags =85
                    Left =564
                    Width =19428
                    Height =7800
                    Name ="subMF"
                    SourceObject ="Form.frmEditMFsub"

                    LayoutCachedLeft =564
                    LayoutCachedWidth =19992
                    LayoutCachedHeight =7800
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
            End
        End
    End
End
CodeBehindForm
' See "frmEditMF.cls"
