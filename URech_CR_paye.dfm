object frmRech_CR_paye: TfrmRech_CR_paye
  Left = 0
  Top = 0
  Caption = 'Recherche'
  ClientHeight = 191
  ClientWidth = 421
  Color = 8404992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = [seBorder]
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 180
    Top = 15
    Width = 74
    Height = 16
    Caption = 'N'#176' Membre :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 421
    Height = 16
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 4
  end
  object Label3: TLabel
    Left = 0
    Top = 175
    Width = 421
    Height = 16
    Align = alBottom
    ExplicitTop = 223
    ExplicitWidth = 4
  end
  object edrech: TEdit
    Left = 257
    Top = 12
    Width = 156
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edrechKeyPress
  end
  object StringGrid1: TStringGrid
    Left = 4
    Top = 42
    Width = 413
    Height = 144
    ColCount = 4
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
    TabOrder = 1
    StyleElements = [seBorder]
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      68
      51
      96
      192)
  end
end
