object Form1: TForm1
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'2'
  ClientHeight = 394
  ClientWidth = 347
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
    Left = 16
    Top = 16
    Width = 68
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#8470'1'
  end
  object Label2: TLabel
    Left = 96
    Top = 16
    Width = 68
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#8470'2'
  end
  object Label3: TLabel
    Left = 176
    Top = 16
    Width = 68
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#8470'3'
  end
  object Label4: TLabel
    Left = 256
    Top = 16
    Width = 68
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#8470'4'
  end
  object SpeedButton1: TSpeedButton
    Left = 16
    Top = 304
    Width = 313
    Height = 25
    Caption = #1057#1090#1072#1088#1090
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Label5: TLabel
    Left = 152
    Top = 336
    Width = 96
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1072#1082#1090#1086#1074
  end
  object Label6: TLabel
    Left = 16
    Top = 336
    Width = 101
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1087#1088#1086#1094#1077#1089#1089#1086#1088#1086#1074
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 0
    Text = '5'
  end
  object Edit2: TEdit
    Left = 96
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 1
    Text = '10'
  end
  object Edit3: TEdit
    Left = 176
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 2
    Text = '15'
  end
  object Edit4: TEdit
    Left = 256
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 3
    Text = '20'
  end
  object Edit5: TEdit
    Left = 152
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '1000'
  end
  object Edit6: TEdit
    Left = 16
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '5'
  end
  object CheckBox1: TCheckBox
    Left = 280
    Top = 352
    Width = 33
    Height = 17
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 16
    Top = 64
    Width = 313
    Height = 233
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 7
  end
end
