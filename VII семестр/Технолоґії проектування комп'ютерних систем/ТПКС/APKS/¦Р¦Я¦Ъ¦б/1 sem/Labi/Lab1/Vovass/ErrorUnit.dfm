object ErrorForm: TErrorForm
  Left = 239
  Top = 162
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1054#1096#1080#1073#1082#1072
  ClientHeight = 198
  ClientWidth = 300
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
    Left = 74
    Top = 10
    Width = 143
    Height = 20
    Caption = #1054#1096#1080#1073#1082#1072' '#1074#1074#1086#1076#1072' !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 38
    Width = 265
    Height = 97
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 0
  end
  object CloseButton: TButton
    Left = 112
    Top = 160
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = CloseButtonClick
  end
end
