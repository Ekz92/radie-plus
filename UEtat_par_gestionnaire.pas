unit UEtat_par_gestionnaire;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, frxClass, frxDBSet;

type
  TfrmEtat_par_gestionnaire = class(TForm)
    cbgestionnaire: TComboBox;
    edcode_gest: TEdit;
    Bevel1: TBevel;
    d1: TDateTimePicker;
    d2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    frxREtat_gest: TfrxReport;
    frxDBREtat_gest: TfrxDBDataset;
    QEtat_gest: TADOQuery;
    CheckBox1: TCheckBox;
    frxREtat_Tgest: TfrxReport;
    procedure FormActivate(Sender: TObject);
    procedure cbgestionnaireCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmEtat_par_gestionnaire: TfrmEtat_par_gestionnaire;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmEtat_par_gestionnaire.cbgestionnaireCloseUp(Sender: TObject);
var
  Qselect_code : TADOQuery;
begin
  Qselect_code:=TADOQuery.Create(self);
  Qselect_code.Connection:=dm.Con_Radie;

  with Qselect_code,SQL do
    begin
      Add('select code_gest from CR_GESTIONNAIRE where nom_gest =  '+QuotedStr(cbgestionnaire.Text));
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

procedure TfrmEtat_par_gestionnaire.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
  begin
    edcode_gest.Clear;
    edcode_gest.Enabled:=false;
    cbgestionnaire.Enabled:=False
  end else
  begin
    edcode_gest.Enabled:=true;
    cbgestionnaire.Enabled :=true
  end;

end;

procedure TfrmEtat_par_gestionnaire.FormActivate(Sender: TObject);
var
  Qselect_gest : TADOQuery;
  I: integer;
begin
  d1.SetFocus;
  Qselect_gest:=TADOQuery.Create(self);
  Qselect_gest.Connection:=dm.Con_Radie;

  with Qselect_gest,SQL do
    begin
      Add('select * from CR_GESTIONNAIRE order by nom_GEST asc ');
    end;

    try
      Qselect_gest.Open;

      for I := 0 to Qselect_gest.RecordCount - 1 do
        begin
          cbgestionnaire.Items.Add(Qselect_gest.FieldByName('nom_GEST').AsString);
          Qselect_gest.Next;
        end;
    finally
      Qselect_gest.Free;
    end;
end;

procedure TfrmEtat_par_gestionnaire.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
cbgestionnaire.Clear;
end;

procedure TfrmEtat_par_gestionnaire.FormShow(Sender: TObject);
begin
d2.Date:=Now;
CheckBox1.Checked:=True;
end;

procedure TfrmEtat_par_gestionnaire.SpeedButton1Click(Sender: TObject);
var
  Date1,Date2,M_statut : TfrxMemoView;
  Component: TfrxComponent;
begin
  with QEtat_gest.SQL do
    begin
      if CheckBox1.Checked then
        begin
          Clear;
          Add('Set dateformat ymd');
          Add('select * from CR_DETAILS_PAYE '
              +' where date_paye between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)+' 00:00:00')+' and ' +QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date)+' 23:59:00')
              );
        end else
        begin
          Clear;
          Add('Set dateformat ymd');
          Add('select * from CR_DETAILS_PAYE where Code_gest = '+QuotedStr(edcode_gest.Text)
              +' and date_paye between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)+' 00:00:00')+' and ' +QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date)+' 23:59:00')
                );
        end;
    end;

//****************************** Affichage date1 pour gestionnaire ***********************
Component := frxREtat_gest.FindObject('Date1');
  if Component is TfrxMemoView then
  begin
        Date1 := Component as TfrxMemoView;
        Date1.Text := DateToStr(D1.DateTime);
  end;
//****************************** Affichage date1 pour gestionnaire***********************
Component := frxREtat_gest.FindObject('Date2');
  if Component is TfrxMemoView then
  begin
        Date2 := Component as TfrxMemoView;
        Date2.Text := DateToStr(d2.DateTime);
  end;
//****************************** Affichage date1 pour tous gestionnaires ***********************
Component := frxREtat_Tgest.FindObject('Date1');
  if Component is TfrxMemoView then
  begin
        Date1 := Component as TfrxMemoView;
        Date1.Text := DateToStr(D1.DateTime);
  end;
//****************************** Affichage date1 pour tous gestionnaires***********************
Component := frxREtat_Tgest.FindObject('Date2');
  if Component is TfrxMemoView then
  begin
        Date2 := Component as TfrxMemoView;
        Date2.Text := DateToStr(d2.DateTime);
  end;

    try
      QEtat_gest.Open;
      if CheckBox1.Checked then
        frxREtat_Tgest.ShowReport() else frxREtat_gest.ShowReport();
    finally

    end;
end;

end.
