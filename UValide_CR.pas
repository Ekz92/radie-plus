unit UValide_CR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, Data.FMTBcd, Data.SqlExpr;

type
  TfrmImport_CR = class(TForm)
    StringGrid1: TStringGrid;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btValider: TButton;
    btAffiche: TButton;
    Label5: TLabel;
    Lbnbre: TLabel;
    SQLQuery1: TSQLQuery;
    btSup: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btAfficheClick(Sender: TObject);
    procedure btValiderClick(Sender: TObject);
    procedure vide_CR();
    procedure vide_StringGrid1();
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btSupClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmImport_CR: TfrmImport_CR;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmImport_CR.vide_CR();
  var
    QVide :TADOQuery;
begin
  QVide:=TADOQuery.Create(self);
  QVide.Connection := dm.Con_Radie;

  with QVide , SQL do
    begin
      Add('Truncate table Import_Credit_CR')
    end;

    TRY
      QVide.ExecSQL;
    FINALLY
      QVide.Free;
    END;
end;
procedure TfrmImport_CR.vide_StringGrid1();
begin
  StringGrid1.RowCount:=2;
  StringGrid1.Rows[1].Clear;
  Lbnbre.Caption := '0';
end;

procedure TfrmImport_CR.btSupClick(Sender: TObject);
var
  sql : string;
begin
  sql := 'truncate table tb_import_credit';

if MessageDlg('Voulez-vous annuler le chargement?',mtConfirmation,[mbYes,mbNo],0) = mryes then
begin
  dm.truncateTable(sql);
  btAffiche.Click;
end;
end;

procedure TfrmImport_CR.btValiderClick(Sender: TObject);
var
  Q_CR_SAF,
  QVide_CR,
  QInsert_RADIE : TADOQuery;
  I,J: integer;
  sql,query : string;

begin
  if MessageDlg('Etes-vous sur de vouloir valider ces crédits radiés??', mtConfirmation,[mbyes,mbno],0) = mryes then
    BEGIN
      sql := '';
       for I := 1 to StringGrid1.RowCount - 1  do
          begin
            QInsert_RADIE:=TADOQuery.Create(self);
            QInsert_RADIE.Connection := dm.Con_Radie;

            with StringGrid1 do
              begin
                    sql:= sql + '('+Cells[0,i] +','         // Numéro du crédit
                    +QuotedStr(Cells[1,i])+',' // Code type crédit
                    +QuotedStr('2019-10-10')+',' // Date de déblocage
                    +Cells[2,i]+','             //Montant crédit
                    +Cells[3,i]+','    //Montant payé
                    +Cells[4,i]+','        //Solde initial sans l'ajout d'interet
                    +FloatToStrF((StrToFloat(Cells[4,i]) * 0.14),TFloatFormat(ffFixed),10,2)+',' //Montant d'interet calculé
                    +FloatToStr((StrToFloat(Cells[4,i]))+(StrToFloat(Cells[4,i]) * 0.14))+',' // Solde  avec calcul d'interet 14%
                    +QuotedStr(Cells[5,i])+',' //Numéro carnet du membre
                    +QuotedStr(Cells[6,i])+',' //Numero de compte comptable
                    +QuotedStr(Cells[7,i]) +',' // Nom du client
                    +QuotedStr('nul')+',' //Nom du gestionnaire radié
                    +QuotedStr(Cells[8,i])+',' // code du gestionnaire de crédit
                    +QuotedStr(FormatDateTime( 'yyyy-mm-dd',StrToDate(Cells[9,i]))) // date de radiation
                    +')' ;

                    if i<>RowCount-1 then
                      sql:=sql+','
              end;
            end;

              query := ' set dateformat ymd '
                      +' INSERT INTO CR_CREDIT(num_credit,cod_credit,date_debloc,montant_credit,montant_paye,solde_old,interet_calc,solde,cod_client,compte_client,nom_client,code_gest,gest_old,date_radie)'
                      +' VALUES '+sql;

              try
                QInsert_RADIE.SQL.Add(query);
                QInsert_RADIE.ExecSQL;
              finally
                QInsert_RADIE.Free;
              end;
          end;
          MessageDlg('Données valider avec succès',mtInformation,[mbyes,mbno],0);
          Vide_CR();
          vide_StringGrid1();
end;

procedure TfrmImport_CR.btAfficheClick(Sender: TObject);
var
  Qselect_Import : TSQLQuery;
  I: Integer;
  Psql : string;
begin
  Qselect_Import:=TSQLQuery.Create(self);
  Qselect_Import.SQLConnection := dm.SQLConnection1;

  Psql := 'Delete from tb_import_credit where date_radie = 0000-00-00 ';

  dm.DeleteFirstLine(Psql);

  with Qselect_Import , SQL do
    begin
      Add('Select * from tb_Import_Credit') ;
    end;
    StringGrid1.RowCount :=2;
    StringGrid1.Rows[1].Clear;
    try
      Qselect_Import.Open;

      if Qselect_Import.IsEmpty then
        begin
          MessageDlg('Aucune données Excel disponible',mtInformation,[mbok],0);
        end else
        begin
          StringGrid1.RowCount := Qselect_Import.RecordCount +1;
          Lbnbre.Caption := IntToStr(Qselect_Import.RecordCount);

          for I := 1 to Qselect_Import.RecordCount do
            with Qselect_Import, StringGrid1 do
              begin
                Cells[0,i] := FieldByName('num_credit').AsString ;
                Cells[1,i] := FieldByName('type_credit').AsString ;
                Cells[2,i] := FieldByName('montant_credit').AsString ;
                Cells[3,i] := FieldByName('montant_paye').AsString;
                Cells[4,i] := FieldByName('solde').AsString;
                Cells[5,i] := FieldByName('code_client').AsString;
                Cells[6,i] := FieldByName('compte_client').AsString;
                Cells[7,i] := FieldByName('nom_client').AsString;
                Cells[8,i] := FieldByName('gest_old').AsString;
                Cells[9,i] := FieldByName('date_radie').AsString ;
                Qselect_Import.Next;
              end;
        end;
        finally
             Qselect_Import.Free;
        end;


end;

procedure TfrmImport_CR.FormCreate(Sender: TObject);
begin
with StringGrid1 do
  begin
    Cells[0,0] := 'N° Credit';
    Cells[1,0] := 'Type';
    Cells[2,0] := 'Montant';
    Cells[3,0] := 'Mnt. payé';
    Cells[4,0] := 'Solde';
    Cells[5,0] := 'code client';
    Cells[6,0] := 'Compte client';
    Cells[7,0] := 'Nom client';
    Cells[8,0] := 'Gest.';
    Cells[9,0] := 'Date radié';
  end;
end;

procedure TfrmImport_CR.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    with Sender As TStringGrid do with canvas do
    begin
      { selection de la couleur de fond}
      if gdFixed in State then
        Brush.Color:=clBtnFace
      else
        if gdSelected in State then
          Brush.Color:=clNavy//$00000046
        else
          if Odd(ARow) then
            Brush.Color :=$006A9BFF//$FFE0FF clgreen
          else
            Brush.Color:=$00FBDA97;//$FFFFE0  clBlue
      {Design du fond}
      FillRect(Rect);
      {Selection de la couleur d'ecriture}
      if gdSelected in State then
        font.Color:=clwhite
        else
        font.Color:=clblack;
      {Design du texte}
      TextOut(Rect.Left,Rect.Top,Cells[ACol,ARow]);
    end;

end;

end.
