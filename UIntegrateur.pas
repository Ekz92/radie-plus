unit UIntegrateur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, frxClass, frxDBSet;

type
  TfrmIntegrateur = class(TForm)
    MainMenu1: TMainMenu;
    PayementCR1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Outils1: TMenuItem;
    Reclassement1: TMenuItem;
    Affectation1: TMenuItem;
    Etat1: TMenuItem;
    Situationpargest1: TMenuItem;
    Chargement1: TMenuItem;
    Fichier1: TMenuItem;
    Nouveau1: TMenuItem;
    Gestionnaire1: TMenuItem;
    Utilisateur1: TMenuItem;
    Situationgnrale1: TMenuItem;
    Opration1: TMenuItem;
    Importation1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Image1: TImage;
    Panel3: TPanel;
    Image2: TImage;
    Label8: TLabel;
    Paramettre1: TMenuItem;
    SpeedButton12: TSpeedButton;
    ImportationExcel1: TMenuItem;
    Fermer1: TMenuItem;
    Graphe1: TMenuItem;
    ImportCrditCR1: TMenuItem;
    ListedeCrditsCR1: TMenuItem;
    Panel4: TPanel;
    Listegnraledecrdit1: TMenuItem;
    Gestionnaire2: TMenuItem;
    Utilisateur2: TMenuItem;
    Crdit1: TMenuItem;
    Cartonnumrique1: TMenuItem;
    procedure Listecrditradi1Click(Sender: TObject);
    procedure PayementCR1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Affectation1Click(Sender: TObject);
    procedure Situationpargest1Click(Sender: TObject);
    procedure Chargement1Click(Sender: TObject);
    procedure Gestionnaire1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ImportationExcel1Click(Sender: TObject);
    procedure Fermer1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Graphe1Click(Sender: TObject);
    procedure ImportCrditCR1Click(Sender: TObject);
    procedure ListedeCrditsCR1Click(Sender: TObject);
    procedure Situationgnraleprriodique1Click(Sender: TObject);
    procedure Situationgnrale1Click(Sender: TObject);
    procedure Listegnraledecrdit1Click(Sender: TObject);
    procedure Gestionnaire2Click(Sender: TObject);
    procedure Utilisateur2Click(Sender: TObject);
    procedure Crdit1Click(Sender: TObject);
    procedure Cartonnumrique1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmIntegrateur: TfrmIntegrateur;

implementation

{$R *.dfm}

uses UListe_CR_RADIE, Upayement, UDM, UAffectation, UEtat_par_gestionnaire,
  UChargement, UGestionnaire, USituation_generale, UImport_data, Uconnexion,
  UUtilisateur, URech_rembourssement, UCommission, UListe_portefeille, UGraph,
  ULoad_graph, UValide_CR, USituation_globale, UListeGeneCredit,
  UAdd_credit_rad;

procedure TfrmIntegrateur.Affectation1Click(Sender: TObject);
begin
frmAffectation.ShowModal;
end;

procedure TfrmIntegrateur.Cartonnumrique1Click(Sender: TObject);
begin
frmRech_ERemboursement.ShowModal;
end;

procedure TfrmIntegrateur.Chargement1Click(Sender: TObject);
begin
frmChargement.ShowModal;
end;

procedure TfrmIntegrateur.Crdit1Click(Sender: TObject);
begin
frmAddCreditRad.showmodal;
end;

procedure TfrmIntegrateur.Fermer1Click(Sender: TObject);
begin
if MessageDlg('Voulez-vous fermer l''application??',mtConfirmation,[mbyes,mbno],0)=mryes then
  close;
end;

procedure TfrmIntegrateur.FormActivate(Sender: TObject);
begin
Label8.Caption := vUsager;

{  //cONNEXION DE SAF

  dm.Con_SAF.ConnectionString:='Provider=SQLNCLI10.1;Persist Security Info=False;User ID=sa;password=saf;Initial Catalog="saf_fucec_00002000";Data Source=10.100.70.187';
  dm.Con_SAF.LoginPrompt :=false;
  dm.Con_SAF.Connected :=true;
//  if dm.Con_SAF.Connected then ShowMessage('Connection établie avec succes');

  //Connexion de radie plus

  dm.Con_Radie.ConnectionString:='Provider=SQLNCLI10.1;Persist Security Info=False;User ID=sa;password=saf;Initial Catalog="RADIE_PLUS";Data Source=10.100.70.187';
  dm.Con_Radie.LoginPrompt :=false;
  dm.Con_Radie.Connected :=true;
//  if dm.Con_Radie.Connected then ShowMessage('Connection établie avec succes');
}
end;

procedure TfrmIntegrateur.Gestionnaire1Click(Sender: TObject);
begin
frmgestionnaire.ShowModal;
end;

procedure TfrmIntegrateur.Gestionnaire2Click(Sender: TObject);
begin
frmgestionnaire.ShowModal;
end;

procedure TfrmIntegrateur.Graphe1Click(Sender: TObject);
begin
frmLoadGraph.ShowModal;
end;

procedure TfrmIntegrateur.ImportationExcel1Click(Sender: TObject);
begin
frmImport_data.ShowModal;
end;

procedure TfrmIntegrateur.ImportCrditCR1Click(Sender: TObject);
begin
frmImport_CR.ShowModal;
end;

procedure TfrmIntegrateur.Listecrditradi1Click(Sender: TObject);
begin
frmListe_credit_radie_intervale.ShowModal;
end;

procedure TfrmIntegrateur.ListedeCrditsCR1Click(Sender: TObject);
begin
frmListe_credit_radie_intervale.ShowModal
end;

procedure TfrmIntegrateur.Listegnraledecrdit1Click(Sender: TObject);
begin
frmListeGeneCredit.ShowModal;
end;

procedure TfrmIntegrateur.PayementCR1Click(Sender: TObject);
begin
frmPayement_CR.ShowModal;
end;

procedure TfrmIntegrateur.Situationgnrale1Click(Sender: TObject);
begin
frmGlobale_situation.ShowModal;
end;

procedure TfrmIntegrateur.Situationgnraleprriodique1Click(Sender: TObject);
begin
frmSituation_generale.ShowModal;

end;

procedure TfrmIntegrateur.Situationpargest1Click(Sender: TObject);
begin
frmEtat_par_gestionnaire.ShowModal;
end;


procedure TfrmIntegrateur.SpeedButton10Click(Sender: TObject);
begin
frmChargement.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton11Click(Sender: TObject);
begin
frmPortefeille.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton12Click(Sender: TObject);
begin
frmRech_ERemboursement.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton1Click(Sender: TObject);
var
  Q_CR_SAF,
  QVide_CR,
  QInsert_RADIE,
  QSelect_CR_RADIE,
  Q_Select_ONE_CR,
  QInsert_PAYE : TADOQuery;
  I,J: integer;
  requte : string;

  vSolde : Real;
begin
  Q_CR_SAF:=TADOQuery.Create(self);
  Q_CR_SAF.Connection := dm.Con_SAF;

  QSelect_CR_RADIE:=TADOQuery.Create(self);
  QSelect_CR_RADIE.Connection := dm.Con_Radie;

  with Q_CR_SAF, SQL do
    begin
      Add('Select * from PR.PR_CREDITOS INNER JOIN CL.CL_CLIENTES '
          +' ON PR.PR_CREDITOS.COD_CLIENTE = CL.CL_CLIENTES.COD_CLIENTE'
          +' AND PR.PR_CREDITOS.COD_CALIFICACION = '+QuotedStr('RADIE')
          +' AND MON_SALDO <> 0 '
      );
    end;

  WITH QSelect_CR_RADIE,SQL do
    begin
      Add('select * from CR_CREDIT')
    end;
    QSelect_CR_RADIE.Open;

if QSelect_CR_RADIE.IsEmpty then
      begin
        Q_CR_SAF.Open;
       for I := 1 to Q_CR_SAF.RecordCount  do
          begin
            QInsert_RADIE:=TADOQuery.Create(self);
            QInsert_RADIE.Connection := dm.Con_Radie;

            QInsert_PAYE:=TADOQuery.Create(self);
            QInsert_PAYE.Connection := dm.Con_Radie;

            with QInsert_RADIE,SQL do
              begin
                Add('INSERT INTO CR_CREDIT(num_credit,cod_credit,date_debloc,montant_credit,montant_paye,interet_calc,solde,cod_client,nom_client,cod_usager)'
                    +' VALUES '
                    +'('
                    +Q_CR_SAF.FieldByName('num_credito').AsString+','
                    +QuotedStr(Q_CR_SAF.FieldByName('COD_TASA_INT').AsString)+','
                    +QuotedStr(Q_CR_SAF.FieldByName('FEC_APERTURA').AsString)+','
                    +Q_CR_SAF.FieldByName('MON_CREDITO').AsString+','
                    +Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsString+','
                    +FloatToStrF((Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14),TFloatFormat(ffFixed),10,2)+','
                    +FloatToStr((Q_CR_SAF.FieldByName('MON_SALDO').Asfloat)+(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14))+',' //(FloatToStrF((Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsFloat * 0.14),TFloatFormat(ffFixed),10,2))+','
                    +QuotedStr(Q_CR_SAF.FieldByName('COD_CLIENTE').AsString)+','
                    +QuotedStr(Q_CR_SAF.FieldByName('NOM_CLIENTE').AsString) +','
                    +QuotedStr('nul')+')'
                    );

                    SaveToFile('d:\CR_CREDIT.txt');
              end;
 {
            with QInsert_PAYE,SQL do
              begin
                Add('INSERT INTO CR_PAYE(num_compte,num_credit,nom_membre,montant_credit,montant_paye,interet_calc,solde) VALUES ('
                   +QuotedStr(Q_CR_SAF.FieldByName('COD_CLIENTE').AsString)+','
                    +Q_CR_SAF.FieldByName('num_credito').AsString+','
                    +QuotedStr(Q_CR_SAF.FieldByName('NOM_CLIENTE').AsString) +','
                    +Q_CR_SAF.FieldByName('MON_CREDITO').AsString+','
                    +Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsString+','
                    +FloatToStrF((Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsFloat * 0.14),TFloatFormat(ffFixed),10,2)+','
                    +Q_CR_SAF.FieldByName('MON_SALDO').AsString+')'
                ) ;
//                SaveToFile('d:\CR_PAYE.txt');
              end;
}
              try
                QInsert_RADIE.ExecSQL;
//                QInsert_PAYE.ExecSQL;
              finally
                QInsert_RADIE.Free;
//                QInsert_PAYE.Free;
              end;
              Q_CR_SAF.Next;
          end;

  end else

  begin

      Q_CR_SAF.Open;
      for I := 1 to Q_CR_SAF.RecordCount do
        begin
          Q_Select_ONE_CR:=TADOQuery.Create(self);
          Q_Select_ONE_CR.Connection := dm.Con_Radie;

         with Q_Select_ONE_CR,SQL do
            begin
              Add('select * from CR_CREDIT where num_credit = '+Q_CR_SAF.FieldByName('num_credito').AsString);
            end;

            try
              Q_Select_ONE_CR.Open;
              if not Q_Select_ONE_CR.IsEmpty then //Trouvé
                begin
//                  ShowMessage('trouvé');
//                  ShowMessage(QSelect_CR_RADIE.FieldByName('num_credit').AsString);
                end
              else
              begin //Non trouvé
                QInsert_RADIE:=TADOQuery.Create(self);
                QInsert_RADIE.Connection := dm.Con_Radie;

                QInsert_PAYE:=TADOQuery.Create(self);
                QInsert_PAYE.Connection := dm.Con_Radie;

                vSolde:= 0;
                vSolde := Q_CR_SAF.FieldByName('MON_SALDO').AsFloat;

                with QInsert_RADIE,SQL do
                  begin
                    Add('INSERT INTO CR_CREDIT(num_credit,cod_credit,date_debloc,montant_credit,montant_paye,interet_calc,solde,cod_client,nom_client,cod_usager)'
                        +' VALUES '
                        +'('
                        +Q_CR_SAF.FieldByName('num_credito').AsString+','
                        +QuotedStr(Q_CR_SAF.FieldByName('COD_TASA_INT').AsString)+','
                        +QuotedStr(Q_CR_SAF.FieldByName('FEC_APERTURA').AsString)+','
                        +Q_CR_SAF.FieldByName('MON_CREDITO').AsString+','
                        +Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsString+','
                        +FloatToStr(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14)+','
                        +FloatToStr((Q_CR_SAF.FieldByName('MON_SALDO').Asfloat)+(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14))+','
                        +QuotedStr(Q_CR_SAF.FieldByName('COD_CLIENTE').AsString)+','
                        +QuotedStr(Q_CR_SAF.FieldByName('NOM_CLIENTE').AsString) +','
                        +QuotedStr('nul')+')'
                        );
                  end;
{
            with QInsert_PAYE,SQL do
              begin
                Add('INSERT INTO CR_PAYE(num_compte,num_credit,nom_membre,montant_credit,montant_paye,interet_calc,solde) VALUES ('
                   +QuotedStr(Q_CR_SAF.FieldByName('COD_CLIENTE').AsString)+','
                    +Q_CR_SAF.FieldByName('num_credito').AsString+','
                    +QuotedStr(Q_CR_SAF.FieldByName('NOM_CLIENTE').AsString) +','
                    +Q_CR_SAF.FieldByName('MON_CREDITO').AsString+','
                    +Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsString+','
                    +FloatToStrF((Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsFloat * 0.14),TFloatFormat(ffFixed),10,2)+','
                    +Q_CR_SAF.FieldByName('MON_SALDO').AsString+')'
                )  ;
                SaveToFile('d:\CR_PAYE.txt');
              end;
}
                  try
                    QInsert_RADIE.ExecSQL;
//                    QInsert_PAYE.ExecSQL;
                  finally
                    QInsert_RADIE.Free;
//                    QInsert_PAYE.free;
                  end;
              end;

            finally
              Q_Select_ONE_CR.Free;
            end;
          Q_CR_SAF.Next;
        end;
  end;
  MessageDlg('Chargement bien effectué',mtInformation,[mbok],0);
end;

procedure TfrmIntegrateur.SpeedButton2Click(Sender: TObject);
begin
frmgestionnaire.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton3Click(Sender: TObject);
begin
if MessageDlg('Voulez-vous fermer l''application??',mtConfirmation,[mbyes,mbno],0)=mryes then
  close;
end;

procedure TfrmIntegrateur.SpeedButton4Click(Sender: TObject);
begin
frmUtilisateur.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton5Click(Sender: TObject);
begin
frmPayement_CR.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton6Click(Sender: TObject);
begin
frmCommission.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton7Click(Sender: TObject);
begin
frmEtat_par_gestionnaire.ShowModal;
end;

procedure TfrmIntegrateur.SpeedButton9Click(Sender: TObject);
begin
frmAffectation.ShowModal;
end;

procedure TfrmIntegrateur.Utilisateur2Click(Sender: TObject);
begin
frmUtilisateur.ShowModal;
end;

end.
