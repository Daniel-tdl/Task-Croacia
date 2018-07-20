unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBXpress, DB, SqlExpr,UConnectBank,
  uRegistrationPeopleFrame, ExtCtrls,uFormClient,uFormSupplier,uFormTraveler,uFormEmployee;

type
  TManagingTypesPersonsMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbConect: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
    FConexao:TConexaoBanco;
  public
    { Public declarations }
  end;

var
  ManagingTypesPersonsMain: TManagingTypesPersonsMain;

implementation

uses
  uPerson;

{$R *.dfm}

procedure TManagingTypesPersonsMain.FormCreate(Sender: TObject);
begin
  FConexao  := TConexaoBanco.Create;
  if FConexao.ConexaoBanco.Connected then
    lbConect.Caption := 'Conectado!'
  else
  begin
    lbConect.Caption := 'Desconectado!';
    lbConect.Color := clRed;
  end;
end;

procedure TManagingTypesPersonsMain.btn1Click(Sender: TObject);
var
  oForm:TForm1;
begin
  oForm := TForm1.Create(nil);
  oForm.Show;
end;

procedure TManagingTypesPersonsMain.btn2Click(Sender: TObject);
var
  oForm:TForm2;
begin
  oForm := TForm2.Create(nil);
  oForm.Show;
end;

procedure TManagingTypesPersonsMain.btn3Click(Sender: TObject);
var
  oForm:TForm3;
begin
  oForm := TForm3.Create(nil);
  oForm.Show;
end;

procedure TManagingTypesPersonsMain.btn4Click(Sender: TObject);
var
  oForm:TForm4;
begin
  oForm := TForm4.Create(nil);
  oForm.Show;
end;

end.
