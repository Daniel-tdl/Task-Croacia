unit uClientDao;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, SqlExpr, DBXpress ,StrUtils, inifiles,UConnectBank,uClient,uPersonDao,uKontoDao,DB,DBClient;

type

  TClientDao = class(TPersonDao)
  private
    procedure insertClient(poClient:TClient);
  public
    constructor Create;
    destructor  Destroy; override;

    procedure save(poClient:TClient);
    function ListPerson(obj:TClient):string;
    function PesquisarPessoa(obj:TClient):OleVariant;
    procedure DeleteClient(poClient:TClient);
  end;

implementation

constructor TClientDao.Create;
begin
  inherited Create;
end;

procedure TClientDao.DeleteClient(poClient: TClient);
var
  oKonto:TKontoDao;
begin
  oKonto := TKontoDao.Create(Conexao);
  try
    oKonto.Delete(poClient.KontoNr);
  finally
    FreeAndNil(oKonto);
  end;

  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('DELETE FROM Person WHERE IdentNr = ' + QuotedStr(poClient.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poClient.typePerson));
  sqlGeral.ExecSQL;
end;

destructor TClientDao.Destroy;
begin
  inherited;
end;

procedure TClientDao.insertClient(poClient: TClient);
var
 Trans: TTransactionDesc;
 idPessoa:Integer;
 idKomto:Integer;
 oKonto:TKontoDao;
begin
  Conexao.GetConexao.StartTransaction(Trans);
  try
    insert(poClient,poClient.firstName,poClient.surename);
    idPessoa := selectUltimoId;
    oKonto := TKontoDao.Create(Conexao);
    try
      oKonto.insert(poClient.KontoNr);
      idKomto := oKonto.selectUltimoId;
    finally
      FreeAndNil(oKonto);
    end;

    sqlGeral.Close;
    sqlGeral.SQL.Clear;
    sqlGeral.SQL.Add('INSERT INTO Client ');
    sqlGeral.SQL.Add(' VALUES (:Person_idPerson, :Konto_idKonto)');
    sqlGeral.ParamByName('Person_idPerson').AsInteger := idPessoa;
    sqlGeral.ParamByName('Konto_idKonto').AsInteger := idKomto;
    sqlGeral.ExecSQL;
    Conexao.GetConexao.Commit(Trans);
  Except
    Conexao.GetConexao.Rollback(Trans);
    Raise;
  end;
end;

function TClientDao.ListPerson(obj: TClient): string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select p.idPerson as ID, p.IdentNr, p.namePerson, k.KontoNr, idpersonTypes,');
  sqlGeral.SQL.Add('(select pt.TypesName from PersonTypes pt where pt.idpersonTypes = p.idPerson) as TypeName from Client c ');
  sqlGeral.SQL.Add('left join Konto k ON c.Konto_idKonto = k.idKonto ');
  sqlGeral.SQL.Add('left join Person p ON c.Person_idPerson = p.idPerson ');
  sqlGeral.SQL.Add('where p.idpersonTypes = ' + IntToStr(obj.typePerson));
  Result := sqlGeral.SQL.GetText;
end;

function TClientDao.PesquisarPessoa(obj: TClient): OleVariant;
var
  i:Integer;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('SELECT * FROM PERSON WHERE IdentNr = ' + QuotedStr(obj.IdentNr) + ' AND idpersonTypes = ' + IntToStr(obj.typePerson));
  sqlGeral.Open;
  i := sqlGeral.FieldByName('idPerson').AsInteger ;
  Result := TClientDataset(sqlGeral).Data ;
end;

procedure TClientDao.save(poClient: TClient);
var
 oDataset:TDataSet;
begin
  oDataset := SelectPersonId(poClient);
  if oDataset.IsEmpty then
  begin
    insertClient(poClient);
    Exit;
  end;

  UpdatePersonId(poClient,poClient.firstName,poClient.surename);
end;


end.
