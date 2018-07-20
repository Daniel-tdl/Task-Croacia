unit uSupplierDao;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, SqlExpr, DBXpress ,StrUtils, inifiles,UConnectBank,uSupplier,uPersonDao,uKontoDao,DB,DBClient;

type

  TSupplierDao = class(TPersonDao)
  private
    procedure insertSupplier(poObj:TSupplier);
  public
    constructor Create;
    destructor  Destroy; override;

    procedure save(poObj:TSupplier);
    function ListPerson(obj:TSupplier):string;
    function PesquisarPessoa(obj:TSupplier):OleVariant;
    procedure DeleteSupplier(poObj:TSupplier);
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

{ TClientDao }


{ TSupplierDao }

constructor TSupplierDao.Create;
begin
  inherited Create;
end;

procedure TSupplierDao.DeleteSupplier(poObj: TSupplier);
var
  oKonto:TKontoDao;
begin
  oKonto := TKontoDao.Create(Conexao);
  try
    oKonto.Delete(poObj.KontoNr);
  finally
    FreeAndNil(oKonto);
  end;

  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('DELETE FROM Person WHERE IdentNr = ' + QuotedStr(poObj.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poObj.typePerson));
  sqlGeral.ExecSQL;
end;

destructor TSupplierDao.Destroy;
begin
  inherited;
end;

procedure TSupplierDao.insertSupplier(poObj: TSupplier);
var
 Trans: TTransactionDesc;
 idPessoa:Integer;
 idKomto:Integer;
 oKonto:TKontoDao;
begin
  Conexao.GetConexao.StartTransaction(Trans);
  try
    insert(poObj,poObj.firstName,poObj.surename);
    idPessoa := selectUltimoId;
    oKonto := TKontoDao.Create(Conexao);
    try
      oKonto.insert(poObj.KontoNr);
      idKomto := oKonto.selectUltimoId;
    finally
      FreeAndNil(oKonto);
    end;

    sqlGeral.Close;
    sqlGeral.SQL.Clear;
    sqlGeral.SQL.Add('INSERT INTO Supplier ');
    sqlGeral.SQL.Add(' VALUES (:Person_idPerson, :Konto_idKonto, :Service_idService)');
    sqlGeral.ParamByName('Person_idPerson').AsInteger := idPessoa;
    sqlGeral.ParamByName('Konto_idKonto').AsInteger := idKomto;
    sqlGeral.ParamByName('Service_idService').AsInteger := poObj.service;
    sqlGeral.ExecSQL;
    Conexao.GetConexao.Commit(Trans);
  Except
    Conexao.GetConexao.Rollback(Trans);
    Raise;
  end;
end;

function TSupplierDao.ListPerson(obj: TSupplier): string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select P.idPerson, P.IdentNr, P.namePerson,SS.serviceDes,K.KontoNr,P.idpersonTypes,SS.idService from Supplier S ');
  sqlGeral.SQL.Add('left join Person P ON S.Person_idPerson = P.idPerson ');
  sqlGeral.SQL.Add('Left join Konto K ON K.idKonto = S.Konto_idKonto ');
  sqlGeral.SQL.Add('Left join Servicee SS ON SS.idService = S.Service_idService ');
  sqlGeral.SQL.Add('where p.idpersonTypes = ' + IntToStr(obj.typePerson));
  Result := sqlGeral.SQL.GetText;
end;

function TSupplierDao.ListCombo: string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select * from Servicee');
  Result := sqlGeral.SQL.GetText;
end;

function TSupplierDao.PesquisarPessoa(obj: TSupplier): OleVariant;
begin

end;

procedure TSupplierDao.save(poObj: TSupplier);
var
 oDataset:TDataSet;
begin
  oDataset := SelectPersonId(poObj);
  if oDataset.IsEmpty then
  begin
    insertSupplier(poObj);
    Exit;
  end;

  UpdatePersonId(poObj,poObj.firstName,poObj.surename);
end;

procedure TSupplierDao.saveService(psService: string);
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('INSERT INTO SERVICEE VALUES (' + QuotedStr(psService) + ')');
  sqlGeral.ExecSQL;
end;

end.
