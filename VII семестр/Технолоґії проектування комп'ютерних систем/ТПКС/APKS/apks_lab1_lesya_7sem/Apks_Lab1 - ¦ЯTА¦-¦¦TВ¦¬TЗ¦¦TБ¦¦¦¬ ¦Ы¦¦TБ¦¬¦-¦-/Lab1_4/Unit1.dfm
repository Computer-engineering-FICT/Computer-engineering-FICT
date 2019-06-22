object Form1: TForm1
  Left = 280
  Top = 126
  Width = 711
  Height = 563
  Caption = #1040#1055#1050#1057'.'#1051#1072#1073'.'#1088#1072#1073'.'#8470'1 ('#1095#1072#1089#1090#1100' 4 - '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1089#1093#1077#1084#1099')'
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
    Width = 703
    Height = 534
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1060#1091#1085#1082#1094#1080#1080
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 695
        Height = 57
        Align = alTop
        TabOrder = 0
        object Button2: TButton
          Left = 288
          Top = 8
          Width = 137
          Height = 41
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 88
          Top = 8
          Width = 137
          Height = 41
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 1
          OnClick = Button1Click
        end
        object Button3: TButton
          Left = 488
          Top = 8
          Width = 137
          Height = 41
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 2
          OnClick = Button3Click
        end
      end
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 57
        Width = 695
        Height = 443
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
        Width = 695
        Height = 500
        Align = alClient
        TabOrder = 0
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 2000
          Height = 4000
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'fun|*.fun'
    Left = 16
    Top = 104
  end
end
