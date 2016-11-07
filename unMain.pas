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
    Panel1: TPanel;
    aBooks: TAction;
    N4: TMenuItem;
    aExport: TAction;
    N5: TMenuItem;
    sdSave: TSaveDialog;
    N6: TMenuItem;
    aImport: TAction;
    N7: TMenuItem;
    odOpen: TOpenDialog;
    procedure aCardsExecute(Sender: TObject);
    procedure aAdressesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aBooksExecute(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aImportExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses unData, unAdress, unPrivatisation, unBooks;

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
  end;
  MessageDlg('Данные успешно экспортированы в ' + sdSave.FileName, mtInformation, [mbOk], 0);
end;

procedure TfmMain.aImportExecute(Sender: TObject);
var
  FileName: String;
  Id: String;
  ForeignId: String;
  Adress: String;
  Owner: String;
  RegDate: String;
  f: TextFile;
begin
  if odOpen.Execute then
  begin
    AssignFile(f, odOpen.FileName);
    ReSet(f);
    while not Eof(f) do
    begin
      ReadLn(f, Id);

      ReadLn(f, ForeignId);
      ReadLn(f, Id);
      dmData.tbBuildings.Insert;
      dmData.tbBuildingsBookId.Value := StrToIntDef(ForeignId, 0);
      dmData.tbBuildingsRegId.Value := Id;

      ReadLn(f, ForeignId);
      dmData.tbBuildingsAddrType.Value := StrToIntDef(ForeignId, 0);
      ReadLn(f, Adress);
      dmData.tbBuildingsAddrName.Value := Adress;
      ReadLn(f, Adress);
      dmData.tbBuildingsAddrBuild.Value := Adress;
      ReadLn(f, Adress);
      dmData.tbBuildingsAddrFlat.Value := Adress;

      ReadLn(f, Owner);
      dmData.tbBuildingsOwnerName.Value := Owner;
      ReadLn(f, Owner);
      dmData.tbBuildingsOwnerInit.Value := Owner;

      ReadLn(f, Id);
      dmData.tbBuildingsBaseId.Value := Id;
      ReadLn(f, RegDate);
      dmData.tbBuildingsBaseDate.Value := StrToDate(RegDate);
      ReadLn(f, RegDate);
      dmData.tbBuildingsRegDate.Value := StrToDate(RegDate);

      dmData.tbBuildings.Post;
      ReadLn(f, Id);
    end;
    CloseFile(f);
  end;
  MessageDlg('Данные успешно импортированы из ' + odOpen.FileName, mtInformation, [mbOk], 0);
end;

end.
