object frmTrainCadreDetail: TfrmTrainCadreDetail
  Left = 0
  Top = 0
  Caption = #24178#37096#22521#35757
  ClientHeight = 576
  ClientWidth = 1051
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1051
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 8
      Width = 88
      Height = 25
      Caption = #24178#37096#22521#35757
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 69
    Width = 1051
    Height = 507
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Tag = 9
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Microsoft YaHei UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 296
    Top = 184
    DockControlHeights = (
      0
      0
      28
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 1000
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Caption = #21152#20837#24178#37096
      Category = 0
      Hint = #21152#20837#24178#37096
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #21024#38500#24178#37096
      Category = 0
      Hint = #21024#38500#24178#37096
      Visible = ivAlways
      OnClick = dxBarButton2Click
    end
    object dxBarButton3: TdxBarButton
      Caption = #32534#36753#20219#20813#20449#24687
      Category = 0
      Hint = #32534#36753#20219#20813#20449#24687
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = #26356#26032#24178#37096
      Category = 0
      Hint = #26356#26032#24178#37096
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = #19979#31227
      Category = 0
      Hint = #19979#31227
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object dxBarButton6: TdxBarButton
      Caption = #24178#37096#20449#24687
      Category = 0
      Hint = #24178#37096#20449#24687
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton7: TdxBarButton
      Caption = #19978#31227
      Category = 0
      Hint = #19978#31227
      Visible = ivAlways
      OnClick = dxBarButton7Click
    end
    object dxBarButton8: TdxBarButton
      Caption = #25253#34920#36755#20986
      Category = 0
      Hint = #25253#34920#36755#20986
      Visible = ivAlways
    end
    object dxBarButton9: TdxBarButton
      Caption = '    '#21047#26032'    '
      Category = 0
      Hint = '    '#21047#26032'    '
      Visible = ivAlways
      OnClick = dxBarButton9Click
    end
  end
  object DataSource1: TDataSource
    Left = 208
    Top = 224
  end
end
