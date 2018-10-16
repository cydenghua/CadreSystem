object frmTrainCadreSetting: TfrmTrainCadreSetting
  Left = 0
  Top = 0
  Caption = #22521#35757#35774#32622
  ClientHeight = 525
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 831
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Button13: TButton
      Left = 688
      Top = 6
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button13Click
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 831
    Height = 488
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet3
    Properties.CustomButtons.Buttons = <>
    Properties.TabHeight = 25
    Properties.TabWidth = 150
    ClientRectBottom = 484
    ClientRectLeft = 4
    ClientRectRight = 827
    ClientRectTop = 31
    object cxTabSheet1: TcxTabSheet
      Caption = #22521#35757#26426#26500
      ImageIndex = 0
      object Panel2: TPanel
        Left = 704
        Top = 0
        Width = 119
        Height = 453
        Align = alRight
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Button1: TButton
          Left = 24
          Top = 120
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 24
          Top = 165
          Width = 75
          Height = 25
          Caption = #21024#38500
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 24
          Top = 210
          Width = 75
          Height = 25
          Caption = #20445#23384
          TabOrder = 2
          OnClick = Button3Click
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 453
        Align = alClient
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #22521#35757#31867#21035
      ImageIndex = 2
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 453
        Align = alClient
        TabOrder = 0
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object Panel4: TPanel
        Left = 704
        Top = 0
        Width = 119
        Height = 453
        Align = alRight
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Button7: TButton
          Left = 24
          Top = 120
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 0
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 24
          Top = 165
          Width = 75
          Height = 25
          Caption = #21024#38500
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 24
          Top = 210
          Width = 75
          Height = 25
          Caption = #20445#23384
          TabOrder = 2
          OnClick = Button9Click
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = #22521#35757#26041#24335
      ImageIndex = 3
      object cxGrid4: TcxGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 453
        Align = alClient
        TabOrder = 0
        object cxGridDBTableView3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSource3
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView3
        end
      end
      object Panel5: TPanel
        Left = 704
        Top = 0
        Width = 119
        Height = 453
        Align = alRight
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Button10: TButton
          Left = 24
          Top = 120
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 0
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 24
          Top = 165
          Width = 75
          Height = 25
          Caption = #21024#38500
          TabOrder = 1
          OnClick = Button11Click
        end
        object Button12: TButton
          Left = 24
          Top = 210
          Width = 75
          Height = 25
          Caption = #20445#23384
          TabOrder = 2
          OnClick = Button12Click
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 132
    Top = 119
  end
  object DataSource2: TDataSource
    Left = 132
    Top = 167
  end
  object DataSource3: TDataSource
    Left = 132
    Top = 223
  end
end
