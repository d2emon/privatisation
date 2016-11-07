object fmPrivatisation: TfmPrivatisation
  Left = 391
  Top = 133
  Width = 433
  Height = 500
  Caption = #1055#1088#1080#1074#1072#1090#1080#1079#1072#1094#1080#1103
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
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 437
    Width = 417
    Height = 25
    DataSource = dmData.dsBuildings
    Align = alBottom
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 437
    Align = alClient
    TabOrder = 0
    DesignSize = (
      417
      437)
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 189
      Height = 13
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#8470' ('#1053#1072#1087#1088#1080#1084#1077#1088': 1/1)'
    end
    object Label4: TLabel
      Left = 8
      Top = 400
      Width = 93
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    end
    object Label8: TLabel
      Left = 104
      Top = 416
      Width = 45
      Height = 13
      Caption = ' 01.01.91'
    end
    object Label9: TLabel
      Left = 256
      Top = 8
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
    end
    object Label10: TLabel
      Left = 8
      Top = 12
      Width = 30
      Height = 13
      Caption = #1050#1085#1080#1075#1072
    end
    object dbedId: TDBEdit
      Left = 214
      Top = 40
      Width = 32
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'RegId'
      DataSource = dmData.dsBuildings
      TabOrder = 0
    end
    object gbAdress: TGroupBox
      Left = 8
      Top = 64
      Width = 241
      Height = 105
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1076#1088#1077#1089
      TabOrder = 1
      DesignSize = (
        241
        105)
      object Label2: TLabel
        Left = 125
        Top = 88
        Width = 9
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1076'.'
      end
      object Label3: TLabel
        Left = 181
        Top = 88
        Width = 15
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1082#1074'.'
      end
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 103
        Height = 13
        Caption = #1091#1083'. '#1057#1086#1074#1077#1090#1089#1082#1072#1103' 85/25'
      end
      object dblcAddrType: TDBLookupComboBox
        Left = 8
        Top = 80
        Width = 57
        Height = 21
        DataField = 'AddrType'
        DataSource = dmData.dsBuildings
        KeyField = 'Id'
        ListField = 'Addr_type'
        ListSource = dmData.dsAdress
        TabOrder = 0
        TabStop = False
      end
      object dbedAddrStreet: TDBEdit
        Left = 72
        Top = 80
        Width = 46
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'AddrName'
        DataSource = dmData.dsBuildings
        TabOrder = 2
      end
      object dbedAddrBuilding: TDBEdit
        Left = 141
        Top = 80
        Width = 32
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        DataField = 'AddrBuild'
        DataSource = dmData.dsBuildings
        TabOrder = 3
      end
      object dbedAddrFlat: TDBEdit
        Left = 205
        Top = 80
        Width = 32
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        DataField = 'AddrFlat'
        DataSource = dmData.dsBuildings
        TabOrder = 4
      end
      object edAddr: TEdit
        Left = 8
        Top = 48
        Width = 226
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = edAddrExit
      end
    end
    object gbOwner: TGroupBox
      Left = 7
      Top = 176
      Width = 242
      Height = 105
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1083#1072#1076#1077#1083#1077#1094
      TabOrder = 2
      DesignSize = (
        242
        105)
      object Label6: TLabel
        Left = 8
        Top = 24
        Width = 63
        Height = 13
        Caption = #1048#1074#1072#1085#1086#1074' '#1048'.'#1048'.'
      end
      object dbedSurname: TDBEdit
        Left = 8
        Top = 72
        Width = 188
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OwnerName'
        DataSource = dmData.dsBuildings
        TabOrder = 1
      end
      object dbedInit: TDBEdit
        Left = 203
        Top = 71
        Width = 32
        Height = 21
        TabStop = False
        Anchors = [akRight]
        DataField = 'OwnerInit'
        DataSource = dmData.dsBuildings
        TabOrder = 2
      end
      object edOwner: TEdit
        Left = 8
        Top = 40
        Width = 227
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = edOwnerExit
      end
    end
    object gbBase: TGroupBox
      Left = 7
      Top = 280
      Width = 242
      Height = 105
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      TabOrder = 3
      DesignSize = (
        242
        105)
      object Label7: TLabel
        Left = 8
        Top = 24
        Width = 75
        Height = 13
        Caption = #1088'1234 01.01.91'
      end
      object dbedBaseId: TDBEdit
        Left = 8
        Top = 80
        Width = 81
        Height = 21
        TabStop = False
        DataField = 'BaseId'
        DataSource = dmData.dsBuildings
        TabOrder = 1
      end
      object dbedBaseDate: TDBEdit
        Left = 96
        Top = 80
        Width = 138
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BaseDate'
        DataSource = dmData.dsBuildings
        TabOrder = 2
      end
      object edBase: TEdit
        Left = 8
        Top = 48
        Width = 225
        Height = 21
        TabOrder = 0
        OnExit = edBaseExit
      end
    end
    object dbedRegDate: TDBEdit
      Left = 104
      Top = 392
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'RegDate'
      DataSource = dmData.dsBuildings
      TabOrder = 4
    end
    object dbmmAppendix: TDBMemo
      Left = 256
      Top = 32
      Width = 154
      Height = 397
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'Appendix'
      DataSource = dmData.dsBuildings
      TabOrder = 5
    end
    object dblcBook: TDBLookupComboBox
      Left = 104
      Top = 8
      Width = 145
      Height = 21
      DataField = 'BookId'
      DataSource = dmData.dsBuildings
      KeyField = 'Id'
      ListField = 'Title'
      ListSource = dmData.dsBooks
      TabOrder = 6
    end
  end
end
