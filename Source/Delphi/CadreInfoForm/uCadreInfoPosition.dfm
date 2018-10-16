object frmCadreInfoPosition: TfrmCadreInfoPosition
  Left = 0
  Top = 0
  Caption = #20219#32844#32534#36753
  ClientHeight = 462
  ClientWidth = 452
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
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 88
    Height = 25
    Caption = #24178#37096#21517#31216
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 138
    Width = 48
    Height = 13
    Caption = #20219#32844#21333#20301
  end
  object Label3: TLabel
    Left = 24
    Top = 169
    Width = 48
    Height = 13
    Caption = #32844#21153#21517#31216
  end
  object cxDBRadioGroup1: TcxDBRadioGroup
    Left = 24
    Top = 72
    Caption = #20219#32844#24773#20917
    DataBinding.DataField = 'status'
    DataBinding.DataSource = DataSource1
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #29616#20219#32844
        Value = '1'
      end
      item
        Caption = #24050#20813#32844
        Value = '0'
      end>
    Properties.OnChange = cxDBRadioGroup1PropertiesChange
    TabOrder = 0
    Height = 49
    Width = 313
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 93
    Top = 166
    DataBinding.DataField = 'name'
    DataBinding.DataSource = DataSource1
    TabOrder = 1
    Width = 244
  end
  object cxGroupBox1: TcxGroupBox
    Left = 24
    Top = 209
    Caption = #20219#32844#20449#24687
    TabOrder = 2
    Height = 84
    Width = 401
    object Label4: TLabel
      Left = 13
      Top = 26
      Width = 48
      Height = 13
      Caption = #20219#32844#21407#22240
    end
    object Label5: TLabel
      Left = 25
      Top = 52
      Width = 36
      Height = 13
      Caption = #20219#32844#25991
    end
    object Label6: TLabel
      Left = 200
      Top = 52
      Width = 48
      Height = 13
      Caption = #20219#32844#25991#21495
    end
    object Label10: TLabel
      Left = 200
      Top = 26
      Width = 48
      Height = 13
      Caption = #20219#32844#26102#38388
    end
    object cxDBComboBox1: TcxDBComboBox
      Left = 69
      Top = 21
      DataBinding.DataField = 'appoint_reason'
      DataBinding.DataSource = DataSource1
      TabOrder = 0
      Width = 119
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 67
      Top = 48
      DataBinding.DataField = 'appoint_file'
      DataBinding.DataSource = DataSource1
      TabOrder = 1
      Width = 121
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 254
      Top = 48
      DataBinding.DataField = 'appoint_file_no'
      DataBinding.DataSource = DataSource1
      TabOrder = 2
      Width = 121
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 254
      Top = 21
      DataBinding.DataField = 'begin_time'
      DataBinding.DataSource = DataSource1
      TabOrder = 3
      Width = 121
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 24
    Top = 317
    Caption = #20813#32844#20449#24687
    TabOrder = 3
    Visible = False
    Height = 84
    Width = 401
    object Label7: TLabel
      Left = 13
      Top = 26
      Width = 48
      Height = 13
      Caption = #20813#32844#21407#22240
    end
    object Label8: TLabel
      Left = 25
      Top = 52
      Width = 36
      Height = 13
      Caption = #20813#32844#25991
    end
    object Label9: TLabel
      Left = 200
      Top = 52
      Width = 48
      Height = 13
      Caption = #20813#32844#25991#21495
    end
    object Label11: TLabel
      Left = 200
      Top = 26
      Width = 48
      Height = 13
      Caption = #20813#32844#26102#38388
    end
    object cxDBComboBox2: TcxDBComboBox
      Left = 69
      Top = 21
      DataBinding.DataField = 'dismiss_reason'
      DataBinding.DataSource = DataSource1
      TabOrder = 0
      Width = 119
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 67
      Top = 48
      DataBinding.DataField = 'dismiss_file'
      DataBinding.DataSource = DataSource1
      TabOrder = 1
      Width = 121
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 254
      Top = 48
      DataBinding.DataField = 'dismiss_file_no'
      DataBinding.DataSource = DataSource1
      TabOrder = 2
      Width = 121
    end
    object cxDBDateEdit2: TcxDBDateEdit
      Left = 254
      Top = 21
      DataBinding.DataField = 'end_time'
      DataBinding.DataSource = DataSource1
      TabOrder = 3
      Width = 121
    end
  end
  object cxDBComboBox3: TcxDBComboBox
    Left = 93
    Top = 135
    DataBinding.DataField = 'org_name'
    DataBinding.DataSource = DataSource1
    Properties.OnChange = cxDBComboBox3PropertiesChange
    TabOrder = 4
    Width = 244
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 452
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    ExplicitLeft = 128
    ExplicitTop = 464
    ExplicitWidth = 177
    object Button1: TButton
      Left = 246
      Top = 18
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 350
      Top = 18
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    Left = 368
    Top = 40
  end
end
