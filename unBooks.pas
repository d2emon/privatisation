unit unBooks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TfmBooks = class(TForm)
    dbgdAdress: TDBGrid;
    dbnvAdress: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBooks: TfmBooks;

implementation

uses unData;

{$R *.dfm}

end.
