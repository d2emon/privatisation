object fmMain: TfmMain
  Left = 280
  Top = 130
  Width = 928
  Height = 480
  Caption = #1055#1088#1080#1074#1072#1090#1080#1079#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
    99999999999999999999999999999CC00000000000000000000000000CC99CC0
    00000000B00000000B0000000CC99CC00000000040000800040008080CC99CC0
    0000000030000000030000000CC99CC008080000C00000000C0008080CC99CC0
    00000000C00008080C0000000CC99CC008080800C00000000C0000000CC99CC0
    00000000C0080C00CC0000000CC99CCCC00C0000C0000C00CC0000000CC99CCC
    C00C0000C0000C00CC00000CCCC99CCCC00C0000C0000CCCCC00000CCCC99CCC
    CCCC0000C0030CCCCC00000CCCC99CCCCCCC0300C0000CCCCC00000CCCC99CCC
    CC9C0000CC00CCCCCC00000CCCC99CCCCCCC0300CCCCCCCCCC00000CCCC99CCC
    CCCC0000CCCFCCCCCC00080CCCC99CCCFCCC0808CCCCCCCCCCCC000CCCC99CCC
    CCCC0000CCCCCCCCFCCC080CCCC99CCCCCCC0808CCCCCCCCCCCC000CCFC99CCC
    CCCC0000CCCCCCCCCCCCC0CCCCC99CCCCCCC0808CCCCCCCCCCCCC0CCCCC99CCC
    CCCC0000CCCCFCCCCCCCC0CCCCC99CCCCCCCC00CCCCCCCCCCCCCCCCCCCC99CCC
    FCCCC00CCCCCCCCCFCCCCCCCCCC99CCCCCCCCCCCCCCCCCCCCCCCCC9CCCC99CCC
    CCCCCCCCCCCCCFCCCCCCCCCCCCC99CCCCCCCCCCCCCCCCCCCCFCCCCCCCCC99CCC
    CCCC6FCCCCCCCCCCCCCCCCCCFCC99CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC99CCC
    CCCCCCCCCCCCCCCCCCCCCCCCCCC9999999999999999999999999999999990000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = mmMain
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dbgdRegistration: TDBGrid
    Left = 0
    Top = 41
    Width = 912
    Height = 381
    Align = alClient
    DataSource = dmData.dsBuildings
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Book'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RegId'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adress'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Owner_Full'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Base'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RegDate'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    Visible = False
  end
  object mmMain: TMainMenu
    Left = 176
    Top = 56
    object N1: TMenuItem
      Action = aCards
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N3: TMenuItem
        Action = aAdresses
      end
      object N4: TMenuItem
        Action = aBooks
      end
    end
    object N5: TMenuItem
      Action = aExport
    end
  end
  object alActions: TActionList
    Left = 128
    Top = 96
    object aCards: TAction
      Caption = #1050#1072#1088#1090#1086#1090#1077#1082#1072
      OnExecute = aCardsExecute
    end
    object aAdresses: TAction
      Caption = #1040#1076#1088#1077#1089#1072
      OnExecute = aAdressesExecute
    end
    object aBooks: TAction
      Caption = #1050#1085#1080#1075#1080
      OnExecute = aBooksExecute
    end
    object aExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090
      OnExecute = aExportExecute
    end
  end
  object sdSave: TSaveDialog
    DefaultExt = 'dat'
    Left = 160
    Top = 128
  end
end
