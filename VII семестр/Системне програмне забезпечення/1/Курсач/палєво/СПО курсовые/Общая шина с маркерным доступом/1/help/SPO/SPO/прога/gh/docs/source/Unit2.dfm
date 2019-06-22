object Form2: TForm2
  Left = 387
  Top = 183
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'О программе'
  ClientHeight = 130
  ClientWidth = 160
  Color = clBtnFace
  UseDockManager = True
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnActivate = OnActivate
  OnDeactivate = OnDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 48
    Top = 104
    Width = 73
    Height = 22
    Caption = 'Выход'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 73
    Height = 14
    Caption = 'Used Memory='
  end
  object Label6: TLabel
    Left = 40
    Top = 24
    Width = 81
    Height = 13
    Caption = 'Гаврилюк А.Б.'
  end
  object Label2: TLabel
    Left = 56
    Top = 40
    Width = 41
    Height = 13
    Caption = 'My site'
  end
  object RzURLLabel1: TRzURLLabel
    Left = 16
    Top = 88
    Width = 129
    Height = 13
    Caption = 'mailto:soft@email.irpin.net'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    FrameSides = []
  end
  object RzURLLabel2: TRzURLLabel
    Left = 8
    Top = 56
    Width = 139
    Height = 13
    Caption = 'http://www.alife-soft.narod.ru'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    FrameSides = []
  end
  object Label3: TLabel
    Left = 57
    Top = 72
    Width = 48
    Height = 13
    Caption = 'My Email'
  end
end
