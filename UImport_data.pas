unit UImport_data;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,ComObj,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmImport_data = class(TForm)
    Button1: TButton;
    sg: TStringGrid;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Lbnbre: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vide_sg();
    procedure sgDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
//    procedure LoadCSV(Filename: string; sg: TStringGrid);
  type
  TArrayOfFields = array of string;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmImport_data: TfrmImport_data;

implementation

{$R *.dfm}

uses UDM, Uconnexion;


procedure TfrmImport_data.Button1Click(Sender: TObject);
var
  QInsert,
  QVide_Import,
  QSelect_credit,
  QUpdate : TADOQuery;
  i:integer;

  vMontant_paye,
  vSolde : Real;

begin
//-------------------------------- Insertion dans la table DETAILS_PAYE------------------------------
if MessageDlg('Confirmez la validation des données Excel',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  BEGIN
    for I := 1 to sg.RowCount-1 do
      Begin
          QInsert:=TADOQuery.Create(self);
          QInsert.Connection := dm.Con_Radie;

            with QInsert, SQL, sg do
              begin
                Add('Set dateformat ymd');
                Add('Insert into CR_DETAILS_PAYE (num_credit,num_membre,num_compte,nom_membre,payement,date_paye,usager,code_gest) VALUES('
                      +QuotedStr(Cells[0,i])+','
                      +QuotedStr(Cells[1,i])+','
                      +QuotedStr(Cells[2,i])+','
                      +QuotedStr(Cells[3,i])+','
                      +QuotedStr(Cells[4,i])+','
                      +QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm',StrToDateTime(Cells[5,i])))+','
                      +QuotedStr(vUsager)+','
                      +QuotedStr(Cells[6,i])+');'
                    );
//                    SaveToFile('D:\CR_DETAILS_PAYE.txt');
                   try
                     QInsert.ExecSQL;
                   finally
                      QInsert.Free;
                   end;
              end;
//--------------------------------------Update des montants dans la table CR_CREDIT------------------
        //***********Selection du crédit**********************
          QSelect_credit:=TADOQuery.Create(self);
          QSelect_credit.Connection := dm.Con_Radie;

          with QSelect_credit , SQL do
            begin
              Add('Select * from CR_CREDIT where num_credit = '+sg.Cells[0,i]+' And cod_client = '+QuotedStr(sg.Cells[1,i]));
//              SaveToFile('D:\taat.txt');
            end;

            try
              QSelect_credit.Open;
              vMontant_paye := QSelect_credit.FieldByName('montant_paye').AsFloat;
              vSolde := QSelect_credit.FieldByName('solde').AsFloat;
            finally
              QSelect_credit.Free;
            end;

        //********************** Excecution de la mise à jours

          QUpdate:=TADOQuery.Create(self);
          QUpdate.Connection := dm.Con_Radie;

          with QUpdate,SQL do
            begin
              Add('UPDATE CR_CREDIT SET '
                  +'montant_paye = '+FloatToStr((vMontant_paye)+StrToFloat(sg.Cells[4,i]))+','
                  +'solde = '+FloatToStr((vSolde) - StrToFloat(sg.Cells[4,i]))
                  +'WHERE num_credit = ' +sg.Cells[0,i] +' And cod_client = '+QuotedStr(sg.Cells[1,i])
                );    //              SaveToFile('D:\vvvv.txt');
            end;
            try
              QUpdate.ExecSQL;
            finally
              QUpdate.Free;
            end;

      End;
//---------------------------------- vider la table d'excel---------------------------------
          QVide_Import:=TADOQuery.Create(self);
          QVide_Import.Connection := dm.Con_Radie;

          with QVide_Import.SQL do
            begin
              Add('Truncate table Import_prelevement')   ;
            end;

            try
              QVide_Import.ExecSQL;
            finally
              QVide_Import.Free;
            end;
//--------------------------------------------------------
      MessageDlg('Données excel valider avec succès',mtInformation,[mbok],0);
      vide_sg();
  END;
end;
procedure TfrmImport_data.vide_sg();
begin
  sg.RowCount:=2;
  sg.Rows[1].Clear;
  Lbnbre.Caption := '0';
end;

procedure TfrmImport_data.Button2Click(Sender: TObject);
var
  Qselect_Import : TADOQuery;
  I: Integer;
begin
  Qselect_Import:=TADOQuery.Create(self);
  Qselect_Import.Connection := dm.Con_Radie;

  with Qselect_Import , SQL do
    begin
      Add('Select * from Import_prelevement') ;
    end;

    try
      Qselect_Import.Open;

      if Qselect_Import.IsEmpty then
        begin
          MessageDlg('Aucune données Excel disponible',mtInformation,[mbok],0);
        end else
        begin
          sg.RowCount := Qselect_Import.RecordCount +1;
          Lbnbre.Caption := IntToStr(Qselect_Import.RecordCount);

          for I := 1 to Qselect_Import.RecordCount do
            with Qselect_Import, sg do
              begin
                Cells[0,i] := FieldByName('num_credit').AsString ;
                Cells[1,i] := FieldByName('code_client').AsString;
                Cells[2,i] := FieldByName('compte_client').AsString;
                Cells[3,i] := FieldByName('nom_client').AsString;
                Cells[4,i] := FieldByName('Montant').AsString;
                Cells[5,i] := FieldByName('date_operation').AsString;
                Cells[6,i] := FieldByName('code_gestionnaire').AsString;
                Qselect_Import.Next;
              end;
        end;
        finally
             Qselect_Import.Free;
        end;
end;

procedure TfrmImport_data.FormCreate(Sender: TObject);
begin
with sg do
  begin
    Cells[0,0] := 'N°Crédit';
    Cells[1,0] := 'N°Membre';
    Cells[2,0] := 'N°Compte';
    Cells[3,0] := 'Nom Membre';
    Cells[4,0] := 'Montant';
    Cells[5,0] := 'Date Opé';
    Cells[6,0] := 'Gest';
  end;
end;

procedure TfrmImport_data.sgDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
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
