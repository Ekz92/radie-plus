unit UAdd_credit_rad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmAddCreditRad = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edNumCredit: TEdit;
    edmntCredit: TEdit;
    edMntPaye: TEdit;
    edSolde: TEdit;
    cbTypeCredit: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edInteret: TEdit;
    Label10: TLabel;
    edSoldeRadie: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    dateDebloc: TDateTimePicker;
    edcodeClt: TEdit;
    edCompteClt: TEdit;
    edNomClt: TEdit;
    edGestionnaire: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAddCreditRad: TfrmAddCreditRad;

implementation

{$R *.dfm}

uses UDM, records;

procedure TfrmAddCreditRad.Button1Click(Sender: TObject);
var
  cr : TCredit;
begin
  with cr do
    begin
      Nnum_credit := StrToInt(edNumCredit.Text);
      Scod_credit := QuotedStr(cbTypeCredit.Text);
      Sdate_debloc := QuotedStr(FormatDateTime('yyyy-mm-dd',dateDebloc.Date));
      Rmontant_credit := StrToFloat(edmntCredit.Text);
      Rmontant_paye := StrToFloat(edMntPaye.Text);
      Rsolde_old := StrToFloat(edSolde.Text);
      Rinteret_calc := StrToFloat(edInteret.Text);
      Rsolde := StrToFloat(edSoldeRadie.Text);
      Scod_client := QuotedStr(edcodeClt.Text);
      Scompte_client := QuotedStr(edCompteClt.Text);
      Snom_client := QuotedStr(edNomClt.Text);
      Scode_gest := QuotedStr('DEF');
      Sgest_old := QuotedStr(edGestionnaire.Text);
      Sdate_radie := QuotedStr(FormatDateTime('yyyy-mm-dd',Date));
    end;
    if (edNumCredit.Text<>'') and (edcodeClt.Text<>'') then
      begin
        dm.InsertCredit(cr);
        Button2.Click;
      end else
      begin
        MessageDlg('Tous les champs sont obligatoires.',mtError,[mbRetry],0);
      end;
end;

procedure TfrmAddCreditRad.Button2Click(Sender: TObject);
begin
edNumCredit.Clear;
edmntCredit.Clear;
edMntPaye.Clear;
edSolde.Clear;
edInteret.Clear;
edSoldeRadie.Clear;
edcodeClt.Clear;
edCompteClt.Clear;
edNomClt.Clear;
edGestionnaire.Clear;
end;

end.
