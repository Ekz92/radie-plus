object frmLoadGraph: TfrmLoadGraph
  Left = 0
  Top = 0
  Caption = 'Load graph'
  ClientHeight = 188
  ClientWidth = 377
  Color = 11433472
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 7
    Top = 9
    Width = 364
    Height = 172
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 15
    Top = 80
    Width = 71
    Height = 16
    Caption = 'Date d'#233'but :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 110
    Width = 70
    Height = 16
    Caption = 'Date finale :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 70
    Top = 147
    Width = 97
    Height = 25
    Caption = 'View Graph'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 198
    Top = 146
    Width = 97
    Height = 25
    Caption = 'Annuler'
  end
  object Bevel2: TBevel
    Left = 16
    Top = 134
    Width = 348
    Height = 6
    Shape = bsBottomLine
  end
  object cbgestionnaire: TComboBox
    Left = 15
    Top = 41
    Width = 242
    Height = 24
    Style = csDropDownList
    TabOrder = 0
    TextHint = 'Gestionnaire'
    OnCloseUp = cbgestionnaireCloseUp
  end
  object edCode_gest: TEdit
    Left = 266
    Top = 41
    Width = 94
    Height = 24
    TabOrder = 1
  end
  object D1: TDateTimePicker
    Left = 126
    Top = 76
    Width = 186
    Height = 24
    Date = 43718.341707291660000000
    Time = 43718.341707291660000000
    TabOrder = 2
  end
  object D2: TDateTimePicker
    Left = 126
    Top = 107
    Width = 186
    Height = 24
    Date = 43718.341707291660000000
    Time = 43718.341707291660000000
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 98
    Top = 17
    Width = 162
    Height = 17
    Caption = 'Tous les gestionnaires'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = CheckBox1Click
  end
end
