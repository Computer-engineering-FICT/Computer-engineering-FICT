object FEdit: TFEdit
  Left = 222
  Top = 188
  Width = 696
  Height = 480
  Caption = 'FEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 409
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsSingle
    TabOrder = 0
    object RichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 682
      Height = 403
      Align = alClient
      BorderStyle = bsNone
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 520
      Top = 6
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 600
      Top = 6
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
