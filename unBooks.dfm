object fmBooks: TfmBooks
  Left = 351
  Top = 149
  Width = 224
  Height = 316
  Caption = #1044#1077#1083#1072
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
    DataSource = dmData.dsBooks
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Title'
        Visible = True
      end>
  end
  object dbnvAdress: TDBNavigator
    Left = 0
    Top = 253
    Width = 208
    Height = 25
    DataSource = dmData.dsBooks
    Align = alBottom
    TabOrder = 1
  end
end
