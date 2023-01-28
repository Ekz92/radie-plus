object frmListe_credit_radie_intervale: TfrmListe_credit_radie_intervale
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'LISTE CREDIT RADIES PAR INTERVALE'
  ClientHeight = 353
  ClientWidth = 666
  Color = 8404992
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 666
    Height = 88
    Align = alTop
    Shape = bsFrame
  end
  object ST_liste_CR: TStringGrid
    Left = 0
    Top = 129
    Width = 665
    Height = 224
    ColCount = 6
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
    ParentColor = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    StyleElements = [seBorder]
    OnDrawCell = ST_liste_CRDrawCell
    ColWidths = (
      71
      80
      82
      227
      94
      101)
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 74
    Caption = 'Intervalle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 20
      Width = 32
      Height = 16
      Caption = 'Mont.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbIntervale: TComboBox
      Left = 49
      Top = 17
      Width = 176
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '<-- 1 000 000'
      Items.Strings = (
        '<-- 1 000 000'
        '1 000 000 - 5 000 000'
        '5 000 000 - 10 000 000'
        '10 000 000 -->')
    end
    object cbtout_Intervale: TCheckBox
      Left = 55
      Top = 47
      Width = 97
      Height = 17
      Caption = 'Tout'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbtout_IntervaleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 243
    Top = 8
    Width = 239
    Height = 74
    Caption = 'Gestionnaire init.'
    TabOrder = 2
    object Label4: TLabel
      Left = 7
      Top = 18
      Width = 38
      Height = 16
      Caption = 'Code :'
    end
    object Label5: TLabel
      Left = 7
      Top = 44
      Width = 35
      Height = 16
      Caption = 'Nom :'
    end
    object edcode_gest: TEdit
      Left = 52
      Top = 15
      Width = 73
      Height = 24
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object cbgest: TComboBox
      Left = 52
      Top = 41
      Width = 183
      Height = 24
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
      OnCloseUp = cbgestCloseUp
    end
    object cbTout_gest: TCheckBox
      Left = 154
      Top = 19
      Width = 66
      Height = 17
      Caption = 'Tout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbTout_gestClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 483
    Top = 8
    Width = 178
    Height = 74
    Caption = 'P'#233'riode'
    TabOrder = 3
    object Label6: TLabel
      Left = 9
      Top = 18
      Width = 35
      Height = 16
      Caption = 'Deb. :'
    end
    object Label7: TLabel
      Left = 9
      Top = 44
      Width = 26
      Height = 16
      Caption = 'Fin :'
    end
    object D1: TDateTimePicker
      Left = 53
      Top = 15
      Width = 121
      Height = 24
      Date = 43752.336394143520000000
      Time = 43752.336394143520000000
      TabOrder = 0
    end
    object D2: TDateTimePicker
      Left = 53
      Top = 41
      Width = 121
      Height = 24
      Date = 43752.336394143520000000
      Time = 43752.336394143520000000
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 666
    Height = 41
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 4
    object Label2: TLabel
      Left = 19
      Top = 18
      Width = 71
      Height = 16
      Caption = 'Nbre ligne : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbnbre_ligne: TLabel
      Left = 107
      Top = 18
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 447
      Top = 7
      Width = 104
      Height = 27
      Caption = 'G'#233'n'#233'rer'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 556
      Top = 7
      Width = 104
      Height = 27
      Caption = 'R'#233'initialiser'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 224
    object Imprimer1: TMenuItem
      Caption = 'Imprimer'
    end
  end
end
