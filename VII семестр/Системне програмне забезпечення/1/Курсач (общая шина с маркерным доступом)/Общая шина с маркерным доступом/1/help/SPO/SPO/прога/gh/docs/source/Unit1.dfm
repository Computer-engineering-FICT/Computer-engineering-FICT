object Form1: TForm1
  Left = 201
  Top = 109
  Width = 590
  Height = 375
  Caption = 'graphhunter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  OnResize = OnResize
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 496
    Top = 296
    object N1: TMenuItem
      Caption = '���� ������'
      OnClick = N1Click
      object N7: TMenuItem
        Caption = '�����'
        object N10: TMenuItem
          Caption = '�������� �����'
          OnClick = N10Click
        end
        object N11: TMenuItem
          Caption = '��������� �����'
          OnClick = N11Click
        end
      end
      object N8: TMenuItem
        Caption = '������'
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '��������'
        OnClick = N9Click
      end
    end
    object N2: TMenuItem
      Caption = '�������������� �������'
      OnClick = N2Click
      object N12: TMenuItem
        Caption = '�����'
        object N15: TMenuItem
          Caption = '�������� �����'
          OnClick = N15Click
        end
      end
      object N13: TMenuItem
        Caption = '������'
        OnClick = N13Click
      end
      object N14: TMenuItem
        Caption = '��������'
        OnClick = N14Click
      end
    end
    object N3: TMenuItem
      Caption = '�������������'
      object N18: TMenuItem
        Caption = '��������� �����'
        OnClick = N18Click
      end
    end
    object N4: TMenuItem
      Caption = '����������'
      object N19: TMenuItem
        Caption = '��������� ����������'
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = '���������� ����������'
        OnClick = N20Click
      end
    end
    object N22: TMenuItem
      Caption = '����'
      object N23: TMenuItem
        Caption = '���� ������'
        OnClick = N23Click
      end
      object N24: TMenuItem
        Caption = '�������������� �������'
        OnClick = N24Click
      end
    end
    object N5: TMenuItem
      Caption = '������'
      object N21: TMenuItem
        Caption = '� ���������'
        OnClick = N21Click
      end
    end
    object N6: TMenuItem
      Caption = '�����'
      OnClick = N6Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'grf'
    Filter = 'Graph files(*.grf)|*.GRF'
    Left = 16
    Top = 264
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = 'syt'
    Filter = 'System files(*.syt)|*.SYT'
    Left = 16
    Top = 296
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'grf'
    Filter = 'Graph files(*.grf)|*.GRF'
    Left = 48
    Top = 264
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = 'syt'
    Filter = 'System files(*.syt)|*.SYT'
    Left = 48
    Top = 296
  end
end
