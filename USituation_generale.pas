unit USituation_generale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Data.DB, Data.Win.ADODB, frxClass, frxDBSet;

type
  TfrmSituation_generale = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    QCR_credit: TADOQuery;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmSituation_generale: TfrmSituation_generale;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmSituation_generale.SpeedButton1Click(Sender: TObject);
begin
with QCR_credit,SQL do
  begin
    Add('select sum(solde_old)')
  end;
end;

end.
