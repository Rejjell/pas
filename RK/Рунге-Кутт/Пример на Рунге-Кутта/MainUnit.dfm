object MainForm: TMainForm
  Left = 192
  Top = 107
  Width = 596
  Height = 480
  Caption = #1055#1088#1080#1084#1077#1088' '#1085#1072' '#1084#1077#1090#1086#1076' '#1056#1091#1085#1075#1077'-'#1050#1091#1090#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 496
    Top = 52
    Width = 22
    Height = 13
    Caption = 'K1 ='
  end
  object Label2: TLabel
    Left = 496
    Top = 84
    Width = 22
    Height = 13
    Caption = 'K2 ='
  end
  object Label3: TLabel
    Left = 496
    Top = 176
    Width = 72
    Height = 13
    Caption = #1050#1086#1076' '#1086#1096#1080#1073#1082#1080' = '
  end
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 481
    Height = 449
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      '')
    BottomAxis.Title.Caption = 't'
    LeftAxis.Title.Caption = 'X(t), Y(t)'
    View3D = False
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'X(t)'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Y(t)'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
  object Edit1: TEdit
    Left = 528
    Top = 48
    Width = 33
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Edit2: TEdit
    Left = 528
    Top = 80
    Width = 33
    Height = 21
    TabOrder = 2
    Text = '500'
  end
  object Button1: TButton
    Left = 496
    Top = 128
    Width = 65
    Height = 25
    Caption = #1057#1095#1080#1090#1072#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
end
