unit UGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Data.DB,
  Data.Win.ADODB, VCLTee.DBChart, VCLTee.TeeDBCrossTab, Vcl.Grids;

type
  TfrmGraph = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBCrossTabSource1: TDBCrossTabSource;
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmGraph: TfrmGraph;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmGraph.FormActivate(Sender: TObject);
begin
ADOTable1.close;
ADOTable1.Open;
end;

end.
