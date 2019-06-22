object MainForm: TMainForm
  Left = 53
  Top = 124
  VertScrollBar.Smooth = True
  VertScrollBar.Tracking = True
  AutoScroll = False
  Caption = #1057#1080#1085#1090#1077#1079' '#1094#1080#1092#1088#1086#1074#1086#1075#1086' '#1072#1074#1090#1086#1084#1072#1090#1072' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1072#1083#1075#1086#1088#1080#1090#1084#1091'.'
  ClientHeight = 546
  ClientWidth = 700
  Color = clBtnFace
  DockSite = True
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 465
    Width = 700
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clActiveBorder
    ParentColor = False
  end
  object Splitter2: TSplitter
    Left = 546
    Top = 0
    Width = 5
    Height = 465
    Cursor = crHSplit
    Align = alRight
    Beveled = True
    Color = clActiveBorder
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 551
    Top = 0
    Width = 149
    Height = 465
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 149
      Height = 193
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 169
        Height = 193
        Align = alLeft
        Caption = #1058#1080#1087' '#1074#1077#1088#1096#1080#1085#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object RBbegin: TRadioButton
        Left = 10
        Top = 15
        Width = 113
        Height = 17
        Caption = #1053#1072#1095#1072#1083#1086
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RBbeginClick
      end
      object RBend: TRadioButton
        Left = 10
        Top = 75
        Width = 113
        Height = 17
        Caption = #1050#1086#1085#1077#1094
        TabOrder = 2
        OnClick = RBendClick
      end
      object RBnext: TRadioButton
        Left = 10
        Top = 30
        Width = 113
        Height = 23
        Caption = #1050#1086#1084#1072#1085#1076#1085#1072#1103
        TabOrder = 3
        OnClick = RBnextClick
      end
      object RBif: TRadioButton
        Left = 10
        Top = 53
        Width = 113
        Height = 18
        Caption = #1059#1089#1083#1086#1074#1085#1072#1103
        TabOrder = 4
        OnClick = RBifClick
      end
      object PostButton: TBitBtn
        Left = 32
        Top = 96
        Width = 89
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 5
        OnClick = PostButtonClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object DelButton: TBitBtn
        Left = 32
        Top = 160
        Width = 89
        Height = 25
        Caption = '  '#1059#1076#1072#1083#1080#1090#1100
        TabOrder = 6
        OnClick = DelButtonClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
      object Edit3: TEdit
        Left = 47
        Top = 130
        Width = 57
        Height = 21
        BevelInner = bvSpace
        TabOrder = 7
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 193
      Width = 149
      Height = 113
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 39
        Height = 16
        Caption = #1057#1074#1103#1079#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 16
        Top = 32
        Width = 25
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 16
        Top = 64
        Width = 25
        Height = 21
        TabOrder = 1
      end
      object AddLinkButton: TBitBtn
        Left = 50
        Top = 28
        Width = 89
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 2
        OnClick = AddLinkButtonClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object DelLinkButton: TBitBtn
        Left = 50
        Top = 62
        Width = 89
        Height = 25
        Caption = '  '#1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        OnClick = DelLinkButtonClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 306
      Width = 149
      Height = 103
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object exitBtn: TBitBtn
        Left = 32
        Top = 48
        Width = 89
        Height = 25
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 0
        OnClick = CloseButClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000005
          5555555555FFFFF5555555550BBBBB0005555555F77777FFF555555BBBBBBBBB
          0055555777777777FF5555BBBBBBBBBBB0055577777777777FF55BBBBBBBBBBB
          BB0557777777777777F55BBBBBB55555BB0057777775555577FFBBBBBB555555
          5BB0777777555555577FBBBBB555555555B57777755555555575BBBB05555555
          55557777F55555555555BBBB0555555555557777F55555555555BBBB05555555
          55557777F555555555555BBB0555555555555777F555555555555BBB00555555
          55555777FF555555555555BBB0055555555555777FF555555555555BBB005555
          5555555777FF5555555555555BB5555555555555577555555555}
        NumGlyphs = 2
      end
      object testBtn: TBitBtn
        Left = 32
        Top = 16
        Width = 89
        Height = 25
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 546
    Height = 465
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1043#1088#1072#1092
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 538
        Height = 437
        Align = alClient
        Color = clWhite
        ParentColor = False
        TabOrder = 0
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 534
          Height = 433
          Align = alClient
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1099' '#1087#1077#1088#1077#1093#1086#1076#1086#1074
      ImageIndex = 1
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 538
        Height = 437
        ActivePage = TabSheet6
        Align = alClient
        MultiLine = True
        Style = tsFlatButtons
        TabIndex = 1
        TabOrder = 0
        object TabSheet5: TTabSheet
          Caption = #1052#1091#1088#1072
          object Splitter3: TSplitter
            Left = 0
            Top = 122
            Width = 530
            Height = 5
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveBorder
            ParentColor = False
          end
          object Label3: TLabel
            Left = 0
            Top = 127
            Width = 149
            Height = 20
            Align = alTop
            Caption = #1058#1072#1073#1083#1080#1094#1072' '#1087#1077#1088#1077#1093#1086#1076#1086#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object SG1: TStringGrid
            Left = 0
            Top = 33
            Width = 530
            Height = 89
            Align = alTop
            RowCount = 3
            FixedRows = 0
            TabOrder = 0
            ColWidths = (
              64
              64
              64
              64
              64)
            RowHeights = (
              24
              24
              24)
          end
          object SG2: TStringGrid
            Left = 0
            Top = 196
            Width = 530
            Height = 210
            Align = alClient
            DefaultColWidth = 32
            FixedCols = 0
            TabOrder = 1
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 530
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 168
              Height = 20
              Align = alLeft
              Caption = '   '#1056#1072#1079#1084#1077#1090#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object razmMuraBtn: TButton
              Left = 439
              Top = 4
              Width = 75
              Height = 25
              Caption = #1056#1072#1079#1084#1077#1090#1082#1072
              TabOrder = 0
              OnClick = razmMuraBtnClick
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 147
            Width = 530
            Height = 49
            Align = alTop
            TabOrder = 3
            object RadioGroup2: TRadioGroup
              Left = 1
              Top = 1
              Width = 384
              Height = 47
              Align = alLeft
              Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1090#1088#1080#1075#1075#1077#1088#1086#1074' '
              TabOrder = 0
            end
            object btnMuraS: TButton
              Left = 432
              Top = 8
              Width = 75
              Height = 25
              Caption = #1042#1099#1073#1088#1072#1090#1100
              TabOrder = 1
              OnClick = btnMuraSClick
            end
            object RB1: TRadioButton
              Left = 8
              Top = 16
              Width = 41
              Height = 17
              Caption = 'RS'
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object RB2: TRadioButton
              Left = 49
              Top = 16
              Width = 41
              Height = 17
              Caption = 'JK'
              TabOrder = 3
            end
            object RB3: TRadioButton
              Left = 91
              Top = 16
              Width = 41
              Height = 17
              Caption = 'D'
              TabOrder = 4
            end
            object RB4: TRadioButton
              Left = 136
              Top = 16
              Width = 41
              Height = 17
              Caption = 'T'
              TabOrder = 5
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = #1052#1080#1083#1080
          ImageIndex = 1
          object Splitter4: TSplitter
            Left = 0
            Top = 123
            Width = 530
            Height = 5
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveBorder
            ParentColor = False
          end
          object Label5: TLabel
            Left = 0
            Top = 128
            Width = 530
            Height = 20
            Align = alTop
            Caption = #1058#1072#1073#1083#1080#1094#1072' '#1087#1077#1088#1077#1093#1086#1076#1086#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object SG3: TStringGrid
            Left = 0
            Top = 33
            Width = 530
            Height = 90
            Align = alTop
            RowCount = 3
            FixedRows = 0
            TabOrder = 0
          end
          object SG4: TStringGrid
            Left = 0
            Top = 197
            Width = 530
            Height = 209
            Align = alClient
            DefaultColWidth = 32
            FixedCols = 0
            TabOrder = 1
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 530
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label6: TLabel
              Left = -345
              Top = 0
              Width = 156
              Height = 20
              Caption = #1056#1072#1079#1084#1077#1090#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 0
              Top = 0
              Width = 168
              Height = 33
              Align = alLeft
              Caption = '   '#1056#1072#1079#1084#1077#1090#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object razmMiliBtn: TButton
              Left = 439
              Top = 4
              Width = 75
              Height = 25
              Caption = #1056#1072#1079#1084#1077#1090#1082#1072
              TabOrder = 0
              OnClick = razmMiliBtnClick
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 148
            Width = 530
            Height = 49
            Align = alTop
            TabOrder = 3
            object RadioGroup3: TRadioGroup
              Left = 1
              Top = 1
              Width = 384
              Height = 47
              Align = alLeft
              Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1090#1088#1080#1075#1075#1077#1088#1086#1074'  '
              TabOrder = 0
            end
            object btnMiliS: TButton
              Left = 432
              Top = 8
              Width = 75
              Height = 25
              Caption = #1042#1099#1073#1088#1072#1090#1100
              TabOrder = 1
              OnClick = btnMiliSClick
            end
            object RB5: TRadioButton
              Left = 8
              Top = 16
              Width = 41
              Height = 17
              Caption = 'RS'
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object RB6: TRadioButton
              Left = 49
              Top = 16
              Width = 41
              Height = 17
              Caption = 'JK'
              TabOrder = 3
            end
            object RB7: TRadioButton
              Left = 91
              Top = 16
              Width = 41
              Height = 17
              Caption = 'D'
              TabOrder = 4
            end
            object RB8: TRadioButton
              Left = 136
              Top = 16
              Width = 41
              Height = 17
              Caption = 'T'
              TabOrder = 5
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1051#1086#1075'. '#1092#1091#1085#1082#1094#1080#1080
      ImageIndex = 2
      object Memo2: TMemo
        Left = 0
        Top = 41
        Width = 538
        Height = 396
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 41
        Align = alTop
        TabOrder = 1
        object btnMiliF: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = #1052#1080#1083#1080
          TabOrder = 0
          OnClick = btnMiliFClick
        end
        object btnMuraF: TButton
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Caption = #1052#1091#1088#1072
          TabOrder = 1
          OnClick = btnMuraFClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1093#1077#1084#1072
      ImageIndex = 3
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 41
        Align = alTop
        TabOrder = 0
        object miliSchBtn: TButton
          Left = 8
          Top = 8
          Width = 81
          Height = 25
          Caption = ' '#1052#1080#1083#1080
          TabOrder = 0
          OnClick = miliSchBtnClick
        end
        object muraSchBtn: TButton
          Left = 96
          Top = 8
          Width = 81
          Height = 25
          Caption = #1052#1091#1088#1072
          TabOrder = 1
          OnClick = muraSchBtnClick
        end
      end
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 41
        Width = 538
        Height = 396
        Align = alClient
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 1
        object Image2: TImage
          Left = 0
          Top = 0
          Width = 534
          Height = 392
          Align = alClient
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 470
    Width = 700
    Height = 76
    Align = alBottom
    TabOrder = 2
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 698
      Height = 74
      Align = alClient
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 592
    Top = 424
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
      end
      object Save1: TMenuItem
        Caption = '&Save'
        OnClick = Save1Click
      end
      object Load1: TMenuItem
        Caption = '&Load'
        OnClick = Load1Click
      end
      object Exit1: TMenuItem
        Bitmap.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Service1: TMenuItem
      Caption = 'Se&rvice'
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About'
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 664
    Top = 424
  end
  object OpenDialog1: TOpenDialog
    Left = 632
    Top = 424
  end
end
