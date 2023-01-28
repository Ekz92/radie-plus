object frmImport_CR: TfrmImport_CR
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Validation de l'#39'mportation de cr'#233'dit radi'#233
  ClientHeight = 345
  ClientWidth = 747
  Color = 8404992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 9
    Top = 39
    Width = 224
    Height = 33
    AutoSize = False
    Caption = 'excel import'#233'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 9
    Top = 9
    Width = 384
    Height = 33
    AutoSize = False
    Caption = 'Validation des donn'#233'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 735
    Top = 0
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 0
    Top = 332
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 8
    Top = 321
    Width = 95
    Height = 18
    Caption = 'Nbre de ligne :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lbnbre: TLabel
    Left = 128
    Top = 321
    Width = 8
    Height = 18
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 2
    Top = 79
    Width = 745
    Height = 233
    ColCount = 10
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    StyleElements = [seBorder]
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      64
      57
      66
      104
      101
      107
      99
      218
      101
      95)
  end
  object btValider: TButton
    Left = 573
    Top = 317
    Width = 95
    Height = 25
    Caption = 'Valider'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btValiderClick
  end
  object btAffiche: TButton
    Left = 478
    Top = 317
    Width = 95
    Height = 25
    Caption = 'Afficher'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btAfficheClick
  end
  object btSup: TButton
    Left = 668
    Top = 317
    Width = 75
    Height = 25
    Caption = 'Supp.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btSupClick
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 480
    Top = 8
  end
end
