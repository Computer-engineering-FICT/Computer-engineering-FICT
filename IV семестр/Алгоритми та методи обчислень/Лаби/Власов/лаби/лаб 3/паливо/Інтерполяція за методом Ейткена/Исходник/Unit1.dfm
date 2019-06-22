object Form1: TForm1
  Left = 90
  Top = -10
  Width = 888
  Height = 748
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1030#1085#1090#1077#1088#1087#1086#1083#1103#1094#1110#1103' '#1084#1077#1090#1086#1076#1086#1084' '#1045#1081#1090#1082#1077#1085#1072
  Color = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 849
    Height = 97
    Color = clActiveBorder
    TabOrder = 0
    object Label1: TLabel
      Left = 768
      Top = 24
      Width = 60
      Height = 39
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1074#1091#1079#1083#1110#1074' '#1110#1085#1090#1077#1088#1087#1086#1083#1103#1094#1110#1111
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 404
      Height = 17
      Caption = #1047#1072#1076#1072#1081#1090#1077' '#1074#1091#1079#1083#1080' '#1110#1085#1090#1077#1088#1087#1086#1083#1103#1094#1110#1111' '#1074' '#1087#1086#1088#1103#1076#1082#1091' '#1079#1088#1086#1089#1090#1072#1085#1085#1103' '#1072#1088#1075#1091#1084#1077#1085#1090#1091':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 32
      Width = 745
      Height = 57
      ColCount = 3
      DefaultColWidth = 45
      RowCount = 2
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = StringGrid1KeyPress
    end
    object Edit1: TEdit
      Left = 768
      Top = 64
      Width = 49
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '2'
    end
    object UpDown1: TUpDown
      Left = 817
      Top = 64
      Width = 24
      Height = 21
      Associate = Edit1
      Min = 2
      Max = 15
      Position = 2
      TabOrder = 2
      Wrap = False
      OnClick = UpDown1Click
    end
  end
  object Chart1: TChart
    Left = 16
    Top = 112
    Width = 849
    Height = 577
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = RUSSIAN_CHARSET
    Title.Font.Color = clMaroon
    Title.Font.Height = -16
    Title.Font.Name = 'Times New Roman'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      #1042#1091#1079#1083#1080' '#1110#1085#1090#1077#1088#1087#1086#1083#1103#1094#1110#1111'  '#1090#1072' '#1110#1085#1090#1077#1088#1087#1086#1083#1103#1094#1110#1081#1085#1080#1081' '#1084#1085#1086#1075#1086#1095#1083#1077#1085'.')
    Legend.Visible = False
    View3D = False
    Color = clSilver
    TabOrder = 1
    object Series1: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.HorizSize = 5
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 5
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 8454016
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
  object MainMenu1: TMainMenu
    Left = 824
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082'...'
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1044#1086#1074#1110#1076#1082#1072
      object N4: TMenuItem
        Caption = #1044#1086#1074#1110#1076#1082#1072' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
        OnClick = N4Click
      end
    end
    object N6: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      OnClick = N6Click
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 768
  end
end
