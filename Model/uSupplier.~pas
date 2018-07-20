unit uSupplier;

interface
uses
  uPerson;

type
  TSupplier = class(TPerson)
  private
    FService:Integer;
    Fsurename: String;
    FfirstName: String;
    FsKontoNr: string;
    
    function GetKontoNr: string;
    function GetService: Integer;
    procedure SetService(const Value: Integer);
    procedure SetfirstName(const Value: String);
    procedure Setsurename(const Value: String);
  published
    property firstName: String read FfirstName write SetfirstName;
    property surename: String read Fsurename write Setsurename;
    property KontoNr: string read GetKontoNr write FsKontoNr;
    property service:Integer read GetService write SetService;
  end;

implementation

uses
  SysUtils;

{ TSupplier }

function TSupplier.GetKontoNr: string;
begin
  Result := IntToStr(typePerson) +'-'+ IdentNr;
end;

function TSupplier.GetService: Integer;
begin
  Result := FService;
end;

procedure TSupplier.SetfirstName(const Value: String);
begin
  FfirstName := Value;
end;

procedure TSupplier.SetService(const Value: Integer);
begin
  FService := Value;
end;

procedure TSupplier.Setsurename(const Value: String);
begin
  Fsurename := Value;
end;

end.
