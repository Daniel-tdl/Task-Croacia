unit uFactoryPerson;

interface

uses
  uTypePersonInterface,uPerson,uClientType,uClient,uSupplierType,uEmployeeType,uTravelerType;

type
  TFactoryPerson = class(TInterfacedObject,IFactoryMethod)
    function getPerson(const poPersonType: TPersonType): ITypePerson;
  end;

implementation

{ TFactoryPerson }

function TFactoryPerson.getPerson(
  const poPersonType: TPersonType): ITypePerson;
begin
  case poPersonType of
    ptClient: result := TClientType.Create;
    ptSupplier: Result := TSupplierType.Create;
    ptEmployee: Result := TEmployeeType.Create;
    ptTraveler: Result := TTravelerType.Create;
  else
    
  end;
end;

end.
