object MainForm: TMainForm
  Left = 220
  Top = 154
  AutoScroll = False
  Caption = '������ ������������ �����'
  ClientHeight = 434
  ClientWidth = 688
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object File1: TMenuItem
      Caption = '����'
      object N3: TMenuItem
        Caption = '�����'
        OnClick = N3Click
      end
    end
    object N1: TMenuItem
      Caption = '�������'
      object N4: TMenuItem
        Caption = '�������'
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = '��������'
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = '����'
      object N7: TMenuItem
        Caption = '�������������'
        OnClick = N7Click
      end
    end
  end
end
