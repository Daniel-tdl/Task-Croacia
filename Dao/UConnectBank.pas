unit UConnectBank;

interface

uses
  SqlExpr, inifiles, SysUtils, Forms;

type

   TConexaoBanco = class

      private
       FConexaoBanco : TSQLConnection;
      public
       constructor Create;
       destructor  Destroy; override;
       function GetConexao : TSQLConnection;

       property ConexaoBanco : TSQLConnection   read GetConexao;
   end;

implementation

{ TConexaoBanco }

constructor TConexaoBanco.Create;
  var ArquivoINI, HostName, DataBase, DriverName, UserName, PassWord : string;
  LocalServer : Integer;
  Configuracoes : TIniFile;
begin
    ArquivoINI := ExtractFilePath(Application.ExeName) + '\config.ini';

    if not FileExists(ArquivoINI) then
    begin
       Exit;
    end;

   // Carregando as informações do arquivo de configurações
   Configuracoes := TIniFile.Create(ArquivoINI);
   Try
     HostName   := Configuracoes.ReadString('Dados', 'HostName',   HostName);
     DataBase    := Configuracoes.ReadString('Dados', 'DataBase',   DataBase);
     DriverName := Configuracoes.ReadString('Dados', 'DriverName', DriverName);
     UserName   := Configuracoes.ReadString('Dados', 'UserName',   UserName);
     PassWord   := Configuracoes.ReadString('Dados', 'PassWord',   PassWord);
   Finally
     Configuracoes.Free;
   end;

   try
      FConexaoBanco := TSQLConnection.Create(Application);
      FConexaoBanco.DriverName := 'MSSQL';
      FConexaoBanco.ConnectionName := 'MSSQLConnection';
      FConexaoBanco.GetDriverFunc := 'getSQLDriverMSSQL';
      FConexaoBanco.LibraryName := 'dbexpmss.dll';
      FConexaoBanco.VendorLib := 'oledb';
      FConexaoBanco.LoginPrompt := False;
      FConexaoBanco.Params.Add('SchemaOverride=sa.dbo');
      FConexaoBanco.Params.Add('HostName=DESKTOP');
      FConexaoBanco.Params.Add('DataBase=DBNAME');
      FConexaoBanco.Params.Add('OS Authentication=False');
      FConexaoBanco.Params.Add('User_Name=UserName');
      FConexaoBanco.Params.Add('Password=Password');
      //FConexaoBanco.Params.Add('MSSQL TransIsolation=ReadCommited');
     //

     FConexaoBanco.Connected  := False;
     FConexaoBanco.Params.Values['DriverName'] := DriverName;
     FConexaoBanco.Params.Values['HostName']   :=  HostName;
     FConexaoBanco.Params.Values['DataBase']   := DataBase;
     FConexaoBanco.Params.Values['User_Name']  := UserName;
     FConexaoBanco.Params.Values['Password']   := PassWord;
     FConexaoBanco.Connected  := True;
   except
     //Erro('Erro ao Conectar o Banco de dados. Verifique as preferencias do sistema!');
     Exception.Create('Erro ao Conectar o Banco de dados. Verifique as preferencias do sistema!');
   end;
end;

destructor TConexaoBanco.Destroy;
begin
  FConexaoBanco.Free;
  inherited;
end;

function TConexaoBanco.GetConexao: TSQLConnection;
begin
   Result := FConexaoBanco;
end;

end.
