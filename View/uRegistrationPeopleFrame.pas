unit uRegistrationPeopleFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,uPerson,uFactoryPerson,uTypePersonInterface,
  DBXpress, DB, SqlExpr,uClient,uSupplier,uEmployee,uTraveler, Grids,
  DBGrids, FMTBcd, DBClient, Provider,UConnectBank,uFormSalveService;

type
  TFrame1 = class(TFrame)
    pnPrincipal: TPanel;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    pnlhigher: TPanel;
    pnlIdentNr: TPanel;
    lbIdentNr: TLabel;
    edtIdentNr: TEdit;
    pnlFirstName: TPanel;
    lbFirstName: TLabel;
    lbSurename: TLabel;
    edtFirstName: TEdit;
    edtSurename: TEdit;
    pnlName: TPanel;
    lbName: TLabel;
    lbKontoNr: TLabel;
    lbDepartment: TLabel;
    lbCountry: TLabel;
    edtName: TEdit;
    edtKontoNr: TEdit;
    cbbDepartment: TComboBox;
    cbbCountry: TComboBox;
    pnlPadding: TPanel;
    btnSave: TBitBtn;
    btnClean: TBitBtn;
    btnService: TBitBtn;
    pnlGridPerson: TPanel;
    dbgrd1: TDBGrid;
    sqlDatasetTable: TSQLDataSet;
    dataSetProvider2: TDataSetProvider;
    clientDataset: TClientDataSet;
    dsDatasource: TDataSource;
    btnDeletar: TBitBtn;
    lbCbbService: TLabel;
    cbbService: TComboBox;
    sqlDatasetService: TSQLDataSet;
    dataSetProviderService: TDataSetProvider;
    dsDatasetService: TClientDataSet;
    ds2: TDataSource;
    procedure btnSaveClick(Sender: TObject);
    procedure edtIdentNrExit(Sender: TObject);
    procedure btnCleanClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnServiceClick(Sender: TObject);
    procedure edtSurenameExit(Sender: TObject);
  private
    FPersonType:TPersonType;

    procedure setPersonType(poPersonType:TPersonType);
    procedure ConfigureLayoutClient;
    procedure ConfigureLayoutSupplier;
    procedure ConfigureLayoutEmployee;
    procedure ConfigureLayoutTraveler;
    procedure CleanEdits;
    function RetornarObj:TObject;
    function RetornarObjClient:TClient;
    function RetornarObjSupplier:TSupplier;
    function RetornarObjEmployee:TEmployee;
    function RetornarObjTraveler:TTraveler;
    procedure CarregarDadosGrid;
    procedure CarregarDadosService;
    procedure PreencherCampos;
    procedure CarregarDadosDepartament;
    procedure CarregarDadosCountry;

    { Prlarations }
  public
    procedure SetTitle(psTitle:String);
    procedure ConfigureLayout(poPersonType:TPersonType);
  end;

implementation

uses Math;

{$R *.dfm}

{ TFrame1 }

procedure TFrame1.ConfigureLayout(poPersonType:TPersonType);
begin
  setPersonType(poPersonType);
  CleanEdits;
  CarregarDadosGrid;
  CarregarDadosService;
  CarregarDadosDepartament;
  CarregarDadosCountry;
  
  case poPersonType of
    ptClient: ConfigureLayoutClient;
    ptSupplier: ConfigureLayoutSupplier;
    ptEmployee: ConfigureLayoutEmployee;
    ptTraveler: ConfigureLayoutTraveler;
  end;
end;

procedure TFrame1.ConfigureLayoutClient;
begin
  lbCbbService.Visible := False;
  cbbService.Visible := False;
  pnlFirstName.Visible := False;
  lbDepartment.Visible := False;
  cbbDepartment.Visible := False;
  lbCountry.Visible := False;
  cbbCountry.Visible := False;
  btnService.Visible := False;
  lbKontoNr.Visible := True;
  edtKontoNr.Visible := True;
  edtKontoNr.Enabled := False;
  edtName.Enabled := True;
  pnlhigher.Height := pnlhigher.Height - pnlFirstName.Height;
end;

procedure TFrame1.ConfigureLayoutEmployee;
begin
  lbCbbService.Visible := False;
  cbbService.Visible := False;
  pnlFirstName.Visible := True;
  pnlFirstName.Top := pnlIdentNr.Top + pnlIdentNr.Height + 1;
  lbDepartment.Visible := True;
  cbbDepartment.Visible := True;
  lbCountry.Visible := False;
  cbbCountry.Visible := False;
   btnService.Visible := False;
   lbKontoNr.Visible := False;
  edtKontoNr.Visible := False;
  edtName.Enabled := False;
end;

procedure TFrame1.ConfigureLayoutSupplier;
begin
  lbCbbService.Visible := True;
  cbbService.Visible := True;
  edtName.Enabled := True;
  pnlFirstName.Visible := False;
  lbDepartment.Visible := False;
  cbbDepartment.Visible := False;
  lbCountry.Visible := False;
  cbbCountry.Visible := False;
  btnService.Visible := True;
  lbKontoNr.Visible := True;
  edtKontoNr.Visible := True;
  edtKontoNr.Enabled := False;
end;

procedure TFrame1.ConfigureLayoutTraveler;
begin
  lbCbbService.Visible := False;
  cbbService.Visible := False;
  pnlFirstName.Visible := True;
  pnlFirstName.Top := pnlIdentNr.Top + pnlIdentNr.Height + 1;
  lbDepartment.Visible := False;
  cbbDepartment.Visible := False;
  lbCountry.Visible := True;
  cbbCountry.Visible := True;
   btnService.Visible := False;
   lbKontoNr.Visible := False;
  edtKontoNr.Visible := False;
  edtName.Enabled := False;
end;

procedure TFrame1.setPersonType(poPersonType: TPersonType);
begin
  FPersonType := poPersonType;
end;

procedure TFrame1.SetTitle(psTitle: String);
begin
  lblTitle.Caption := psTitle;
end;

procedure TFrame1.btnSaveClick(Sender: TObject);
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
begin
  if edtIdentNr.Text = EmptyStr then
    Exit;

  if (FPersonType = ptSupplier) and (cbbService.ItemIndex < 0) then
    Exit;
                                                                                                                              
  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FPersonType);

  try
    obj := RetornarObj;
    try
      TypePerson.Save(obj);
    finally
      FreeAndNil(obj);
    end;

    CleanEdits;
    CarregarDadosGrid;
  except
    Exit;
  end;
end;

procedure TFrame1.edtIdentNrExit(Sender: TObject);
var
  obj:TPerson;
begin
  obj := TPerson.Create;
  try
    edtKontoNr.Text := IntToStr(obj.GetTypePersonEnum(FPersonType)) + '-' + edtIdentNr.Text;
    PreencherCampos;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TFrame1.CleanEdits;
var
  nIndex:Integer;
begin
  for nIndex := 0 to ComponentCount - 1 do
  begin
    if Components[nIndex] is TEdit then
       (Components[nIndex] as TEdit).Text := '';                                                               
  end;
end;

procedure TFrame1.btnCleanClick(Sender: TObject);
begin
  CleanEdits;
end;

function TFrame1.RetornarObj:TObject;
begin
  case FPersonType of
    ptClient : result := RetornarObjClient;
    ptSupplier : result := RetornarObjSupplier;
    ptEmployee : result := RetornarObjEmployee;
    ptTraveler : result := RetornarObjTraveler;
  else
    Result := nil;  
  end;
end;

function TFrame1.RetornarObjClient:TClient;
var
  obj:TClient;
begin
  obj := TClient.Create;
  obj.name := edtName.Text;
  obj.firstName := edtFirstName.Text;
  obj.surename := edtSurename.Text;
  obj.KontoNr := edtKontoNr.Text;
  obj.IdentNr := edtIdentNr.Text;
  obj.typePerson := obj.GetTypePersonEnum(FPersonType);

  Result := obj;
end;

function TFrame1.RetornarObjEmployee:TEmployee;
var
  obj:TEmployee;
begin
  obj := TEmployee.Create;
  obj.name := edtName.Text;
  obj.firstName := edtFirstName.Text;
  obj.surename := edtSurename.Text;
  obj.IdentNr := edtIdentNr.Text;
  obj.department := cbbDepartment.ItemIndex + 1;
  obj.typePerson := obj.GetTypePersonEnum(FPersonType);
  Result := obj;
end;

function TFrame1.RetornarObjSupplier: TSupplier;
var
  obj:TSupplier;
begin
  obj := TSupplier.Create;
  obj.name := edtName.Text;
  obj.firstName := edtFirstName.Text;
  obj.surename := edtSurename.Text;
  obj.KontoNr := edtKontoNr.Text;
  obj.IdentNr := edtIdentNr.Text;
  obj.service := cbbService.ItemIndex;
  obj.typePerson := obj.GetTypePersonEnum(FPersonType);
  Result := obj;
end;

function TFrame1.RetornarObjTraveler: TTraveler;
var
  obj:TTraveler;
begin
  obj := TTraveler.Create;
  obj.name := edtName.Text;
  obj.firstName := edtFirstName.Text;
  obj.surename := edtSurename.Text;
  obj.IdentNr := edtIdentNr.Text;
  obj.country := cbbCountry.ItemIndex;
  obj.typePerson := obj.GetTypePersonEnum(FPersonType);
  Result := obj;
end;

procedure TFrame1.CarregarDadosGrid;
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
  sql:string;
  oConexao:TConexaoBanco;
begin
  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FPersonType);

  oConexao := TConexaoBanco.Create;
  if not oConexao.ConexaoBanco.Connected then
    Exit;

  clientDataset.Active := False;
  sqlDatasetTable.Active := False;
  sqlDatasetTable.SQLConnection := oConexao.ConexaoBanco;

  obj := RetornarObj;
  try
    sql := TypePerson.ListPerson(obj);
    sqlDatasetTable.CommandText := sql;
    sqlDatasetTable.Active := True;
    clientDataset.Active := True;

    dbgrd1.Refresh;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TFrame1.PreencherCampos;
var
  obj:TPerson;
begin
  obj := TPerson.Create;
  try
    if not clientDataset.Locate('IdentNr;idpersonTypes', VarArrayOf([edtIdentNr.Text,obj.GetTypePersonEnum(FPersonType)]), []) then
      Exit;

    case FPersonType of
      ptClient:
      begin
        edtName.Text := clientDataset.FieldByName('namePerson').AsString;
      end;
      ptSupplier:
      begin
        edtName.Text := clientDataset.FieldByName('namePerson').AsString;
      end;
      ptEmployee:
      begin
        edtFirstName.Text := clientDataset.FieldByName('FirstName').AsString;
        edtSurename.Text := clientDataset.FieldByName('Surename').AsString;
      end;
      ptTraveler:
      begin
        edtFirstName.Text := clientDataset.FieldByName('FirstName').AsString;
        edtSurename.Text := clientDataset.FieldByName('Surename').AsString;
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TFrame1.btnDeletarClick(Sender: TObject);
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
begin
  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FPersonType);

  obj := RetornarObj;

  try
    TypePerson.Delete(obj);
    CleanEdits;
    CarregarDadosGrid;
  except
    ShowMessage('Erro delete!!!');
  end;
end;

procedure TFrame1.CarregarDadosService;
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
  sql:string;
  oConexao:TConexaoBanco;
begin
  if not (FPersonType = ptSupplier) then
    Exit;

  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FPersonType);

  oConexao := TConexaoBanco.Create;
  if not oConexao.ConexaoBanco.Connected then
    Exit;

  dsDatasetService.Active := False;
  sqlDatasetService.Active := False;
  sqlDatasetService.SQLConnection := oConexao.ConexaoBanco;

  obj := RetornarObj;
  try
    sql := TypePerson.ListCombo;
    sqlDatasetService.CommandText := sql;
    sqlDatasetService.Active := True;
    dsDatasetService.Active := True;

    while not dsDatasetService.Eof do
    begin
      cbbService.Items.Add(dsDatasetService.FieldByName('serviceDes').AsString);
      dsDatasetService.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TFrame1.btnServiceClick(Sender: TObject);
var
  oForm:TForm5;
begin
  oForm := TForm5.Create(nil);
  try
    oForm.typePerson := FPersonType;
    oForm.ShowModal;
  finally
    oForm.Free;
  end;

  CarregarDadosService;
end;

procedure TFrame1.CarregarDadosCountry;
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
  sql:string;
  oConexao:TConexaoBanco;
begin
  if not (FPersonType = ptTraveler) then
    Exit;

  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FPersonType);

  oConexao := TConexaoBanco.Create;
  if not oConexao.ConexaoBanco.Connected then
    Exit;

  dsDatasetService.Active := False;
  sqlDatasetService.Active := False;
  sqlDatasetService.SQLConnection := oConexao.ConexaoBanco;

  obj := RetornarObj;
  try
    sql := TypePerson.ListCombo;
    sqlDatasetService.CommandText := sql;
    sqlDatasetService.Active := True;
    dsDatasetService.Active := True;

    while not dsDatasetService.Eof do
    begin
      cbbCountry.Items.Add(dsDatasetService.FieldByName('country').AsString);
      dsDatasetService.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TFrame1.CarregarDadosDepartament;
var
  FactoryPerson: IFactoryMethod;
  TypePerson: ITypePerson;
  obj:TObject;
  sql:string;
  oConexao:TConexaoBanco;
begin
  if not (FPersonType = ptEmployee) then
    Exit;

  FactoryPerson := TFactoryPerson.Create;
  TypePerson := FactoryPerson.getPerson(FPersonType);

  oConexao := TConexaoBanco.Create;
  if not oConexao.ConexaoBanco.Connected then
    Exit;

  dsDatasetService.Active := False;
  sqlDatasetService.Active := False;
  sqlDatasetService.SQLConnection := oConexao.ConexaoBanco;

  obj := RetornarObj;
  try
    sql := TypePerson.ListCombo;
    sqlDatasetService.CommandText := sql;
    sqlDatasetService.Active := True;
    dsDatasetService.Active := True;

    while not dsDatasetService.Eof do
    begin
      cbbDepartment.Items.Add(dsDatasetService.FieldByName('department').AsString);
      dsDatasetService.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TFrame1.edtSurenameExit(Sender: TObject);
begin
  edtName.Text := edtFirstName.Text +' '+ edtSurename.Text;
end;

end.


