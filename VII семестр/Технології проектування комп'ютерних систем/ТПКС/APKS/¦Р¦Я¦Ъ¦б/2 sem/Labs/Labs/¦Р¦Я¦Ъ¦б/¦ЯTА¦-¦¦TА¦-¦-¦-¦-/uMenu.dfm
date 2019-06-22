object Form1: TForm1
  Left = 192
  Top = 107
  Width = 263
  Height = 130
  Caption = 'Синтез цифрового автомата'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 201
    Height = 25
    Caption = 'Этап 1 - Контроль исходных данных'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 56
    Width = 201
    Height = 25
    Caption = 'Этап 2 - Разметка состояний'
    TabOrder = 1
    OnClick = Button2Click
  end
end
