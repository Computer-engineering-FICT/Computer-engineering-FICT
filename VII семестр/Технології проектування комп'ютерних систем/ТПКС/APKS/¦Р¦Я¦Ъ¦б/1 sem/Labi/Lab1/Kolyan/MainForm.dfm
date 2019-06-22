object Form1: TForm1
  Left = 13
  Top = 2
  Width = 777
  Height = 572
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'1 '#1087#1086' '#1040#1055#1050#1057',  '#1041#1086#1081#1095#1077#1085#1082#1086' '#1053#1080#1082#1086#1083#1072#1103',  '#1043#1088#1091#1087#1087#1072' '#1048#1042'-93'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 8
    Width = 769
    Height = 537
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1085#1086#1089#1090#1100
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 100
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1077#1088#1096#1080#1085
      end
      object Label2: TLabel
        Left = 16
        Top = 40
        Width = 75
        Height = 13
        Caption = #1057#1074#1103#1079#1080' '#1074#1077#1088#1096#1080#1085':'
      end
      object Label3: TLabel
        Left = 360
        Top = 40
        Width = 108
        Height = 13
        Caption = #1057#1080#1075#1085#1072#1083#1099' '#1074' '#1074#1077#1088#1096#1080#1085#1072#1093':'
      end
      object Edit1: TEdit
        Left = 144
        Top = 8
        Width = 49
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object StringGrid1: TStringGrid
        Left = 16
        Top = 56
        Width = 345
        Height = 257
        DefaultColWidth = 25
        DefaultRowHeight = 15
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 1
      end
      object StringGrid2: TStringGrid
        Left = 368
        Top = 56
        Width = 153
        Height = 257
        ColCount = 4
        DefaultColWidth = 25
        DefaultRowHeight = 15
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 2
        RowHeights = (
          15
          15
          15
          15
          15)
      end
      object Button1: TButton
        Left = 200
        Top = 8
        Width = 75
        Height = 25
        Caption = #1055#1088#1080#1085#1103#1090#1100
        TabOrder = 3
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 528
        Top = 168
        Width = 105
        Height = 49
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
        TabOrder = 4
        OnClick = Button2Click
      end
      object Memo1: TMemo
        Left = 16
        Top = 320
        Width = 505
        Height = 177
        Lines.Strings = (
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '')
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object Button3: TButton
        Left = 528
        Top = 56
        Width = 105
        Height = 49
        Caption = #1063#1080#1090#1072#1090#1100
        TabOrder = 6
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 528
        Top = 112
        Width = 105
        Height = 49
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 7
        OnClick = Button4Click
      end
      object Button9: TButton
        Left = 528
        Top = 224
        Width = 105
        Height = 49
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 8
        OnClick = Button9Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1088#1072#1092'. '#1074#1074#1086#1076
      ImageIndex = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 633
        Height = 1000
        OnMouseDown = Image1MouseDown
      end
      object Label6: TLabel
        Left = 656
        Top = 96
        Width = 44
        Height = 13
        Caption = #1057#1080#1075#1085#1072#1083#1099
      end
      object Button5: TButton
        Left = 656
        Top = 136
        Width = 105
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1077#1088#1096#1080#1085#1091
        TabOrder = 0
        OnClick = Button5Click
      end
      object ScrollBar1: TScrollBar
        Left = 632
        Top = 0
        Width = 16
        Height = 510
        Kind = sbVertical
        Max = 101
        PageSize = 0
        TabOrder = 1
        OnChange = ScrollBar1Change
      end
      object RadioGroup1: TRadioGroup
        Left = 656
        Top = 0
        Width = 105
        Height = 89
        Caption = #1058#1080#1087' '#1042#1077#1088#1096#1080#1085#1099
        ItemIndex = 3
        Items.Strings = (
          #1053#1072#1095#1072#1083#1086
          #1050#1086#1085#1077#1094
          #1054#1087#1077#1088#1072#1090#1086#1088#1085#1072#1103
          #1059#1089#1083#1086#1074#1085#1072#1103)
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 656
        Top = 224
        Width = 105
        Height = 129
        Caption = #1057#1074#1103#1079#1080
        TabOrder = 3
        object Label4: TLabel
          Left = 8
          Top = 24
          Width = 17
          Height = 13
          Caption = #1048#1079':'
        end
        object Label5: TLabel
          Left = 16
          Top = 112
          Width = 10
          Height = 13
          Caption = #1042':'
        end
        object ComboBox1: TComboBox
          Left = 32
          Top = 16
          Width = 65
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = #1053#1086#1084#1077#1088
          OnChange = ComboBox1Change
        end
        object RadioGroup2: TRadioGroup
          Left = 8
          Top = 40
          Width = 89
          Height = 57
          Caption = #1058#1080#1087' '#1074#1099#1093#1086#1076#1072
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'yes'
            'no')
          TabOrder = 1
        end
        object ComboBox2: TComboBox
          Left = 32
          Top = 104
          Width = 65
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Text = #1053#1086#1084#1077#1088
        end
      end
      object Button6: TButton
        Left = 656
        Top = 360
        Width = 105
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1074#1103#1079#1100
        TabOrder = 4
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 656
        Top = 384
        Width = 105
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1074#1103#1079#1100
        TabOrder = 5
        OnClick = Button7Click
      end
      object Edit2: TEdit
        Left = 656
        Top = 112
        Width = 33
        Height = 21
        TabOrder = 6
      end
      object Edit3: TEdit
        Left = 688
        Top = 112
        Width = 41
        Height = 21
        TabOrder = 7
      end
      object Edit4: TEdit
        Left = 728
        Top = 112
        Width = 33
        Height = 21
        TabOrder = 8
      end
      object ComboBox3: TComboBox
        Left = 656
        Top = 168
        Width = 105
        Height = 21
        ItemHeight = 13
        TabOrder = 9
        Text = #1053#1086#1084#1077#1088
      end
      object Button8: TButton
        Left = 656
        Top = 192
        Width = 105
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1077#1088#1096#1080#1085#1091
        TabOrder = 10
        OnClick = Button8Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1056#1072#1079#1084#1077#1090#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
      ImageIndex = 2
      object RadioGroup3: TRadioGroup
        Left = 8
        Top = 8
        Width = 89
        Height = 97
        Caption = #1058#1080#1087' '#1072#1074#1090#1086#1084#1072#1090#1072
        ItemIndex = 0
        Items.Strings = (
          #1052#1080#1083#1080
          #1052#1091#1088#1072)
        TabOrder = 0
      end
      object RadioGroup4: TRadioGroup
        Left = 8
        Top = 112
        Width = 89
        Height = 89
        Caption = #1058#1080#1087' '#1090#1088#1080#1075#1075#1077#1088#1086#1074
        ItemIndex = 0
        Items.Strings = (
          'D'
          'RS')
        TabOrder = 1
      end
      object Button10: TButton
        Left = 8
        Top = 216
        Width = 89
        Height = 57
        Caption = #1047#1072#1087#1091#1089#1082
        TabOrder = 2
        OnClick = Button10Click
      end
      object StringGrid4: TStringGrid
        Left = 112
        Top = 128
        Width = 649
        Height = 369
        DefaultColWidth = 30
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 2
        TabOrder = 3
      end
      object StringGrid3: TStringGrid
        Left = 112
        Top = 8
        Width = 649
        Height = 120
        DefaultColWidth = 30
        DefaultRowHeight = 15
        FixedRows = 0
        TabOrder = 4
        ColWidths = (
          94
          30
          30
          30
          30)
        RowHeights = (
          15
          15
          15
          15
          15)
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1060#1091#1085#1082#1094#1080#1080
      ImageIndex = 3
      object Button11: TButton
        Left = 0
        Top = 0
        Width = 75
        Height = 25
        Caption = #1047#1072#1087#1091#1089#1082
        TabOrder = 0
        OnClick = Button11Click
      end
      object Memo2: TMemo
        Left = 0
        Top = 32
        Width = 761
        Height = 473
        TabOrder = 1
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1057#1093#1077#1084#1072
      ImageIndex = 4
      object Button12: TButton
        Left = 0
        Top = 0
        Width = 75
        Height = 25
        Caption = #1047#1072#1087#1091#1089#1082
        TabOrder = 0
        OnClick = Button12Click
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 32
        Width = 761
        Height = 473
        TabOrder = 1
        OnDockDrop = ScrollBox1DockDrop
        object Image2: TImage
          Left = 0
          Top = 0
          Width = 753
          Height = 25000
        end
      end
    end
  end
end
