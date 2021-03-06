unit unPrivatisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TfmPrivatisation = class(TForm)
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    dbedId: TDBEdit;
    gbAdress: TGroupBox;
    gbOwner: TGroupBox;
    gbBase: TGroupBox;
    dbedAddrStreet: TDBEdit;
    dbedAddrBuilding: TDBEdit;
    dbedAddrFlat: TDBEdit;
    dblcAddrType: TDBLookupComboBox;
    dbedSurname: TDBEdit;
    dbedInit: TDBEdit;
    dbedBaseId: TDBEdit;
    dbedBaseDate: TDBEdit;
    dbedRegDate: TDBEdit;
    dbmmAppendix: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edAddr: TEdit;
    edOwner: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dblcBook: TDBLookupComboBox;
    Label11: TLabel;
    Label12: TLabel;
    dblcCity: TDBLookupComboBox;
    procedure edAddrExit(Sender: TObject);
    procedure edOwnerExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrivatisation: TfmPrivatisation;

implementation

uses unData;

{$R *.dfm}

procedure TfmPrivatisation.edAddrExit(Sender: TObject);
var
  parsed: String;
  typelen: Byte;
begin
  // ��. 50 ��� ������� 37/32
  parsed := trim(edAddr.Text);
  if Length(parsed) > 0 then
  begin
  try
    typelen := pos('.', parsed);
    dmData.quAdress.Close;
    dmData.quAdress.ParamByName('Search').Value := '%' + copy(parsed, 0, typelen) + '%';
    dmData.quAdress.Open;

    dmData.tbBuildingsAddrType.Value := dmData.quAdressId.Value;
    parsed := trim(copy(parsed, typelen + 1, Length(parsed) - typelen));

    typelen := LastDelimiter(' ', parsed);
    dmData.tbBuildingsAddrName.Value := copy(parsed, 0, typelen - 1);
    parsed := trim(copy(parsed, typelen + 1, Length(parsed) - typelen));

    typelen := pos('/', parsed);
    dmData.tbBuildingsAddrBuild.Value := copy(parsed, 0, typelen - 1);
    dmData.tbBuildingsAddrFlat.Value := trim(copy(parsed, typelen + 1, Length(parsed) - typelen));
  finally
    edAddr.Text := '';
  end;
  end;
end;

procedure TfmPrivatisation.edOwnerExit(Sender: TObject);
var
  parsed: String;
  typelen: Byte;
begin
  // ������������� �.�.
  parsed := trim(edOwner.Text);
  if Length(parsed) > 0 then
  begin
  try
    typelen := LastDelimiter(' ', parsed);
    dmData.tbBuildingsOwnerName.Value := copy(parsed, 0, typelen - 1);
    dmData.tbBuildingsOwnerInit.Value := trim(copy(parsed, typelen + 1, Length(parsed) - typelen));
  finally
    edOwner.Text := '';
  end;
  end;
end;

end.
