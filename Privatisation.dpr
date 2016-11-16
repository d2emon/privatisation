program Privatisation;

uses
  Forms,
  unMain in 'unMain.pas' {fmMain},
  unData in 'unData.pas' {dmData: TDataModule},
  unAdress in 'unAdress.pas' {fmAdress},
  unPrivatisation in 'unPrivatisation.pas' {fmPrivatisation},
  unBooks in 'unBooks.pas' {fmBooks},
  unCity in 'unCity.pas' {fmCities};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Приватизация';
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfmAdress, fmAdress);
  Application.CreateForm(TfmPrivatisation, fmPrivatisation);
  Application.CreateForm(TfmBooks, fmBooks);
  Application.CreateForm(TfmCities, fmCities);
  Application.Run;
end.
