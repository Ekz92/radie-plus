unit UListe_CR_RADIE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Menus;

type
  TfrmListe_credit_radie_intervale = class(TForm)
    ST_liste_CR: TStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edcode_gest: TEdit;
    cbgest: TComboBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    D1: TDateTimePicker;
    D2: TDateTimePicker;
    Bevel1: TBevel;
    cbIntervale: TComboBox;
    cbTout_gest: TCheckBox;
    cbtout_Intervale: TCheckBox;
    PopupMenu1: TPopupMenu;
    Imprimer1: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    lbnbre_ligne: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure cbTout_gestClick(Sender: TObject);
    procedure cbtout_IntervaleClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure affiche_gest()  ;
    procedure cbgestCloseUp(Sender: TObject);
    procedure moin_1million_gest();
    procedure moin_1million_sans_gest();
    procedure entre_1et5_million_gest();
    procedure entre_1et5_million_sans_gest();
    procedure entre_5et10_million_gest();
    procedure entre_5et10_million_sans_gest();
    procedure _10etplus_million_gest();
    procedure _10etplus_million_sans_gest()  ;
    procedure Tout_intervale();
    procedure Tout_intervale_tout_gest();
    procedure ST_liste_CRDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmListe_credit_radie_intervale: TfrmListe_credit_radie_intervale;
  String_sql : string;

implementation

{$R *.dfm}

uses UDM;
//************************pour < 1 mllion*********************************************
procedure TfrmListe_credit_radie_intervale.moin_1million_gest()  ;
begin
        String_sql := 'Select * from CR_Credit '
        +' where solde_old <= '+IntToStr(1000000)
        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;

procedure TfrmListe_credit_radie_intervale.moin_1million_sans_gest()  ;
begin
        String_sql:='Select * from CR_Credit '
        +' where solde_old <= '+IntToStr(1000000)
//        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
//***************************************************Entre 1 et 5 millions ********************************************
procedure TfrmListe_credit_radie_intervale.entre_1et5_million_gest()  ;
begin
        String_sql:= 'Select * from CR_Credit '
        +' where solde_old between '+IntToStr(1000000)+' and '+IntToStr(5000000)
        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;

procedure TfrmListe_credit_radie_intervale.entre_1et5_million_sans_gest()  ;
begin
        String_sql := 'Select * from CR_Credit '
        +' where solde_old between '+IntToStr(1000000)+' and '+IntToStr(5000000)
//        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
//********************************************Entre 5 et 10 millions******************************
procedure TfrmListe_credit_radie_intervale.entre_5et10_million_gest()  ;
begin
        String_sql:='Select * from CR_Credit '
        +' where solde_old between '+IntToStr(5000000)+' and '+IntToStr(10000000)
        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;

procedure TfrmListe_credit_radie_intervale.entre_5et10_million_sans_gest()  ;
begin
        String_sql := 'Select * from CR_Credit '
        +' where solde_old between '+IntToStr(5000000)+' and '+IntToStr(10000000)
//        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
//******************************************** 10 millions et plus *************************************
procedure TfrmListe_credit_radie_intervale._10etplus_million_gest()  ;
begin
        String_sql:='Select * from CR_Credit '
        +' where solde_old >= '+IntToStr(10000000)
        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
procedure TfrmListe_credit_radie_intervale._10etplus_million_sans_gest()  ;
begin
        String_sql:='Select * from CR_Credit '
        +' where solde_old >= '+IntToStr(10000000)
//        +' and gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
//****************************************Tout intervalle*********** ********************************
procedure TfrmListe_credit_radie_intervale.Tout_intervale();
begin
        String_sql:='Select * from CR_Credit '
        +' where gest_old = '+QuotedStr(edcode_gest.Text)
        +' and date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
//********************************** Tout intervale, tout gestionnaire***********************************
procedure TfrmListe_credit_radie_intervale.Tout_intervale_tout_gest();
begin
        String_sql:='Select * from CR_Credit '
        +' where date_radie between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date));
end;
//*************************************************************************************************************
procedure TfrmListe_credit_radie_intervale.cbgestCloseUp(Sender: TObject);
var
  Qselect_code : TADOQuery;
begin
  Qselect_code:=TADOQuery.Create(self);
  Qselect_code.Connection:=dm.Con_Radie;

  with Qselect_code,SQL do
    begin
      Add('select code_gest from INIT_GESTIONNAIRE where nom_gest =  '+QuotedStr(cbgest.Text));
    end;

    try
      Qselect_code.Open;
      if not Qselect_code.IsEmpty then
        edcode_gest.Text := Qselect_code.Fields[0].Value
      else
        begin

        end;
    finally
      Qselect_code.Free;
    end;

end;

procedure TfrmListe_credit_radie_intervale.cbTout_gestClick(Sender: TObject);
begin
if cbTout_gest.Checked then
  begin
    edcode_gest.Clear;
    edcode_gest.Enabled:=false;
    cbgest.Enabled:=False
  end else
  begin
    edcode_gest.Enabled:=true;
    cbgest.Enabled :=true
  end;
end;

procedure TfrmListe_credit_radie_intervale.cbtout_IntervaleClick(Sender: TObject);
begin
if cbtout_Intervale.Checked then
  begin
    cbIntervale.ItemIndex:=-1;
    cbIntervale.Enabled:=False
  end else
  begin
    cbIntervale.Enabled:=true;
  end;
end;

procedure TfrmListe_credit_radie_intervale.affiche_gest();
var
  Qselect_gest : TADOQuery;
  I: integer;
begin
  d1.SetFocus;
  Qselect_gest:=TADOQuery.Create(self);
  Qselect_gest.Connection:=dm.Con_Radie;

  with Qselect_gest,SQL do
    begin
      Add('select * from INIT_GESTIONNAIRE order by nom_GEST asc ');
    end;

    try
      Qselect_gest.Open;

      for I := 0 to Qselect_gest.RecordCount - 1 do
        begin
          cbgest.Items.Add(Qselect_gest.FieldByName('nom_GEST').AsString);
          Qselect_gest.Next;
        end;
    finally
      Qselect_gest.Free;
    end;
end;


procedure TfrmListe_credit_radie_intervale.FormCreate(Sender: TObject);
begin
  with ST_liste_CR do
    begin
      Cells[0,0] := 'N°Crédit';
      Cells[1,0] := 'Type';
      Cells[2,0] := 'Code clt';
      Cells[3,0] := 'Client';
      Cells[4,0] := 'Mnt. radié';
      Cells[5,0] := 'Date radié';
    end;
end;

procedure TfrmListe_credit_radie_intervale.FormShow(Sender: TObject);
begin
  affiche_gest();
  cbTout_gest.Checked:=True;
  D2.Date:=Now;
end;

procedure TfrmListe_credit_radie_intervale.SpeedButton1Click(Sender: TObject);
var
  Qselect : TADOQuery;
  i : integer;
begin
  lbnbre_ligne.Caption:='0';
  Qselect:=TADOQuery.Create(self);
  Qselect.Connection := dm.Con_Radie;

//*********************moins d'1million*****************
  if (cbIntervale.ItemIndex = 0) and (cbTout_gest.Checked=true) then
    moin_1million_sans_gest()
  else
  if (cbIntervale.ItemIndex = 0) and (cbTout_gest.Checked = false) then
    moin_1million_gest()
  else
  if (cbIntervale.ItemIndex = 1) and (cbTout_gest.Checked = true) then
    entre_1et5_million_sans_gest()
  else
  if (cbIntervale.ItemIndex =1)and(cbTout_gest.Checked = false) then
    entre_1et5_million_gest()
  else
  if (cbIntervale.ItemIndex = 2)and(cbTout_gest.Checked = true) then
    entre_5et10_million_sans_gest()
  else
  if (cbIntervale.ItemIndex =2)and(cbTout_gest.Checked = false) then
    entre_5et10_million_gest()
  else
  if (cbIntervale.ItemIndex =3)and(cbTout_gest.Checked = true) then
    _10etplus_million_sans_gest()
  else
  if (cbIntervale.ItemIndex =3)and(cbTout_gest.Checked = false) then
    _10etplus_million_gest()
  else
  if (cbtout_Intervale.Checked = true) and (cbTout_gest.Checked = false) then
    Tout_intervale()
  else
  if (cbtout_Intervale.Checked = true) and (cbTout_gest.Checked = true) then
    Tout_intervale_tout_gest();

  with Qselect,SQL do
    begin
      Add('SET DATEFORMAT ymd');
      Add(String_sql);
//      SaveToFile('D:\cbIntervale.txt');
    end;

    try
      Qselect.Open;
      ST_liste_CR.RowCount := Qselect.RecordCount +1;
      if (ST_liste_CR.RowCount > 1) then ST_liste_CR.FixedRows :=1;
      
      for I := 1 to Qselect.RecordCount do
        with ST_liste_CR do
          begin
            Cells[0,i] := Qselect.FieldByName('num_credit').AsString;
            Cells[1,i] := Qselect.FieldByName('cod_credit').AsString;
            Cells[2,i] := Qselect.FieldByName('cod_client').AsString;
            Cells[3,i] := Qselect.FieldByName('nom_client').AsString;
            Cells[4,i] := Qselect.FieldByName('solde_old').AsString;
            Cells[5,i] := Qselect.FieldByName('date_radie').AsString;
            Qselect.Next;
            lbnbre_ligne.Caption :=IntToStr(i);
          end;
    finally
        Qselect.Free;
    end;


end;

procedure TfrmListe_credit_radie_intervale.ST_liste_CRDrawCell(Sender: TObject; ACol,
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
