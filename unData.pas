unit unData;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmData = class(TDataModule)
    dbPrivatisation: TDatabase;
    tbAdresses: TTable;
    tbBuildings: TTable;
    dsAdress: TDataSource;
    dsBuildings: TDataSource;
    tbBuildingsAdress: TStringField;
    tbBuildingsOwner_Full: TStringField;
    tbBuildingsBase: TStringField;
    tbAdressesId: TAutoIncField;
    tbAdressesAddr_type: TStringField;
    tbBuildingsId: TAutoIncField;
    tbBuildingsRegId: TStringField;
    tbBuildingsAddrName: TStringField;
    tbBuildingsAddrBuild: TStringField;
    tbBuildingsAddrFlat: TStringField;
    tbBuildingsOwnerName: TStringField;
    tbBuildingsOwnerInit: TStringField;
    tbBuildingsBaseId: TStringField;
    tbBuildingsBaseDate: TDateField;
    tbBuildingsRegDate: TDateField;
    tbBuildingsAddrTypeName: TStringField;
    tbBuildingsAppendix: TMemoField;
    quAdress: TQuery;
    quAdressId: TIntegerField;
    quAdressAddr_type: TStringField;
    tbBooks: TTable;
    dsBooks: TDataSource;
    tbBooksId: TAutoIncField;
    tbBooksTitle: TStringField;
    tbBuildingsBook: TStringField;
    quRegId: TQuery;
    quRegIdExists: TIntegerField;
    quRegIdId: TIntegerField;
    tbBuildingsRegNum: TIntegerField;
    tbBuildingsBookId: TIntegerField;
    tbBuildingsAddrType: TIntegerField;
    tbCities: TTable;
    dsCities: TDataSource;
    tbCitiesId: TAutoIncField;
    tbCitiesCityName: TStringField;
    tbBuildingsCityId: TIntegerField;
    tbBuildingsCity: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbBuildingsCalcFields(DataSet: TDataSet);
    procedure tbBuildingsAfterInsert(DataSet: TDataSet);
    procedure tbBuildingsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

procedure TdmData.DataModuleCreate(Sender: TObject);
begin
  // dmData.tbAdresses.Close;
  // dmData.tbBuildings.Close;
  dmData.dbPrivatisation.Close;
  dmData.dbPrivatisation.Params.Add('PATH=' + GetCurrentDir + '\db');
  dmData.dbPrivatisation.Open;
  dmData.tbAdresses.Open;
  dmData.tbBooks.Open;
  dmData.tbCities.Open;
  dmData.tbBuildings.Open;
end;

procedure TdmData.tbBuildingsCalcFields(DataSet: TDataSet);
var
  CityName: String;
begin
  if dmData.tbBuildingsCityId.Value > 1 then
    CityName := dmData.tbBuildingsCity.Value + ', ';
  dmData.tbBuildingsAdress.Value := Format('%s%s %s %s/%s', [
    CityName,
    dmData.tbBuildingsADDRTYPEName.Value,
    dmData.tbBuildingsADDRNAME.Value,
    dmData.tbBuildingsADDRBUILD.Value,
    dmData.tbBuildingsADDRFLAT.Value
  ]);

  dmData.tbBuildingsOwner_full.Value := Format('%s %s', [
    dmData.tbBuildingsOWNERName.Value,
    dmData.tbBuildingsOWNERINIT.Value
  ]);

  dmData.tbBuildingsBase.Value := Format('Распоряжение № %s от %s', [
    dmData.tbBuildingsBaseId.Value,
    FormatDateTime('dd.mm.y', dmData.tbBuildingsBaseDate.Value)
  ]);
end;

procedure TdmData.tbBuildingsAfterInsert(DataSet: TDataSet);
begin
  dmData.tbBuildingsBookId.Value := dmData.tbBooksId.Value;
  dmData.tbBuildingsRegId.Value := Format('%s/', [dmData.tbBooksTitle.Value]);
end;

procedure TdmData.tbBuildingsBeforePost(DataSet: TDataSet);
var
  parsed: String;
  typelen: Integer;
begin
  parsed := trim(dmData.tbBuildingsRegId.Value);
  try
    typelen := LastDelimiter('/', parsed);
    parsed := trim(copy(parsed, typelen + 1, Length(parsed) - typelen));
    dmData.tbBuildingsRegNum.Value := StrToIntDef(parsed, 0);
  finally
  end;
end;

end.
