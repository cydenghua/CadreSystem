object frmDicOrg: TfrmDicOrg
  Left = 0
  Top = 0
  Caption = #32452#32455#26550#26500#31649#29702
  ClientHeight = 571
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 520
    Width = 839
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object cxCheckBox1: TcxCheckBox
      Left = 199
      Top = 16
      Caption = #20801#35768#20462#25913
      Properties.OnChange = cxCheckBox1PropertiesChange
      State = cbsChecked
      TabOrder = 0
      Width = 72
    end
    object Button9: TButton
      Left = 284
      Top = 14
      Width = 75
      Height = 25
      Caption = #28155#21152#21516#32423
      TabOrder = 1
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 442
      Top = 14
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 633
      Top = 14
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 3
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 549
      Top = 14
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 4
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 745
      Top = 14
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 5
      OnClick = Button13Click
    end
    object Button1: TButton
      Left = 27
      Top = 14
      Width = 70
      Height = 25
      Caption = #19978#31227
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 103
      Top = 14
      Width = 70
      Height = 25
      Caption = #19979#31227
      TabOrder = 7
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 363
      Top = 14
      Width = 75
      Height = 25
      Caption = #28155#21152#19979#32423
      TabOrder = 8
      OnClick = Button3Click
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 249
    Top = 0
    Width = 8
    Height = 520
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 582
    Height = 520
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 582
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label8: TLabel
        Left = 20
        Top = 20
        Width = 110
        Height = 25
        Caption = #24403#21069#21333#20301#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxDBLabel1: TcxDBLabel
        Left = 136
        Top = 17
        DataBinding.DataField = 'name'
        DataBinding.DataSource = DataSource1
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -21
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Height = 30
        Width = 300
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 57
      Width = 582
      Height = 463
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 459
      ClientRectLeft = 4
      ClientRectRight = 578
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = #22522#26412#20449#24687
        ImageIndex = 0
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 574
          Height = 435
          Align = alClient
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Label1: TLabel
            Left = 44
            Top = 18
            Width = 306
            Height = 13
            Caption = #65288#8220#21333#20301#20998#31867#8221#26159#25351#23545#26576#20123#21333#20301#30340#32479#31216#65292#22914#8220#22235#22823#29677#23376#8221#65289
            Color = clHotLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label2: TLabel
            Left = 51
            Top = 119
            Width = 60
            Height = 13
            Caption = #21333#20301#21517#31216#65306
          end
          object Label3: TLabel
            Left = 51
            Top = 150
            Width = 60
            Height = 13
            Caption = #21333#20301#31616#31216#65306
          end
          object Label4: TLabel
            Left = 51
            Top = 181
            Width = 60
            Height = 13
            Caption = #19978#32423#21333#20301#65306
          end
          object cxDBRadioGroup1: TcxDBRadioGroup
            Left = 44
            Top = 54
            Caption = #21333#20301#31867#22411#65306
            DataBinding.DataField = 'org_type'
            DataBinding.DataSource = DataSource1
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = #30495#23454#21333#20301'/'#37096#38376
                Value = '1'
              end
              item
                Caption = #34394#25311#21333#20301'/'#20998#32452
                Value = '0'
              end>
            TabOrder = 0
            Height = 49
            Width = 329
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 123
            Top = 116
            DataBinding.DataField = 'name'
            DataBinding.DataSource = DataSource1
            TabOrder = 1
            Width = 250
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 123
            Top = 147
            DataBinding.DataField = 'name2'
            DataBinding.DataSource = DataSource1
            TabOrder = 2
            Width = 250
          end
          object cxGroupBox1: TcxGroupBox
            Left = 44
            Top = 226
            Caption = #35814#32454#20449#24687
            TabOrder = 3
            Height = 135
            Width = 393
            object Label5: TLabel
              Left = 23
              Top = 24
              Width = 84
              Height = 13
              Caption = #32452#32455#26426#26500#20195#30721#65306
            end
            object Label6: TLabel
              Left = 47
              Top = 55
              Width = 60
              Height = 13
              Caption = #21333#20301#31867#22411#65306
            end
            object Label7: TLabel
              Left = 23
              Top = 86
              Width = 84
              Height = 13
              Caption = #36130#25919#20379#20859#31867#22411#65306
            end
            object cxDBTextEdit3: TcxDBTextEdit
              Left = 113
              Top = 21
              DataBinding.DataField = 'org_code'
              DataBinding.DataSource = DataSource1
              TabOrder = 0
              Width = 250
            end
            object cxDBLookupComboBox2: TcxDBLookupComboBox
              Left = 113
              Top = 52
              DataBinding.DataField = 'org_type'
              DataBinding.DataSource = DataSource1
              Properties.KeyFieldNames = 'sys_id'
              Properties.ListColumns = <
                item
                  Caption = #31867#22411
                  FieldName = 'name'
                end>
              Properties.ListSource = DataSource3
              TabOrder = 1
              Width = 251
            end
            object cxDBLookupComboBox3: TcxDBLookupComboBox
              Left = 113
              Top = 83
              DataBinding.DataField = 'finace_type'
              DataBinding.DataSource = DataSource1
              Properties.KeyFieldNames = 'sys_id'
              Properties.ListColumns = <
                item
                  Caption = #31867#22411
                  FieldName = 'name'
                end>
              Properties.ListSource = DataSource4
              TabOrder = 2
              Width = 251
            end
          end
          object cxDBLookupComboBox1: TcxDBLookupComboBox
            Left = 123
            Top = 178
            DataBinding.DataField = 'parent_id'
            DataBinding.DataSource = DataSource1
            Properties.KeyFieldNames = 'sys_id'
            Properties.ListColumns = <
              item
                Caption = #21333#20301
                FieldName = 'name'
              end>
            Properties.ListSource = DataSource2
            TabOrder = 4
            Width = 250
          end
        end
      end
    end
  end
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 249
    Height = 520
    Align = alLeft
    Bands = <
      item
      end>
    DataController.DataSource = DataSource1
    DataController.ParentField = 'parent_id'
    DataController.KeyField = 'sys_id'
    Navigator.Buttons.CustomButtons = <>
    OptionsData.Editing = False
    RootValue = -1
    TabOrder = 3
    object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #26550#26500
      DataBinding.FieldName = 'name'
      Width = 300
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
      DataBinding.FieldName = 'sys_id'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn
      DataBinding.FieldName = 'order_no'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object DataSource1: TDataSource
    Left = 149
    Top = 217
  end
  object DataSource2: TDataSource
    Left = 149
    Top = 288
  end
  object DataSource3: TDataSource
    Left = 120
    Top = 360
  end
  object DataSource4: TDataSource
    Left = 120
    Top = 424
  end
end
