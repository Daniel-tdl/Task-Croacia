program ManagingTypesPersons;

uses
  Forms,
  Main in 'Main.pas' {ManagingTypesPersonsMain},
  UConnectBank in 'Dao\UConnectBank.pas',
  uClientDao in 'Dao\uClientDao.pas',
  uPerson in 'Model\uPerson.pas',
  uClient in 'Model\uClient.pas',
  uSupplier in 'Model\uSupplier.pas',
  uService in 'Model\uService.pas',
  uEmployee in 'Model\uEmployee.pas',
  uTraveler in 'Model\uTraveler.pas',
  uRegistrationPeopleFrame in 'View\uRegistrationPeopleFrame.pas' {Frame1: TFrame},
  uTypePersonInterface in 'Control\uTypePersonInterface.pas',
  uClientType in 'Control\uClientType.pas',
  uFactoryPerson in 'Control\uFactoryPerson.pas',
  uPersonDao in 'Dao\uPersonDao.pas',
  uKontoDao in 'Dao\uKontoDao.pas',
  uFormClient in 'View\uFormClient.pas' {Form1},
  uFormSupplier in 'View\uFormSupplier.pas' {Form2},
  uFormEmployee in 'View\uFormEmployee.pas' {Form3},
  uFormTraveler in 'View\uFormTraveler.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TManagingTypesPersonsMain, ManagingTypesPersonsMain);
  Application.Run;
end.
