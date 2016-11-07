unit unAdress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TfmAdress = class(TForm)
    dbgdAdress: TDBGrid;
    dbnvAdress: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAdress: TfmAdress;

implementation

uses unData;

{$R *.dfm}

end.
