object Form1: TForm1
  Left = 194
  Top = 119
  Width = 696
  Height = 480
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'1 '#1075').'
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
    Width = 688
    Height = 453
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1060#1091#1085#1082#1094#1080#1080
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 41
        Align = alTop
        TabOrder = 0
        object Button2: TButton
          Left = 248
          Top = 8
          Width = 89
          Height = 25
          Caption = 'OK'
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 128
          Top = 8
          Width = 113
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 41
        Width = 680
        Height = 384
        Align = alClient
        TabOrder = 1
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 1000
          Height = 1500
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '  '#1057#1093#1077#1084#1072'  '
      ImageIndex = 1
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 680
        Height = 425
        Align = alClient
        TabOrder = 0
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 1100
          Height = 3600
          Center = True
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'fun|*.fun'
    Left = 80
    Top = 32
  end
end
