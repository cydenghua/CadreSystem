object frmOrgStructure: TfrmOrgStructure
  Left = 0
  Top = 0
  Caption = #32452#32455#26550#26500
  ClientHeight = 556
  ClientWidth = 976
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 976
    Height = 556
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 552
    ClientRectLeft = 4
    ClientRectRight = 972
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = #24178#37096#21015#34920
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 69
        Width = 968
        Height = 459
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Tag = 9
          OnDblClick = cxGrid1DBTableView1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Editing = False
          OptionsView.CellEndEllipsis = True
          OptionsView.CellAutoHeight = True
          OptionsView.CellTextMaxLineCount = 2
          OptionsView.GroupByBox = False
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 41
        Width = 968
        Height = 28
        Align = dalTop
        BarManager = dxBarManager1
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 968
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object Label1: TLabel
          Left = 27
          Top = 15
          Width = 104
          Height = 16
          Caption = #24403#21069#20154#25968#65306'*'#20154
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 161
          Top = 6
          Width = 88
          Height = 25
          Caption = #21333#20301#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 256
    Top = 336
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
    Left = 392
    Top = 184
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1010
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #21152#20837#24178#37096
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = #20174#24178#37096#24211#36873#25321
      Category = 0
      Hint = #20174#24178#37096#24211#36873#25321
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #26032#24405#20837#24178#37096
      Category = 0
      Hint = #26032#24405#20837#24178#37096
      Visible = ivAlways
    end
    object dxBarSubItem2: TdxBarSubItem
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton3: TdxBarButton
      Caption = #26174#31034#19979#32423
      Category = 0
      Hint = #26174#31034#19979#32423
      Visible = ivAlways
      OnClick = dxBarButton3Click
    end
    object dxBarButton4: TdxBarButton
      Caption = #24178#37096#35814#24773
      Category = 0
      Hint = #24178#37096#35814#24773
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object dxBarButton5: TdxBarButton
      Caption = #21024#38500#24178#37096
      Category = 0
      Hint = #21024#38500#24178#37096
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object dxBarButton6: TdxBarButton
      Caption = #20462#25913#32844#21153
      Category = 0
      Hint = #20462#25913#32844#21153
      Visible = ivAlways
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = #20462#25913#32844#21153
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end>
    end
    object dxBarButton7: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton8: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton9: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton10: TdxBarButton
      Caption = #20462#25913#32844#21153
      Category = 0
      Hint = #20462#25913#32844#21153
      Visible = ivAlways
      OnClick = dxBarButton10Click
    end
  end
end
