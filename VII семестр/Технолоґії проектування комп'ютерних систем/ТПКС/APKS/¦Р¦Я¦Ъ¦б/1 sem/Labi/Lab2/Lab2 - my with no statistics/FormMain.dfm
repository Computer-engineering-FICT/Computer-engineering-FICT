object MainForm: TMainForm
  Left = 222
  Top = 149
  Width = 609
  Height = 398
  Caption = 'Processors system model'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label17: TLabel
    Left = 280
    Top = 32
    Width = 33
    Height = 13
    Caption = 'Turn N'
  end
  object GroupBox1: TGroupBox
    Left = 416
    Top = 16
    Width = 169
    Height = 153
    Caption = 'Processor 1'
    TabOrder = 7
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 25
      Height = 13
      Caption = 'State'
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 117
      Height = 13
      Caption = 'Current package number'
    end
    object Label6: TLabel
      Left = 8
      Top = 104
      Width = 94
      Height = 26
      Caption = 'Count of   processed package'
      WordWrap = True
    end
    object Label18: TLabel
      Left = 8
      Top = 88
      Width = 66
      Height = 13
      Caption = 'Time released'
    end
    object eP1State: TEdit
      Left = 48
      Top = 24
      Width = 113
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object eP1CPN: TEdit
      Left = 128
      Top = 56
      Width = 33
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object eP1PP: TEdit
      Left = 104
      Top = 112
      Width = 57
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object eP1TR: TEdit
      Left = 80
      Top = 80
      Width = 81
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 16
    Width = 249
    Height = 97
    Caption = 'Source N1'
    TabOrder = 4
    object Label2: TLabel
      Left = 7
      Top = 23
      Width = 162
      Height = 13
      Caption = 'Count of the generated packeges:'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 13
      Top = 52
      Width = 52
      Height = 13
      Caption = 'Distribution'
    end
    object Label14: TLabel
      Left = 16
      Top = 72
      Width = 47
      Height = 13
      Caption = 'Intensivity'
    end
    object eS1PC: TEdit
      Left = 176
      Top = 20
      Width = 65
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbDistr1: TComboBox
      Left = 96
      Top = 44
      Width = 145
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Regular'
      Items.Strings = (
        'Regular'
        'Erlang'#39's'
        'Puasson'#39's'
        'Hyperexponential')
    end
    object eS1Int: TEdit
      Left = 96
      Top = 68
      Width = 65
      Height = 21
      TabStop = False
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 120
    Width = 249
    Height = 97
    Caption = 'Source N2'
    TabOrder = 5
    object Label4: TLabel
      Left = 7
      Top = 23
      Width = 159
      Height = 13
      Caption = 'Count of the generated packeges'
      WordWrap = True
    end
    object Label11: TLabel
      Left = 13
      Top = 52
      Width = 52
      Height = 13
      Caption = 'Distribution'
    end
    object Label15: TLabel
      Left = 16
      Top = 72
      Width = 47
      Height = 13
      Caption = 'Intensivity'
    end
    object eS2PC: TEdit
      Left = 176
      Top = 20
      Width = 65
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbDistr2: TComboBox
      Left = 96
      Top = 44
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Regular'
      Items.Strings = (
        'Regular'
        'Erlang'#39's'
        'Puasson'#39's'
        'Hyperexponential')
    end
    object eS2Int: TEdit
      Left = 96
      Top = 68
      Width = 65
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 16
    Top = 224
    Width = 249
    Height = 97
    Caption = 'Source N3'
    TabOrder = 6
    object Label9: TLabel
      Left = 7
      Top = 23
      Width = 159
      Height = 13
      Caption = 'Count of the generated packeges'
      WordWrap = True
    end
    object Label10: TLabel
      Left = 13
      Top = 48
      Width = 52
      Height = 13
      Caption = 'Distribution'
    end
    object Label16: TLabel
      Left = 16
      Top = 72
      Width = 47
      Height = 13
      Caption = 'Intensivity'
    end
    object eS3PC: TEdit
      Left = 176
      Top = 20
      Width = 65
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbDistr3: TComboBox
      Left = 96
      Top = 44
      Width = 145
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Regular'
      Items.Strings = (
        'Regular'
        'Erlang'#39's'
        'Puasson'#39's'
        'Hyperexponential')
    end
    object eS3Int: TEdit
      Left = 96
      Top = 68
      Width = 65
      Height = 21
      TabStop = False
      TabOrder = 2
    end
  end
  object GroupBox5: TGroupBox
    Left = 280
    Top = 120
    Width = 121
    Height = 97
    Caption = 'Turn'
    TabOrder = 8
    object Label7: TLabel
      Left = 8
      Top = 32
      Width = 100
      Height = 13
      Caption = 'Expecting packages:'
    end
    object eEP: TEdit
      Left = 32
      Top = 56
      Width = 49
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox6: TGroupBox
    Left = 416
    Top = 168
    Width = 169
    Height = 153
    Caption = 'Processor 1'
    TabOrder = 9
    object Label8: TLabel
      Left = 8
      Top = 32
      Width = 25
      Height = 13
      Caption = 'State'
    end
    object Label12: TLabel
      Left = 8
      Top = 64
      Width = 117
      Height = 13
      Caption = 'Current package number'
    end
    object Label13: TLabel
      Left = 8
      Top = 104
      Width = 94
      Height = 26
      Caption = 'Count of   processed package'
      WordWrap = True
    end
    object Label19: TLabel
      Left = 8
      Top = 88
      Width = 66
      Height = 13
      Caption = 'Time released'
    end
    object eP2State: TEdit
      Left = 48
      Top = 24
      Width = 113
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object eP2CPN: TEdit
      Left = 128
      Top = 56
      Width = 33
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object eP2PP: TEdit
      Left = 104
      Top = 112
      Width = 57
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object eP2TR: TEdit
      Left = 80
      Top = 80
      Width = 81
      Height = 21
      TabOrder = 3
    end
  end
  object btReset: TButton
    Left = 72
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 0
    OnClick = btResetClick
  end
  object btStep: TButton
    Left = 160
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Step'
    TabOrder = 1
    OnClick = btStepClick
  end
  object btFinish: TButton
    Left = 248
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Finish'
    TabOrder = 2
    OnClick = btFinishClick
  end
  object btStat: TButton
    Left = 336
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Statistic'
    TabOrder = 3
    OnClick = btStatClick
  end
  object btExit: TButton
    Left = 512
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 10
    OnClick = btExitClick
  end
  object eTurn: TEdit
    Left = 320
    Top = 24
    Width = 81
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
end
