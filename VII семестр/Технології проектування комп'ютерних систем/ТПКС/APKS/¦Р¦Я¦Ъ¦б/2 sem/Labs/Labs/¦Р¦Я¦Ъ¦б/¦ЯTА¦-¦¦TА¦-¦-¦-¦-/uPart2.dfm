object FormPart2: TFormPart2
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Часть 2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 529
    Height = 329
    ActivePage = TabSheetMili
    TabOrder = 0
    object TabSheetMili: TTabSheet
      Caption = 'Мили'
      object StringGridMili: TStringGrid
        Left = 0
        Top = 0
        Width = 521
        Height = 305
        DefaultColWidth = 25
        TabOrder = 0
      end
    end
    object TabSheetMur: TTabSheet
      Caption = 'Мур'
      ImageIndex = 1
      object StringGrid2: TStringGrid
        Left = 0
        Top = -1
        Width = 521
        Height = 305
        TabOrder = 0
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 312
    Top = 40
    object Menu: TMenuItem
      Caption = 'Меню'
      object MenuOpen: TMenuItem
        Caption = 'Открыть файл'
        OnClick = MenuOpenClick
      end
      object MenuMark: TMenuItem
        Caption = 'Разметка'
        OnClick = MenuMarkClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 352
    Top = 40
  end
end
