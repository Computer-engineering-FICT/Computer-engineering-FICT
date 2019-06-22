object EditForm: TEditForm
  Left = 531
  Top = 113
  Width = 473
  Height = 452
  Caption = 'Просмотр графа'
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
    Left = 144
    Top = 0
    Width = 170
    Height = 20
    Caption = 'Структурные таблицы '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman Cyr'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 392
    Width = 113
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 24
    Width = 449
    Height = 361
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Автомат Мура'
      object MMura: TStringGrid
        Left = 0
        Top = 16
        Width = 441
        Height = 153
        ColCount = 4
        DefaultColWidth = 26
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        RowHeights = (
          15
          15)
      end
      object Memo1: TMemo
        Left = 24
        Top = 192
        Width = 401
        Height = 121
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Автомат Мили'
      ImageIndex = 1
      object MMili: TStringGrid
        Left = 0
        Top = 16
        Width = 441
        Height = 153
        ColCount = 4
        DefaultColWidth = 26
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        RowHeights = (
          15
          15)
      end
      object Memo2: TMemo
        Left = 24
        Top = 192
        Width = 401
        Height = 121
        Lines.Strings = (
          '')
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
end
