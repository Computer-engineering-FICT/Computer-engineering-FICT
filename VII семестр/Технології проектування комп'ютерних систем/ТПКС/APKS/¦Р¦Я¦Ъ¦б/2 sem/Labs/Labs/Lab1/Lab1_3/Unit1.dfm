object Form1: TForm1
  Left = 206
  Top = 246
  Width = 554
  Height = 421
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'1 '#1074').'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 546
    Height = 394
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1060#1091#1085#1082#1094#1080#1080'  '#1075#1088#1072#1092#1072
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 49
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Button1: TButton
          Left = 184
          Top = 16
          Width = 161
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1092#1072#1081#1083#1072
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 49
        Width = 538
        Height = 317
        Align = alClient
        TabOrder = 1
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 1000
          Height = 1000
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 538
        Height = 325
        Align = alClient
        DefaultColWidth = 35
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 325
        Width = 538
        Height = 41
        Align = alBottom
        Caption = #1040#1074#1090#1086#1084#1072#1090'  '
        TabOrder = 1
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'stt|*.stt'
    Left = 8
    Top = 32
  end
end
