object fmEdit: TfmEdit
  Left = 192
  Top = 77
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1077#1088#1096#1080#1085#1099
  ClientHeight = 73
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbId: TLabel
    Left = 96
    Top = 8
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 83
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1074#1077#1088#1096#1080#1085#1099
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 8
    Width = 73
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 40
    Width = 73
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    Kind = bkCancel
  end
  object ComboBox: TComboBox
    Left = 8
    Top = 40
    Width = 105
    Height = 21
    ItemHeight = 13
    MaxLength = 5
    Sorted = True
    TabOrder = 2
  end
end
