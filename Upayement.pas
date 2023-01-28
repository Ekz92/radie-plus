unit Upayement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Vcl.ExtCtrls;

type
  TfrmPayement_CR = class(TForm)
    Label1: TLabel;
    edcredit: TEdit;
    ednum_membre: TEdit;
    Label3: TLabel;
    ednom: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edmont_cr: TEdit;
    edmon_paye: TEdit;
    edsolde: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edmontant: TEdit;
    Label10: TLabel;
    edInteret: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cbListe_Gest: TComboBox;
    ed_code: TEdit;
    Bevel3: TBevel;
    Label13: TLabel;
    ednum_compte: TEdit;
    procedure ednum_membreDblClick(Sender: TObject);
    procedure edmontantKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Liste_gestionnaire();
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbListe_GestCloseUp(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmPayement_CR: TfrmPayement_CR;

implementation

{$R *.dfm}

uses URech_CR_paye, UDM, Uconnexion;

procedure TfrmPayement_CR.cbListe_GestCloseUp(Sender: TObject);
var
  Qselect_code : TADOQuery;
begin
  Qselect_code:=TADOQuery.Create(self);
  Qselect_code.Connection:=dm.Con_Radie;
if cbListe_Gest.Text<>'' then
  begin
    with Qselect_code,SQL do
      begin
        Add('select code_gest from CR_GESTIONNAIRE where nom_gest =  '+QuotedStr(cbListe_Gest.Text));
      end;

      try
        Qselect_code.Open;
        ed_code.Text := Qselect_code.Fields[0].Value;
      finally
        Qselect_code.Free;
      end;
  end else
  MessageDlg('Merci de selectionner un gestionnaire avant de porsuivre l''opération.',mtWarning,[mbOK],0);
end;

procedure TfrmPayement_CR.ednum_membreDblClick(Sender: TObject);
begin
frmRech_CR_paye.ShowModal;
end;

procedure TfrmPayement_CR.edmontantKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
key := #0;

end;

procedure TfrmPayement_CR.FormActivate(Sender: TObject);
begin
Liste_gestionnaire();
end;

procedure TfrmPayement_CR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
cbListe_Gest.Items.Clear;
end;

procedure TfrmPayement_CR.Liste_gestionnaire();
var
  QListe_gestionnaire : TADOQuery;
   i : integer ;
begin
  QListe_gestionnaire:=TADOQuery.Create(self);
  QListe_gestionnaire.Connection := dm.Con_Radie ;

  with QListe_gestionnaire,SQL do
    begin
      Add('select * from CR_GESTIONNAIRE');
    end;

    try
      QListe_gestionnaire.Open;

      for I := 1 to QListe_gestionnaire.RecordCount do
          begin
            cbListe_Gest.Items.Add(QListe_gestionnaire.FieldByName('nom_gest').AsString);
            QListe_gestionnaire.Next;
          end;
    finally
      QListe_gestionnaire.Free;
    end;
end;


procedure TfrmPayement_CR.SpeedButton1Click(Sender: TObject);
var
  QInsert_paye,
  QInsert_D_Paye,
  QSelect_credit : TADOQuery;
  Requete : string;
  result,
  num_cr : integer;
  mont_paye,
  solde : real;
begin
  QInsert_paye := TADOQuery.Create(self);
  QInsert_paye.Connection := dm.Con_Radie;

  QSelect_credit := TADOQuery.Create(self);
  QSelect_credit.Connection := dm.Con_Radie;

if (edmontant.Text<>'') then
  begin
  with QSelect_credit,SQL do
    begin
      Add('select * from CR_CREDIT where num_credit = '+edcredit.Text);
    end;

    try
      QSelect_credit.Open;
      num_cr := QSelect_credit.FieldByName('num_credit').AsInteger;
      mont_paye := QSelect_credit.FieldByName('montant_paye').AsFloat;
      solde := QSelect_credit.FieldByName('solde').AsFloat;
    finally
      QSelect_credit.Free;
    end;
      begin
        Requete := 'Update CR_CREDIT set '
                    +' montant_paye = '+FloatToStr(mont_paye + StrToFloat(edmontant.Text))+','
                    +' solde = '+FloatToStr(solde - StrToFloat(edmontant.Text))
                    +' WHERE num_credit = '+QuotedStr(edcredit.Text)
                    +' and cod_client = '+ QuotedStr(ednum_membre.Text);
      end;

  with QInsert_paye,SQL do
    begin
      Add(Requete);
    end;
//-------------------- preparation de la requete d'insertion dans paye_detail
QInsert_D_Paye:=TADOQuery.Create(self);
QInsert_D_Paye.Connection :=dm.Con_Radie;

  with QInsert_D_Paye,SQL do
    begin
      Add('Set dateformat ymd');
      Add('Insert into CR_DETAILS_PAYE (num_credit,num_membre,num_compte,nom_membre,payement,date_paye,usager,code_gest) VALUES ('
            +edcredit.Text+','
            +QuotedStr(ednum_membre.Text)+','
            +QuotedStr(ednum_compte.Text)+','
            +QuotedStr(ednom.Text)+','
            +edmontant.Text +','
            +QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',now)) +','
            +QuotedStr(vUsager)+','
            +QuotedStr(ed_code.Text)
        +');');
    end;
//----------------------------Exécution----------
    try
      if MessageDlg('Voulez-vous enregistrer cette opération ???', mtConfirmation,[mbyes,mbno],0) = mryes then
        begin
          QInsert_D_Paye.ExecSQL;
          QInsert_paye.ExecSQL;
          SpeedButton2.Click;
          MessageDlg('Opération bien éffectuée !!!', mtConfirmation,[mbOK],0 );
        end;
    finally
      QInsert_paye.Free;
    end;
  end else
  begin
    MessageDlg('Veuillez Saisir le montant ', mtWarning,[mbRetry],0);
    edmontant.SetFocus;
  end;

end;

procedure TfrmPayement_CR.SpeedButton2Click(Sender: TObject);
begin
  edcredit.Clear;
  ednum_membre.Clear;
  ednum_compte.Clear;
  ednom.Clear;
  edmont_cr.Clear;
  edmon_paye.Clear;
  edsolde.Clear;
  edmontant.Clear;
  edInteret.Clear;
end;

end.
