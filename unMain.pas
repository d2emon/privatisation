unit unMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, Grids, DBGrids, ExtCtrls;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    N1: TMenuItem;
    alActions: TActionList;
    aCards: TAction;
    aAdresses: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    dbgdRegistration: TDBGrid;
    pnFilter: TPanel;
    aBooks: TAction;
    N4: TMenuItem;
    aExport: TAction;
    N5: TMenuItem;
    sdSave: TSaveDialog;
    N6: TMenuItem;
    aImport: TAction;
    N7: TMenuItem;
    odOpen: TOpenDialog;
    aFix: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    aCities: TAction;
    N10: TMenuItem;
    procedure aCardsExecute(Sender: TObject);
    procedure aAdressesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aBooksExecute(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aImportExecute(Sender: TObject);
    procedure aFixExecute(Sender: TObject);
    procedure aCitiesExecute(Sender: TObject);
    procedure dbgdRegistrationKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses unData, unAdress, unPrivatisation, unBooks, unCity;

{$R *.dfm}

procedure TfmMain.aCardsExecute(Sender: TObject);
begin
  fmPrivatisation.Show;
end;

procedure TfmMain.aAdressesExecute(Sender: TObject);
begin
  fmAdress.Show;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmData.dbPrivatisation.Close;
end;

procedure TfmMain.aBooksExecute(Sender: TObject);
begin
  fmBooks.Show;
end;

procedure TfmMain.aExportExecute(Sender: TObject);
var
  f: TextFile;
begin
  sdSave.FileName := FormatDateTime('dd.mm.y', Now);
  if sdSave.Execute then
  begin
    AssignFile(f, sdSave.FileName);
    ReWrite(f);
    dmData.tbBuildings.First;
    while not dmData.tbBuildings.Eof do
    begin
      WriteLn(f, dmData.tbBuildingsId.Value);

      WriteLn(f, dmData.tbBuildingsBookId.AsString);
      WriteLn(f, dmData.tbBuildingsRegId.Value);

      WriteLn(f, dmData.tbBuildingsAddrType.AsString);
      WriteLn(f, dmData.tbBuildingsAddrName.Value);
      WriteLn(f, dmData.tbBuildingsAddrBuild.Value);
      WriteLn(f, dmData.tbBuildingsAddrFlat.Value);

      WriteLn(f, dmData.tbBuildingsOwnerName.Value);
      WriteLn(f, dmData.tbBuildingsOwnerInit.Value);

      WriteLn(f, dmData.tbBuildingsBaseId.Value);

      WriteLn(f, FormatDateTime('dd.mm.y', dmData.tbBuildingsBaseDate.Value));
      WriteLn(f, FormatDateTime('dd.mm.y', dmData.tbBuildingsRegDate.Value));

      WriteLn(f, '----');
      dmData.tbBuildings.Next;
    end;
    CloseFile(f);
    MessageDlg('Данные успешно экспортированы в ' + sdSave.FileName, mtInformation, [mbOk], 0);
  end;
end;

procedure TfmMain.aImportExecute(Sender: TObject);
var
  FileName: String;
  I: Integer;
  Id: String;
  ForeignId: String;
  AdressType: String;
  AdressName: String;
  AdressBuild: String;
  AdressFlat: String;
  OwnerName: String;
  OwnerInit: String;
  BaseId: String;
  BaseDate: String;
  RegDate: String;
  f: TextFile;
  Edit: Boolean;
begin
  if odOpen.Execute then
  begin
    AssignFile(f, odOpen.FileName);
    ReSet(f);
    I := 0;
    while not Eof(f) do
    begin
      ReadLn(f, Id);

      ReadLn(f, ForeignId);
      ReadLn(f, Id);

      ReadLn(f, AdressType);
      ReadLn(f, AdressName);
      ReadLn(f, AdressBuild);
      ReadLn(f, AdressFlat);

      ReadLn(f, OwnerName);
      ReadLn(f, OwnerInit);

      ReadLn(f, BaseId);
      ReadLn(f, BaseDate);
      ReadLn(f, RegDate);

      dmData.quRegId.Close;
      dmData.quRegId.ParamByName('RegId').Value := Id;
      dmData.quRegId.Open;
      Edit := False;
      If dmData.quRegIdExists.Value = 0 then
      begin
        I := I + 1;
        dmData.tbBuildings.Insert;
        Edit := True;
      end
      else
      begin
        dmData.tbBuildings.EditKey;
        dmData.tbBuildingsRegId.Value := Id;
        dmData.tbBuildings.GotoKey;
        dmData.tbBuildings.Edit;
        Edit := True;
      end;

      if Edit then
      begin
        dmData.tbBuildingsBookId.Value := StrToIntDef(ForeignId, 0);
        dmData.tbBuildingsRegId.Value := Id;

        dmData.tbBuildingsAddrType.Value := StrToIntDef(AdressType, 0);
        dmData.tbBuildingsAddrName.Value := AdressName;
        dmData.tbBuildingsAddrBuild.Value := AdressBuild;
        dmData.tbBuildingsAddrFlat.Value := AdressFlat;

        dmData.tbBuildingsOwnerName.Value := OwnerName;
        dmData.tbBuildingsOwnerInit.Value := OwnerInit;

        dmData.tbBuildingsBaseId.Value := BaseId;
        dmData.tbBuildingsBaseDate.Value := StrToDate(BaseDate);
        dmData.tbBuildingsRegDate.Value := StrToDate(RegDate);

        dmData.tbBuildings.Post;
      end;
      ReadLn(f, Id);
    end;
    CloseFile(f);
    MessageDlg('Данные (' + IntToStr(I) + ' записей) успешно импортированы из ' + odOpen.FileName, mtInformation, [mbOk], 0);
  end;
end;

procedure TfmMain.aFixExecute(Sender: TObject);
begin
  dmData.tbBuildings.First;
  while not dmData.tbBuildings.Eof do
  begin
    dmData.tbBuildings.Edit;
    if dmData.tbBuildingsCityId.Value < 1 then
      dmData.tbBuildingsCityId.Value := 1;
    dmData.tbBuildings.Post;
    dmData.tbBuildings.Next;
  end;
  MessageDlg('Данные успешно переиндексированы', mtInformation, [mbOk], 0);
end;

procedure TfmMain.aCitiesExecute(Sender: TObject);
begin
  fmCities.Show;
end;

procedure TfmMain.dbgdRegistrationKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then aCards.Execute;
end;

end.
