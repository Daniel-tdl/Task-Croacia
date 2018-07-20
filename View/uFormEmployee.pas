unit uFormEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRegistrationPeopleFrame,uPerson;

type
  TForm3 = class(TForm)
    frm1frm: TFrame1;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  frm1frm.SetTitle('Manage Employee');
  frm1frm.ConfigureLayout(ptEmployee);
end;

end.
