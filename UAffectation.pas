unit UAffectation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.Buttons, Data.DB, Data.Win.ADODB;

type
  TfrmAffectation = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CB_User: TComboBox;
    edCode_user: TEdit;
    Splitter1: TSplitter;
    St_depart: TStringGrid;
    St_arrivee: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure St_departDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure St_departDblClick(Sender: TObject);
    procedure CB_UserCloseUp(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure St_departDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure St_arriveeDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAffectation: TfrmAffectation;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmAffectation.CB_UserCloseUp(Sender: TObject);
var
  QCod_USAGER : TADOQuery;
begin
  QCod_USAGER := TADOQuery.Create(self);
  QCod_USAGER.Connection := dm.Con_Radie;

  with QCod_USAGER , SQL do
    begin
      Add('select * from CR_GESTIONNAIRE where nom_gest = '+QuotedStr(CB_User.Text));
      //SaveToFile('D:\toto.txt');
    end;

    try
      QCod_USAGER.Open;
      edCode_user.Text := QCod_USAGER.FieldByName('code_gest').AsString;
    finally
      QCod_USAGER.Free;
    end;
end;

procedure TfrmAffectation.FormActivate(Sender: TObject);
var
  QSelect,
  QUsager : TADOQuery;
  I: integer;
begin
//--------------------------Liste des crédits radiés-----------
  QSelect := TADOQuery.Create(self);
  QSelect.Connection := dm.Con_Radie;

  with QSelect,SQL do
    begin
      Add('select * from CR_CREDIT '
          +' where code_gest = '+QuotedStr('nul')
          +' order by num_credit asc');
//          SaveToFile('d:\num_credit.txt');
    end;

    try
      QSelect.Open;
      St_depart.RowCount := QSelect.RecordCount +1;
      for I := 1 to QSelect.RecordCount do
        with QSelect , St_depart do
          begin
            Cells[0,i] := FieldByName('num_credit').AsString;
            Cells[1,i] := FieldByName('cod_client').AsString;
            Cells[2,i] := FieldByName('nom_client').AsString;
            QSelect.Next;
          end;

    finally
      QSelect.Free;
    end;

//------------------------Liste des usager---------------------
  QUsager := TADOQuery.Create(self);
  QUsager.Connection := dm.Con_Radie;

  with QUsager , SQL do
    begin
      Add('select * from CR_GESTIONNAIRE order by nom_GEST asc');
    end;
    try
      QUsager.Open ;
      for I := 1 to QUsager.RecordCount do
        begin
          CB_User.Items.Add(QUsager.FieldByName('nom_gest').AsString);
          QUsager.Next;
        end;

    finally

    end;


end;

procedure TfrmAffectation.FormCreate(Sender: TObject);
begin
with St_depart do
  begin
    Cells[0,0] := 'Crédit' ;
    Cells[1,0] := 'Membre' ;
    Cells[2,0] := 'Nom membre'
  end;

  with St_arrivee do
  begin
    Cells[0,0] := 'Crédit' ;
    Cells[1,0] := 'Membre' ;
    Cells[2,0] := 'Nom membre'
  end;
end;

procedure TfrmAffectation.SpeedButton5Click(Sender: TObject);
var
  QUpdate_CR : TADOQuery;
  i :integer;
begin
  St_arrivee.RowCount := St_arrivee.RowCount-1;

if MessageDlg('Voulez-vous constituer le portefeuil de ce gestionnnaire??',mtConfirmation,[mbyes,mbno],0)=mryes then
begin
  for I := 1 to St_arrivee.RowCount-1 do
    begin

      QUpdate_CR := TADOQuery.Create(self);
      QUpdate_CR.Connection := dm.Con_Radie;

      with QUpdate_CR,SQL do
        begin
          Add('Update CR_CREDIT set code_gest = '+QuotedStr(edCode_user.Text)
              +' where num_credit = '+St_arrivee.Cells[0,i]
          ) ;
        end;
        try
           QUpdate_CR.ExecSQL;
        finally
          QUpdate_CR.Free;
        end;
    end;
    MessageDlg('L''opération s''est déroulée avec succès !!!',mtConfirmation,[mbok],0);
    St_arrivee.RowCount:=2;
    St_arrivee.Rows[1].Clear;
end;
end;

procedure TfrmAffectation.St_arriveeDrawCell(Sender: TObject; ACol,
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

procedure TfrmAffectation.St_departDblClick(Sender: TObject);
  var
    A : integer;
  I: Integer;
begin
  A := St_arrivee.RowCount-1 ;

  St_arrivee.Cells[0,A] := St_depart.Cells[0,St_depart.Row];
  St_arrivee.Cells[1,A] := St_depart.Cells[1,St_depart.Row];
  St_arrivee.Cells[2,A] := St_depart.Cells[2,St_depart.Row];

  St_arrivee.RowCount := St_arrivee.RowCount +1;

  for I := St_depart.Row to St_depart.RowCount do
    with St_depart do
      begin
        Rows[i]:=Rows[i+1];
      end;
  St_depart.RowCount := St_depart.RowCount -1;

end;

procedure TfrmAffectation.St_departDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var
    A : integer;
begin
  A := St_arrivee.RowCount+2 ;
  St_arrivee.RowCount := St_arrivee.RowCount +1;

  St_arrivee.Cells[0,A] := St_depart.Cells[0,St_depart.Row];
  St_arrivee.Cells[1,A] := St_depart.Cells[1,St_depart.Row];
  St_arrivee.Cells[2,A] := St_depart.Cells[2,St_depart.Row];

//  A := A+2;
end;

procedure TfrmAffectation.St_departDrawCell(Sender: TObject; ACol,
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
