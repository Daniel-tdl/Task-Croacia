unit uFormSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRegistrationPeopleFrame,uPerson;

type
  TForm2 = class(TForm)
    frm1frm: TFrame1;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  frm1frm.SetTitle('Manage Supplier');
  frm1frm.ConfigureLayout(ptSupplier);
end;

end.
