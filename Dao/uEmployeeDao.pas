unit uEmployeeDao;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, SqlExpr, DBXpress ,StrUtils, inifiles,UConnectBank,uEmployee,uPersonDao,DB,DBClient;

type

  TEmployeeDao = class(TPersonDao)
  private
    procedure insertEmployee(poObj:TEmployee);
  public
    constructor Create;
    destructor  Destroy; override;

    procedure save(poObj:TEmployee);
    function ListPerson(obj:TEmployee):string;
    function PesquisarPessoa(obj:TEmployee):OleVariant;
    procedure DeleteEmployee(poObj:TEmployee);
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

{ TEmployeeDao }

constructor TEmployeeDao.Create;
begin
  inherited Create;
end;

procedure TEmployeeDao.DeleteEmployee(poObj: TEmployee);
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('DELETE FROM Person WHERE IdentNr = ' + QuotedStr(poObj.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poObj.typePerson));
  sqlGeral.ExecSQL;
end;

destructor TEmployeeDao.Destroy;
begin

  inherited;
end;

procedure TEmployeeDao.insertEmployee(poObj: TEmployee);
var
 Trans: TTransactionDesc;
 idPessoa:Integer;
 idKomto:Integer;
begin
  Conexao.GetConexao.StartTransaction(Trans);
  try
    insert(poObj,poObj.firstName,poObj.surename);
    idPessoa := selectUltimoId;

    sqlGeral.Close;
    sqlGeral.SQL.Clear;
    sqlGeral.SQL.Add('INSERT INTO Employee ');
    sqlGeral.SQL.Add(' VALUES (:Department_idDepartment, :Person_idPerson)');
    sqlGeral.ParamByName('Department_idDepartment').AsInteger := poObj.department;
    sqlGeral.ParamByName('Person_idPerson').AsInteger := idPessoa;
    sqlGeral.ExecSQL;
    Conexao.GetConexao.Commit(Trans);
  Except
    Conexao.GetConexao.Rollback(Trans);
    Raise;
  end;
end;

function TEmployeeDao.ListCombo: string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select * from Department');
  Result := sqlGeral.SQL.GetText;
end;

function TEmployeeDao.ListPerson(obj: TEmployee): string;
begin
  sqlGeral.Close;
  sqlGeral.SQL.Clear;
  sqlGeral.SQL.Add('select P.idPerson, P.IdentNr, P.namePerson,P.firstName,P.surename,D.department,P.idpersonTypes from Employee E ');
  sqlGeral.SQL.Add('left join Person P ON E.Person_idPerson = P.idPerson ');
  sqlGeral.SQL.Add('Left join Department D ON D.idDepartment = E.Department_idDepartment ');
  sqlGeral.SQL.Add('where p.idpersonTypes = ' + IntToStr(obj.typePerson));
  Result := sqlGeral.SQL.GetText;
end;

function TEmployeeDao.PesquisarPessoa(obj: TEmployee): OleVariant;
begin

end;

procedure TEmployeeDao.save(poObj: TEmployee);
var
 oDataset:TDataSet;
begin
  oDataset := SelectPersonId(poObj);
  if oDataset.IsEmpty then
  begin
    insertEmployee(poObj);
    Exit;
  end;

  UpdatePersonId(poObj,poObj.firstName,poObj.surename);
end;

procedure TEmployeeDao.saveService(psService: string);
begin

end;

end.
