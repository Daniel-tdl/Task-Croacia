unit uPerson;

interface

type
  TPersonType = (ptClient, ptSupplier , ptEmployee, ptTraveler) ;
  
  TPerson = class
  private
    FIdentNr:string;
    FtypePerson:Integer;
    FName: string;
    FIdPessoa: Integer;

    function GetIdentNr: string;
    function GettypePerson: Integer;
    procedure SetIdentNr(const Value: string);
    procedure SettypePerson(const Value: Integer);
    procedure setName(const Value: string);
  public
    function GetTypePersonEnum(potypePerson:TPersonType): integer;
  published
    property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    property IdentNr: string read GetIdentNr write SetIdentNr;
    property typePerson: Integer read GettypePerson write SettypePerson;
    property name:string read FName write setName;
  end;

implementation

{ TPerson }

function TPerson.GetIdentNr: string;
begin
  Result := FIdentNr;
end;

function TPerson.GettypePerson: Integer;
begin
   Result := FtypePerson;
end;

function TPerson.GetTypePersonEnum(potypePerson: TPersonType): integer;
begin
  case potypePerson of
    ptClient: Result := 1;
    ptSupplier: Result := 2;
    ptEmployee: Result := 4;
    ptTraveler: Result := 5;
  end;
end;

procedure TPerson.SetIdentNr(const Value: string);
begin
  FIdentNr := Value;
end;

procedure TPerson.setName(const Value: string);
begin
  FName := Value;
end;

procedure TPerson.SettypePerson(const Value: Integer);
begin
  FtypePerson := Value;
end;

end.
