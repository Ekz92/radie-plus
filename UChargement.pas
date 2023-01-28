unit UChargement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Buttons,
  Vcl.StdCtrls;

type
  TfrmChargement = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmChargement: TfrmChargement;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmChargement.SpeedButton1Click(Sender: TObject);
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
begin     {
  Label1.Visible:=True;
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
                Add('INSERT INTO CR_CREDIT(num_credit,cod_credit,date_debloc,montant_credit,montant_paye,solde_old,interet_calc,solde,cod_client,compte_client,nom_client,code_gest)'
                    +' VALUES '
                    +'('
                    +Q_CR_SAF.FieldByName('num_credito').AsString+','         // Numéro du crédit
                    +QuotedStr(Q_CR_SAF.FieldByName('COD_TASA_INT').AsString)+',' // Code type crédit
                    +QuotedStr(Q_CR_SAF.FieldByName('FEC_APERTURA').AsString)+',' // Date de déblocage
                    +Q_CR_SAF.FieldByName('MON_CREDITO').AsString+','             //Montant crédit
                    +Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsString+','    //Montant payé
                    +FloatToStr(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat)+','        //Solde initial sans l'ajout d'interet
                    +FloatToStrF((Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14),TFloatFormat(ffFixed),10,2)+',' //Montant d'interet calculé
                    +FloatToStr((Q_CR_SAF.FieldByName('MON_SALDO').Asfloat)+(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14))+',' // Solde  avec calcul d'interet 14%
                    +QuotedStr(Q_CR_SAF.FieldByName('COD_CLIENTE').AsString)+',' //Numéro carnet du membre
                    +QuotedStr(Q_CR_SAF.FieldByName('ID_CUENTA').AsString)+',' //Numero de compte comptable
                    +QuotedStr(Q_CR_SAF.FieldByName('NOM_CLIENTE').AsString) +',' // Nom du client
                    +QuotedStr('nul')+')' //Nom du gestionnaire
                    );
              end;

              try
                QInsert_RADIE.ExecSQL;
              finally
                QInsert_RADIE.Free;
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
                    Add('INSERT INTO CR_CREDIT(num_credit,cod_credit,date_debloc,montant_credit,montant_paye,solde_old,interet_calc,solde,cod_client,compte_client,nom_client,code_gest)'
                        +' VALUES '
                        +'('
                        +Q_CR_SAF.FieldByName('num_credito').AsString+','         // Numéro du crédit
                        +QuotedStr(Q_CR_SAF.FieldByName('COD_TASA_INT').AsString)+',' // Code type crédit
                        +QuotedStr(Q_CR_SAF.FieldByName('FEC_APERTURA').AsString)+',' // Date de déblocage
                        +Q_CR_SAF.FieldByName('MON_CREDITO').AsString+','             //Montant crédit
                        +Q_CR_SAF.FieldByName('MON_PAGADO_PRINCIPAL').AsString+','    //Montant payé
                        +FloatToStr(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat)+','        //Solde initial sans l'ajout d'interet
                        +FloatToStrF((Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14),TFloatFormat(ffFixed),10,2)+',' //Montant d'interet calculé
                        +FloatToStr((Q_CR_SAF.FieldByName('MON_SALDO').Asfloat)+(Q_CR_SAF.FieldByName('MON_SALDO').AsFloat * 0.14))+',' // Solde  avec calcul d'interet 14%
                        +QuotedStr(Q_CR_SAF.FieldByName('COD_CLIENTE').AsString)+',' //Numéro carnet du membre
                        +QuotedStr(Q_CR_SAF.FieldByName('ID_CUENTA').AsString)+',' //Numero de compte comptable
                        +QuotedStr(Q_CR_SAF.FieldByName('NOM_CLIENTE').AsString) +',' // Nom du client
                        +QuotedStr('nul')+')' //Nom du gestionnaire
                        );
                  end;

                  try
                    QInsert_RADIE.ExecSQL;
                  finally
                    QInsert_RADIE.Free;
                  end;
              end;

            finally
              Q_Select_ONE_CR.Free;
            end;
          Q_CR_SAF.Next;
        end;
  end;
  MessageDlg('Chargement bien effectué',mtInformation,[mbok],0);   }
end;
end.
