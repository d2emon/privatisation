object fmAdress: TfmAdress
  Left = 192
  Top = 124
  Width = 240
  Height = 323
  Caption = #1040#1076#1088#1077#1089#1072
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
    Width = 224
    Height = 260
    Align = alClient
    DataSource = dmData.dsAdress
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Addr_type'
        Title.Caption = #1058#1080#1087' '#1091#1083#1080#1094#1099
        Visible = True
      end>
  end
  object dbnvAdress: TDBNavigator
    Left = 0
    Top = 260
    Width = 224
    Height = 25
    DataSource = dmData.dsAdress
    Align = alBottom
    TabOrder = 1
  end
end
