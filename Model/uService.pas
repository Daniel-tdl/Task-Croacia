unit uService;

interface

type
  TService = class
  private
    FService: Integer;
    procedure SetService(const Value: Integer);
  published
    property service:Integer  read FService write SetService;
  end;

implementation

{ TService }

procedure TService.SetService(const Value: Integer);
begin
  FService := Value;
end;

end.
