object Change: TChange
  Left = 791
  Top = 333
  Width = 207
  Height = 205
  Caption = 'Редактирование'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 73
    Height = 13
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 73
    Height = 13
  end
  object Label3: TLabel
    Left = 24
    Top = 80
    Width = 81
    Height = 21
  end
  object Label4: TLabel
    Left = 24
    Top = 120
    Width = 81
    Height = 13
  end
  object Edit1: TEdit
    Left = 104
    Top = 16
    Width = 41
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 104
    Top = 48
    Width = 65
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 104
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 2
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 104
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 3
    Visible = False
    OnKeyPress = Edit4KeyPress
  end
  object Ok: TButton
    Left = 48
    Top = 152
    Width = 113
    Height = 17
    Caption = 'OK'
    TabOrder = 4
    OnClick = OkClick
  end
end
