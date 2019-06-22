object Form1: TForm1
  Left = 278
  Top = 102
  Width = 626
  Height = 584
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'2'
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
    Left = 224
    Top = 488
    Width = 116
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
  end
  object Label2: TLabel
    Left = 24
    Top = 488
    Width = 82
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1080#1090#1077#1088#1072#1094#1080#1081
  end
  object Label3: TLabel
    Left = 384
    Top = 48
    Width = 68
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
  end
  object Label5: TLabel
    Left = 392
    Top = 88
    Width = 46
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090' '
  end
  object Label4: TLabel
    Left = 48
    Top = 16
    Width = 101
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
  end
  object Label6: TLabel
    Left = 240
    Top = 16
    Width = 94
    Height = 13
    Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
  end
  object Button1: TButton
    Left = 424
    Top = 488
    Width = 97
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 352
    Top = 488
    Width = 33
    Height = 21
    TabOrder = 1
    Text = '10'
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 32
    Width = 169
    Height = 161
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 120
    Top = 488
    Width = 65
    Height = 21
    TabOrder = 3
    Text = '100'
  end
  object Chart1: TChart
    Left = 16
    Top = 208
    Width = 553
    Height = 265
    BackWall.Brush.Color = clWhite
    BackWall.Color = clInactiveCaptionText
    Title.Text.Strings = (
      #1043#1088#1072#1092#1080#1082)
    BackColor = clInactiveCaptionText
    Legend.Visible = False
    View3D = False
    Color = clInactiveBorder
    TabOrder = 4
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clFuchsia
      LinePen.Color = clFuchsia
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object StringGrid2: TStringGrid
    Left = 200
    Top = 32
    Width = 169
    Height = 161
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 5
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Edit3: TEdit
    Left = 472
    Top = 40
    Width = 33
    Height = 21
    TabOrder = 6
    Text = '5'
  end
  object Button2: TButton
    Left = 384
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Edit4: TEdit
    Left = 472
    Top = 80
    Width = 33
    Height = 21
    TabOrder = 8
    Text = '50'
  end
end
