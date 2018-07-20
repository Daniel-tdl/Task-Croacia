unit uSupplierType;

interface

uses
  uTypePersonInterface,uPerson,Windows,DB;

type
  TSupplierType = class(TInterfacedObject,ITypePerson)
    procedure Save(obj:TObject);
    procedure Delete(obj:TObject);
    function ListPerson(obj:TObject):string;
    function PesquisarPessoa(obj:TObject):OleVariant;
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

implementation

uses
  uSupplier,forms, SysUtils,Dialogs,uSupplierDao;

{ TSupplierType }

procedure TSupplierType.Delete(obj: TObject);
var
  oCliente:TSupplierDao;
begin
  oCliente := TSupplierDao.Create;
  try
    oCliente.DeleteSupplier((obj as TSupplier));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TSupplierType.ListPerson(obj: TObject): string;
var
  oCliente:TSupplierDao;
begin
  oCliente := TSupplierDao.Create;
  try
    result := oCliente.ListPerson((obj as TSupplier));
  finally
    FreeAndNil(oCliente);
  end;
end;

function TSupplierType.ListCombo: string;
var
  oCliente:TSupplierDao;
begin
  try
    oCliente := TSupplierDao.Create;
    Result := oCliente.ListCombo;
  finally
    FreeAndNil(oCliente);
  end;
end;

function TSupplierType.PesquisarPessoa(obj: TObject): OleVariant;
var
  oCliente:TSupplierDao;
begin
  try
    oCliente := TSupplierDao.Create;
    Result := oCliente.PesquisarPessoa((obj as TSupplier));
  finally
    FreeAndNil(oCliente);
  end;
end;

procedure TSupplierType.Save(obj: TObject);
var
  oCliente:TSupplierDao;
begin
  try
    try
      oCliente := TSupplierDao.Create;
      oCliente.save((obj as TSupplier));
    finally
      FreeAndNil(oCliente);
    end;

    ShowMessage('Saved successfully.');
  except
    ShowMessage('Error saving.');
    raise;
  end;
end;

procedure TSupplierType.saveService(psService:string);
var
  oCliente:TSupplierDao;
begin
  try
    oCliente := TSupplierDao.Create;
    oCliente.saveService(psService);
  finally
    FreeAndNil(oCliente);
  end;
end;

end.
