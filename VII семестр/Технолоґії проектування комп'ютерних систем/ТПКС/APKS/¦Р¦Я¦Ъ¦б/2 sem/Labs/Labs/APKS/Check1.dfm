object fmCheck1: TfmCheck1
  Left = 180
  Top = 75
  Width = 748
  Height = 534
  Caption = '1. '#1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1043#1057#1040
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter4: TSplitter
    Left = 0
    Top = 385
    Width = 740
    Height = 5
    Cursor = crVSplit
    Align = alTop
    MinSize = 60
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 740
    Height = 385
    ActivePage = TabSheet1
    Align = alTop
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1080#1075#1085#1072#1083#1099
      object Splitter1: TSplitter
        Left = 369
        Top = 0
        Width = 5
        Height = 357
        Cursor = crHSplit
        MinSize = 60
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 357
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 369
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1042#1093#1086#1076#1085#1099#1077
        end
        object Memo1: TMemo
          Left = 0
          Top = 13
          Width = 369
          Height = 344
          Align = alClient
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 374
        Top = 0
        Width = 358
        Height = 357
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 358
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1042#1099#1093#1086#1076#1085#1099#1077
        end
        object Memo2: TMemo
          Left = 0
          Top = 13
          Width = 358
          Height = 344
          Align = alClient
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1052#1072#1090#1088#1080#1094#1099' '#1089#1074#1103#1079#1085#1086#1089#1090#1080
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 369
        Top = 0
        Width = 5
        Height = 357
        Cursor = crHSplit
        MinSize = 60
      end
      object Panel5: TPanel
        Left = 374
        Top = 0
        Width = 358
        Height = 357
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label5: TLabel
          Left = 0
          Top = 0
          Width = 160
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1058#1086#1083#1100#1082#1086' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1077' '#1074#1099#1093#1086#1076#1099
        end
        object StringGrid2: TStringGrid
          Left = 0
          Top = 13
          Width = 358
          Height = 344
          Align = alClient
          DefaultColWidth = 20
          DefaultRowHeight = 16
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 357
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 163
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1058#1086#1083#1100#1082#1086' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1077' '#1074#1099#1093#1086#1076#1099
        end
        object StringGrid1: TStringGrid
          Left = 0
          Top = 13
          Width = 369
          Height = 344
          Align = alClient
          DefaultColWidth = 20
          DefaultRowHeight = 16
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1091#1090#1080' '#1080' '#1094#1080#1082#1083#1099
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 369
        Top = 0
        Width = 5
        Height = 357
        Cursor = crHSplit
        MinSize = 60
      end
      object Panel3: TPanel
        Left = 374
        Top = 0
        Width = 358
        Height = 357
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 34
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1062#1080#1082#1083#1099
        end
        object Memo3: TMemo
          Left = 0
          Top = 13
          Width = 358
          Height = 344
          Align = alClient
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 357
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 0
          Top = 0
          Width = 24
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1055#1091#1090#1080
        end
        object Memo4: TMemo
          Left = 0
          Top = 13
          Width = 369
          Height = 344
          Align = alClient
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
  object Memo5: TMemo
    Left = 0
    Top = 390
    Width = 740
    Height = 117
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
