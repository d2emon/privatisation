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
    tbBuildingsAddrType: TFloatField;
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
    tbBuildingsBookId: TFloatField;
    tbBuildingsBook: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbBuildingsCalcFields(DataSet: TDataSet);
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
  dmData.tbBuildings.Open;
end;

procedure TdmData.tbBuildingsCalcFields(DataSet: TDataSet);
begin
  dmData.tbBuildingsAdress.Value := Format('%s %s %s/%s', [
    dmData.tbBuildingsADDRTYPEName.Value,
    dmData.tbBuildingsADDRNAME.Value,
    dmData.tbBuildingsADDRBUILD.Value,
    dmData.tbBuildingsADDRFLAT.Value
  ]);

  dmData.tbBuildingsOwner_full.Value := Format('%s %s', [
    dmData.tbBuildingsOWNERName.Value,
    dmData.tbBuildingsOWNERINIT.Value
  ]);

  dmData.tbBuildingsBase.Value := Format('%s %s', [
    dmData.tbBuildingsBaseId.Value,
    FormatDateTime('dd.mm.y', dmData.tbBuildingsBaseDate.Value)
  ]);
end;

end.
