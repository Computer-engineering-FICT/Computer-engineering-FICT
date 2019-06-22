object EditForm: TEditForm
  Left = 319
  Top = 325
  Width = 442
  Height = 197
  Caption = 'Редактирование'
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
  object editorial: TStringGrid
    Left = 56
    Top = 0
    Width = 313
    Height = 169
    ColCount = 6
    DefaultColWidth = 50
    FixedCols = 0
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    OnSetEditText = editorialSetEditText
  end
end
