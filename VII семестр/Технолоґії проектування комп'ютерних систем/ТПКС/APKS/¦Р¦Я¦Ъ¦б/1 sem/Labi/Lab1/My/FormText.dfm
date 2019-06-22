object TextForm: TTextForm
  Left = 300
  Top = 152
  BorderStyle = bsSingle
  Caption = #1042#1074#1086#1076
  ClientHeight = 234
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lText: TLabel
    Left = 16
    Top = 16
    Width = 113
    Height = 16
    Caption = #1059#1089#1083#1086#1074#1085#1099#1081' '#1089#1080#1075#1085#1072#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object eText: TEdit
    Left = 136
    Top = 16
    Width = 89
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object pButtons: TPanel
    Left = 56
    Top = 48
    Width = 137
    Height = 137
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bSignal: TButton
      Left = 8
      Top = 104
      Width = 25
      Height = 25
      Caption = 'y'
      TabOrder = 0
      OnClick = bSignalClick
    end
    object b1: TButton
      Tag = 1
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Caption = '1'
      TabOrder = 1
      OnClick = bNumClick
    end
    object b2: TButton
      Tag = 2
      Left = 40
      Top = 8
      Width = 25
      Height = 25
      Caption = '2'
      TabOrder = 2
      OnClick = bNumClick
    end
    object b3: TButton
      Tag = 3
      Left = 72
      Top = 8
      Width = 25
      Height = 25
      Caption = '3'
      TabOrder = 3
      OnClick = bNumClick
    end
    object b4: TButton
      Tag = 4
      Left = 8
      Top = 40
      Width = 25
      Height = 25
      Caption = '4'
      TabOrder = 4
      OnClick = bNumClick
    end
    object b5: TButton
      Tag = 5
      Left = 40
      Top = 40
      Width = 25
      Height = 25
      Caption = '5'
      TabOrder = 5
      OnClick = bNumClick
    end
    object b0: TButton
      Left = 40
      Top = 104
      Width = 25
      Height = 25
      Caption = '0'
      TabOrder = 9
      OnClick = bNumClick
    end
    object b7: TButton
      Tag = 7
      Left = 8
      Top = 72
      Width = 25
      Height = 25
      Caption = '7'
      TabOrder = 6
      OnClick = bNumClick
    end
    object b9: TButton
      Tag = 9
      Left = 72
      Top = 72
      Width = 25
      Height = 25
      Caption = '9'
      TabOrder = 8
      OnClick = bNumClick
    end
    object b8: TButton
      Tag = 8
      Left = 40
      Top = 72
      Width = 25
      Height = 25
      Caption = '8'
      TabOrder = 7
      OnClick = bNumClick
    end
    object bComma: TButton
      Left = 72
      Top = 104
      Width = 25
      Height = 25
      Caption = ','
      TabOrder = 10
      OnClick = bCommaClick
    end
    object bBack: TButton
      Left = 104
      Top = 104
      Width = 25
      Height = 25
      Caption = '<--'
      TabOrder = 11
      OnClick = bBackClick
    end
    object b6: TButton
      Tag = 6
      Left = 72
      Top = 40
      Width = 25
      Height = 25
      Caption = '6'
      TabOrder = 12
      OnClick = bNumClick
    end
  end
  object bOk: TButton
    Left = 40
    Top = 200
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object bCancel: TButton
    Left = 136
    Top = 200
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
