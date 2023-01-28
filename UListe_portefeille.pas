unit UListe_portefeille;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Data.Win.ADODB, frxClass, frxDBSet, frxExportCSV, frxExportText,
  frxExportPDF, frxExportBaseDialog;

type
  TfrmPortefeille = class(TForm)
    Gestionnaire: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbgestionnaire: TComboBox;
    edcode_gest: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    frxPortefeuille: TfrxReport;
    frxDBPortefeuille: TfrxDBDataset;
    QPorteufeille: TADOQuery;
    frxQSomme: TfrxDBDataset;
    QSomme: TADOQuery;
    frxPDFExport1: TfrxPDFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxCSVExport1: TfrxCSVExport;
    procedure FormActivate(Sender: TObject);
    procedure cbgestionnaireCloseUp(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmPortefeille: TfrmPortefeille;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmPortefeille.cbgestionnaireCloseUp(Sender: TObject);
var
  Qselect_code : TADOQuery;
begin
  Qselect_code:=TADOQuery.Create(self);
  Qselect_code.Connection:=dm.Con_Radie;

  with Qselect_code,SQL do
    begin
      Add('select code_gest from CR_GESTIONNAIRE where nom_gest =  '+QuotedStr(cbgestionnaire.Text));
    end;

    try
      Qselect_code.Open;
      if not Qselect_code.IsEmpty then
        edcode_gest.Text := Qselect_code.Fields[0].Value
      else
        begin

        end;
    finally
      Qselect_code.Free;
    end;

end;

procedure TfrmPortefeille.FormActivate(Sender: TObject);
var
  Qselect_gest : TADOQuery;
  I: integer;
begin
  Qselect_gest:=TADOQuery.Create(self);
  Qselect_gest.Connection:=dm.Con_Radie;

  with Qselect_gest,SQL do
    begin
      Add('select * from CR_GESTIONNAIRE order by nom_GEST asc ');
    end;

    try
      Qselect_gest.Open;

      for I := 0 to Qselect_gest.RecordCount - 1 do
        begin
          cbgestionnaire.Items.Add(Qselect_gest.FieldByName('nom_GEST').AsString);
          Qselect_gest.Next;
        end;
    finally
      Qselect_gest.Free;
    end;
end;

procedure TfrmPortefeille.FormClose(Sender: TObject; var Action: TCloseAction);
begin
cbgestionnaire.Clear;
end;

procedure TfrmPortefeille.SpeedButton1Click(Sender: TObject);
begin
with QSomme,SQL do
  begin
  Clear;
    Add( 'select sum(montant_credit) as TCredit,sum(montant_paye) as TPaye,sum(solde_old) as TRadie,sum(interet_calc) as TInteret,sum(solde) as solde '
       +' from CR_CREDIT  where code_gest = ' +QuotedStr(edcode_gest.Text));
  end;


with QPorteufeille, SQL do
  begin
    Clear;
    Add('Select * from CR_CREDIT Where code_gest = '+QuotedStr(edcode_gest.Text) );
  end;

  QPorteufeille.Open;
  QSomme.Open;
  frxPortefeuille.ShowReport();
end;

end.
