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
    Width =14173
    DatasheetFontHeight =11
    ItemSuffix =113
    Right =12420
    Bottom =11232
    RecSrcDt = Begin
        0x86cd6396dc3be640
    End
    Caption ="項目別一覧"
    OnOpen ="[Event Procedure]"
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
            Height =550
            Name ="フォームヘッダー"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin EmptyCell
                    Left =300
                    Top =60
                    Width =684
                    Height =460
                    Name ="Auto_LogoEmptyCell"
                    GroupTable =1
                    LayoutCachedLeft =300
                    LayoutCachedTop =60
                    LayoutCachedWidth =984
                    LayoutCachedHeight =520
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =50
                    Left =1044
                    Top =60
                    Width =11388
                    Height =460
                    FontSize =18
                    Name ="Auto_Header0"
                    Caption ="項目別一覧"
                    GroupTable =1
                    LayoutCachedLeft =1044
                    LayoutCachedTop =60
                    LayoutCachedWidth =12432
                    LayoutCachedHeight =520
                    ColumnStart =1
                    ColumnEnd =1
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
            CanGrow = NotDefault
            Height =12068
            Name ="詳細"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =570
                    Top =570
                    Width =1320
                    Height =270
                    Name ="lblRange"
                    Caption ="出力期間："
                    LayoutCachedLeft =570
                    LayoutCachedTop =570
                    LayoutCachedWidth =1890
                    LayoutCachedHeight =840
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    IMEMode =2
                    Left =2215
                    Top =570
                    Width =2835
                    Name ="txtRange"

                    LayoutCachedLeft =2215
                    LayoutCachedTop =570
                    LayoutCachedWidth =5050
                    LayoutCachedHeight =840
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =2214
                    Width =1418
                    TabIndex =1
                    Name ="txtCkomoku1"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =2214
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =2484
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =2604
                    Width =1418
                    TabIndex =2
                    Name ="txtCkomoku2"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =2604
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =2874
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =2994
                    Width =1418
                    TabIndex =3
                    Name ="txtCkomoku3"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =2994
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =3264
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =3384
                    Width =1418
                    TabIndex =4
                    Name ="txtCkomoku4"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =3384
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =3654
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =3774
                    Width =1418
                    TabIndex =5
                    Name ="txtCkomoku5"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =3774
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =4044
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =4164
                    Width =1418
                    TabIndex =6
                    Name ="txtCkomoku6"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =4164
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =4434
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =4554
                    Width =1418
                    TabIndex =7
                    Name ="txtCkomoku7"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =4554
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =4824
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =4944
                    Width =1418
                    TabIndex =8
                    Name ="txtCkomoku8"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =4944
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =5214
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =5334
                    Width =1418
                    TabIndex =9
                    Name ="txtCkomoku9"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =5334
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =5604
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =5724
                    Width =1418
                    TabIndex =10
                    Name ="txtCkomoku10"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =5724
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =5994
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =6114
                    Width =1418
                    TabIndex =11
                    Name ="txtCkomoku11"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =6114
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =6384
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =6504
                    Width =1418
                    TabIndex =12
                    Name ="txtCkomoku12"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =6504
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =6774
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =6894
                    Width =1418
                    TabIndex =13
                    Name ="txtCkomoku13"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =6894
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =7164
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =7284
                    Width =1418
                    TabIndex =14
                    Name ="txtCkomoku14"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =7284
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =7554
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =7674
                    Width =1418
                    TabIndex =15
                    Name ="txtCkomoku15"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =7674
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =7944
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =2214
                    Width =2041
                    TabIndex =16
                    ForeColor =6710886
                    Name ="lblCkomoku1"

                    LayoutCachedLeft =574
                    LayoutCachedTop =2214
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =2484
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =2604
                    Width =2041
                    TabIndex =17
                    ForeColor =6710886
                    Name ="lblCkomoku2"

                    LayoutCachedLeft =574
                    LayoutCachedTop =2604
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =2874
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =2994
                    Width =2041
                    TabIndex =18
                    ForeColor =6710886
                    Name ="lblCkomoku3"

                    LayoutCachedLeft =574
                    LayoutCachedTop =2994
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =3264
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =3384
                    Width =2041
                    TabIndex =19
                    ForeColor =6710886
                    Name ="lblCkomoku4"

                    LayoutCachedLeft =574
                    LayoutCachedTop =3384
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =3654
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =3774
                    Width =2041
                    TabIndex =20
                    ForeColor =6710886
                    Name ="lblCkomoku5"

                    LayoutCachedLeft =574
                    LayoutCachedTop =3774
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =4044
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =4164
                    Width =2041
                    TabIndex =21
                    ForeColor =6710886
                    Name ="lblCkomoku6"

                    LayoutCachedLeft =574
                    LayoutCachedTop =4164
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =4434
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =4554
                    Width =2041
                    TabIndex =22
                    ForeColor =6710886
                    Name ="lblCkomoku7"

                    LayoutCachedLeft =574
                    LayoutCachedTop =4554
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =4824
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =4944
                    Width =2041
                    TabIndex =23
                    ForeColor =6710886
                    Name ="lblCkomoku8"

                    LayoutCachedLeft =574
                    LayoutCachedTop =4944
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =5214
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =5334
                    Width =2041
                    TabIndex =24
                    ForeColor =6710886
                    Name ="lblCkomoku9"

                    LayoutCachedLeft =574
                    LayoutCachedTop =5334
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =5604
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =5724
                    Width =2041
                    TabIndex =25
                    ForeColor =6710886
                    Name ="lblCkomoku10"

                    LayoutCachedLeft =574
                    LayoutCachedTop =5724
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =5994
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =6114
                    Width =2041
                    TabIndex =26
                    ForeColor =6710886
                    Name ="lblCkomoku11"

                    LayoutCachedLeft =574
                    LayoutCachedTop =6114
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =6384
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =6504
                    Width =2041
                    TabIndex =27
                    ForeColor =6710886
                    Name ="lblCkomoku12"

                    LayoutCachedLeft =574
                    LayoutCachedTop =6504
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =6774
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =6894
                    Width =2041
                    TabIndex =28
                    ForeColor =6710886
                    Name ="lblCkomoku13"

                    LayoutCachedLeft =574
                    LayoutCachedTop =6894
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =7164
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =7284
                    Width =2041
                    TabIndex =29
                    ForeColor =6710886
                    Name ="lblCkomoku14"

                    LayoutCachedLeft =574
                    LayoutCachedTop =7284
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =7554
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =7674
                    Width =2041
                    TabIndex =30
                    ForeColor =6710886
                    Name ="lblCkomoku15"

                    LayoutCachedLeft =574
                    LayoutCachedTop =7674
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =7944
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =4482
                    Top =2213
                    Width =851
                    Height =271
                    TabIndex =31
                    Name ="cmdMeisai1"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =2213
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =2484
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =2604
                    Width =851
                    Height =271
                    TabIndex =32
                    Name ="cmdMeisai2"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =2604
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =2875
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =2995
                    Width =851
                    Height =271
                    TabIndex =33
                    Name ="cmdMeisai3"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =2995
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =3266
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =3386
                    Width =851
                    Height =271
                    TabIndex =34
                    Name ="cmdMeisai4"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =3386
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =3657
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =3777
                    Width =851
                    Height =271
                    TabIndex =35
                    Name ="cmdMeisai5"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =3777
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =4048
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =4168
                    Width =851
                    Height =271
                    TabIndex =36
                    Name ="cmdMeisai6"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =4168
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =4439
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =4559
                    Width =851
                    Height =271
                    TabIndex =37
                    Name ="cmdMeisai7"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =4559
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =4830
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =4950
                    Width =851
                    Height =271
                    TabIndex =38
                    Name ="cmdMeisai8"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =4950
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =5221
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =5341
                    Width =851
                    Height =271
                    TabIndex =39
                    Name ="cmdMeisai9"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =5341
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =5612
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =5732
                    Width =851
                    Height =271
                    TabIndex =40
                    Name ="cmdMeisai10"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =5732
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =6003
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =6123
                    Width =851
                    Height =271
                    TabIndex =41
                    Name ="cmdMeisai11"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =6123
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =6394
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =6514
                    Width =851
                    Height =271
                    TabIndex =42
                    Name ="cmdMeisai12"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =6514
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =6785
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =6905
                    Width =851
                    Height =271
                    TabIndex =43
                    Name ="cmdMeisai13"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =6905
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =7176
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =7296
                    Width =851
                    Height =271
                    TabIndex =44
                    Name ="cmdMeisai14"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =7296
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =7567
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =7687
                    Width =851
                    Height =271
                    TabIndex =45
                    Name ="cmdMeisai15"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =7687
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =7958
                End
                Begin Subform
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =6525
                    Top =2205
                    Width =6636
                    Height =7431
                    TabIndex =46
                    Name ="subMeisai"
                    SourceObject ="Form.frmMeisaiD"

                    LayoutCachedLeft =6525
                    LayoutCachedTop =2205
                    LayoutCachedWidth =13161
                    LayoutCachedHeight =9636
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =2212
                    Width =368
                    Height =272
                    TabIndex =47
                    Name ="txtCD1"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =2212
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =2484
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =2604
                    Width =368
                    Height =272
                    TabIndex =48
                    Name ="txtCD2"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =2604
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =2876
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =2996
                    Width =368
                    Height =272
                    TabIndex =49
                    Name ="txtCD3"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =2996
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =3268
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =3388
                    Width =368
                    Height =272
                    TabIndex =50
                    Name ="txtCD4"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =3388
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =3660
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =3780
                    Width =368
                    Height =272
                    TabIndex =51
                    Name ="txtCD5"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =3780
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =4052
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =4172
                    Width =368
                    Height =272
                    TabIndex =52
                    Name ="txtCD6"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =4172
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =4444
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =4564
                    Width =368
                    Height =272
                    TabIndex =53
                    Name ="txtCD7"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =4564
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =4836
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =4956
                    Width =368
                    Height =272
                    TabIndex =54
                    Name ="txtCD8"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =4956
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =5228
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =5348
                    Width =368
                    Height =272
                    TabIndex =55
                    Name ="txtCD9"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =5348
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =5620
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =5740
                    Width =368
                    Height =272
                    TabIndex =56
                    Name ="txtCD10"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =5740
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =6012
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =6132
                    Width =368
                    Height =272
                    TabIndex =57
                    Name ="txtCD11"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =6132
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =6404
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =6524
                    Width =368
                    Height =272
                    TabIndex =58
                    Name ="txtCD12"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =6524
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =6796
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =6916
                    Width =368
                    Height =272
                    TabIndex =59
                    Name ="txtCD13"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =6916
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =7188
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =7308
                    Width =368
                    Height =272
                    TabIndex =60
                    Name ="txtCD14"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =7308
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =7580
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =7700
                    Width =368
                    Height =272
                    TabIndex =61
                    Name ="txtCD15"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =7700
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =7972
                End
                Begin Label
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =574
                    Top =1372
                    Width =1320
                    Height =270
                    Name ="lblGokei"
                    Caption ="差引金額："
                    LayoutCachedLeft =574
                    LayoutCachedTop =1372
                    LayoutCachedWidth =1894
                    LayoutCachedHeight =1642
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =50
                    IMEMode =2
                    Left =2219
                    Top =1372
                    Width =2835
                    TabIndex =62
                    Name ="txtGokei"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2219
                    LayoutCachedTop =1372
                    LayoutCachedWidth =5054
                    LayoutCachedHeight =1642
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =8092
                    Width =1418
                    TabIndex =63
                    Name ="txtCkomoku16"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =8092
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =8362
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =8482
                    Width =1418
                    TabIndex =64
                    Name ="txtCkomoku17"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =8482
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =8752
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =8872
                    Width =1418
                    TabIndex =65
                    Name ="txtCkomoku18"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =8872
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =9142
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =9262
                    Width =1418
                    TabIndex =66
                    Name ="txtCkomoku19"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =9262
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =9532
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =8092
                    Width =2041
                    TabIndex =67
                    ForeColor =6710886
                    Name ="lblCkomoku16"

                    LayoutCachedLeft =574
                    LayoutCachedTop =8092
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =8362
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =8482
                    Width =2041
                    TabIndex =68
                    ForeColor =6710886
                    Name ="lblCkomoku17"

                    LayoutCachedLeft =574
                    LayoutCachedTop =8482
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =8752
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =8872
                    Width =2041
                    TabIndex =69
                    ForeColor =6710886
                    Name ="lblCkomoku18"

                    LayoutCachedLeft =574
                    LayoutCachedTop =8872
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =9142
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =9262
                    Width =2041
                    TabIndex =70
                    ForeColor =6710886
                    Name ="lblCkomoku19"

                    LayoutCachedLeft =574
                    LayoutCachedTop =9262
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =9532
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =8102
                    Width =851
                    Height =271
                    TabIndex =71
                    Name ="cmdMeisai16"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =8102
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =8373
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =8493
                    Width =851
                    Height =271
                    TabIndex =72
                    Name ="cmdMeisai17"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =8493
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =8764
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =8884
                    Width =851
                    Height =271
                    TabIndex =73
                    Name ="cmdMeisai18"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =8884
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =9155
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =9275
                    Width =851
                    Height =271
                    TabIndex =74
                    Name ="cmdMeisai19"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =9275
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =9546
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =8112
                    Width =368
                    Height =272
                    TabIndex =75
                    Name ="txtCD16"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =8112
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =8384
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =8504
                    Width =368
                    Height =272
                    TabIndex =76
                    Name ="txtCD17"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =8504
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =8776
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =8896
                    Width =368
                    Height =272
                    TabIndex =77
                    Name ="txtCD18"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =8896
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =9168
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =9288
                    Width =368
                    Height =272
                    TabIndex =78
                    Name ="txtCD19"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =9288
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =9560
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =9680
                    Width =1418
                    TabIndex =79
                    Name ="txtCkomoku20"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =9680
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =9950
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =9680
                    Width =2041
                    TabIndex =80
                    ForeColor =6710886
                    Name ="lblCkomoku20"

                    LayoutCachedLeft =574
                    LayoutCachedTop =9680
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =9950
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =9693
                    Width =851
                    Height =271
                    TabIndex =81
                    Name ="cmdMeisai20"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =9693
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =9964
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =9706
                    Width =368
                    Height =272
                    TabIndex =82
                    Name ="txtCD20"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =9706
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =9978
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =10098
                    Width =1418
                    TabIndex =83
                    Name ="txtCkomoku21"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =10098
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =10368
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =10098
                    Width =2041
                    TabIndex =84
                    ForeColor =6710886
                    Name ="lblCkomoku21"

                    LayoutCachedLeft =574
                    LayoutCachedTop =10098
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =10368
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =10111
                    Width =851
                    Height =271
                    TabIndex =85
                    Name ="cmdMeisai21"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =10111
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =10382
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =10124
                    Width =368
                    Height =272
                    TabIndex =86
                    Name ="txtCD21"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =10124
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =10396
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =10516
                    Width =1418
                    TabIndex =87
                    Name ="txtCkomoku22"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =10516
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =10786
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =10516
                    Width =2041
                    TabIndex =88
                    ForeColor =6710886
                    Name ="lblCkomoku22"

                    LayoutCachedLeft =574
                    LayoutCachedTop =10516
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =10786
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =10529
                    Width =851
                    Height =271
                    TabIndex =89
                    Name ="cmdMeisai22"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =10529
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =10800
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =10542
                    Width =368
                    Height =272
                    TabIndex =90
                    Name ="txtCD22"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =10542
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =10814
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =10934
                    Width =1418
                    TabIndex =91
                    Name ="txtCkomoku23"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =10934
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =11204
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =10934
                    Width =2041
                    TabIndex =92
                    ForeColor =6710886
                    Name ="lblCkomoku23"

                    LayoutCachedLeft =574
                    LayoutCachedTop =10934
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =11204
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =10947
                    Width =851
                    Height =271
                    TabIndex =93
                    Name ="cmdMeisai23"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =10947
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =11218
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =10960
                    Width =368
                    Height =272
                    TabIndex =94
                    Name ="txtCD23"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =10960
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =11232
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =11352
                    Width =1418
                    TabIndex =95
                    Name ="txtCkomoku24"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =11352
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =11622
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =11352
                    Width =2041
                    TabIndex =96
                    ForeColor =6710886
                    Name ="lblCkomoku24"

                    LayoutCachedLeft =574
                    LayoutCachedTop =11352
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =11622
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =11365
                    Width =851
                    Height =271
                    TabIndex =97
                    Name ="cmdMeisai24"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =11365
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =11636
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =11378
                    Width =368
                    Height =272
                    TabIndex =98
                    Name ="txtCD24"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =11378
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =11650
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =2782
                    Top =11770
                    Width =1418
                    TabIndex =99
                    Name ="txtCkomoku25"
                    Format ="¥#,##0;-¥#,##0"

                    LayoutCachedLeft =2782
                    LayoutCachedTop =11770
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =12040
                    CurrencySymbol ="¥"
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =50
                    BackStyle =0
                    Left =574
                    Top =11770
                    Width =2041
                    TabIndex =100
                    ForeColor =6710886
                    Name ="lblCkomoku25"

                    LayoutCachedLeft =574
                    LayoutCachedTop =11770
                    LayoutCachedWidth =2615
                    LayoutCachedHeight =12040
                    BorderThemeColorIndex =0
                    BorderTint =50.0
                    BorderShade =100.0
                    ForeTint =60.0
                End
                Begin CommandButton
                    Visible = NotDefault
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4482
                    Top =11783
                    Width =851
                    Height =271
                    TabIndex =101
                    Name ="cmdMeisai25"
                    Caption ="明細"

                    LayoutCachedLeft =4482
                    LayoutCachedTop =11783
                    LayoutCachedWidth =5333
                    LayoutCachedHeight =12054
                End
                Begin TextBox
                    Visible = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =3
                    TextFontFamily =50
                    IMEMode =2
                    Left =5502
                    Top =11796
                    Width =368
                    Height =272
                    TabIndex =102
                    Name ="txtCD25"

                    LayoutCachedLeft =5502
                    LayoutCachedTop =11796
                    LayoutCachedWidth =5870
                    LayoutCachedHeight =12068
                End
            End
        End
        Begin FormFooter
            Height =793
            Name ="フォームフッター"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin CommandButton
                    OverlapFlags =85
                    TextFontFamily =50
                    Left =4764
                    Top =108
                    Width =567
                    Height =567
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

                    LayoutCachedLeft =4764
                    LayoutCachedTop =108
                    LayoutCachedWidth =5331
                    LayoutCachedHeight =675
                End
            End
        End
    End
End
CodeBehindForm
' See "frmZenkomoku.cls"
