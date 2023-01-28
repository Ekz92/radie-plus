object frmAddCreditRad: TfrmAddCreditRad
  Left = 0
  Top = 0
  Caption = 'Radier un nouveau cr'#233'dit'
  ClientHeight = 258
  ClientWidth = 698
  Color = 8404992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel3: TBevel
    Left = 6
    Top = 8
    Width = 685
    Height = 220
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 261
    Top = 16
    Width = 422
    Height = 201
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 14
    Top = 16
    Width = 241
    Height = 201
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 22
    Top = 28
    Width = 61
    Height = 16
    Caption = 'N'#176' Cr'#233'dit :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 22
    Top = 54
    Width = 37
    Height = 16
    Caption = 'Type :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 22
    Top = 80
    Width = 84
    Height = 16
    Caption = 'Mnt du cr'#233'dit :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 22
    Top = 106
    Width = 61
    Height = 16
    Caption = 'Mnt pay'#233' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 22
    Top = 132
    Width = 41
    Height = 16
    Caption = 'Solde :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 270
    Top = 28
    Width = 67
    Height = 16
    Caption = 'Date d'#233'bloc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 270
    Top = 54
    Width = 72
    Height = 16
    Caption = 'Code client :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 270
    Top = 80
    Width = 87
    Height = 16
    Caption = 'Compte client :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 22
    Top = 158
    Width = 73
    Height = 16
    Caption = 'Interet calc :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 22
    Top = 184
    Width = 77
    Height = 16
    Caption = 'Solde Radi'#233' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 270
    Top = 106
    Width = 69
    Height = 16
    Caption = 'Nom client :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 270
    Top = 132
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
  object edNumCredit: TEdit
    Left = 110
    Top = 25
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 0
  end
  object edmntCredit: TEdit
    Left = 110
    Top = 77
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 2
  end
  object edMntPaye: TEdit
    Left = 110
    Top = 103
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 3
  end
  object edSolde: TEdit
    Left = 110
    Top = 129
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 4
  end
  object cbTypeCredit: TComboBox
    Left = 110
    Top = 51
    Width = 137
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 1
    Items.Strings = (
      'CORD'
      'CVIR'
      'CPREF'
      'CSCOL'
      'DCVRT')
  end
  object edInteret: TEdit
    Left = 110
    Top = 155
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 5
  end
  object edSoldeRadie: TEdit
    Left = 110
    Top = 181
    Width = 137
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 6
  end
  object dateDebloc: TDateTimePicker
    Left = 366
    Top = 25
    Width = 101
    Height = 24
    Date = 44590.414301747680000000
    Time = 44590.414301747680000000
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 7
  end
  object edcodeClt: TEdit
    Left = 366
    Top = 51
    Width = 160
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 8
  end
  object edCompteClt: TEdit
    Left = 366
    Top = 77
    Width = 160
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentColor = True
    ParentFont = False
    TabOrder = 9
  end
  object edNomClt: TEdit
    Left = 366
    Top = 103
    Width = 309
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 10
  end
  object edGestionnaire: TEdit
    Left = 366
    Top = 129
    Width = 309
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 6
    ParentColor = True
    ParentFont = False
    TabOrder = 11
  end
  object Button1: TButton
    Left = 540
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Radier'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 617
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Annuler'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Button2Click
  end
end
