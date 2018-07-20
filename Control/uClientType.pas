unit uClientType;

interface

uses
  uTypePersonInterface,uPerson,Windows,DB;

type
  TClientType = class(TInterfacedObject,ITypePerson)
    procedure Save(obj:TObject);
    procedure Delete(obj:TObject);
    function ListPerson(obj:TObject):string;
    function PesquisarPessoa(obj:TObject):OleVariant;
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

uses
  uClient,forms, SysUtils,Dialogs,uClientDao;

{ TClientFactory }

procedure TClientType.Delete(obj: TObject);
var
  oCliente:TClientDao;
begin
  oCliente := TClientDao.Create;
  try
    oCliente.DeleteClient((obj as TClient));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TClientType.ListPerson(obj: TObject): string;
var
  oCliente:TClientDao;
begin
  oCliente := TClientDao.Create;
  try
    result := oCliente.ListPerson((obj as TClient));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TClientType.ListCombo: string;
begin

end;

function TClientType.PesquisarPessoa(obj: TObject): OleVariant;
var
  oCliente:TClientDao;
begin
  try
    oCliente := TClientDao.Create;
    Result := oCliente.PesquisarPessoa((obj as TClient));
  finally
    FreeAndNil(oCliente);
  end;
end;

procedure TClientType.Save(obj: TObject);
var
  oCliente:TClientDao;
begin
  try
    try
      oCliente := TClientDao.Create;
      oCliente.save((obj as TClient));
    finally
      FreeAndNil(oCliente);
    end;

    ShowMessage('Saved successfully.');
  except
    ShowMessage('Error saving.');
    raise;
  end;
end;

procedure TClientType.saveService(psService: string);
begin

end;

end.
