object Form4: TForm4
  Left = 197
  Top = 109
  Width = 591
  Height = 460
  BorderIcons = []
  Caption = '���� �������'
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = OnActivate
  OnResize = OnResize
  PixelsPerInch = 96
  TextHeight = 13
  object TaskChart: TChart
    Left = 0
    Top = 0
    Width = 553
    Height = 321
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = clSilver
    Gradient.EndColor = clLime
    Gradient.StartColor = clLime
    Gradient.Visible = True
    MarginBottom = 0
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 0
    Title.AdjustFrame = False
    Title.Brush.Style = bsFDiagonal
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    AxisVisible = False
    BackColor = clSilver
    LeftAxis.MinorTicks.Visible = False
    LeftAxis.TickLength = 0
    LeftAxis.Ticks.Visible = False
    LeftAxis.TicksInner.Visible = False
    Legend.Frame.Visible = False
    Legend.ShadowSize = 0
    Legend.Visible = False
    ScaleLastPage = False
    View3D = False
    BevelOuter = bvNone
    BevelWidth = 0
    Color = clSilver
    TabOrder = 0
    object Series2: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Font.Charset = DEFAULT_CHARSET
      Marks.Font.Color = clBlack
      Marks.Font.Height = -16
      Marks.Font.Name = 'Arial'
      Marks.Font.Style = [fsBold]
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.HorizSize = 1
      Pointer.InflateMargins = False
      Pointer.Pen.Width = 2
      Pointer.Style = psRectangle
      Pointer.VertSize = 1
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1
      StartYValues.Order = loNone
    end
    object Series1: TBubbleSeries
      Marks.ArrowLength = 0
      Marks.Font.Charset = DEFAULT_CHARSET
      Marks.Font.Color = clBlack
      Marks.Font.Height = -16
      Marks.Font.Name = 'Arial'
      Marks.Font.Style = [fsBold]
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = True
      SeriesColor = clRed
      Pointer.HorizSize = 33
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 33
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      RadiusValues.DateTime = False
      RadiusValues.Name = 'Radius'
      RadiusValues.Multiplier = 1
      RadiusValues.Order = loNone
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 308
    Width = 289
    Height = 125
    ActivePage = TabSheet1
    DockSite = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '�������� ���������'
      object SpeedButton1: TSpeedButton
        Left = 96
        Top = 64
        Width = 65
        Height = 22
        Caption = '��������'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 82
        Height = 13
        Caption = '��� ����������'
      end
      object SpinEdit1: TSpinEdit
        Left = 96
        Top = 8
        Width = 57
        Height = 22
        MaxLength = 1000
        MaxValue = 1
        MinValue = 0
        TabOrder = 0
        Value = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = '�������'
      ImageIndex = 1
      object SpeedButton2: TSpeedButton
        Left = 96
        Top = 64
        Width = 65
        Height = 22
        Caption = '�������'
        Flat = True
        OnClick = SpeedButton2Click
      end
      object Label1: TLabel
        Left = 0
        Top = 16
        Width = 97
        Height = 13
        Caption = '����� ����������'
      end
      object SpinEdit2: TSpinEdit
        Left = 104
        Top = 8
        Width = 57
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = '��������'
      ImageIndex = 2
      object Label5: TLabel
        Left = 0
        Top = 32
        Width = 82
        Height = 13
        Caption = '��� ����������'
      end
      object SpeedButton3: TSpeedButton
        Left = 96
        Top = 64
        Width = 65
        Height = 22
        Caption = '��������'
        Flat = True
        OnClick = SpeedButton3Click
      end
      object Label3: TLabel
        Left = 0
        Top = 16
        Width = 97
        Height = 13
        Caption = '����� ����������'
      end
      object SpinEdit3: TSpinEdit
        Left = 104
        Top = 8
        Width = 57
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object SpinEdit4: TSpinEdit
        Left = 104
        Top = 32
        Width = 57
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
    end
  end
  object PageControl2: TPageControl
    Left = 288
    Top = 308
    Width = 289
    Height = 125
    ActivePage = TabSheet4
    TabOrder = 2
    object TabSheet4: TTabSheet
      Caption = '�������� �����'
      object Label4: TLabel
        Left = 0
        Top = 16
        Width = 14
        Height = 13
        Caption = '��'
      end
      object Label6: TLabel
        Left = 96
        Top = 16
        Width = 7
        Height = 13
        Caption = '�'
      end
      object Label7: TLabel
        Left = 176
        Top = 16
        Width = 19
        Height = 13
        Caption = '���'
      end
      object SpeedButton4: TSpeedButton
        Left = 104
        Top = 64
        Width = 73
        Height = 22
        Caption = '��������'
        Flat = True
        OnClick = SpeedButton4Click
      end
      object SpinEdit5: TSpinEdit
        Left = 24
        Top = 8
        Width = 65
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object SpinEdit6: TSpinEdit
        Left = 104
        Top = 8
        Width = 65
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object SpinEdit7: TSpinEdit
        Left = 200
        Top = 8
        Width = 65
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object CheckBox1: TCheckBox
        Left = 24
        Top = 40
        Width = 89
        Height = 17
        Caption = '����������'
        TabOrder = 3
      end
    end
    object TabSheet5: TTabSheet
      Caption = '�������'
      ImageIndex = 1
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 14
        Height = 13
        Caption = '��'
      end
      object Label9: TLabel
        Left = 104
        Top = 16
        Width = 7
        Height = 13
        Caption = '�'
      end
      object SpeedButton5: TSpeedButton
        Left = 88
        Top = 64
        Width = 65
        Height = 22
        Caption = '�������'
        Flat = True
        OnClick = SpeedButton5Click
      end
      object SpinEdit8: TSpinEdit
        Left = 32
        Top = 8
        Width = 57
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object SpinEdit9: TSpinEdit
        Left = 128
        Top = 8
        Width = 57
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
    end
    object TabSheet6: TTabSheet
      Caption = '��������'
      ImageIndex = 2
      object Label10: TLabel
        Left = 0
        Top = 16
        Width = 14
        Height = 13
        Caption = '��'
      end
      object Label11: TLabel
        Left = 96
        Top = 16
        Width = 7
        Height = 13
        Caption = '�'
      end
      object Label12: TLabel
        Left = 176
        Top = 16
        Width = 19
        Height = 13
        Caption = '���'
      end
      object SpeedButton6: TSpeedButton
        Left = 88
        Top = 64
        Width = 73
        Height = 22
        Caption = '��������'
        Flat = True
        OnClick = SpeedButton6Click
      end
      object SpinEdit10: TSpinEdit
        Left = 24
        Top = 8
        Width = 65
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object SpinEdit11: TSpinEdit
        Left = 104
        Top = 8
        Width = 65
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object SpinEdit12: TSpinEdit
        Left = 200
        Top = 8
        Width = 65
        Height = 22
        MaxValue = 1000
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 40
        Width = 89
        Height = 17
        Caption = '����������'
        TabOrder = 3
      end
    end
  end
end
