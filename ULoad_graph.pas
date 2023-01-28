unit ULoad_graph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmLoadGraph = class(TForm)
    cbgestionnaire: TComboBox;
    edCode_gest: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    D1: TDateTimePicker;
    D2: TDateTimePicker;
    CheckBox1: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure cbgestionnaireCloseUp(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmLoadGraph: TfrmLoadGraph;

implementation

{$R *.dfm}

uses UDM, UGraph;

procedure TfrmLoadGraph.cbgestionnaireCloseUp(Sender: TObject);
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

procedure TfrmLoadGraph.CheckBox1Click(Sender: TObject);
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

procedure TfrmLoadGraph.FormActivate(Sender: TObject);
var
  Qselect_gest : TADOQuery;
  I: integer;
begin
  d1.SetFocus;
  cbgestionnaire.Items.Clear;

  D1.MaxDate := Now;
  D2.MaxDate := Now;

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

procedure TfrmLoadGraph.FormShow(Sender: TObject);
begin
CheckBox1.Checked:=True;
D2.Date:=Now;
end;

procedure TfrmLoadGraph.SpeedButton1Click(Sender: TObject);
var
  Qinsert,
  QDel : TADOQuery;
begin
  frmGraph.ADOTable1.close;
  frmGraph.ADOTable1.Open;

  QDel:=TADOQuery.Create(self);
  QDel.Connection := dm.Con_Radie;

  with QDel,SQL do
    begin
      Add('truncate table CR_GRAPH')
    end;

    try
      QDel.ExecSQL;
    finally
      QDel.Free;
    end;
//********************************************************************************
  Qinsert:=TADOQuery.Create(self);
  Qinsert.Connection := dm.Con_Radie;

  if CheckBox1.Checked then
      with Qinsert,SQL do
        begin
          Add('SET DATEFORMAT ymd');
          Add('Insert into CR_GRAPH '
              +' select cast(date_paye AS DATE) as date1, sum(payement), code_gest'
              +' from CR_DETAILS_PAYE '
              +' where date_paye between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)+' 00:00:00')+' and ' +QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date)+' 23:59:00')
              +' group by cast(date_paye AS DATE),code_gest order by cast(date_paye AS DATE)');
//              SaveToFile('g:\group.txt');
        end
    else
      begin
        with Qinsert,SQL do
          begin
            Add('SET DATEFORMAT ymd');
            Add('Insert into CR_GRAPH '
                +' select cast(date_paye AS DATE) as date1, sum(payement), code_gest'
                +' from CR_DETAILS_PAYE '
                +' where date_paye between '+QuotedStr(FormatDateTime('yyyy-mm-dd',d1.Date)+' 00:00:00')+' and ' +QuotedStr(FormatDateTime('yyyy-mm-dd',d2.Date)+' 23:59:00')
                +' and code_gest = '+QuotedStr(edCode_gest.Text)
                +' group by cast(date_paye AS DATE),code_gest order by cast(date_paye AS DATE)');
//                SaveToFile('g:\group.txt');
          end
      end;


    try
      Qinsert.ExecSQL;
    finally
      Qinsert.Free;
    end;
   frmGraph.ShowModal;
end;
end.
