object frmChargement: TfrmChargement
  Left = 0
  Top = 0
  Caption = 'Chargement'
  ClientHeight = 210
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 109
    Top = 80
    Width = 169
    Height = 73
    Caption = 'Chargement'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 382
    Height = 18
    Caption = 'Chargement de donn'#233'es SAF en cours. Veillez patienter... '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    Visible = False
  end
end
