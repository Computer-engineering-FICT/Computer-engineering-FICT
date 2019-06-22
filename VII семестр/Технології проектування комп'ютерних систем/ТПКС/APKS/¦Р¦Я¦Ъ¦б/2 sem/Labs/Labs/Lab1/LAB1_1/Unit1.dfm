object Form1: TForm1
  Left = 230
  Top = 116
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'1 '#1072').  '
  ClientHeight = 500
  ClientWidth = 629
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 192
    Top = 8
    Width = 117
    Height = 13
    Caption = #1043#1088#1072#1092'-'#1089#1093#1077#1084#1072' '#1072#1083#1075#1086#1088#1080#1090#1084#1072
  end
  object Button1: TButton
    Left = 336
    Top = 464
    Width = 113
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 8
    Top = 72
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100'  '#1074#1077#1088#1096#1080#1085#1091
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 96
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1077#1088#1096#1080#1085#1091
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 120
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1074#1103#1079#1100
    TabOrder = 3
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 144
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1074#1103#1079#1100
    TabOrder = 4
    OnClick = Button6Click
  end
  object Button2: TButton
    Left = 8
    Top = 232
    Width = 113
    Height = 25
    Caption = #1053#1086#1074#1072#1103' '#1075#1088#1072#1092'-'#1089#1093#1077#1084#1072
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button7: TButton
    Left = 8
    Top = 256
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button7Click
  end
  object ScrollBox1: TScrollBox
    Left = 160
    Top = 32
    Width = 465
    Height = 417
    TabOrder = 7
    object Image1: TImage
      Left = -48
      Top = -8
      Width = 2000
      Height = 2000
    end
  end
  object Button8: TButton
    Left = 8
    Top = 280
    Width = 113
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 8
    OnClick = Button8Click
  end
  object SaveDialog1: TSaveDialog
    Left = 128
    Top = 248
  end
  object OpenDialog1: TOpenDialog
    Left = 128
    Top = 280
  end
end
