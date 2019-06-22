object frmGraphRedaktor: TfrmGraphRedaktor
  Left = 73
  Top = 127
  Width = 910
  Height = 593
  BorderIcons = []
  Caption = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
  Color = clBtnFace
  DockSite = True
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  PopupMenu = MainGraphMenu
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnDockDrop = FormDockDrop
  PixelsPerInch = 96
  TextHeight = 13
  object MainGraphMenu: TPopupMenu
    Left = 320
    Top = 192
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
      object N2: TMenuItem
        Caption = #1059#1089#1083#1086#1074#1085#1091#1102' '#1074#1077#1088#1096#1080#1085#1091
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088#1085#1091#1102' '#1074#1077#1088#1096#1080#1085#1091
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1042#1077#1088#1096#1080#1085#1091' "'#1053#1072#1095#1072#1083#1086'"'
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1077#1088#1096#1080#1085#1091' "'#1050#1086#1085#1077#1094'"'
        OnClick = N5Click
      end
    end
    object N6: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1089' '#1092#1072#1081#1083#1072#1084#1080
      object N7: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1093#1077#1084#1091
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1072#1073#1083#1080#1094#1099
        OnClick = N8Click
      end
    end
  end
  object ComponentMenu: TPopupMenu
    Left = 408
    Top = 248
    object N9: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1077
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1089#1074#1103#1079#1080
      OnClick = N11Click
    end
  end
  object qryStructuraShemi: TQuery
    SQL.Strings = (
      'CREATE TABLE TS '
      '(                  TTT CHAR)'
      '                ')
    Left = 224
    Top = 80
  end
  object DSStructuraShemi: TDataSource
    DataSet = qryStructuraShemi
    Left = 176
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    Left = 368
    Top = 64
  end
  object qrySave: TQuery
    Left = 240
    Top = 192
  end
  object DSSave: TDataSource
    DataSet = qrySave
    Left = 192
    Top = 200
  end
end
