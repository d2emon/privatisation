unit unMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, Grids, DBGrids, ExtCtrls, ComCtrls;

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
    pbStatus: TProgressBar;
    N11: TMenuItem;
    tmAutosave: TTimer;
    N12: TMenuItem;
    aFindLoose: TAction;
    N13: TMenuItem;
    miAutosave: TMenuItem;
    procedure aCardsExecute(Sender: TObject);
    procedure aAdressesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aBooksExecute(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aImportExecute(Sender: TObject);
    procedure aFixExecute(Sender: TObject);
    procedure aCitiesExecute(Sender: TObject);
    procedure dbgdRegistrationKeyPress(Sender: TObject; var Key: Char);
    procedure N11Click(Sender: TObject);
    procedure tmAutosaveTimer(Sender: TObject);
    procedure aFindLooseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miAutosaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    DBPath: String;
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
  mf: TextFile;
  MemoFile: String;
  MemoId: Integer;
begin
  sdSave.FileName := FormatDateTime('dd.mm.y', Now);
  if sdSave.Execute then
  begin
    AssignFile(f, sdSave.FileName);
    ReWrite(f);

    AssignFile(mf, sdSave.FileName + '.lst');
    ReWrite(mf);

    pbStatus.Position := 0;
    pbStatus.Max := dmData.tbBuildings.RecordCount;
    pbStatus.Show;

    dmData.tbBuildings.First;
    while not dmData.tbBuildings.Eof do
    begin
      WriteLn(f, dmData.tbBuildingsId.Value);

      WriteLn(f, dmData.tbBuildingsBook.Value);
      WriteLn(f, dmData.tbBuildingsRegId.Value);

      if dmData.tbBuildingsCityId.Value > 1 then
        WriteLn(f, dmData.tbBuildingsAddrType.AsString +
          ':' + dmData.tbBuildingsCity.Value)
      else
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

      if dmData.tbBuildingsAppendix.Value <> '' then
      begin
        MemoId := MemoId + 1;
        MemoFile := sdSave.FileName + IntToStr(MemoId) + '.txt';

        Writeln(mf, dmData.tbBuildingsRegId.Value);
        Writeln(mf, MemoFile);

        dmData.tbBuildingsAppendix.SaveToFile(MemoFile);
      end;
      dmData.tbBuildings.Next;
      pbStatus.Position := pbStatus.Position + 1;
    end;
    CloseFile(mf);
    CloseFile(f);
    pbStatus.Hide;
    MessageDlg('Данные успешно экспортированы в ' + sdSave.FileName, mtInformation, [mbOk], 0);
  end;
end;

procedure TfmMain.aImportExecute(Sender: TObject);
var
  FileName: String;
  I: Integer;
  Id: String;
  BookId: Integer;
  ForeignId: String;
  SepPos: Integer;
  City: String;
  CityId: Integer;
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
        // dmData.tbBuildings.SetKey;
        // dmData.tbBuildingsRegId.Value := Id;
        // dmData.tbBuildings.GotoKey;
        dmData.tbBuildings.Locate('RegId', Id, []);
        dmData.tbBuildings.Edit;
        Edit := True;
      end;

      dmData.quBookId.Close;
      dmData.quBookId.ParamByName('BookId').Value := ForeignId;
      dmData.quBookId.Open;
      If dmData.quBookId.RecordCount = 0 then
      begin
        dmData.tbBooks.Insert;
        dmData.tbBooksTitle.Value := ForeignId;
        dmData.tbBooks.Post;
        BookId := dmData.tbBooksId.Value;
      end
      else
      begin
        BookId := dmData.quBookIdId.Value;
      end;

      if Edit then
      begin
        dmData.tbBuildingsBookId.Value := BookId;
        dmData.tbBuildingsRegId.Value := Id;

        SepPos := Pos(':', AdressType);

        if SepPos > 0 then
        begin
          City := Copy(AdressType, SepPos + 1, Length(AdressType) - SepPos);

          dmData.quCityId.Close;
          dmData.quCityId.ParamByName('CityName').Value := City;
          dmData.quCityId.Open;
          If dmData.quCityId.RecordCount = 0 then
          begin
            dmData.tbCities.Insert;
            dmData.tbCitiesCityName.Value := City;
            dmData.tbCities.Post;
            CityId := dmData.tbCitiesId.Value;
          end
          else
          begin
            CityId := dmData.quCityIdId.Value;
          end;
          dmData.tbBuildingsCityId.Value := CityId;

          AdressType := Copy(AdressType, 0, SepPos - 1);
        end;

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

procedure TfmMain.N11Click(Sender: TObject);
var
  BookId: Integer;
  Book: String;
begin
  Book := InputBox('Дело', 'Переместить в дело ', '');
  If Book <> '' then
  begin
    if MessageDlg('Вы действительно хотите переместить все записи в дело №' + Book + '?',
      mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      dmData.quBookId.Close;
      dmData.quBookId.ParamByName('BookId').Value := Book;
      dmData.quBookId.Open;
      If dmData.quBookId.RecordCount = 0 then
      begin
        dmData.tbBooks.Insert;
        dmData.tbBooksTitle.Value := Book;
        dmData.tbBooks.Post;
        BookId := dmData.tbBooksId.Value;
      end
      else
      begin
        BookId := dmData.quBookIdId.Value;
      end;
      dmData.quBookChange.ParamByName('BookId').Value := BookId;
      dmData.quBookChange.ExecSQL;
      dmData.tbBuildings.Refresh;
      ShowMessage('Все записи успешно перенесены в дело №' + Book);
    end;
  end;
end;

procedure TfmMain.tmAutosaveTimer(Sender: TObject);
var
  RowId: Integer;
begin
  dmData.Log('Saving database');

  RowId := dmData.tbBuildingsId.Value;

  dmData.Log('Current row is ' + IntToStr(RowId));

  dmData.OnCreate(nil);
  fmMain.Caption := 'Приватизация (Последнее сохранение ' + FormatDateTime('t', Now) + ')';

  dmData.Log('Saved');

  dmData.tbBuildings.Locate('Id', RowId, []);
  // dmData.tbBuildings.

  dmData.Log('Current row is ' + IntToStr(RowId) + ' again');
end;

procedure TfmMain.aFindLooseExecute(Sender: TObject);
var
  BookToSearch: String;
  BookId: Integer;
  SearchId: Integer;
  SearchFrom: Integer;
  SearchTo: Integer;
  Missed: String;
begin
  BookToSearch := InputBox('Поиск пропущенных', 'Искать в деле ', dmData.tbBooksTitle.Value);

  dmData.quBookId.Close;
  dmData.quBookId.ParamByName('BookId').Value := BookToSearch;
  dmData.quBookId.Open;

  BookId := dmData.quBookIdId.Value;
  SearchFrom := StrToIntDef(InputBox('Поиск пропущенных', 'Первая запись', '1'), 0);
  SearchTo := StrToIntDef(InputBox('Поиск пропущенных', 'Последняя запись', IntToStr(dmData.tbBuildingsRegNum.Value)), 0);

  if (SearchFrom = 0) or (SearchTo = 0) then exit;

  Missed := '';
  for SearchId := SearchFrom to SearchTo do
  begin
    dmData.quMissed.Close;
    dmData.quMissed.ParamByName('BookId').Value := BookId;
    dmData.quMissed.ParamByName('RegId').Value := SearchId;
    dmData.quMissed.Open;

    if dmData.quMissedCountId.Value = 0 then
    begin
      if Length(Missed) > 0 then
        Missed := Missed + ', ' + BookToSearch + '/' + IntToStr(SearchId)
      else
        Missed := 'Пропущены записи: ' + BookToSearch + '/' + IntToStr(SearchId);
    end;
  end;

  ShowMessage(Missed);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  DBPath := GetCurrentDir + '\db';
end;

procedure TfmMain.miAutosaveClick(Sender: TObject);
begin
  tmAutosave.Enabled := miAutosave.Checked;
end;

end.
