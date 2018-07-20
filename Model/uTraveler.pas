unit uTraveler;

interface

uses
  uPerson;

type
  TTraveler = class(TPerson)
  private
    FCountry: Integer;
    FfirstName: string;
    FSurename: string;
    procedure SetCountry(const Value: Integer);
    procedure SetfirstName(const Value: string);
    procedure SetSurename(const Value: string);
  published
    property country : Integer read FCountry  write SetCountry;
    property firstName: string read FfirstName write SetfirstName;
    property surename : string read FSurename  write SetSurename;
  end;

implementation

{ TTraveler }

procedure TTraveler.SetCountry(const Value: Integer);
begin
  FCountry := Value;
end;

procedure TTraveler.SetfirstName(const Value: string);
begin
  FfirstName := Value;
end;

procedure TTraveler.SetSurename(const Value: string);
begin
  FSurename := Value;
end;

end.
