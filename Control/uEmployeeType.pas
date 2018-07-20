unit uEmployeeType;

interface
uses
  uTypePersonInterface,uPerson,Windows,DB;

type
  TEmployeeType = class(TInterfacedObject,ITypePerson)
    procedure Save(obj:TObject);
    procedure Delete(obj:TObject);
    function ListPerson(obj:TObject):string;
    function PesquisarPessoa(obj:TObject):OleVariant;
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

uses
  uSupplier,forms, SysUtils,Dialogs,uEmployeeDao,uEmployee;

{ TEmployeeType }

procedure TEmployeeType.Delete(obj: TObject);
var
  oCliente:TEmployeeDao;
begin
  oCliente := TEmployeeDao.Create;
  try
    oCliente.DeleteEmployee((obj as TEmployee));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TEmployeeType.ListCombo: string;
var
  oCliente:TEmployeeDao;
begin
  try
    oCliente := TEmployeeDao.Create;
    Result := oCliente.ListCombo;
  finally
    FreeAndNil(oCliente);
  end;
end;

function TEmployeeType.ListPerson(obj: TObject): string;
var
  oCliente:TEmployeeDao;
begin
  oCliente := TEmployeeDao.Create;
  try
    result := oCliente.ListPerson((obj as TEmployee));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TEmployeeType.PesquisarPessoa(obj: TObject): OleVariant;
var
  oCliente:TEmployeeDao;
begin
  try
    oCliente := TEmployeeDao.Create;
    Result := oCliente.PesquisarPessoa((obj as TEmployee));
  finally
    FreeAndNil(oCliente);
  end;
end;

procedure TEmployeeType.Save(obj: TObject);
var
  oCliente:TEmployeeDao;
begin
  try
    try
      oCliente := TEmployeeDao.Create;
      oCliente.save((obj as TEmployee));
    finally
      FreeAndNil(oCliente);
    end;

    ShowMessage('Saved successfully.');
  except
    ShowMessage('Error saving.');
    raise;
  end;
end;

procedure TEmployeeType.saveService(psService: string);
begin

end;

end.
