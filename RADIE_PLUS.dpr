program RADIE_PLUS;

uses
  Vcl.Forms,
  UListe_CR_RADIE in 'UListe_CR_RADIE.pas' {frmListe_credit_radie_intervale},
  UDM in 'UDM.pas' {DM: TDataModule},
  Upayement in 'Upayement.pas' {frmPayement_CR},
  URech_CR_paye in 'URech_CR_paye.pas' {frmRech_CR_paye},
  UIntegrateur in 'UIntegrateur.pas' {frmIntegrateur},
  UAffectation in 'UAffectation.pas' {frmAffectation},
  UEtat_par_gestionnaire in 'UEtat_par_gestionnaire.pas' {frmEtat_par_gestionnaire},
  Uconnexion in 'Uconnexion.pas' {frmConnexion},
  UChargement in 'UChargement.pas' {frmChargement},
  UGestionnaire in 'UGestionnaire.pas' {frmgestionnaire},
  USituation_generale in 'USituation_generale.pas' {frmSituation_generale},
  UImport_data in 'UImport_data.pas' {frmImport_data},
  UUtilisateur in 'UUtilisateur.pas' {frmUtilisateur},
  URech_rembourssement in 'URech_rembourssement.pas' {frmRech_ERemboursement},
  Vcl.Themes,
  Vcl.Styles,
  UCommission in 'UCommission.pas' {frmCommission},
  UListe_portefeille in 'UListe_portefeille.pas' {frmPortefeille},
  UGraph in 'UGraph.pas' {frmGraph},
  ULoad_graph in 'ULoad_graph.pas' {frmLoadGraph},
  UValide_CR in 'UValide_CR.pas' {frmImport_CR},
  USituation_globale in 'USituation_globale.pas' {frmGlobale_situation},
  UListeGeneCredit in 'UListeGeneCredit.pas' {frmListeGeneCredit},
  records in 'records.pas',
  UAdd_credit_rad in 'UAdd_credit_rad.pas' {frmAddCreditRad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConnexion, frmConnexion);
  Application.CreateForm(TfrmImport_data, frmImport_data);
  Application.CreateForm(TfrmIntegrateur, frmIntegrateur);
  Application.CreateForm(TfrmPayement_CR, frmPayement_CR);
  Application.CreateForm(TfrmListe_credit_radie_intervale, frmListe_credit_radie_intervale);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmRech_CR_paye, frmRech_CR_paye);
  Application.CreateForm(TfrmAffectation, frmAffectation);
  Application.CreateForm(TfrmEtat_par_gestionnaire, frmEtat_par_gestionnaire);
  Application.CreateForm(TfrmChargement, frmChargement);
  Application.CreateForm(Tfrmgestionnaire, frmgestionnaire);
  Application.CreateForm(TfrmSituation_generale, frmSituation_generale);
  Application.CreateForm(TfrmUtilisateur, frmUtilisateur);
  Application.CreateForm(TfrmRech_ERemboursement, frmRech_ERemboursement);
  Application.CreateForm(TfrmCommission, frmCommission);
  Application.CreateForm(TfrmPortefeille, frmPortefeille);
  Application.CreateForm(TfrmGraph, frmGraph);
  Application.CreateForm(TfrmLoadGraph, frmLoadGraph);
  Application.CreateForm(TfrmImport_CR, frmImport_CR);
  Application.CreateForm(TfrmGlobale_situation, frmGlobale_situation);
  Application.CreateForm(TfrmListeGeneCredit, frmListeGeneCredit);
  Application.CreateForm(TfrmAddCreditRad, frmAddCreditRad);
  Application.Run;
end.
