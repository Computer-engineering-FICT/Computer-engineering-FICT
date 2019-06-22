object FormMain: TFormMain
  Left = 1
  Top = 102
  Width = 800
  Height = 492
  Caption = 'Модель вычислительной системы'
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
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 281
    Height = 377
    Caption = 'Узел №1'
    TabOrder = 0
    object Image1: TImage
      Left = 128
      Top = 128
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        000000000000000000C44444400000000000000000000000004C444444000000
        00000000000000000048C44444400000000000000000000000488C4444440000
        0000000000000000004888C444444000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000044444444488848F8F84444
        4000000000C444444444884F8F8F444444000000000C444444444848F8F84444
        444000000000C4444444444F8F8F44444444000000000C4444444448F8F84444
        44444000000000C48F8F8F8F8F8F8F8F8F8400000000000C48F8F8F8F8F8F8F8
        F840000000000000C48F8F8F8F8F8F8F84000000000000000C48F8F8F8F8F8F8
        400000000000000000C48F8F8F8F8F840000000000000000000C48F8F8F8F840
        00000000000000000000C48F8F8F8400000000000000000000000C48F8F84000
        0000000000000000000000C48F84000000000000000000000000000C48400000
        000000000000000000000000C400000000000000FFFFFFFFFFC07FFFFFC03FFF
        FFC01FFFFFC00FFFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FF
        FFC007FFFFC007FFFFC007FFFFC007FFFFC007FFC000007FC000003FE000001F
        F000000FF8000007FC00000FFE00001FFF00003FFF80007FFFC000FFFFE001FF
        FFF003FFFFF807FFFFFC0FFFFFFE1FFFFFFF3FFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000004444
        40000000000044444400000000004F444440000000004848F840000000004F4F
        8F40000000004848F840000000004F4F8F40000004444848F84440000444444F
        8F44440000444448F844444000048F8F8F8F8400000048F8F8F840000000048F
        8F84000000000048F840000000000004840000000000000040000000F07F0000
        F03F0000F01F0000F01F0000F01F0000F01F0000F01F00008007000080030000
        C0010000E0030000F0070000F80F0000FC1F0000FE3F0000FF7F0000}
    end
    object Label15: TLabel
      Left = 8
      Top = 288
      Width = 163
      Height = 13
      Caption = 'Распределение входных заявок'
    end
    object Label19: TLabel
      Left = 192
      Top = 288
      Width = 78
      Height = 13
      Caption = 'Интенсивность'
    end
    object Label25: TLabel
      Left = 8
      Top = 328
      Width = 152
      Height = 13
      Caption = 'Интенсивность спец. пакетов'
    end
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 103
      Height = 13
      Caption = 'Обработано заявок:'
    end
    object LabelServed1: TLabel
      Left = 120
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label5: TLabel
      Left = 8
      Top = 32
      Width = 69
      Height = 13
      Caption = 'Загрузка ЦП:'
    end
    object LabelCPULoad1: TLabel
      Left = 88
      Top = 32
      Width = 14
      Height = 13
      Caption = '0%'
    end
    object GroupBox1: TGroupBox
      Left = 96
      Top = 56
      Width = 105
      Height = 57
      Caption = 'ЦПЭ №1'
      TabOrder = 0
      object LabelCPUMode1: TLabel
        Left = 24
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Ожидание'
      end
    end
    object GroupBoxQueue1: TGroupBox
      Left = 8
      Top = 176
      Width = 265
      Height = 105
      Caption = 'Очередь ЦПЭ №1'
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 183
        Height = 13
        Caption = 'Количство пакетов до спец. пакета:'
      end
      object LabelQueue1: TLabel
        Left = 216
        Top = 16
        Width = 6
        Height = 13
        Caption = '0'
      end
      object LabelQueueAfterSP: TLabel
        Left = 216
        Top = 64
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 201
        Height = 13
        Caption = 'Количство пакетов после спец. пакета:'
      end
      object Label3: TLabel
        Left = 8
        Top = 84
        Width = 89
        Height = 13
        Caption = 'Время ожидания:'
      end
      object LabelTaskWait1: TLabel
        Left = 104
        Top = 84
        Width = 6
        Height = 13
        Caption = '0'
      end
      object CheckBoxSpecPacket: TCheckBox
        Left = 8
        Top = 40
        Width = 209
        Height = 17
        Caption = 'Присутствие в очереди спец. пакета'
        TabOrder = 0
      end
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 304
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Равномерное'
        'Эрланга'
        'Пуассона'
        'Гиперэкспоненциальное')
    end
    object Edit1: TEdit
      Left = 192
      Top = 304
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '0,2'
    end
    object EditSpecLambda: TEdit
      Left = 192
      Top = 328
      Width = 73
      Height = 21
      TabOrder = 4
      Text = '0,01'
    end
  end
  object GroupBox5: TGroupBox
    Left = 280
    Top = 0
    Width = 177
    Height = 377
    Caption = 'Узел №2'
    TabOrder = 1
    object Image2: TImage
      Left = 72
      Top = 128
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        000000000000000000C44444400000000000000000000000004C444444000000
        00000000000000000048C44444400000000000000000000000488C4444440000
        0000000000000000004888C444444000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000044444444488848F8F84444
        4000000000C444444444884F8F8F444444000000000C444444444848F8F84444
        444000000000C4444444444F8F8F44444444000000000C4444444448F8F84444
        44444000000000C48F8F8F8F8F8F8F8F8F8400000000000C48F8F8F8F8F8F8F8
        F840000000000000C48F8F8F8F8F8F8F84000000000000000C48F8F8F8F8F8F8
        400000000000000000C48F8F8F8F8F840000000000000000000C48F8F8F8F840
        00000000000000000000C48F8F8F8400000000000000000000000C48F8F84000
        0000000000000000000000C48F84000000000000000000000000000C48400000
        000000000000000000000000C400000000000000FFFFFFFFFFC07FFFFFC03FFF
        FFC01FFFFFC00FFFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FF
        FFC007FFFFC007FFFFC007FFFFC007FFFFC007FFC000007FC000003FE000001F
        F000000FF8000007FC00000FFE00001FFF00003FFF80007FFFC000FFFFE001FF
        FFF003FFFFF807FFFFFC0FFFFFFE1FFFFFFF3FFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000004444
        40000000000044444400000000004F444440000000004848F840000000004F4F
        8F40000000004848F840000000004F4F8F40000004444848F84440000444444F
        8F44440000444448F844444000048F8F8F8F8400000048F8F8F840000000048F
        8F84000000000048F840000000000004840000000000000040000000F07F0000
        F03F0000F01F0000F01F0000F01F0000F01F0000F01F00008007000080030000
        C0010000E0030000F0070000F80F0000FC1F0000FE3F0000FF7F0000}
    end
    object Label16: TLabel
      Left = 6
      Top = 240
      Width = 163
      Height = 13
      Caption = 'Распределение входных заявок'
    end
    object Label20: TLabel
      Left = 51
      Top = 280
      Width = 78
      Height = 13
      Caption = 'Интенсивность'
    end
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 103
      Height = 13
      Caption = 'Обработано заявок:'
    end
    object LabelServed2: TLabel
      Left = 120
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label11: TLabel
      Left = 8
      Top = 32
      Width = 69
      Height = 13
      Caption = 'Загрузка ЦП:'
    end
    object LabelCPULoad2: TLabel
      Left = 88
      Top = 32
      Width = 14
      Height = 13
      Caption = '0%'
    end
    object GroupBox3: TGroupBox
      Left = 40
      Top = 56
      Width = 105
      Height = 57
      Caption = 'ЦПЭ №2'
      TabOrder = 0
      object LabelCPUMode2: TLabel
        Left = 24
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Ожидание'
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 176
      Width = 161
      Height = 57
      Caption = 'Очередь ЦПЭ №2'
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 16
        Width = 100
        Height = 13
        Caption = 'Количство пакетов:'
      end
      object LabelQueue2: TLabel
        Left = 112
        Top = 16
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label10: TLabel
        Left = 8
        Top = 36
        Width = 89
        Height = 13
        Caption = 'Время ожидания:'
      end
      object LabelTaskWait2: TLabel
        Left = 104
        Top = 36
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object ComboBox2: TComboBox
      Left = 24
      Top = 256
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Равномерное'
        'Эрланга'
        'Пуассона'
        'Гиперэкспоненциальное')
    end
    object Edit2: TEdit
      Left = 48
      Top = 300
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '0,3'
    end
  end
  object GroupBox6: TGroupBox
    Left = 456
    Top = 0
    Width = 177
    Height = 377
    Caption = 'Узел №3'
    TabOrder = 2
    object Image3: TImage
      Left = 72
      Top = 128
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        000000000000000000C44444400000000000000000000000004C444444000000
        00000000000000000048C44444400000000000000000000000488C4444440000
        0000000000000000004888C444444000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000044444444488848F8F84444
        4000000000C444444444884F8F8F444444000000000C444444444848F8F84444
        444000000000C4444444444F8F8F44444444000000000C4444444448F8F84444
        44444000000000C48F8F8F8F8F8F8F8F8F8400000000000C48F8F8F8F8F8F8F8
        F840000000000000C48F8F8F8F8F8F8F84000000000000000C48F8F8F8F8F8F8
        400000000000000000C48F8F8F8F8F840000000000000000000C48F8F8F8F840
        00000000000000000000C48F8F8F8400000000000000000000000C48F8F84000
        0000000000000000000000C48F84000000000000000000000000000C48400000
        000000000000000000000000C400000000000000FFFFFFFFFFC07FFFFFC03FFF
        FFC01FFFFFC00FFFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FF
        FFC007FFFFC007FFFFC007FFFFC007FFFFC007FFC000007FC000003FE000001F
        F000000FF8000007FC00000FFE00001FFF00003FFF80007FFFC000FFFFE001FF
        FFF003FFFFF807FFFFFC0FFFFFFE1FFFFFFF3FFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000004444
        40000000000044444400000000004F444440000000004848F840000000004F4F
        8F40000000004848F840000000004F4F8F40000004444848F84440000444444F
        8F44440000444448F844444000048F8F8F8F8400000048F8F8F840000000048F
        8F84000000000048F840000000000004840000000000000040000000F07F0000
        F03F0000F01F0000F01F0000F01F0000F01F0000F01F00008007000080030000
        C0010000E0030000F0070000F80F0000FC1F0000FE3F0000FF7F0000}
    end
    object Label17: TLabel
      Left = 6
      Top = 240
      Width = 163
      Height = 13
      Caption = 'Распределение входных заявок'
    end
    object Label21: TLabel
      Left = 56
      Top = 280
      Width = 78
      Height = 13
      Caption = 'Интенсивность'
    end
    object Label14: TLabel
      Left = 8
      Top = 16
      Width = 103
      Height = 13
      Caption = 'Обработано заявок:'
    end
    object LabelServed3: TLabel
      Left = 120
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label26: TLabel
      Left = 8
      Top = 32
      Width = 69
      Height = 13
      Caption = 'Загрузка ЦП:'
    end
    object LabelCPULoad3: TLabel
      Left = 88
      Top = 32
      Width = 14
      Height = 13
      Caption = '0%'
    end
    object GroupBox7: TGroupBox
      Left = 40
      Top = 56
      Width = 105
      Height = 57
      Caption = 'ЦПЭ №3'
      TabOrder = 0
      object LabelCPUMode3: TLabel
        Left = 24
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Ожидание'
      end
    end
    object GroupBox8: TGroupBox
      Left = 8
      Top = 176
      Width = 161
      Height = 57
      Caption = 'Очередь ЦПЭ №3'
      TabOrder = 1
      object Label9: TLabel
        Left = 8
        Top = 16
        Width = 100
        Height = 13
        Caption = 'Количство пакетов:'
      end
      object LabelQueue3: TLabel
        Left = 112
        Top = 16
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label24: TLabel
        Left = 8
        Top = 36
        Width = 89
        Height = 13
        Caption = 'Время ожидания:'
      end
      object LabelTaskWait3: TLabel
        Left = 104
        Top = 36
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object ComboBox3: TComboBox
      Left = 16
      Top = 256
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Равномерное'
        'Эрланга'
        'Пуассона'
        'Гиперэкспоненциальное')
    end
    object Edit3: TEdit
      Left = 56
      Top = 296
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '0,4'
    end
  end
  object GroupBox9: TGroupBox
    Left = 632
    Top = 0
    Width = 177
    Height = 377
    Caption = 'Узел №4'
    TabOrder = 3
    object Image4: TImage
      Left = 72
      Top = 128
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        000000000000000000C44444400000000000000000000000004C444444000000
        00000000000000000048C44444400000000000000000000000488C4444440000
        0000000000000000004888C444444000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000000000000488848F8F84000
        00000000000000000048884F8F8F4000000000000044444444488848F8F84444
        4000000000C444444444884F8F8F444444000000000C444444444848F8F84444
        444000000000C4444444444F8F8F44444444000000000C4444444448F8F84444
        44444000000000C48F8F8F8F8F8F8F8F8F8400000000000C48F8F8F8F8F8F8F8
        F840000000000000C48F8F8F8F8F8F8F84000000000000000C48F8F8F8F8F8F8
        400000000000000000C48F8F8F8F8F840000000000000000000C48F8F8F8F840
        00000000000000000000C48F8F8F8400000000000000000000000C48F8F84000
        0000000000000000000000C48F84000000000000000000000000000C48400000
        000000000000000000000000C400000000000000FFFFFFFFFFC07FFFFFC03FFF
        FFC01FFFFFC00FFFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FFFFC007FF
        FFC007FFFFC007FFFFC007FFFFC007FFFFC007FFC000007FC000003FE000001F
        F000000FF8000007FC00000FFE00001FFF00003FFF80007FFFC000FFFFE001FF
        FFF003FFFFF807FFFFFC0FFFFFFE1FFFFFFF3FFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000004444
        40000000000044444400000000004F444440000000004848F840000000004F4F
        8F40000000004848F840000000004F4F8F40000004444848F84440000444444F
        8F44440000444448F844444000048F8F8F8F8400000048F8F8F840000000048F
        8F84000000000048F840000000000004840000000000000040000000F07F0000
        F03F0000F01F0000F01F0000F01F0000F01F0000F01F00008007000080030000
        C0010000E0030000F0070000F80F0000FC1F0000FE3F0000FF7F0000}
    end
    object Label18: TLabel
      Left = 6
      Top = 240
      Width = 163
      Height = 13
      Caption = 'Распределение входных заявок'
    end
    object Label22: TLabel
      Left = 59
      Top = 280
      Width = 78
      Height = 13
      Caption = 'Интенсивность'
    end
    object Label28: TLabel
      Left = 8
      Top = 16
      Width = 103
      Height = 13
      Caption = 'Обработано заявок:'
    end
    object LabelServed4: TLabel
      Left = 120
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label30: TLabel
      Left = 8
      Top = 32
      Width = 69
      Height = 13
      Caption = 'Загрузка ЦП:'
    end
    object LabelCPULoad4: TLabel
      Left = 88
      Top = 32
      Width = 14
      Height = 13
      Caption = '0%'
    end
    object GroupBox10: TGroupBox
      Left = 40
      Top = 56
      Width = 105
      Height = 57
      Caption = 'ЦПЭ №4'
      TabOrder = 0
      object LabelCPUMode4: TLabel
        Left = 24
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Ожидание'
      end
    end
    object GroupBox11: TGroupBox
      Left = 8
      Top = 176
      Width = 161
      Height = 57
      Caption = 'Очередь ЦПЭ №4'
      TabOrder = 1
      object Label13: TLabel
        Left = 8
        Top = 16
        Width = 100
        Height = 13
        Caption = 'Количство пакетов:'
      end
      object LabelQueue4: TLabel
        Left = 112
        Top = 16
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label29: TLabel
        Left = 8
        Top = 36
        Width = 89
        Height = 13
        Caption = 'Время ожидания:'
      end
      object LabelTaskWait4: TLabel
        Left = 104
        Top = 36
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object ComboBox4: TComboBox
      Left = 24
      Top = 256
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Равномерное'
        'Эрланга'
        'Пуассона'
        'Гиперэкспоненциальное')
    end
    object Edit4: TEdit
      Left = 56
      Top = 300
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '0,5'
    end
  end
  object GroupBox12: TGroupBox
    Left = 0
    Top = 384
    Width = 785
    Height = 57
    Caption = 'Моделирование'
    TabOrder = 4
    object Label23: TLabel
      Left = 8
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Такт:'
    end
    object LabelTakt: TLabel
      Left = 40
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object ButtonStart: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Начать'
      TabOrder = 0
      OnClick = ButtonStartClick
    end
    object ButtonTakt: TButton
      Left = 184
      Top = 16
      Width = 75
      Height = 25
      Caption = '1 такт'
      Enabled = False
      TabOrder = 1
      OnClick = ButtonTaktClick
    end
    object ButtonRun: TButton
      Left = 280
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Выполнить'
      Enabled = False
      TabOrder = 2
      OnClick = ButtonRunClick
    end
    object ButtonStat: TButton
      Left = 376
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Статистика'
      TabOrder = 3
      OnClick = ButtonStatClick
    end
  end
  object MainMenu: TMainMenu
    Left = 232
    Top = 16
  end
end
