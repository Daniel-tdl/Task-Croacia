unit uClient;

interface

uses
  uPerson;

type
  TClient = class(TPerson)
  private
    Fsurename: String;
    FfirstName: String;
    FsKontoNr: string;
    function GetKontoNr: string;
    procedure SetfirstName(const Value: String);
    procedure Setsurename(const Value: String);
  published
    property firstName: String read FfirstName write SetfirstName;
    property surename: String read Fsurename write Setsurename;
    property KontoNr: string read GetKontoNr write FsKontoNr;
  end;

implementation

uses SysUtils;


{ TClient }

function TClient.GetKontoNr: string;
begin
  Result := IntToStr(typePerson) +'-'+ IdentNr;
end;

procedure TClient.SetfirstName(const Value: String);
begin
  FfirstName := Value;
end;

procedure TClient.Setsurename(const Value: String);
begin
  Fsurename := Value;
end;

end.
