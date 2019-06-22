object Form1: TForm1
  Left = 522
  Top = 193
  Width = 545
  Height = 503
  Caption = 'Form1'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object page: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 457
    ActivePage = tab1
    Align = alClient
    TabOrder = 0
    object tab1: TTabSheet
      Caption = 'Input'
      object Spliter: TSplitter
        Left = 0
        Top = 426
        Width = 529
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Status: TMemo
        Left = 0
        Top = 429
        Width = 529
        Height = 0
        Align = alBottom
        Color = clBtnFace
        Font.Charset = OEM_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Terminal'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 529
        Height = 426
        Align = alClient
        TabOrder = 1
        OnResize = Panel1Resize
        object Input: TMemo
          Left = 1
          Top = 1
          Width = 328
          Height = 296
          Color = clScrollBar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          OEMConvert = True
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Clear: TButton
          Left = 448
          Top = 161
          Width = 75
          Height = 25
          Caption = 'Clear Stat'
          TabOrder = 1
          OnClick = ClearClick
        end
        object Mode: TButton
          Left = 448
          Top = 106
          Width = 75
          Height = 25
          Caption = 'View Source'
          TabOrder = 2
          OnClick = ModeClick
        end
        object Node0: TButton
          Left = 448
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Begin'
          TabOrder = 3
          Visible = False
          OnClick = Node0Click
        end
        object Node1: TButton
          Left = 448
          Top = 29
          Width = 75
          Height = 25
          Caption = 'End'
          TabOrder = 4
          Visible = False
          OnClick = Node1Click
        end
        object Node2: TButton
          Left = 448
          Top = 53
          Width = 75
          Height = 25
          Caption = 'Y'
          TabOrder = 5
          Visible = False
          OnClick = Node2Click
        end
        object Node3: TButton
          Left = 448
          Top = 77
          Width = 75
          Height = 25
          Caption = 'X'
          TabOrder = 6
          Visible = False
          OnClick = Node3Click
        end
        object Run: TButton
          Left = 448
          Top = 130
          Width = 75
          Height = 25
          Caption = 'Run'
          TabOrder = 7
          OnClick = RunClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Setup'
      ImageIndex = 1
      OnResize = TabSheet2Resize
      object Model: TRadioGroup
        Left = 0
        Top = 8
        Width = 97
        Height = 65
        Caption = 'Automat'
        ItemIndex = 0
        Items.Strings = (
          'Mura'
          'Mili')
        TabOrder = 0
      end
      object Trigger: TRadioGroup
        Left = 0
        Top = 80
        Width = 97
        Height = 65
        Caption = 'Triggers'
        ItemIndex = 0
        Items.Strings = (
          'D'
          'JK')
        TabOrder = 1
      end
      object Accept: TButton
        Left = 8
        Top = 151
        Width = 75
        Height = 25
        Caption = 'Accept'
        TabOrder = 2
        OnClick = AcceptClick
      end
      object Table: TStringGrid
        Left = 99
        Top = 0
        Width = 429
        Height = 337
        ColCount = 1
        DefaultColWidth = 25
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        TabOrder = 3
      end
      object Full: TCheckBox
        Left = 0
        Top = 176
        Width = 97
        Height = 17
        Caption = 'Full Table'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Functions'
      ImageIndex = 2
      object Func: TMemo
        Left = 0
        Top = 0
        Width = 529
        Height = 429
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Graph'
      ImageIndex = 3
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 529
        Height = 429
        Align = alClient
        Color = clWhite
        ParentColor = False
        TabOrder = 0
        object graph: TPaintBox
          Left = 0
          Top = 0
          Width = 525
          Height = 330
          OnPaint = graphPaint
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 32
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Save as...'
        OnClick = Saveas1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object Open: TOpenDialog
    Filter = 'Text files (*.GRP)|*.grp'
    Left = 372
    Top = 32
  end
  object Save: TSaveDialog
    Filter = 'Text files (*.grp)|*.grp'
    Left = 404
    Top = 32
  end
end
