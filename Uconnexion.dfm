object frmConnexion: TfrmConnexion
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Connexion'
  ClientHeight = 350
  ClientWidth = 339
  Color = 8404992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object SB_conn: TSpeedButton
    Left = 28
    Top = 206
    Width = 283
    Height = 42
    Caption = 'Connexion'
    Font.Charset = ANSI_CHARSET
    Font.Color = 8404992
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SB_connClick
  end
  object lblogin: TLabel
    Left = 89
    Top = 28
    Width = 170
    Height = 42
    Caption = 'RADIE PLUS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -35
    Font.Name = 'Calibri'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 51
    Top = 172
    Width = 103
    Height = 15
    Caption = 'Se souvenir de moi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 191
    Top = 172
    Width = 120
    Height = 15
    Caption = 'Mot de passe oubli'#233' ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 273
    Top = 309
    Width = 38
    Height = 15
    Cursor = crHandPoint
    Caption = 'Fermer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label4Click
  end
  object edlogin: TEdit
    Left = 28
    Top = 92
    Width = 283
    Height = 32
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    MaxLength = 4
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TextHint = 'Login'
  end
  object edpwd: TEdit
    Left = 28
    Top = 132
    Width = 283
    Height = 32
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Calibri'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    TextHint = 'Password'
    OnKeyPress = edpwdKeyPress
  end
  object CheckBox1: TCheckBox
    Left = 27
    Top = 172
    Width = 17
    Height = 17
    TabOrder = 2
  end
end
