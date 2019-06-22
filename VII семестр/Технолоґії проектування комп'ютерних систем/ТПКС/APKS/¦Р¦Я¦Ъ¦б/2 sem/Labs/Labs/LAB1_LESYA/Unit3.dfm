object Form3: TForm3
  Left = 383
  Top = 257
  Width = 439
  Height = 255
  Caption = 'Form3'
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
    Left = 88
    Top = 32
    Width = 36
    Height = 13
    Caption = #1057#1080#1075#1085#1072#1083
  end
  object Label2: TLabel
    Left = 48
    Top = 136
    Width = 113
    Height = 13
    Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  end
  object Button1: TButton
    Left = 288
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 272
    Top = 16
    Width = 129
    Height = 89
    Caption = #1058#1080#1087'  '#1074#1077#1088#1096#1080#1085#1099
    ItemIndex = 0
    Items.Strings = (
      #1050#1086#1085#1077#1095#1085#1072#1103
      #1054#1087#1077#1088#1072#1090#1086#1088#1085#1072#1103
      #1059#1089#1083#1086#1074#1085#1072#1103)
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 40
    Top = 160
    Width = 129
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 48
    Top = 56
    Width = 113
    Height = 21
    TabOrder = 4
  end
end
