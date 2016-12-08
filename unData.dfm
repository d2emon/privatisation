object dmData: TdmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 124
  Height = 363
  Width = 215
  object dbPrivatisation: TDatabase
    Connected = True
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
    BeforePost = tbBuildingsBeforePost
    OnCalcFields = tbBuildingsCalcFields
    DatabaseName = 'Privatisation'
    SessionName = 'Default'
    IndexName = 'RegNumId'
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
      Size = 16
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
      DisplayWidth = 8
      FieldName = 'OwnerInit'
      Size = 8
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
    object tbBuildingsRegNum: TIntegerField
      FieldName = 'RegNum'
    end
    object tbBuildingsBookId: TIntegerField
      FieldName = 'BookId'
    end
    object tbBuildingsAddrType: TIntegerField
      FieldName = 'AddrType'
    end
    object tbBuildingsCityId: TIntegerField
      DefaultExpression = '1'
      FieldName = 'CityId'
    end
    object tbBuildingsCity: TStringField
      FieldKind = fkLookup
      FieldName = 'City'
      LookupDataSet = tbCities
      LookupKeyFields = 'Id'
      LookupResultField = 'CityName'
      KeyFields = 'CityId'
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
    IndexName = 'Book'
    TableName = 'books.db'
    Left = 88
    Top = 112
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
      'SELECT COUNT( Id ) Buildings."Exists", Id'
      'FROM "buildings.DB" Buildings'
      'WHERE  RegId = :RegId '
      'GROUP BY Id')
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
    object quRegIdId: TIntegerField
      FieldName = 'Id'
      Origin = 'PRIVATISATION."buildings.DB".Id'
    end
  end
  object tbCities: TTable
    DatabaseName = 'Privatisation'
    IndexName = 'City'
    TableName = 'cities.db'
    Left = 88
    Top = 160
    object tbCitiesId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbCitiesCityName: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 32
      FieldName = 'CityName'
      Size = 32
    end
  end
  object dsCities: TDataSource
    DataSet = tbCities
    Left = 144
    Top = 160
  end
  object quBookId: TQuery
    DatabaseName = 'Privatisation'
    SQL.Strings = (
      'SELECT Id'
      'FROM "books.db" Books'
      'WHERE  Title = :BookId')
    Left = 24
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'BookId'
        ParamType = ptUnknown
      end>
    object quBookIdId: TIntegerField
      FieldName = 'Id'
      Origin = 'PRIVATISATION."books.DB".Id'
    end
  end
  object quCityId: TQuery
    DatabaseName = 'Privatisation'
    SQL.Strings = (
      'SELECT Id'
      'FROM "cities.db" Cities'
      'WHERE  CityName = :CityName')
    Left = 24
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'CityName'
        ParamType = ptUnknown
      end>
    object quCityIdId: TIntegerField
      FieldName = 'Id'
      Origin = 'PRIVATISATION."cities.DB".Id'
    end
  end
  object quBookChange: TQuery
    DatabaseName = 'Privatisation'
    SQL.Strings = (
      'UPDATE "buildings.DB" Buildings SET BookId=:BookId')
    Left = 88
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BookId'
        ParamType = ptUnknown
      end>
  end
end
