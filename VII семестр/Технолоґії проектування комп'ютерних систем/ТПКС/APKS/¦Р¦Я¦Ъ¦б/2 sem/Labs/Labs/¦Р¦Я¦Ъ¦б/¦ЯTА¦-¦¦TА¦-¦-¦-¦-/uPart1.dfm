object FormPart1: TFormPart1
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Часть 1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 529
    Height = 329
    ActivePage = TabSheetCycles
    TabOrder = 0
    object TabSheetWays: TTabSheet
      Caption = 'Пути'
      object StringGridWays: TStringGrid
        Left = 0
        Top = 0
        Width = 521
        Height = 297
        ColCount = 1
        DefaultColWidth = 50
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
    end
    object TabSheetCycles: TTabSheet
      Caption = 'Циклы'
      ImageIndex = 1
      object StringGridCycles: TStringGrid
        Left = 0
        Top = 0
        Width = 521
        Height = 297
        ColCount = 1
        DefaultColWidth = 50
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 376
    Top = 24
    object Menu: TMenuItem
      Caption = 'Меню'
      object MenuOpenFile: TMenuItem
        Caption = 'Открыть файл'
        OnClick = MenuOpenFileClick
      end
      object MenuAnalyze: TMenuItem
        Caption = 'Анализ'
        OnClick = MenuAnalyzeClick
      end
      object MenuSave: TMenuItem
        Caption = 'Сохранить результаты'
        OnClick = MenuSaveClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 336
    Top = 24
  end
  object SaveDialog: TSaveDialog
    Left = 420
    Top = 24
  end
end
