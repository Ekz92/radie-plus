unit UGestionnaire;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  Tfrmgestionnaire = class(TForm)
    Liste: TPageControl;
    Nouveau: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edcode: TEdit;
    ednom: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StringGrid1: TStringGrid;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    Modifier1: TMenuItem;
    Supprimer1: TMenuItem;
    Image1: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Liste_gestionnaire();
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmgestionnaire: Tfrmgestionnaire;

implementation

{$R *.dfm}

uses UDM;

procedure Tfrmgestionnaire.FormActivate(Sender: TObject);
begin
Liste_gestionnaire();
end;

procedure Tfrmgestionnaire.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
    begin
      Cells[0,0] := 'Code';
      Cells[1,0] := 'Nom & prénom';
    end;
        
end;

procedure Tfrmgestionnaire.SpeedButton1Click(Sender: TObject);
var
  QInset_gest : TADOQuery;
begin

  QInset_gest:=TADOQuery.Create(self);
  QInset_gest.Connection := dm.Con_Radie;

  with QInset_gest,SQL do
    begin
      Add('Insert into CR_GESTIONNAIRE(code_gest,nom_gest) VALUES('
          +QuotedStr(Trim(edcode.Text))+','
          +QuotedStr(Trim(ednom.Text))
          +')')
    end;
    try
      QInset_gest.ExecSQL;    
      ShowMessage('Utilisateur créé avec succès.')  ;
      Liste_gestionnaire();
    finally
      QInset_gest.Free;
    end;

end;

procedure Tfrmgestionnaire.StringGrid1DrawCell(Sender: TObject; ACol,
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

procedure Tfrmgestionnaire.Liste_gestionnaire();
var
  QListe_gestionnaire : TADOQuery;
   i : integer ;
begin
  QListe_gestionnaire:=TADOQuery.Create(self);
  QListe_gestionnaire.Connection := dm.Con_Radie ;

  with QListe_gestionnaire,SQL do
    begin
      Add('select * from CR_GESTIONNAIRE');
    end;

    try
      QListe_gestionnaire.Open;
      StringGrid1.RowCount:= QListe_gestionnaire.RecordCount +1;

      for I := 1 to QListe_gestionnaire.RecordCount do
        with StringGrid1 do
          begin
            Cells[0,i] := QListe_gestionnaire.FieldByName('code_gest').AsString;
            Cells[1,i] := QListe_gestionnaire.FieldByName('nom_gest').AsString; 
            QListe_gestionnaire.Next;         
          end;
                      
    finally                            
      QListe_gestionnaire.Free;
    end;
  
end;

end.
