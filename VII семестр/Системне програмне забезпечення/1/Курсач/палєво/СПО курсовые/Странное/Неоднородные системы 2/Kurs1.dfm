object Form1: TForm1
  Left = 223
  Top = 186
  Width = 1036
  Height = 775
  Caption = #1050#1091#1088#1089#1086#1074#1072' '#1088#1086#1073#1086#1090#1072' '#1087#1086' '#1057#1055#1047
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 512
    Width = 77
    Height = 13
    Caption = #1056#1086#1079#1084#1110#1088' '#1084#1072#1090#1088#1080#1094#1110
  end
  object Im: TImage
    Left = 224
    Top = 208
    Width = 641
    Height = 289
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Center = True
  end
  object Label2: TLabel
    Left = 80
    Top = 72
    Width = 79
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1090#1080#1074#1085#1110#1089#1090#1100
  end
  object Label3: TLabel
    Left = 88
    Top = 136
    Width = 32
    Height = 13
    Caption = #1064#1083#1103#1093#1080
  end
  object Label4: TLabel
    Left = 64
    Top = 248
    Width = 76
    Height = 13
    Caption = #1052#1110#1085#1110#1084#1091#1084' '#1096#1083#1103#1093#1110#1074
  end
  object Label5: TLabel
    Left = 384
    Top = 0
    Width = 85
    Height = 13
    Caption = #1057#1080#1089#1090#1077#1084#1072' '#1088#1110#1074#1085#1103#1085#1100
  end
  object Label6: TLabel
    Left = 8
    Top = 512
    Width = 87
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1074#1077#1088#1096#1080#1085
  end
  object Label7: TLabel
    Left = 680
    Top = 0
    Width = 106
    Height = 13
    Caption = #1056#1086#1079#1074#39#1103#1079#1082#1080' '#1079#1072' '#1043#1072#1091#1089#1086#1084
  end
  object Label8: TLabel
    Left = 776
    Top = 0
    Width = 93
    Height = 13
    Caption = 'equation of iteration'
  end
  object Label9: TLabel
    Left = 880
    Top = 0
    Width = 106
    Height = 13
    Caption = #1056#1086#1079#1084#1110#1088' '#1082#1086#1077#1092'. '#1110#1090#1077#1088#1072#1094#1110#1111
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 217
    Height = 25
    Caption = #1056#1086#1079#1087#1086#1076#1110#1083#1080#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 24
    Width = 217
    Height = 25
    Caption = #1057#1080#1089#1090#1077#1084#1072' '#1088#1110#1074#1085#1103#1085#1100
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 528
    Width = 73
    Height = 21
    TabOrder = 2
    Text = '100000'
  end
  object Virobn: TStringGrid
    Left = 0
    Top = 88
    Width = 217
    Height = 49
    ColCount = 10
    DefaultColWidth = 20
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    TabOrder = 3
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 152
    Width = 217
    Height = 97
    ColCount = 10
    DefaultColWidth = 20
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    TabOrder = 4
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 264
    Width = 217
    Height = 217
    ColCount = 10
    DefaultColWidth = 20
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    TabOrder = 5
  end
  object StringGrid3: TStringGrid
    Left = 224
    Top = 16
    Width = 457
    Height = 169
    ColCount = 11
    DefaultColWidth = 40
    DefaultRowHeight = 15
    RowCount = 10
    FixedRows = 0
    TabOrder = 6
  end
  object Edit2: TEdit
    Left = 8
    Top = 528
    Width = 73
    Height = 21
    TabOrder = 7
    Text = '10'
  end
  object StringGrid5: TStringGrid
    Left = 680
    Top = 16
    Width = 97
    Height = 169
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 15
    RowCount = 10
    FixedRows = 0
    TabOrder = 8
  end
  object Button3: TButton
    Left = 0
    Top = 48
    Width = 217
    Height = 25
    Caption = #1030#1090#1077#1088#1072#1094#1110#1103
    Enabled = False
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 0
    Top = 480
    Width = 217
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 10
    OnClick = Button4Click
  end
  object StringGrid4: TStringGrid
    Left = 776
    Top = 16
    Width = 89
    Height = 169
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 15
    RowCount = 10
    FixedRows = 0
    TabOrder = 11
    RowHeights = (
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15)
  end
  object StringGrid6: TStringGrid
    Left = 880
    Top = 16
    Width = 105
    Height = 169
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 15
    RowCount = 10
    FixedRows = 0
    TabOrder = 12
  end
end
