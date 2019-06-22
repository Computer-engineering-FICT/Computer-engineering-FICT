object Form1: TForm1
  Left = 183
  Top = 163
  Width = 450
  Height = 480
  Caption = #1058#1072#1073#1083#1080#1094#1072'-'#1088#1077#1079#1091#1083#1100#1090#1072#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Table2: TDBGrid
    Left = 8
    Top = 0
    Width = 433
    Height = 449
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 40
    Top = 32
  end
  object Table1: TTable
    Active = True
    TableName = 'TableSave.DB'
    Left = 80
    Top = 16
  end
end
