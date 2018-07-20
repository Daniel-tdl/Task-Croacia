unit uTravelerDao;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, SqlExpr, DBXpress ,StrUtils, inifiles,UConnectBank,uTraveler,uPersonDao,DB,DBClient;

type

  TTravelerDao = class(TPersonDao)
  private
    procedure insertTraveler(poObj:TTraveler);
  public
    constructor Create;
    destructor  Destroy; override;

    procedure save(poObj:TTraveler);
    function ListPerson(obj:TTraveler):string;
    function PesquisarPessoa(obj:TTraveler):OleVariant;
    procedure DeleteTraveler(poObj:TTraveler);
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

{ TTravelerDao }

constructor TTravelerDao.Create;
begin
  inherited Create;
end;

procedure TTravelerDao.DeleteTraveler(poObj: TTraveler);
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('DELETE FROM Person WHERE IdentNr = ' + QuotedStr(poObj.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poObj.typePerson));
  sqlGeral.ExecSQL;
end;

destructor TTravelerDao.Destroy;
begin

  inherited;
end;

procedure TTravelerDao.insertTraveler(poObj: TTraveler);
var
 Trans: TTransactionDesc;
 idPessoa:Integer;
begin
  Conexao.GetConexao.StartTransaction(Trans);
  try
    insert(poObj,poObj.firstName,poObj.surename);
    idPessoa := selectUltimoId;

    sqlGeral.Close;
    sqlGeral.SQL.Clear;
    sqlGeral.SQL.Add('INSERT INTO Traveler ');
    sqlGeral.SQL.Add(' VALUES (:Country_idCountry, :Person_idPerson)');
    sqlGeral.ParamByName('Country_idCountry').AsInteger := poObj.country;
    sqlGeral.ParamByName('Person_idPerson').AsInteger := idPessoa;
    sqlGeral.ExecSQL;
    Conexao.GetConexao.Commit(Trans);
  Except
    Conexao.GetConexao.Rollback(Trans);
    Raise;
  end;
end;

function TTravelerDao.ListCombo: string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select * from Country');
  Result := sqlGeral.SQL.GetText;
end;

function TTravelerDao.ListPerson(obj: TTraveler): string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select P.idPerson, P.IdentNr, P.namePerson,P.firstName,P.surename, C.country,P.idpersonTypes from Traveler T ');
  sqlGeral.SQL.Add('left join Person P ON T.Person_idPerson = P.idPerson ');
  sqlGeral.SQL.Add('Left join Country C ON C.idCountry = T.Country_idCountry ');
  sqlGeral.SQL.Add('where p.idpersonTypes = ' + IntToStr(obj.typePerson));
  Result := sqlGeral.SQL.GetText;
end;

function TTravelerDao.PesquisarPessoa(obj: TTraveler): OleVariant;
begin

end;

procedure TTravelerDao.save(poObj: TTraveler);
var
 oDataset:TDataSet;
begin
  oDataset := SelectPersonId(poObj);
  if oDataset.IsEmpty then
  begin
    insertTraveler(poObj);
    Exit;
  end;

  UpdatePersonId(poObj,poObj.firstName,poObj.surename);
end;

procedure TTravelerDao.saveService(psService: string);
begin

end;

end.
