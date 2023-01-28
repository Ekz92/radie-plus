unit USituation_globale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Data.Win.ADODB, frxClass, frxDBSet;

type
  TfrmGlobale_situation = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    lbTotRadie: TLabel;
    lbTrecupere: TLabel;
    lbreste: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    frxReport1: TfrxReport;
    QSituation_generale: TADOQuery;
    frxDBQSituation_generale: TfrxDBDataset;
    QSituation_generaleTRadie: TFMTBCDField;
    QSituation_generaleTpaye: TFMTBCDField;
    QSituation_generaleReste: TFMTBCDField;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmGlobale_situation: TfrmGlobale_situation;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmGlobale_situation.FormActivate(Sender: TObject);
var
Query : TADOQuery;
vTRadie,
vTpaye,
vReste : real;
begin
  Query:=TADOQuery.Create(self);
  Query.Connection := dm.Con_Radie;

  with Query,SQL do
    begin
      Add('Select sum(solde_old) as TRadie,sum(montant_paye) as Tpaye ,(sum(solde_old) - sum(montant_paye)) as Reste from CR_CREDIT ')
    end;

    TRY
      Query.Open;

      vTRadie := Query.FieldByName('TRadie').AsFloat;
      vTpaye := Query.FieldByName('Tpaye').AsFloat;
      vReste :=Query.FieldByName('Reste').AsFloat;

      lbTotRadie.Caption := FloatToStrF(vTRadie,ffNumber,15,2)+'F';
      lbTrecupere.Caption := FloatToStrF(vTpaye,ffNumber,15,2)+'F';
      lbreste.Caption := FloatToStrF(vReste,ffNumber,15,2)+'F';
    FINALLY
      Query.Free;
    END;
end;

procedure TfrmGlobale_situation.SpeedButton1Click(Sender: TObject);
var
Query : TADOQuery;
vTRadie,
vTpaye,
vReste : real;
begin
  Query:=TADOQuery.Create(self);
  Query.Connection := dm.Con_Radie;

  with Query,SQL do
    begin
      Add('Select sum(solde_old) as TRadie,sum(montant_paye) as Tpaye ,(sum(solde_old) - sum(montant_paye)) as Reste from CR_CREDIT ')
    end;

    TRY
      Query.Open;

      vTRadie := Query.FieldByName('TRadie').AsFloat;
      vTpaye := Query.FieldByName('Tpaye').AsFloat;
      vReste :=Query.FieldByName('Reste').AsFloat;

      lbTotRadie.Caption := FloatToStrF(vTRadie,ffNumber,15,2)+'F';
      lbTrecupere.Caption := FloatToStrF(vTpaye,ffNumber,15,2)+'F';
      lbreste.Caption := FloatToStrF(vReste,ffNumber,15,2)+'F';
    FINALLY
      Query.Free;
    END;
end;

procedure TfrmGlobale_situation.SpeedButton2Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
