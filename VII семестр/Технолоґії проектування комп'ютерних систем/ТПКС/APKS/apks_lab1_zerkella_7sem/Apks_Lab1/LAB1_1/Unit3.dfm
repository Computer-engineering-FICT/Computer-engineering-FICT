object Form3: TForm3
  Left = 227
  Top = 160
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 199
  ClientWidth = 195
  Color = 15652821
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbSignal: TLabel
    Left = 8
    Top = 56
    Width = 43
    Height = 13
    Caption = #1057#1080#1075#1085#1072#1083
  end
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 65
    Height = 13
    Caption = #1057#1074#1103#1079#1072#1090#1100' '#1089':'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = #1042#1077#1088#1096#1080#1085#1072
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 120
    Width = 177
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 72
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object cbType: TComboBox
    Left = 8
    Top = 24
    Width = 177
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1054#1087#1077#1088#1072#1090#1086#1088
    OnChange = cbTypeChange
    Items.Strings = (
      #1054#1087#1077#1088#1072#1090#1086#1088
      #1059#1089#1083#1086#1074#1080#1077
      #1050#1086#1085#1077#1094' '#1075#1088#1072#1092#1072)
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 160
    Width = 73
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 160
    Width = 73
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
