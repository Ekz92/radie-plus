unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Comp.Client, Data.DBXMySQL, Data.SqlExpr,records;

type
  TDM = class(TDataModule)
    Con_SAF: TADOConnection;
    Con_Radie: TADOConnection;
    SQLConnection1: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure DeleteFirstLine(Psql : string);
    function truncateTable(Psql : string):Boolean;


    procedure InsertCredit(cr : TCredit);
    function SelectCredit(Psql : string):TCreditArray;
  end;

var
  DM: TDM;
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UEtat_par_gestionnaire, URech_rembourssement, UGraph, USituation_generale;

{$R *.dfm}
function TDM.truncateTable(Psql : string):boolean;
var
  query : TSQLQuery;
begin
  Query := TSQLQuery.Create(Self);
  Query.SQLConnection := DM.SQLConnection1;

  try
    query.SQL.Add(Psql);
    query.ExecSQL;
  finally
    query.Free;
  end;

end;
procedure TDM.InsertCredit(cr : TCredit);
var
  Query : TADOQuery;
  Sql : string;
begin
  Query := TADOQuery.Create(Self);
  Query.Connection := DM.Con_Radie;


  with cr do
    begin
      Sql := 'Set dateformat ymd '
            +'Insert into cr_credit(num_credit,cod_credit,date_debloc,montant_credit,'
            +'montant_paye, solde_old, interet_calc, solde, cod_client, compte_client,'
            +'nom_client,code_gest,gest_old,date_radie ) values ('
            +IntToStr(Nnum_credit)+','
            +Scod_credit+','
            +Sdate_debloc +','
            +FloatToStr(Rmontant_credit)+','
            +FloatToStr(Rmontant_paye)+','
            +FloatToStr(Rsolde_old)+','
            +FloatToStr(Rinteret_calc)+','
            +FloatToStr(Rsolde)+','
            +Scod_client+','
            +Scompte_client+','
            +Snom_client+','
            +Scode_gest+','
            +Sgest_old+','
            +Sdate_radie+');'
    end;

  try

    Query.SQL.Add(Sql);
    Query.ExecSQL();
  finally
    Query.Free;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
{ADOConnection1.ConnectionString:='Provider=SQLNCLI10.1;Persist Security Info=False;User ID=conn1;password=saf;Initial Catalog="saf_fucec_00002000";Data Source=10.100.70.187';
ADOConnection1.LoginPrompt :=false;
ADOConnection1.Connected :=true;
if ADOConnection1.Connected then
}
end;
procedure TDM.DeleteFirstLine(Psql : string);
var
  Query : TSQLQuery;
begin
  Query := TSQLQuery.Create(Self);
  Query.SQLConnection := DM.SQLConnection1;

  try
    Query.SQL.Add(Psql);
    Query.ExecSQL();
  finally
    Query.Free;
  end;
end;

function TDM.SelectCredit(Psql : string):TCreditArray;
var
  Query : TADOQuery;
  sql : string;
  Credit : TCredit;
  Credits : TCreditArray;
  i : integer;
begin
  Query := TADOQuery.Create(Self);
  Query.Connection := DM.Con_Radie;

  sql := 'Select * from CR_CREDIT '+Psql;

  try
    Query.SQL.Add('Set dateformat ymd');
    Query.SQL.Add(sql);
 //   Query.SQL.SaveToFile('g:\credit.txt');
    Query.Open;
    i:=0;
     with query do
      begin
        while not Eof do
          begin
            SetLength(Credits,i+1);
            with Credit do
              begin
                Nnum_credit:=FieldByName('num_credit').AsInteger;
                Scod_credit:=FieldByName('cod_credit').AsString;
                Sdate_debloc :=FieldByName('date_debloc').AsString;
                Rmontant_credit := FieldByName('montant_credit').AsFloat;
                Rmontant_paye:=FieldByName('montant_paye').AsFloat;
                Rsolde_old:=FieldByName('solde_old').AsFloat;
                Rinteret_calc:=FieldByName('interet_calc').AsFloat;
                Rsolde := FieldByName('solde').AsFloat;
                Scod_client := FieldByName('cod_client').AsString;
                Scompte_client := FieldByName('compte_client').AsString;
                Snom_client:=FieldByName('nom_client').AsString;
                Scode_gest := FieldByName('code_gest').AsString;
                Sgest_old := FieldByName('gest_old').AsString;
                Sdate_radie := FieldByName('date_radie').AsString
              end;
              Credits[i]:=Credit;
              Inc(i);
              query.Next;
          end;
          Result := Credits;
      end;


  finally
    Query.Free;
  end;
end;
end.

