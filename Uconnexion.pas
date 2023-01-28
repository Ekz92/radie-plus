unit Uconnexion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmConnexion = class(TForm)
    SB_conn: TSpeedButton;
    lblogin: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edlogin: TEdit;
    edpwd: TEdit;
    CheckBox1: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure edpwdKeyPress(Sender: TObject; var Key: Char);
    procedure SB_connClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmConnexion: TfrmConnexion;
  vUsager : string;

implementation

{$R *.dfm}

uses UDM, UIntegrateur;

procedure TfrmConnexion.edpwdKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    SB_conn.Click;

end;

procedure TfrmConnexion.FormActivate(Sender: TObject);
begin
{
  dm.Con_SAF.ConnectionTimeout := 0;
  dm.Con_SAF.ConnectionString:='Provider=SQLNCLI10.1;Persist Security Info=False;User ID=sa;password=saf;Initial Catalog="saf_fucec_00002000";Data Source=127.0.0.1';
  dm.Con_SAF.LoginPrompt :=false;
  dm.Con_SAF.Connected :=true;
}
  //Connexion de radie plus

  dm.Con_Radie.ConnectionTimeout :=0;
  dm.Con_Radie.ConnectionString:='Provider=SQLNCLI10.1;Persist Security Info=False;User ID=sa;password=saf;Initial Catalog="RADIE_PLUS";Data Source=127.0.0.1';
  dm.Con_Radie.LoginPrompt :=false;
  dm.Con_Radie.Connected :=true;

end;

procedure TfrmConnexion.Label4Click(Sender: TObject);
begin
if MessageDlg('Voulez-vous fermer Radie Plus ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  Application.Terminate;

end;

procedure TfrmConnexion.SB_connClick(Sender: TObject);
var
  RUser : TADOQuery;
  conn : integer;
begin
  RUser:=TADOQuery.Create(self);
  RUser.Connection := dm.Con_Radie;
  RUser.CommandTimeout := 0;

  with RUser, SQL do
    begin
      Add('Select * from CR_USER Where usager = '+QuotedStr(edlogin.Text)
            +' and motdepass = '+QuotedStr(edpwd.Text)
       );
    end;

      try
        RUser.Open;
        if not RUser.IsEmpty then
          Conn := 1
        else
          conn := 0
      finally
        RUser.Free;
      end;

  if Conn = 1 then
    begin
      vUsager := edlogin.Text;
      frmIntegrateur.ShowModal;
    end else
      MessageDlg('Login ou mot de passe incorrect', mtError,[mbRetry],0);

end;

end.
