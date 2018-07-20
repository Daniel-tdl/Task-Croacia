object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 502
  Height = 452
  TabOrder = 0
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 452
    Align = alClient
    Caption = 'pnPrincipal'
    TabOrder = 0
    object pnlTitle: TPanel
      Left = 1
      Top = 1
      Width = 500
      Height = 41
      Align = alTop
      TabOrder = 0
      object lblTitle: TLabel
        Left = 205
        Top = 11
        Width = 91
        Height = 20
        Caption = 'Customer base'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlhigher: TPanel
      Left = 1
      Top = 42
      Width = 500
      Height = 170
      Align = alTop
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Caption = 'pnlhigher'
      TabOrder = 1
      object pnlIdentNr: TPanel
        Left = 2
        Top = 2
        Width = 492
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbIdentNr: TLabel
          Left = 11
          Top = 15
          Width = 44
          Height = 13
          Caption = 'IdentNr : '
        end
        object lbCbbService: TLabel
          Left = 283
          Top = 12
          Width = 39
          Height = 13
          Caption = 'Service:'
        end
        object edtIdentNr: TEdit
          Left = 59
          Top = 11
          Width = 121
          Height = 21
          TabOrder = 0
          OnExit = edtIdentNrExit
        end
        object cbbService: TComboBox
          Left = 335
          Top = 8
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object pnlFirstName: TPanel
        Left = 2
        Top = 43
        Width = 492
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbFirstName: TLabel
          Left = 8
          Top = 15
          Width = 53
          Height = 13
          Caption = 'First Name:'
        end
        object lbSurename: TLabel
          Left = 237
          Top = 14
          Width = 54
          Height = 13
          Caption = 'Surename :'
        end
        object edtFirstName: TEdit
          Left = 67
          Top = 11
          Width = 154
          Height = 21
          TabOrder = 0
        end
        object edtSurename: TEdit
          Left = 295
          Top = 10
          Width = 188
          Height = 21
          TabOrder = 1
          OnExit = edtSurenameExit
        end
      end
      object pnlName: TPanel
        Left = 2
        Top = 84
        Width = 492
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlName'
        TabOrder = 2
        object lbName: TLabel
          Left = 8
          Top = 14
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object lbKontoNr: TLabel
          Left = 317
          Top = 16
          Width = 45
          Height = 13
          Caption = 'KontoNr :'
        end
        object lbDepartment: TLabel
          Left = 317
          Top = 16
          Width = 61
          Height = 13
          Caption = 'Department :'
        end
        object lbCountry: TLabel
          Left = 318
          Top = 18
          Width = 42
          Height = 13
          Caption = 'Country :'
        end
        object edtName: TEdit
          Left = 48
          Top = 11
          Width = 240
          Height = 21
          TabOrder = 0
        end
        object edtKontoNr: TEdit
          Left = 365
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object cbbDepartment: TComboBox
          Left = 386
          Top = 11
          Width = 97
          Height = 21
          ItemHeight = 13
          TabOrder = 2
        end
        object cbbCountry: TComboBox
          Left = 366
          Top = 11
          Width = 118
          Height = 21
          ItemHeight = 13
          TabOrder = 3
        end
      end
      object pnlPadding: TPanel
        Left = 2
        Top = 125
        Width = 492
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object btnSave: TBitBtn
          Left = 8
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = btnSaveClick
          Kind = bkOK
        end
        object btnClean: TBitBtn
          Left = 95
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Clean'
          TabOrder = 1
          OnClick = btnCleanClick
          Kind = bkCancel
        end
        object btnService: TBitBtn
          Left = 267
          Top = 9
          Width = 110
          Height = 25
          Caption = 'Register Services'
          TabOrder = 2
          OnClick = btnServiceClick
        end
        object btnDeletar: TBitBtn
          Left = 183
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 3
          OnClick = btnDeletarClick
          Kind = bkCancel
        end
      end
    end
    object pnlGridPerson: TPanel
      Left = 1
      Top = 212
      Width = 500
      Height = 239
      Align = alClient
      BevelInner = bvRaised
      BorderStyle = bsSingle
      TabOrder = 2
      object dbgrd1: TDBGrid
        Left = 2
        Top = 2
        Width = 492
        Height = 231
        Align = alClient
        DataSource = dsDatasource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object sqlDatasetTable: TSQLDataSet
    SchemaName = 'msdb'
    CommandText = 
      'select p.idPerson as ID, p.IdentNr, p.namePerson, k.KontoNr, '#10'(s' +
      'elect pt.TypesName from PersonTypes pt where pt.idpersonTypes = ' +
      'p.idPerson) as TypeName from Client c '#10'left join Konto k ON c.Ko' +
      'nto_idKonto = k.idKonto '#10'left join Person p ON c.Person_idPerson' +
      ' = p.idPerson '#10'where p.idpersonTypes = 1'
    DataSource = dsDatasource
    MaxBlobSize = -1
    Params = <>
    Left = 320
    Top = 8
  end
  object dataSetProvider2: TDataSetProvider
    DataSet = sqlDatasetTable
    Left = 360
    Top = 8
  end
  object clientDataset: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dataSetProvider2'
    Left = 400
    Top = 8
  end
  object dsDatasource: TDataSource
    DataSet = clientDataset
    Left = 432
    Top = 8
  end
  object sqlDatasetService: TSQLDataSet
    SchemaName = 'msdb'
    CommandText = 
      'select p.idPerson as ID, p.IdentNr, p.namePerson, k.KontoNr, '#10'(s' +
      'elect pt.TypesName from PersonTypes pt where pt.idpersonTypes = ' +
      'p.idPerson) as TypeName from Client c '#10'left join Konto k ON c.Ko' +
      'nto_idKonto = k.idKonto '#10'left join Person p ON c.Person_idPerson' +
      ' = p.idPerson '#10'where p.idpersonTypes = 1'
    DataSource = ds2
    MaxBlobSize = -1
    Params = <>
    Left = 8
    Top = 8
  end
  object dataSetProviderService: TDataSetProvider
    DataSet = sqlDatasetService
    Left = 40
    Top = 8
  end
  object dsDatasetService: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dataSetProviderService'
    Left = 72
    Top = 8
  end
  object ds2: TDataSource
    DataSet = clientDataset
    Left = 104
    Top = 8
  end
end
