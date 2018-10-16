object frmAppointPlanEdit: TfrmAppointPlanEdit
  Left = 0
  Top = 0
  Caption = #20219#20813#35745#21010
  ClientHeight = 285
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 49
    Top = 35
    Width = 60
    Height = 16
    Caption = #20219#20813#26041#26696
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 49
    Top = 66
    Width = 60
    Height = 16
    Caption = #21046#34920#26085#26399
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 64
    Top = 97
    Width = 45
    Height = 16
    Caption = #21046#34920#20154
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 19
    Top = 128
    Width = 90
    Height = 16
    Caption = #24180#40836#35745#31639#26102#38388
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 49
    Top = 159
    Width = 60
    Height = 16
    Caption = #20219#20813#27969#31243
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 121
    Top = 30
    DataBinding.DataField = 'name'
    DataBinding.DataSource = DataSource1
    TabOrder = 0
    Width = 121
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 121
    Top = 61
    DataBinding.DataField = 'create_time'
    DataBinding.DataSource = DataSource1
    TabOrder = 1
    Width = 121
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 121
    Top = 92
    DataBinding.DataField = 'create_user'
    DataBinding.DataSource = DataSource1
    TabOrder = 2
    Width = 121
  end
  object cxDBDateEdit2: TcxDBDateEdit
    Left = 121
    Top = 123
    DataBinding.DataField = 'age_begin'
    DataBinding.DataSource = DataSource1
    TabOrder = 3
    Width = 121
  end
  object cxDBComboBox1: TcxDBComboBox
    Left = 121
    Top = 154
    DataBinding.DataField = 'appoint_flow'
    DataBinding.DataSource = DataSource1
    TabOrder = 4
    Width = 121
  end
  object Button1: TButton
    Left = 121
    Top = 224
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 212
    Top = 224
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    Left = 24
    Top = 184
  end
end
