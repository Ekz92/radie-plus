unit UListeGeneCredit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Buttons, frxClass, frxDBSet, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  Vcl.Menus;

type
  TfrmListeGeneCredit = class(TForm)
    ST_liste_CR: TStringGrid;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edNumCredit: TEdit;
    edNumMembre: TEdit;
    Label3: TLabel;
    edNom: TEdit;
    Label4: TLabel;
    edNumCompte: TEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    lbNbLigne: TLabel;
    SpeedButton2: TSpeedButton;
    QCredit: TADOQuery;
    frxDBCredit: TfrxDBDataset;
    frxCredit: TfrxReport;
    D1: TDateTimePicker;
    D2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    cbPeriode: TCheckBox;
    PopupMenu1: TPopupMenu;
    Imprimerlaligne1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ST_liste_CRDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cbPeriodeClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmListeGeneCredit: TfrmListeGeneCredit;

implementation

{$R *.dfm}

uses records, UDM;

procedure TfrmListeGeneCredit.cbPeriodeClick(Sender: TObject);
begin
  if cbPeriode.Checked then
    begin
      d1.Enabled:=true;
      d2.Enabled:=true;
    end
    else
    begin
      d1.Enabled:=false;
      d2.Enabled:=False;
    end;
end;

procedure TfrmListeGeneCredit.FormCreate(Sender: TObject);
begin
  with ST_liste_CR do
    begin
      Cells[0,0] := 'N°Crédit';
      Cells[1,0] := 'Type';
      Cells[2,0] := 'Code clt';
      Cells[3,0] := 'Client';
      Cells[4,0] := 'Mnt. radié';
      Cells[5,0] := 'Solde';
      Cells[6,0] := 'Date radié';
    end;

end;

procedure TfrmListeGeneCredit.FormShow(Sender: TObject);
var
  credits : TCreditArray;
  i : integer;
  Psql : string;
begin
  Psql := '';

  credits := dm.SelectCredit(Psql);
  ST_liste_CR.RowCount := Length(credits)+1;

  for I := Low(credits) to High(credits) do
    begin
      with ST_liste_CR do
        begin
          Cells[0,i+1]:=IntToStr(credits[i].Nnum_credit);
          Cells[1,i+1]:=credits[i].Scod_credit;
          Cells[2,i+1]:=credits[i].Scod_client;
          Cells[3,i+1]:=credits[i].Snom_client;
          Cells[4,i+1]:=FloatToStr(credits[i].Rsolde_old);
          Cells[5,i+1]:=FloatToStr(credits[i].Rsolde);
          Cells[6,i+1]:=credits[i].Sdate_radie;
        end;
    end;
  lbNbLigne.Caption := IntToStr(Length(credits)-1)+' Lignes trouvées';
end;

procedure TfrmListeGeneCredit.SpeedButton1Click(Sender: TObject);
var
  credits : TCreditArray;
  i : integer;
  Psql : string;
begin
  if cbPeriode.Checked then
    begin
      Psql := ' where num_credit like '+QuotedStr('%'+edNumCredit.Text+'%')
              +' and compte_client like '+QuotedStr('%'+edNumCompte.Text+'%')
              +' and cod_client like '+QuotedStr('%'+edNumMembre.Text+'%')
              +' and nom_client like '+QuotedStr('%'+edNom.Text+'%')
              +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)+' 00:00:00')
              +                    ' and ' +QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date)+' 23:59:00')
              ;
    end else
    begin
      Psql := ' where num_credit like '+QuotedStr('%'+edNumCredit.Text+'%')
              +' and compte_client like '+QuotedStr('%'+edNumCompte.Text+'%')
              +' and cod_client like '+QuotedStr('%'+edNumMembre.Text+'%')
              +' and nom_client like '+QuotedStr('%'+edNom.Text+'%')
              ;    
    end;
    
  credits := dm.SelectCredit(Psql);
  ST_liste_CR.RowCount := Length(credits)+1;
  if (ST_liste_CR.RowCount>1) then ST_liste_CR.FixedRows := 1;
  
  for I := Low(credits) to High(credits) do
    begin
      with ST_liste_CR do
        begin
          Cells[0,i+1]:=IntToStr(credits[i].Nnum_credit);
          Cells[1,i+1]:=credits[i].Scod_credit;
          Cells[2,i+1]:=credits[i].Scod_client;
          Cells[3,i+1]:=credits[i].Snom_client;
          Cells[4,i+1]:=FloatToStr(credits[i].Rsolde_old);
          Cells[5,i+1]:=FloatToStr(credits[i].Rsolde);
          Cells[6,i+1]:=credits[i].Sdate_radie;
        end;
    end;

    lbNbLigne.Caption := IntToStr(Length(credits))+' Lignes trouvées';
end;

procedure TfrmListeGeneCredit.SpeedButton2Click(Sender: TObject);
var
  psql : string;
begin
//  QCredit := TADOQuery.Create(self);
//  QCredit.Connection:=dm.Con_Radie;

  Psql := ' Select * from cr_credit where num_credit like '+QuotedStr(edNumCredit.Text+'%')
          +' and compte_client like '+QuotedStr(edNumCompte.Text+'%')
          +' and cod_client like '+QuotedStr(edNumMembre.Text+'%')
          +' and nom_client like '+QuotedStr(edNom.Text+'%')
          ;

    try
      QCredit.SQL.Clear;
      QCredit.SQL.Add(psql);
      QCredit.Open;
      frxCredit.ShowReport();
    finally                  
//      QCredit.Free;  
    end;

end;


procedure TfrmListeGeneCredit.ST_liste_CRDrawCell(Sender: TObject; ACol,
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
