unit uFormClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRegistrationPeopleFrame,uPerson;

type
  TForm1 = class(TForm)
    frm1frm: TFrame1;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  frm1frm.SetTitle('Manage client');
  frm1frm.ConfigureLayout(ptClient);
end;

end.
