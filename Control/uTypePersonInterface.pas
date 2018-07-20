unit uTypePersonInterface;

interface

uses
  uPerson,DB;

type
  ITypePerson = interface
    procedure Save(obj:TObject);
    procedure Delete(obj:TObject);
    function ListPerson(obj:TObject):string;
    function PesquisarPessoa(obj:TObject):OleVariant;
    function ListCombo:string;
    procedure saveService(psService:string);
  end;

  IFactoryMethod = interface
    function getPerson(const poPersonType: TPersonType): ITypePerson;
  end;

implementation

end.
