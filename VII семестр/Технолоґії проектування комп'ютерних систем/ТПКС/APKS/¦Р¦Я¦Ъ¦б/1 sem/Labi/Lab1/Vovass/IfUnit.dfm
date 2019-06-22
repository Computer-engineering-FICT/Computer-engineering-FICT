object IfForm: TIfForm
  Left = 256
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1089#1083#1086#1074#1085#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  ClientHeight = 260
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup2: TRadioGroup
    Left = 16
    Top = 15
    Width = 169
    Height = 186
    Caption = #1042#1099#1073#1086#1088' '#1087#1091#1090#1080'   '
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 26
    Top = 31
    Width = 113
    Height = 18
    Caption = #1042#1087#1088#1072#1074#1086' '
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 26
    Top = 55
    Width = 113
    Height = 18
    Caption = #1042#1083#1077#1074#1086
    TabOrder = 1
  end
  object OKButton: TButton
    Left = 64
    Top = 216
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = OKButtonClick
  end
end
