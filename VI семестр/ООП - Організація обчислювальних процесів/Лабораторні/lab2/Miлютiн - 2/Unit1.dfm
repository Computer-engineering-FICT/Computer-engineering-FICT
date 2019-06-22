object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1077#1085#1085#1099#1081' '#1087#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082
  ClientHeight = 306
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 281
    Height = 273
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object Label2: TLabel
      Left = 121
      Top = 12
      Width = 64
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1089#1089#1086#1088#1099
    end
    object Label6: TLabel
      Left = 8
      Top = 128
      Width = 36
      Height = 13
      Caption = #1047#1072#1076#1072#1095#1080
    end
    object sgData: TStringGrid
      Left = 48
      Top = 24
      Width = 225
      Height = 241
      ColCount = 1
      DefaultColWidth = 20
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 304
    Top = 16
    Width = 289
    Height = 273
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 1
    object Label7: TLabel
      Left = 5
      Top = 128
      Width = 36
      Height = 13
      Caption = #1047#1072#1076#1072#1095#1080
    end
    object Label3: TLabel
      Left = 129
      Top = 8
      Width = 64
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1089#1089#1086#1088#1099
    end
    object sgRez: TStringGrid
      Left = 48
      Top = 24
      Width = 233
      Height = 241
      ColCount = 1
      DefaultColWidth = 20
      DefaultRowHeight = 20
      Enabled = False
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 608
    Top = 16
    Width = 113
    Height = 273
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 74
      Height = 26
      Caption = #1050#1086#1083'-'#1074#1086' '#1079#1072#1076#1072#1095' \ '#1087#1088#1086#1094#1077#1089#1089#1086#1088#1086#1074':'
      WordWrap = True
    end
    object edtQ: TEdit
      Left = 8
      Top = 40
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '5'
    end
    object btnInit: TButton
      Left = 8
      Top = 72
      Width = 97
      Height = 25
      Caption = #1047#1072#1076#1072#1090#1100
      TabOrder = 1
      OnClick = btnInitClick
    end
    object btnCalc: TButton
      Left = 8
      Top = 112
      Width = 97
      Height = 25
      Caption = #1057#1095#1080#1090#1072#1090#1100
      TabOrder = 2
      OnClick = btnCalcClick
    end
  end
end
