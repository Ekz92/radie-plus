unit URech_rembourssement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB, frxClass, frxDBSet, Vcl.Imaging.pngimage, Vcl.Menus;

type
  TfrmRech_ERemboursement = class(TForm)
    ednum: TEdit;
    ednom: TEdit;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Image1: TImage;
    Label1: TLabel;
    Label4: TLabel;
    frxEtat_par_membre: TfrxReport;
    QDetail: TADOQuery;
    frxDBDetail_paye: TfrxDBDataset;
    PopupMenu1: TPopupMenu;
    Historique1: TMenuItem;
    Nouveaupaiement1: TMenuItem;
    QdbHeader: TfrxDBDataset;
    QHeader: TADOQuery;
    QHeaderid_credit: TAutoIncField;
    QHeadernum_credit: TIntegerField;
    QHeadercod_credit: TStringField;
    QHeaderdate_debloc: TDateTimeField;
    QHeadermontant_credit: TBCDField;
    QHeadermontant_paye: TBCDField;
    QHeadersolde_old: TBCDField;
    QHeaderinteret_calc: TBCDField;
    QHeadersolde: TBCDField;
    QHeadercod_client: TStringField;
    QHeadercompte_client: TStringField;
    QHeadernom_client: TStringField;
    QHeadercode_gest: TStringField;
    QHeadergest_old: TStringField;
    QHeaderdate_radie: TDateTimeField;
    QDetailid_cr_dp: TAutoIncField;
    QDetailnum_credit: TIntegerField;
    QDetailnum_membre: TStringField;
    QDetailnum_compte: TStringField;
    QDetailnom_membre: TStringField;
    QDetailpayement: TBCDField;
    QDetaildate_paye: TDateTimeField;
    QDetailusager: TStringField;
    QDetailcode_gest: TStringField;
    QDetailid_credit: TAutoIncField;
    QDetailnum_credit_1: TIntegerField;
    QDetailcod_credit: TStringField;
    QDetaildate_debloc: TDateTimeField;
    QDetailmontant_credit: TBCDField;
    QDetailmontant_paye: TBCDField;
    QDetailsolde_old: TBCDField;
    QDetailinteret_calc: TBCDField;
    QDetailsolde: TBCDField;
    QDetailcod_client: TStringField;
    QDetailcompte_client: TStringField;
    QDetailnom_client: TStringField;
    QDetailcode_gest_1: TStringField;
    QDetailgest_old: TStringField;
    QDetaildate_radie: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure ednumKeyPress(Sender: TObject; var Key: Char);
    procedure rech_par_num();
    procedure rech_par_nom();
    procedure ednomKeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Historique1Click(Sender: TObject);
    procedure Nouveaupaiement1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmRech_ERemboursement: TfrmRech_ERemboursement;

implementation

{$R *.dfm}

uses UDM, URech_CR_paye, Upayement;

procedure TfrmRech_ERemboursement.ednomKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    rech_par_nom();
  end;
end;

procedure TfrmRech_ERemboursement.ednumKeyPress(Sender: TObject; var Key: Char);
begin
{if not (key in ['0'..'9','.',#8,#13]) then
key := #0;}

if key = #13 then
  begin
    rech_par_num();
  end;

end;
procedure TfrmRech_ERemboursement.rech_par_nom();
  var
    QSelect : TADOQuery;
  I: Integer;
begin
    QSelect:=TADOQuery.Create(self);
    QSelect.Connection := dm.Con_Radie;

    with QSelect.SQL do
      begin
        Add('SELECT * FROM CR_CREDIT WHERE NOM_CLIENT LIKE '+QuotedStr(ednom.Text+'%'));
      end;

      try
        QSelect.Open;

              StringGrid1.RowCount := 2;
              StringGrid1.Rows[1].Clear;

        for I := 1 to QSelect.RecordCount do
          with QSelect ,StringGrid1 do
            begin
              StringGrid1.RowCount := QSelect.RecordCount+1;
              Cells[0,i] := QSelect.FieldByName('cod_client').AsString;
              Cells[1,i] := QSelect.FieldByName('nom_client').AsString;
              Cells[2,i] := QSelect.FieldByName('montant_credit').AsString;
              Cells[3,i] := QSelect.FieldByName('montant_paye').AsString;
              Cells[4,i] := QSelect.FieldByName('solde').AsString;

              QSelect.Next;
            end;

      finally
        QSelect.Free;
      end;

end;


procedure TfrmRech_ERemboursement.rech_par_num();
  var
    QSelect : TADOQuery;
  I: Integer;
begin
    QSelect:=TADOQuery.Create(self);
    QSelect.Connection := dm.Con_Radie;

    with QSelect.SQL do
      begin
        Add('SELECT * FROM CR_CREDIT WHERE COD_CLIENT LIKE '+QuotedStr(ednum.Text));
      end;

              StringGrid1.RowCount := 2;
              StringGrid1.Rows[1].Clear;

      try
        QSelect.Open;

        for I := 1 to QSelect.RecordCount do
          with QSelect ,StringGrid1 do
            begin
              StringGrid1.RowCount := QSelect.RecordCount+1;
              Cells[0,i] := QSelect.FieldByName('cod_client').AsString;
              Cells[1,i] := QSelect.FieldByName('nom_client').AsString;
              Cells[2,i] := QSelect.FieldByName('montant_credit').AsString;
              Cells[3,i] := QSelect.FieldByName('montant_paye').AsString;
              Cells[4,i] := QSelect.FieldByName('solde').AsString;
              QSelect.Next;

            end;

      finally
        QSelect.Free;
      end;

end;
procedure TfrmRech_ERemboursement.StringGrid1DblClick(Sender: TObject);
begin
{  QDetail.SQL.Clear;
  QDetail.SQL.Add('Select * from CR_CREDIT C, CR_DETAILS_PAYE D'
                  +' Where C.num_credit = D.num_credit'
                  +' And D.num_membre = '+StringGrid1.Cells[0,StringGrid1.Row]
                  );

  QDetail.Open;
  frxEtat_par_membre.ShowReport();
  }
end;

procedure TfrmRech_ERemboursement.StringGrid1DrawCell(Sender: TObject; ACol,
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

procedure TfrmRech_ERemboursement.FormCreate(Sender: TObject);
begin
with StringGrid1 do
  begin
    Cells[0,0] := 'N° Membre';
    Cells[1,0] := 'Nom membre';
    Cells[2,0] := 'Mont. Crédit';
    Cells[3,0] := 'Mont. payé';
    Cells[4,0] := 'Solde';
  end;
end;

procedure TfrmRech_ERemboursement.Historique1Click(Sender: TObject);
begin
  QDetail.SQL.Clear;
  QDetail.SQL.Add('Select * from CR_CREDIT C, CR_DETAILS_PAYE D'
                  +' Where C.num_credit = D.num_credit'
                  +' And D.num_membre = '+StringGrid1.Cells[0,StringGrid1.Row]
                  );

  QHeader.SQL.Clear;
  QHeader.SQL.Add('Select * from CR_CREDIT Where cod_client = '+StringGrid1.Cells[0,StringGrid1.Row]);

  QHeader.Open;
  QDetail.Open;
  frxEtat_par_membre.ShowReport();

end;

procedure TfrmRech_ERemboursement.Nouveaupaiement1Click(Sender: TObject);
begin
  with  frmPayement_CR , StringGrid1 do
    begin
      ednum_membre.Text := Cells[0,row];
      ednum_compte.Text := Cells[1,row];
      ShowModal;
    end;
end;

end.
