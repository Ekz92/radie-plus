unit URech_CR_paye;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Data.DB,
  Data.Win.ADODB;

type
  TfrmRech_CR_paye = class(TForm)
    Label1: TLabel;
    edrech: TEdit;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edrechKeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmRech_CR_paye: TfrmRech_CR_paye;
  vNum_membre,
  vNum_compte,
  vNum_credit,
  vNomP :string;

  vMont_CR,
  vMont_Paye,
  vInteret,
  vSolde : real;

implementation

{$R *.dfm}

uses UDM, Upayement;

procedure TfrmRech_CR_paye.edrechKeyPress(Sender: TObject; var Key: Char);
VAR
  QSelect_compte : TADOQuery;
  I: Integer;
begin
  QSelect_compte:=TADOQuery.Create(self);
  QSelect_compte.Connection := dm.Con_Radie;

  with QSelect_compte,sql do
    begin
      Add('Select * from CR_CREDIT WHERE COD_CLIENT like '+QuotedStr(edrech.Text) );
    end;

if key = #13 then
  begin
      try
        QSelect_compte.Open;

        if NOT QSelect_compte.IsEmpty then
           begin
              StringGrid1.RowCount := QSelect_compte.RecordCount +1;

              for I := 1 to QSelect_compte.RecordCount do
                with StringGrid1, QSelect_compte do
                  begin
                    Cells[0,i] := FieldByName('NUM_CREDIT').AsString;
                    Cells[1,i] := FieldByName('cod_credit').AsString;

                    Cells[2,i] := FieldByName('COD_CLIENT').AsString;
 //                   Cells[3,i] := FieldByName('COMPTE_CLIENT').AsString;
                    Cells[3,i] := FieldByName('NOM_CLIENT').AsString;
//                    Cells[4,i] := FieldByName('MON_SALDO').AsString;

                    QSelect_compte.Next ;


                  end;
           end else
           begin
             MessageDlg('Aucune ligne trouvée',mtInformation,[mbok],0);
             StringGrid1.RowCount :=2;
           end;
      finally
        QSelect_compte.Free;
      end;
  end;
end;

procedure TfrmRech_CR_paye.FormCreate(Sender: TObject);
begin
with StringGrid1 do
  begin
    Cells[0,0]:='N° Crédit';
    Cells[1,0]:='Type';
    Cells[2,0]:='N°Membre';
//    Cells[3,0]:='N°Compte';
    Cells[3,0]:='Nom';
//    Cells[5,0]:='Solde';
  end;

end;

procedure TfrmRech_CR_paye.StringGrid1DblClick(Sender: TObject);
VAR
  QSelect_compte_SAF,
  QSelect_compte_RP : TADOQuery;
  I: Integer;
begin
  QSelect_compte_SAF:=TADOQuery.Create(self);
  QSelect_compte_SAF.Connection := dm.Con_SAF;

  QSelect_compte_RP:=TADOQuery.Create(self);
  QSelect_compte_RP.Connection := dm.Con_Radie;

  WITH QSelect_compte_RP,sql do
    begin
      Add('Select * from CR_CREDIT WHERE COD_client = '+QuotedStr(StringGrid1.Cells[2,StringGrid1.Row]));
    end;



      try
       QSelect_compte_RP.Open;
          with QSelect_compte_RP do
            begin
              vNum_membre := FieldByName('cod_client').AsString;
              vNum_compte := FieldByName('compte_client').AsString;
              vNum_credit := FieldByName('num_credit').AsString;
              vNomP       := FieldByName('nom_client').AsString;
              vMont_CR    := FieldByName('montant_credit').AsFloat;
              vMont_Paye  := FieldByName('montant_paye').AsFloat;
              vInteret    := FieldByName('interet_calc').AsFloat;
              vSolde      := FieldByName('solde').AsFloat;

            end;
      finally
       QSelect_compte_RP.Free;
      end;

    WITH frmPayement_CR do
      begin
        ednum_membre.Text   := vNum_membre;
        ednum_compte.Text   := vNum_compte;
        edcredit.Text       := vNum_credit;
        ednom.Text          := vNomP;

        edmont_cr.Text  := FloatToStrF(vMont_CR,ffNumber,15,2)+' F';
        edmon_paye.Text := FloatToStrF(vMont_Paye,ffNumber,15,2)+' F';
        edsolde.Text    := FloatToStrF(vSolde,ffNumber,15,2)+' F';
        edInteret.Text  := FloatToStrF(vInteret,ffNumber,15,2)+' F';

        if vSolde = 0 then
          begin
            edmontant.Enabled := false;
            edmontant.Color :=$009D96FE ;
            edmontant.Text := 'Soldé';
          end
        else
          begin
            edmontant.Enabled := true;
            edmontant.ParentColor :=True;
            edmontant.Clear;
          end

      end;

    close;
end;

procedure TfrmRech_CR_paye.StringGrid1DrawCell(Sender: TObject; ACol,
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
