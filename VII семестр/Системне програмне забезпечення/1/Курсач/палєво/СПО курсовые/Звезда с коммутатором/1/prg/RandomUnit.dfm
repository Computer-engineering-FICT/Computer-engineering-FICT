object RandomForm: TRandomForm
  Left = 377
  Top = 263
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1075#1088#1072#1092#1072
  ClientHeight = 104
  ClientWidth = 276
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
    Left = 4
    Top = 8
    Width = 162
    Height = 19
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1077#1088#1096#1080#1085
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 4
    Top = 41
    Width = 105
    Height = 19
    Caption = #1057#1074#1103#1079#1072#1085#1085#1086#1089#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 254
    Top = 41
    Width = 16
    Height = 19
    Caption = '%'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 182
    Top = 8
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '20'
  end
  object Edit2: TEdit
    Left = 182
    Top = 39
    Width = 49
    Height = 21
    TabOrder = 1
    Text = '4'
  end
  object UpDown1: TUpDown
    Left = 231
    Top = 8
    Width = 15
    Height = 21
    Associate = Edit1
    Min = 0
    Position = 20
    TabOrder = 2
    Wrap = False
  end
  object UpDown2: TUpDown
    Left = 231
    Top = 39
    Width = 15
    Height = 21
    Associate = Edit2
    Min = 0
    Position = 4
    TabOrder = 3
    Wrap = False
  end
  object btOk: TButton
    Left = 115
    Top = 75
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    OnClick = btOkClick
  end
  object btCancel: TButton
    Left = 190
    Top = 75
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = btCancelClick
  end
end
