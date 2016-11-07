object fmPrivatisation: TfmPrivatisation
  Left = 395
  Top = 167
  Width = 557
  Height = 446
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
    Top = 383
    Width = 541
    Height = 25
    DataSource = dmData.dsBuildings
    Align = alBottom
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 383
    Align = alClient
    TabOrder = 0
    DesignSize = (
      541
      383)
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 189
      Height = 13
      Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#8470' ('#1053#1072#1087#1088#1080#1084#1077#1088': 1/1)'
    end
    object Label4: TLabel
      Left = 8
      Top = 344
      Width = 93
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    end
    object Label8: TLabel
      Left = 232
      Top = 360
      Width = 45
      Height = 13
      Caption = ' 01.01.91'
    end
    object Label9: TLabel
      Left = 336
      Top = 8
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
    end
    object Label10: TLabel
      Left = 8
      Top = 12
      Width = 41
      Height = 13
      Caption = #1044#1077#1083#1086' '#8470
    end
    object dbedId: TDBEdit
      Left = 218
      Top = 40
      Width = 107
      Height = 21
      DataField = 'RegId'
      DataSource = dmData.dsBuildings
      TabOrder = 0
    end
    object gbAdress: TGroupBox
      Left = 8
      Top = 64
      Width = 320
      Height = 105
      Caption = #1040#1076#1088#1077#1089
      TabOrder = 1
      DesignSize = (
        320
        105)
      object Label2: TLabel
        Left = 204
        Top = 88
        Width = 9
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1076'.'
      end
      object Label3: TLabel
        Left = 260
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
        Width = 125
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'AddrName'
        DataSource = dmData.dsBuildings
        TabOrder = 2
      end
      object dbedAddrBuilding: TDBEdit
        Left = 220
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
        Left = 284
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
        Width = 305
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = edAddrExit
      end
    end
    object gbOwner: TGroupBox
      Left = 7
      Top = 176
      Width = 320
      Height = 105
      Caption = #1042#1083#1072#1076#1077#1083#1077#1094
      TabOrder = 2
      DesignSize = (
        320
        105)
      object Label6: TLabel
        Left = 8
        Top = 24
        Width = 74
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      end
      object dbedSurname: TDBEdit
        Left = 8
        Top = 72
        Width = 266
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OwnerName'
        DataSource = dmData.dsBuildings
        TabOrder = 1
      end
      object dbedInit: TDBEdit
        Left = 281
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
        Width = 305
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = edOwnerExit
      end
    end
    object gbBase: TGroupBox
      Left = 7
      Top = 280
      Width = 320
      Height = 49
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      TabOrder = 3
      DesignSize = (
        320
        49)
      object Label11: TLabel
        Left = 208
        Top = 20
        Width = 11
        Height = 13
        Caption = #1086#1090
      end
      object Label12: TLabel
        Left = 8
        Top = 20
        Width = 89
        Height = 13
        Caption = #1056#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1077' '#8470
      end
      object dbedBaseId: TDBEdit
        Left = 104
        Top = 16
        Width = 97
        Height = 21
        TabStop = False
        DataField = 'BaseId'
        DataSource = dmData.dsBuildings
        TabOrder = 0
      end
      object dbedBaseDate: TDBEdit
        Left = 224
        Top = 16
        Width = 88
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BaseDate'
        DataSource = dmData.dsBuildings
        TabOrder = 1
      end
    end
    object dbedRegDate: TDBEdit
      Left = 232
      Top = 336
      Width = 89
      Height = 21
      DataField = 'RegDate'
      DataSource = dmData.dsBuildings
      TabOrder = 4
    end
    object dbmmAppendix: TDBMemo
      Left = 336
      Top = 32
      Width = 198
      Height = 343
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'Appendix'
      DataSource = dmData.dsBuildings
      TabOrder = 5
    end
    object dblcBook: TDBLookupComboBox
      Left = 216
      Top = 8
      Width = 113
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
