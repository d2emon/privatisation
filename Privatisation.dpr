program Privatisation;

uses
  Forms,
  unMain in 'unMain.pas' {fmMain},
  unData in 'unData.pas' {dmData: TDataModule},
  unAdress in 'unAdress.pas' {fmAdress},
  unPrivatisation in 'unPrivatisation.pas' {fmPrivatisation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfmAdress, fmAdress);
  Application.CreateForm(TfmPrivatisation, fmPrivatisation);
  Application.Run;
end.
