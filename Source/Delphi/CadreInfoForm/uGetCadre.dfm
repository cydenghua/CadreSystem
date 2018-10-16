object frmGetCadre: TfrmGetCadre
  Left = 0
  Top = 0
  Caption = #36873#25321#24178#37096
  ClientHeight = 553
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 486
    Width = 807
    Height = 67
    Align = alBottom
    TabOrder = 0
    object Button5: TButton
      Left = 568
      Top = 24
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 672
      Top = 24
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button6Click
    end
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Button7: TButton
      Left = 151
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#25214
      TabOrder = 3
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 232
      Top = 24
      Width = 75
      Height = 25
      Caption = #20840#26174
      TabOrder = 4
      OnClick = Button8Click
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    Caption = #26410#36873#24178#37096
    TabOrder = 1
    Height = 486
    Width = 321
    object cxListBoxUnSelect: TcxListBox
      Left = 2
      Top = 18
      Width = 317
      Height = 466
      Align = alClient
      ItemHeight = 25
      Items.Strings = (
        '123'
        '123'
        '123')
      MultiSelect = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 411
    Top = 0
    Align = alClient
    Caption = #24050#36873#24178#37096
    TabOrder = 2
    Height = 486
    Width = 396
    object cxListBoxSelect: TcxListBox
      Left = 2
      Top = 18
      Width = 392
      Height = 466
      Align = alClient
      ItemHeight = 25
      MultiSelect = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      ExplicitLeft = 6
      ExplicitTop = 14
    end
  end
  object Panel2: TPanel
    Left = 321
    Top = 0
    Width = 90
    Height = 486
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 6
      Top = 159
      Width = 75
      Height = 25
      Caption = ' <'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 6
      Top = 195
      Width = 75
      Height = 25
      Caption = '>'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 6
      Top = 257
      Width = 75
      Height = 25
      Caption = #12298
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 6
      Top = 293
      Width = 75
      Height = 25
      Caption = #12299
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object DataSource1: TDataSource
    Left = 360
    Top = 376
  end
end
