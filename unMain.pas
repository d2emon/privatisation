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
    procedure aCardsExecute(Sender: TObject);
    procedure aAdressesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aBooksExecute(Sender: TObject);
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

end.
