unit uEmployee;

interface
uses
  uPerson;

type
  TEmployee = class(TPerson)
  private
    FDepartment: Integer;
    FSurename: string;
    FfirstName: string;
    procedure SetDepartment(const Value: Integer);
    procedure SetfirstName(const Value: string);
    procedure SetSurename(const Value: string);
    published
      property department: Integer read FDepartment write SetDepartment;
      property firstName: string read FfirstName write SetfirstName;
      property surename : string read FSurename  write SetSurename ;
  end;

implementation

{ TEmployee }

procedure TEmployee.SetDepartment(const Value: Integer);
begin
  FDepartment := Value;
end;

procedure TEmployee.SetfirstName(const Value: string);
begin
  FfirstName := Value;
end;

procedure TEmployee.SetSurename(const Value: string);
begin
  FSurename := Value;
end;

end.
