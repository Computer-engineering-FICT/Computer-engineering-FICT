object RebroForm: TRebroForm
  Left = 248
  Top = 120
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1073#1088#1086
  ClientHeight = 98
  ClientWidth = 158
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 8
    Width = 152
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1077#1089' '#1088#1077#1073#1088#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 19
    Top = 33
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btOk: TButton
    Left = 42
    Top = 62
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = btOkClick
  end
end
