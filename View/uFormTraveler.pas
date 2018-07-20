unit uFormTraveler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRegistrationPeopleFrame, uPerson;

type
  TForm4 = class(TForm)
    frm1frm: TFrame1;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  frm1frm.SetTitle('Manage Traveler');
  frm1frm.ConfigureLayout(ptTraveler);
end;

end.
