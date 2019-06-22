object Form1: TForm1
  Left = 217
  Top = 183
  Width = 674
  Height = 448
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'1 '#1073').'
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
    Left = 24
    Top = 144
    Width = 48
    Height = 13
    Caption = #1058#1056#1048#1043#1043#1045#1056
  end
  object Button1: TButton
    Left = 80
    Top = 24
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBox1: TScrollBox
    Left = 250
    Top = 20
    Width = 385
    Height = 321
    VertScrollBar.Position = 8
    TabOrder = 1
    Visible = False
    object Image1: TImage
      Left = -24
      Top = -16
      Width = 2000
      Height = 2000
    end
  end
  object Button2: TButton
    Left = 88
    Top = 232
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 80
    Top = 72
    Width = 89
    Height = 57
    Caption = #1040#1074#1090#1086#1084#1072#1090
    ItemIndex = 0
    Items.Strings = (
      #1052#1091#1088#1072
      #1052#1080#1083#1080)
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 144
    Width = 89
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = '  D'
    Items.Strings = (
      '  T'
      '  D'
      '  RS'
      '  JK')
  end
  object CheckBox1: TCheckBox
    Left = 96
    Top = 280
    Width = 97
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Filter = 'grf|*.grf'
    Left = 16
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 16
    Top = 80
  end
end
