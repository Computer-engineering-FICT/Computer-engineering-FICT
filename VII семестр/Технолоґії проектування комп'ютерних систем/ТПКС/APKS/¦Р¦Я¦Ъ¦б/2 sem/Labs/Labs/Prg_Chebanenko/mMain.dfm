object frmMain: TfrmMain
  Left = 67
  Top = 155
  Width = 912
  Height = 594
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1080#1085#1090#1077#1079#1072' '#1091#1087#1088#1072#1074#1083#1103#1102#1097#1080#1093' '#1072#1074#1090#1086#1084#1072#1090#1086#1074
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 240
    Top = 32
    object N1: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1069#1090#1072#1087#1099' '#1088#1072#1073#1086#1090#1099
      object N3: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1056#1072#1079#1084#1077#1090#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081' '#1080' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1090#1088#1091#1082#1090#1091#1088#1085#1099#1093' '#1090#1072#1073#1083#1080#1094
        OnClick = N4Click
      end
    end
  end
end
