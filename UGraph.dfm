object frmGraph: TfrmGraph
  Left = 0
  Top = 0
  ClientHeight = 511
  ClientWidth = 1105
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 1105
    Height = 511
    Legend.LegendStyle = lsSeries
    Title.Color = clRed
    Title.Text.Strings = (
      'Diagramme')
    BottomAxis.LabelsFormat.TextAlignment = taCenter
    Chart3DPercent = 3
    DepthAxis.LabelsFormat.TextAlignment = taCenter
    DepthTopAxis.LabelsFormat.TextAlignment = taCenter
    LeftAxis.LabelsFormat.TextAlignment = taCenter
    RightAxis.LabelsFormat.TextAlignment = taCenter
    TopAxis.LabelsFormat.TextAlignment = taCenter
    Zoom.Pen.Mode = pmNotXor
    Align = alClient
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 4
    object Series1: TLineSeries
      Marks.Visible = False
      DataSource = DBCrossTabSource1
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 480
    Top = 144
  end
  object ADOTable1: TADOTable
    Connection = DM.Con_Radie
    CursorType = ctStatic
    TableName = 'CR_GRAPH'
    Left = 520
    Top = 224
  end
  object DBCrossTabSource1: TDBCrossTabSource
    Active = True
    DataSet = ADOTable1
    GroupField = 'code_gest'
    LabelField = 'Date_opration'
    Series = Series1
    ValueField = 'Montant'
    Left = 160
    Top = 104
  end
end
