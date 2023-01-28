object frmSituation_generale: TfrmSituation_generale
  Left = 0
  Top = 0
  Caption = 'Situation p'#233'riodique des payements'
  ClientHeight = 157
  ClientWidth = 300
  Color = 1356019
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 265
    Height = 137
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 64
    Height = 16
    Caption = 'Date d'#233'b. :'
  end
  object Label2: TLabel
    Left = 32
    Top = 65
    Width = 60
    Height = 16
    Caption = 'Date Fin. :'
  end
  object Bevel2: TBevel
    Left = 32
    Top = 96
    Width = 233
    Height = 6
    Shape = bsBottomLine
  end
  object SpeedButton1: TSpeedButton
    Left = 56
    Top = 109
    Width = 73
    Height = 29
    Caption = 'Visualiser'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 150
    Top = 108
    Width = 73
    Height = 29
    Caption = 'Fermer'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 128
    Top = 28
    Width = 95
    Height = 24
    Date = 43690.407334768520000000
    Time = 43690.407334768520000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 128
    Top = 61
    Width = 95
    Height = 24
    Date = 43690.407334768520000000
    Time = 43690.407334768520000000
    TabOrder = 1
  end
  object frxReport1: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43761.315622812500000000
    ReportOptions.LastChange = 43761.315622812500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 248
    Top = 64
  end
  object QCR_credit: TADOQuery
    Connection = DM.Con_Radie
    Parameters = <>
    SQL.Strings = (
      'select * from cr_credit')
    Left = 248
    Top = 112
  end
end
