object MatrixView: TMatrixView
  Left = 498
  Top = 294
  Width = 165
  Height = 180
  BiDiMode = bdLeftToRight
  Caption = 'Матрица  связности'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TStringGrid
    Left = 0
    Top = 0
    Width = 157
    Height = 153
    Align = alClient
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 0
    OnSelectCell = GridSelectCell
  end
end
