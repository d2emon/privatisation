object dmData: TdmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 124
  Height = 257
  Width = 215
  object dbPrivatisation: TDatabase
    DatabaseName = 'Privatisation'
    DriverName = 'STANDARD'
    Params.Strings = (
      'path=db')
    SessionName = 'Default'
    Left = 24
    Top = 8
  end
  object tbAdresses: TTable
    DatabaseName = 'Privatisation'
    SessionName = 'Default'
    TableName = 'adresses.db'
    Left = 88
    Top = 8
    object tbAdressesId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbAdressesAddr_type: TStringField
      DisplayLabel = #1058#1080#1087' '#1091#1083#1080#1094#1099
      FieldName = 'Addr_type'
      Size = 5
    end
  end
  object tbBuildings: TTable
    AfterInsert = tbBuildingsAfterInsert
    OnCalcFields = tbBuildingsCalcFields
    DatabaseName = 'Privatisation'
    SessionName = 'Default'
    IndexFieldNames = 'RegId'
    TableName = 'buildings.db'
    Left = 88
    Top = 56
    object tbBuildingsBase: TStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      DisplayWidth = 32
      FieldKind = fkCalculated
      FieldName = 'Base'
      Size = 96
      Calculated = True
    end
    object tbBuildingsId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbBuildingsRegId: TStringField
      DisplayLabel = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#8470
      FieldName = 'RegId'
      Size = 8
    end
    object tbBuildingsAddrType: TFloatField
      FieldName = 'AddrType'
    end
    object tbBuildingsAddrName: TStringField
      FieldName = 'AddrName'
      Size = 64
    end
    object tbBuildingsAddrBuild: TStringField
      FieldName = 'AddrBuild'
      Size = 8
    end
    object tbBuildingsAddrFlat: TStringField
      FieldName = 'AddrFlat'
      Size = 4
    end
    object tbBuildingsAddrTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'AddrTypeName'
      LookupDataSet = tbAdresses
      LookupKeyFields = 'Id'
      LookupResultField = 'Addr_type'
      KeyFields = 'AddrType'
      Lookup = True
    end
    object tbBuildingsAdress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 32
      FieldKind = fkCalculated
      FieldName = 'Adress'
      Size = 64
      Calculated = True
    end
    object tbBuildingsOwnerName: TStringField
      FieldName = 'OwnerName'
      Size = 64
    end
    object tbBuildingsOwnerInit: TStringField
      FieldName = 'OwnerInit'
      Size = 5
    end
    object tbBuildingsOwner_Full: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094
      FieldKind = fkCalculated
      FieldName = 'Owner_Full'
      Calculated = True
    end
    object tbBuildingsBaseId: TStringField
      FieldName = 'BaseId'
      Size = 8
    end
    object tbBuildingsBaseDate: TDateField
      FieldName = 'BaseDate'
    end
    object tbBuildingsRegDate: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      FieldName = 'RegDate'
    end
    object tbBuildingsAppendix: TMemoField
      FieldName = 'Appendix'
      BlobType = ftMemo
      Size = 240
    end
    object tbBuildingsBookId: TFloatField
      FieldName = 'BookId'
    end
    object tbBuildingsBook: TStringField
      DisplayLabel = #1044#1077#1083#1086
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Book'
      LookupDataSet = tbBooks
      LookupKeyFields = 'Id'
      LookupResultField = 'Title'
      KeyFields = 'BookId'
      Lookup = True
    end
  end
  object dsAdress: TDataSource
    DataSet = tbAdresses
    Left = 144
    Top = 8
  end
  object dsBuildings: TDataSource
    DataSet = tbBuildings
    Left = 144
    Top = 56
  end
  object quAdress: TQuery
    DatabaseName = 'Privatisation'
    SQL.Strings = (
      'SELECT Id, Addr_type'
      'FROM "adresses.db" Adresses'
      'WHERE  Addr_type LIKE :Search ')
    Left = 24
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'Search'
        ParamType = ptInput
        Value = '%%'
      end>
    object quAdressId: TIntegerField
      FieldName = 'Id'
      Origin = 'PRIVATISATION."adresses.DB".Id'
    end
    object quAdressAddr_type: TStringField
      FieldName = 'Addr_type'
      Origin = 'PRIVATISATION."adresses.DB".Addr_type'
      Size = 5
    end
  end
  object tbBooks: TTable
    DatabaseName = 'Privatisation'
    SessionName = 'Default'
    TableName = 'books.db'
    Left = 88
    Top = 104
    object tbBooksId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbBooksTitle: TStringField
      DisplayLabel = #1044#1077#1083#1086
      FieldName = 'Title'
      Size = 32
    end
  end
  object dsBooks: TDataSource
    DataSet = tbBooks
    Left = 144
    Top = 112
  end
  object quRegId: TQuery
    DatabaseName = 'Privatisation'
    SQL.Strings = (
      'SELECT COUNT( Id ) Buildings."Exists"'
      'FROM "buildings.DB" Buildings'
      'WHERE  RegId = :RegId ')
    Left = 24
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'RegId'
        ParamType = ptInput
      end>
    object quRegIdExists: TIntegerField
      FieldName = 'Exists'
      Origin = 'PRIVATISATION."buildings.DB".Id'
    end
  end
end
