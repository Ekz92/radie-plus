object frmAffectation: TfrmAffectation
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'AFFECTATION DE CREDITS RADIES'
  ClientHeight = 299
  ClientWidth = 703
  Color = 8404992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = [seBorder]
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 687
    Height = 57
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 703
    Height = 16
    Align = alTop
    ExplicitWidth = 4
  end
  object Label2: TLabel
    Left = 0
    Top = 283
    Width = 703
    Height = 16
    Align = alBottom
    ExplicitWidth = 4
  end
  object Label3: TLabel
    Left = 15
    Top = 26
    Width = 80
    Height = 16
    Caption = 'Gestionnaire :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Splitter1: TSplitter
    Left = 2
    Top = 71
    Width = 700
    Height = 3
    Align = alNone
    Beveled = True
  end
  object SpeedButton1: TSpeedButton
    Left = 348
    Top = 124
    Width = 25
    Height = 24
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 348
    Top = 154
    Width = 25
    Height = 25
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton3: TSpeedButton
    Left = 348
    Top = 183
    Width = 25
    Height = 22
    Caption = '>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 348
    Top = 211
    Width = 25
    Height = 22
    Caption = '<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton5: TSpeedButton
    Left = 600
    Top = 24
    Width = 89
    Height = 27
    Caption = 'Appliquer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton5Click
  end
  object CB_User: TComboBox
    Left = 118
    Top = 23
    Width = 270
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnCloseUp = CB_UserCloseUp
  end
  object edCode_user: TEdit
    Left = 394
    Top = 23
    Width = 92
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object St_depart: TStringGrid
    Left = 8
    Top = 78
    Width = 337
    Height = 214
    ColCount = 3
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
    ParentColor = True
    ScrollBars = ssNone
    TabOrder = 2
    StyleElements = [seBorder]
    OnDblClick = St_departDblClick
    OnDragDrop = St_departDragDrop
    OnDrawCell = St_departDrawCell
    ColWidths = (
      65
      86
      179)
  end
  object St_arrivee: TStringGrid
    Left = 377
    Top = 78
    Width = 320
    Height = 214
    ColCount = 3
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
    ParentColor = True
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 3
    StyleElements = [seBorder]
    OnDrawCell = St_arriveeDrawCell
    ColWidths = (
      73
      86
      154)
  end
end
