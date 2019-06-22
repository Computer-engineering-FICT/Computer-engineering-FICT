object Form1: TForm1
  Left = 240
  Top = 98
  Width = 661
  Height = 383
  Caption = #1040#1055#1050#1057'.'#1051#1072#1073'.'#1088#1072#1073'.'#8470'1 ('#1095#1072#1089#1090#1100' 2 - '#1089#1080#1085#1090#1077#1079' '#1072#1074#1090#1086#1084#1072#1090#1072', '#1089#1090#1088#1091#1082#1090'. '#1090#1072#1073#1083'.)'
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
    Left = 48
    Top = 160
    Width = 92
    Height = 19
    Caption = #1058#1080#1087' '#1090#1088#1080#1075#1075#1077#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 48
    Top = 16
    Width = 145
    Height = 33
    Caption = #1054#1090#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBox1: TScrollBox
    Left = 250
    Top = 20
    Width = 385
    Height = 321
    HorzScrollBar.Position = 364
    VertScrollBar.Position = 8
    TabOrder = 1
    Visible = False
    object Image1: TImage
      Left = -388
      Top = -8
      Width = 2000
      Height = 2000
    end
  end
  object Button2: TButton
    Left = 48
    Top = 224
    Width = 145
    Height = 33
    Caption = 'OK'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 48
    Top = 64
    Width = 145
    Height = 81
    Caption = #1040#1074#1090#1086#1084#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1052#1091#1088#1072
      #1052#1080#1083#1080)
    ParentFont = False
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 48
    Top = 184
    Width = 145
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 19
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = '  T'
    Items.Strings = (
      '  T'
      '  D'
      '  RS'
      '  JK')
  end
  object CheckBox1: TCheckBox
    Left = 72
    Top = 272
    Width = 97
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Button3: TButton
    Left = 48
    Top = 304
    Width = 145
    Height = 33
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'grf|*.grf'
    Left = 8
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    Left = 8
    Top = 112
  end
end
