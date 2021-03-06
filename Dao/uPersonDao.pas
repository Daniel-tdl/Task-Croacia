unit uPersonDao;

interface
uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, SqlExpr,  StrUtils, inifiles,UConnectBank,uPerson,DB,DBClient;

type
  TPersonDao = class
  private
    FConexao  : TConexaoBanco;
    FSqqGeral : TSQLQuery;
    function GetSqkGeral: TSQLQuery;
    function GetConexao: TConexaoBanco;
  public
    constructor Create;
    destructor  Destroy; override;

    procedure insert(const poPerson: TPerson; const psfirstName:string; const psSurename:string);
    function selectUltimoId: integer;
    function SelectPersonId(const poPerson:TPerson):TDataSet;
    function SelectPerson:TDataSet;
    procedure UpdatePersonId(const poPerson: TPerson; const psfirstName:string; const psSurename:string);
    procedure DeletPersonId(const poPerson:TPerson);
  published
      property sqlGeral: TSQLQuery read GetSqkGeral;
      property Conexao: TConexaoBanco read GetConexao;
  end;

implementation


{ TPersonDao }

constructor TPersonDao.Create;
begin
    FConexao  := TConexaoBanco.Create;
   FSqqGeral := TSQLQuery.Create(Application);
   FSqqGeral.SQLConnection := FConexao.ConexaoBanco;
end;

destructor TPersonDao.Destroy;
begin
  FreeAndNil(FSqqGeral);
  inherited;
end;

function TPersonDao.GetConexao: TConexaoBanco;
begin
  Result := FConexao;
end;

function TPersonDao.GetSqkGeral: TSQLQuery;
begin
  Result := FSqqGeral;
end;

procedure TPersonDao.insert(const poPerson: TPerson; const psfirstName:string; const psSurename:String);
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('INSERT INTO Person');
  FSqqGeral.SQL.Add(' VALUES('+ QuotedStr(poPerson.name)+', '+ QuotedStr(poPerson.IdentNr)+', '+ QuotedStr(psfirstName)+', '
                              + QuotedStr(psSurename)+',' + IntToStr(poPerson.typePerson) +')');
  FSqqGeral.ExecSQL;
end;

function TPersonDao.SelectPerson: TDataSet;
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('SELECT * FROM PERSON ');
  Result := FSqqGeral.DataSource.DataSet;
end;

function TPersonDao.SelectPersonId(const poPerson:TPerson): TDataSet;
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('SELECT * FROM PERSON WHERE IdentNr = '+ QuotedStr(poPerson.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poPerson.typePerson));
  FSqqGeral.Open;
  Result := FSqqGeral
end;

function TPersonDao.selectUltimoId: integer;
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('select top 1 idPerson from Person order by idPerson desc');
  FSqqGeral.Open;
  Result := FSqqGeral.FieldByName('idPerson').AsInteger;
end;

procedure TPersonDao.UpdatePersonId(const poPerson: TPerson; const psfirstName:string; const psSurename:string);
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('UPDATE Person SET ');
  FSqqGeral.SQL.Add(' namePerson = ' + QuotedStr(poPerson.name) + ', firstName = ' + QuotedStr(psfirstName) + ', surename = '  + QuotedStr(psSurename) + ', idpersonTypes = ' + IntToStr(poPerson.typePerson) + ' where IdentNr = ' + QuotedStr(poPerson.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poPerson.typePerson));
  FSqqGeral.ExecSQL;
end;

procedure TPersonDao.DeletPersonId(const poPerson:TPerson);
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('DELETE FROM Person WHERE IdentNr = ' + QuotedStr(poPerson.IdentNr) + ' AND idpersonTypes = ' + IntToStr(poPerson.typePerson));
  FSqqGeral.ExecSQL;
end;

end.
