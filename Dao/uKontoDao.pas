unit uKontoDao;

interface

uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, SqlExpr,  StrUtils, inifiles,UConnectBank,uClient;

type
  TKontoDao = class
  private
    FSqqGeral : TSQLQuery;
  public
    constructor Create(const conection:TConexaoBanco);
    destructor  Destroy; override;

    procedure insert(const psKontoNr:string);
    procedure Delete(const psKontoNr:string);
    function selectUltimoId: integer;
    procedure Update(const poKonto:TClient;const psKontoNr: string);
  end;

implementation

{ TKonto }

constructor TKontoDao.Create(const conection: TConexaoBanco);
begin
   FSqqGeral := TSQLQuery.Create(Application);
   FSqqGeral.SQLConnection := conection.GetConexao;
end;

procedure TKontoDao.Delete(const psKontoNr: string);
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('DELETE FROM Konto WHERE KontoNr = ' + QuotedStr(psKontoNr));
  FSqqGeral.ExecSQL;
end;

destructor TKontoDao.Destroy;
begin
   FreeAndNil(FSqqGeral);
  inherited;
end;

procedure TKontoDao.insert(const psKontoNr: string);
begin
  FSqqGeral.Close;
    FSqqGeral.SQL.Clear;
    FSqqGeral.SQL.Add('INSERT INTO Konto ');
    FSqqGeral.SQL.Add(' VALUES('+ QuotedStr(psKontoNr) +')');
    FSqqGeral.ExecSQL;
end;

function TKontoDao.selectUltimoId: integer;
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('select top 1 idKonto from Konto order by idKonto desc');
  FSqqGeral.Open;
  Result := FSqqGeral.FieldByName('idKonto').AsInteger;
end;

procedure TKontoDao.Update(const poKonto:TClient;const psKontoNr: string);
begin
  FSqqGeral.Close;
  FSqqGeral.SQL.Clear;
  FSqqGeral.SQL.Add('UPDATE Konto SET KontoNr = ' + poKonto.KontoNr + ' WHERE KontoNr = ' + QuotedStr(psKontoNr));
  FSqqGeral.ExecSQL;
end;

end.
