object frmTrainCadreEdit: TfrmTrainCadreEdit
  Left = 0
  Top = 0
  Caption = #22521#35757#35774#32622
  ClientHeight = 457
  ClientWidth = 441
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
    Left = 36
    Top = 30
    Width = 60
    Height = 13
    Caption = #22521#35757#21517#31216#65306
  end
  object Label3: TLabel
    Left = 39
    Top = 116
    Width = 60
    Height = 13
    Caption = #22521#35757#31867#21035#65306
  end
  object Label4: TLabel
    Left = 39
    Top = 147
    Width = 60
    Height = 13
    Caption = #22521#35757#26102#38388#65306
  end
  object Label5: TLabel
    Left = 39
    Top = 178
    Width = 60
    Height = 13
    Caption = #22521#35757#26426#26500#65306
  end
  object Label6: TLabel
    Left = 39
    Top = 207
    Width = 60
    Height = 13
    Caption = #22521#35757#26041#24335#65306
  end
  object Label7: TLabel
    Left = 39
    Top = 238
    Width = 60
    Height = 13
    Caption = #22521#35757#20869#23481#65306
  end
  object Label8: TLabel
    Left = 39
    Top = 313
    Width = 60
    Height = 13
    Caption = #22806#20986#32771#23519#65306
  end
  object Label9: TLabel
    Left = 206
    Top = 147
    Width = 12
    Height = 13
    Caption = #33267
  end
  object Label10: TLabel
    Left = 326
    Top = 147
    Width = 36
    Height = 13
    Caption = #22825#25968#65306
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 102
    Top = 29
    DataBinding.DataField = 'name'
    DataBinding.DataSource = DataSource1
    TabOrder = 0
    Width = 300
  end
  object cxDBRadioGroup1: TcxDBRadioGroup
    Left = 30
    Top = 56
    Caption = #22521#35757#31181#31867#65306
    DataBinding.DataField = 'type'
    DataBinding.DataSource = DataSource1
    Properties.Columns = 3
    Properties.Items = <
      item
        Caption = #35843#35757
        Value = '1'
      end
      item
        Caption = #26412#32423#22521#35757
        Value = '2'
      end
      item
        Caption = #21333#20301#20869#37096#22521#35757
        Value = '3'
      end>
    TabOrder = 1
    Height = 49
    Width = 371
  end
  object cxDBComboBox1: TcxDBComboBox
    Left = 102
    Top = 111
    DataBinding.DataField = 'genre'
    DataBinding.DataSource = DataSource1
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 2
    Width = 300
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 102
    Top = 142
    DataBinding.DataField = 'begin_date'
    DataBinding.DataSource = DataSource1
    Properties.OnChange = cxDBDateEdit2PropertiesChange
    TabOrder = 3
    Width = 100
  end
  object cxDBDateEdit2: TcxDBDateEdit
    Left = 221
    Top = 143
    DataBinding.DataField = 'end_date'
    DataBinding.DataSource = DataSource1
    Properties.OnChange = cxDBDateEdit2PropertiesChange
    TabOrder = 4
    Width = 100
  end
  object cxDBSpinEdit1: TcxDBSpinEdit
    Left = 360
    Top = 143
    DataBinding.DataField = 'days'
    DataBinding.DataSource = DataSource1
    TabOrder = 5
    Width = 42
  end
  object cxDBComboBox2: TcxDBComboBox
    Left = 102
    Top = 173
    DataBinding.DataField = 'organization'
    DataBinding.DataSource = DataSource1
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 6
    Width = 300
  end
  object cxDBComboBox3: TcxDBComboBox
    Left = 102
    Top = 204
    DataBinding.DataField = 'mode'
    DataBinding.DataSource = DataSource1
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 7
    Width = 300
  end
  object cxDBMemo1: TcxDBMemo
    Left = 102
    Top = 235
    DataBinding.DataField = 'content'
    DataBinding.DataSource = DataSource1
    TabOrder = 8
    Height = 65
    Width = 300
  end
  object cxDBMemo2: TcxDBMemo
    Left = 102
    Top = 310
    DataBinding.DataField = 'inspect'
    DataBinding.DataSource = DataSource1
    TabOrder = 9
    Height = 65
    Width = 300
  end
  object Button1: TButton
    Left = 221
    Top = 408
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 10
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 327
    Top = 408
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 11
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 36
    Top = 408
    Width = 75
    Height = 25
    Caption = #22521#35757#35774#32622
    TabOrder = 12
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 368
  end
end
