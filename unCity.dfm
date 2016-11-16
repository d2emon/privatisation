object fmCities: TfmCities
  Left = 192
  Top = 124
  Width = 224
  Height = 316
  Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#1087#1091#1085#1082#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgdAdress: TDBGrid
    Left = 0
    Top = 0
    Width = 208
    Height = 253
    Align = alClient
    DataSource = dmData.dsCities
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CityName'
        Visible = True
      end>
  end
  object dbnvAdress: TDBNavigator
    Left = 0
    Top = 253
    Width = 208
    Height = 25
    DataSource = dmData.dsCities
    Align = alBottom
    TabOrder = 1
  end
end
