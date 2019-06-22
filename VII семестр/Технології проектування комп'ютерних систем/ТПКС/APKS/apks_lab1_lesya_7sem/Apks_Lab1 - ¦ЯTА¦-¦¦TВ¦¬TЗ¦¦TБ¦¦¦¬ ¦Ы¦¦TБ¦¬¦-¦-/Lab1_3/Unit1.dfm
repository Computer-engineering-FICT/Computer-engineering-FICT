object Form1: TForm1
  Left = 274
  Top = 122
  Width = 650
  Height = 504
  Caption = #1040#1055#1050#1057'.'#1051#1072#1073'.'#1088#1072#1073'.'#8470'1 ('#1095#1072#1089#1090#1100' 3 - '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1092#1091#1085#1082#1094#1080#1081')'
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
    Width = 642
    Height = 475
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
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 634
        Height = 49
        Align = alTop
        TabOrder = 0
        object Button1: TButton
          Left = 120
          Top = 8
          Width = 137
          Height = 33
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 384
          Top = 8
          Width = 145
          Height = 33
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 49
        Width = 634
        Height = 392
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
        Width = 634
        Height = 400
        Align = alClient
        DefaultColWidth = 35
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 400
        Width = 634
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
    Top = 40
  end
end
