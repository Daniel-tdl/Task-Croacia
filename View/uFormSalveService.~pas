unit uFormSalveService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,uTypePersonInterface,UConnectBank,uFactoryPerson,uPerson;

type
  TForm5 = class(TForm)
    pnl1: TPanel;
    lb1: TLabel;
    lb2: TLabel;
    edt1: TEdit;
    btn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
  private
    FtypePerson: TPersonType;
    procedure SetTypePerson(const Value: TPersonType);
    { Private declarations }
  public
    property typePerson:TPersonType  read FtypePerson write SetTypePerson;
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.btn1Click(Sender: TObject);
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
  sql:string;
  oConexao:TConexaoBanco;
  nIndex:Integer;
begin
  if edt1.Text = EmptyStr then
    Exit;
    
  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FtypePerson);

  TypePerson.saveService(edt1.Text);
end;

procedure TForm5.SetTypePerson(const Value: TPersonType);
begin
  FtypePerson := Value;
end;

end.
