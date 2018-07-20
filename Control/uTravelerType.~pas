unit uTravelerType;

interface

uses
  uTypePersonInterface,uPerson,Windows,DB;

type
  TTravelerType = class(TInterfacedObject,ITypePerson)
    procedure Save(obj:TObject);
    procedure Delete(obj:TObject);
    function ListPerson(obj:TObject):string;
    function PesquisarPessoa(obj:TObject):OleVariant;
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

uses
  uSupplier,forms, SysUtils,Dialogs,uTravelerDao,uTraveler;

{ TTravelerType }

procedure TTravelerType.Delete(obj: TObject);
var
  oCliente:TTravelerDao;
begin
  oCliente := TTravelerDao.Create;
  try
    oCliente.DeleteTraveler((obj as TTraveler));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TTravelerType.ListCombo: string;
var
  oCliente:TTravelerDao;
begin
  try
    oCliente := TTravelerDao.Create;
    Result := oCliente.ListCombo;
  finally
    FreeAndNil(oCliente);
  end;
end;

function TTravelerType.ListPerson(obj: TObject): string;
var
  oCliente:TTravelerDao;
begin
  oCliente := TTravelerDao.Create;
  try
    result := oCliente.ListPerson((obj as TTraveler));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TTravelerType.PesquisarPessoa(obj: TObject): OleVariant;
var
  oCliente:TTravelerDao;
begin
  try
    oCliente := TTravelerDao.Create;
    Result := oCliente.PesquisarPessoa((obj as TTraveler));
  finally
    FreeAndNil(oCliente);
  end;
end;

procedure TTravelerType.Save(obj: TObject);
var
  oCliente:TTravelerDao;
begin
  try
    try
      oCliente := TTravelerDao.Create;
      oCliente.save((obj as TTraveler));
    finally
      FreeAndNil(oCliente);
    end;

    ShowMessage('Saved successfully.');
  except
    ShowMessage('Error saving.');
    raise;
  end;
end;

procedure TTravelerType.saveService(psService: string);
begin

end;

end.
