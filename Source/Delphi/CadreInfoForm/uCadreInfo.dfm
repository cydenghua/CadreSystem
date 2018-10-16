object frmCadreInfo: TfrmCadreInfo
  Left = 0
  Top = 0
  Caption = #24178#37096#20449#24687
  ClientHeight = 656
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 608
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 215
      Height = 606
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSourceCadreInfo
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 217
    Top = 0
    Width = 731
    Height = 608
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet6
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 604
    ClientRectLeft = 4
    ClientRectRight = 727
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = #22522#26412#20449#24687
      ImageIndex = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 20
          Width = 48
          Height = 13
          Caption = #22995'        '#21517
        end
        object Label10: TLabel
          Left = 384
          Top = 54
          Width = 48
          Height = 13
          Caption = #20837#20826#26102#38388
        end
        object Label11: TLabel
          Left = 317
          Top = 87
          Width = 36
          Height = 13
          Caption = #20986#29983#22320
        end
        object Label12: TLabel
          Left = 176
          Top = 120
          Width = 72
          Height = 13
          Caption = #36827#20837#21333#20301#26102#38388
        end
        object Label13: TLabel
          Left = 384
          Top = 120
          Width = 48
          Height = 13
          Caption = #20581#24247#29366#20917
        end
        object Label14: TLabel
          Left = 188
          Top = 156
          Width = 60
          Height = 13
          Caption = #20219#32844#32423#26102#38388
        end
        object Label15: TLabel
          Left = 348
          Top = 156
          Width = 84
          Height = 13
          Caption = #20219#21069#19968#32844#32423#26102#38388
        end
        object Label16: TLabel
          Left = 384
          Top = 189
          Width = 48
          Height = 13
          Caption = #20219#32844#26102#38388
        end
        object Label2: TLabel
          Left = 24
          Top = 54
          Width = 48
          Height = 13
          Caption = #27665'        '#26063
        end
        object Label27: TLabel
          Left = 12
          Top = 249
          Width = 60
          Height = 13
          Caption = #29616#20219#32844#31616#31216
        end
        object Label28: TLabel
          Left = 199
          Top = 249
          Width = 48
          Height = 13
          Caption = #20154#21592#36523#20221
        end
        object Label29: TLabel
          Left = 383
          Top = 249
          Width = 48
          Height = 13
          Caption = #24178#37096#31867#22411
        end
        object Label3: TLabel
          Left = 24
          Top = 87
          Width = 48
          Height = 13
          Caption = #31821'        '#36143
        end
        object Label4: TLabel
          Left = 24
          Top = 120
          Width = 48
          Height = 13
          Caption = #24037#20316#26102#38388
        end
        object Label5: TLabel
          Left = 24
          Top = 156
          Width = 48
          Height = 13
          Caption = #32844#21153#32423#21035
        end
        object Label6: TLabel
          Left = 24
          Top = 188
          Width = 48
          Height = 13
          Caption = #29616#20219#32844#21153
        end
        object Label7: TLabel
          Left = 200
          Top = 20
          Width = 48
          Height = 13
          Caption = #24615'        '#21035
        end
        object Label8: TLabel
          Left = 384
          Top = 20
          Width = 48
          Height = 13
          Caption = #20986#29983#24180#26376
        end
        object Label9: TLabel
          Left = 200
          Top = 54
          Width = 48
          Height = 13
          Caption = #25919#27835#38754#35980
        end
        object cxDBComboBox1: TcxDBComboBox
          Left = 253
          Top = 16
          DataBinding.DataField = 'sex'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            '111'
            '322'
            '332')
          TabOrder = 0
          Width = 90
        end
        object cxDBComboBox13: TcxDBComboBox
          Left = 438
          Top = 245
          DataBinding.DataField = 'cadre_type'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 1
          Width = 90
        end
        object cxDBComboBox14: TcxDBComboBox
          Left = 253
          Top = 245
          DataBinding.DataField = 'personnel_identity'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 2
          Width = 90
        end
        object cxDBComboBox2: TcxDBComboBox
          Left = 79
          Top = 50
          DataBinding.DataField = 'nation'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 3
          Width = 90
        end
        object cxDBComboBox3: TcxDBComboBox
          Left = 254
          Top = 50
          DataBinding.DataField = 'political_status'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 4
          Width = 90
        end
        object cxDBComboBox4: TcxDBComboBox
          Left = 79
          Top = 82
          DataBinding.DataField = 'native_place'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 5
          Width = 170
        end
        object cxDBComboBox5: TcxDBComboBox
          Left = 358
          Top = 82
          DataBinding.DataField = 'birth_place'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 6
          Width = 170
        end
        object cxDBComboBox6: TcxDBComboBox
          Left = 438
          Top = 116
          DataBinding.DataField = 'health_condition'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 7
          Width = 90
        end
        object cxDBComboBox7: TcxDBComboBox
          Left = 79
          Top = 152
          DataBinding.DataField = 'job_level'
          DataBinding.DataSource = DataSourceCadreInfo
          Properties.DropDownListStyle = lsEditFixedList
          TabOrder = 8
          Width = 90
        end
        object cxDBImage1: TcxDBImage
          Left = 552
          Top = 16
          DataBinding.DataField = 'photo'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 9
          Height = 157
          Width = 113
        end
        object cxDBMemo1: TcxDBMemo
          Left = 78
          Top = 185
          DataBinding.DataField = 'present_asg'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 10
          Height = 51
          Width = 265
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 79
          Top = 16
          DataBinding.DataField = 'name'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 11
          Width = 90
        end
        object cxDBTextEdit14: TcxDBTextEdit
          Left = 78
          Top = 244
          DataBinding.DataField = 'present_asg_short'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 12
          Width = 90
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 438
          Top = 16
          DataBinding.DataField = 'birthday'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 13
          Width = 90
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 438
          Top = 50
          DataBinding.DataField = 'party_time'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 14
          Width = 90
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 79
          Top = 116
          DataBinding.DataField = 'work_time'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 15
          Width = 90
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 253
          Top = 116
          DataBinding.DataField = 'enter_unit_time'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 16
          Width = 90
        end
        object cxDBTextEdit6: TcxDBTextEdit
          Left = 253
          Top = 152
          DataBinding.DataField = 'job_time'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 17
          Width = 90
        end
        object cxDBTextEdit7: TcxDBTextEdit
          Left = 438
          Top = 152
          DataBinding.DataField = 'pre_job_time'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 18
          Width = 90
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 438
          Top = 185
          DataBinding.DataField = 'present_asg_time'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 19
          Width = 90
        end
        object cxGroupBox1: TcxGroupBox
          Left = 16
          Top = 274
          Caption = #19987#19994#25216#26415#32844#21153#12289#29305#38271
          TabOrder = 20
          Height = 98
          Width = 649
          object Label17: TLabel
            Left = 8
            Top = 30
            Width = 48
            Height = 13
            Caption = #25216#26415#32844#31216
          end
          object Label18: TLabel
            Left = 184
            Top = 30
            Width = 48
            Height = 13
            Caption = #21462#24471#26102#38388
          end
          object Label19: TLabel
            Left = 392
            Top = 30
            Width = 24
            Height = 13
            Caption = #31561#32423
          end
          object Label20: TLabel
            Left = 8
            Top = 63
            Width = 48
            Height = 13
            Caption = #19987#19994#29305#38271
          end
          object Image1: TImage
            Left = 96
            Top = 32
            Width = 105
            Height = 105
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 63
            Top = 26
            DataBinding.DataField = 'tech_title'
            DataBinding.DataSource = DataSourceCadreInfo
            TabOrder = 0
            Width = 90
          end
          object cxDBTextEdit10: TcxDBTextEdit
            Left = 237
            Top = 26
            DataBinding.DataField = 'tech_title_time'
            DataBinding.DataSource = DataSourceCadreInfo
            TabOrder = 1
            Width = 90
          end
          object cxDBComboBox8: TcxDBComboBox
            Left = 422
            Top = 28
            DataBinding.DataField = 'tech_title_level'
            DataBinding.DataSource = DataSourceCadreInfo
            Properties.DropDownListStyle = lsEditFixedList
            TabOrder = 2
            Width = 90
          end
          object cxDBTextEdit11: TcxDBTextEdit
            Left = 63
            Top = 59
            DataBinding.DataField = 'tech_skill'
            DataBinding.DataSource = DataSourceCadreInfo
            TabOrder = 3
            Width = 450
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 16
          Top = 385
          Caption = #20840#26085#21046#25945#32946
          TabOrder = 21
          Height = 86
          Width = 649
          object Label21: TLabel
            Left = 8
            Top = 26
            Width = 48
            Height = 13
            Caption = #23398'        '#21382
          end
          object Label22: TLabel
            Left = 8
            Top = 58
            Width = 48
            Height = 13
            Caption = #23398'        '#20301
          end
          object Label23: TLabel
            Left = 183
            Top = 21
            Width = 48
            Height = 26
            Alignment = taRightJustify
            Caption = #27605#19994#23398#26657#21450#19987#19994
            WordWrap = True
          end
          object cxDBComboBox9: TcxDBComboBox
            Left = 62
            Top = 21
            DataBinding.DataField = 'ft_education'
            DataBinding.DataSource = DataSourceCadreInfo
            Properties.DropDownListStyle = lsEditFixedList
            TabOrder = 0
            Width = 90
          end
          object cxDBComboBox10: TcxDBComboBox
            Left = 62
            Top = 55
            DataBinding.DataField = 'ft_degree'
            DataBinding.DataSource = DataSourceCadreInfo
            Properties.DropDownListStyle = lsEditFixedList
            TabOrder = 1
            Width = 90
          end
          object cxDBTextEdit12: TcxDBTextEdit
            Left = 237
            Top = 21
            DataBinding.DataField = 'ft_school'
            DataBinding.DataSource = DataSourceCadreInfo
            TabOrder = 2
            Width = 396
          end
        end
        object cxGroupBox3: TcxGroupBox
          Left = 16
          Top = 480
          Caption = #22312#32844#25945#32946
          TabOrder = 22
          Height = 86
          Width = 649
          object Label24: TLabel
            Left = 8
            Top = 26
            Width = 48
            Height = 13
            Caption = #23398'        '#21382
          end
          object Label25: TLabel
            Left = 8
            Top = 58
            Width = 48
            Height = 13
            Caption = #23398'        '#20301
          end
          object Label26: TLabel
            Left = 183
            Top = 20
            Width = 48
            Height = 26
            Alignment = taRightJustify
            Caption = #27605#19994#23398#26657#21450#19987#19994
            WordWrap = True
          end
          object cxDBComboBox11: TcxDBComboBox
            Left = 62
            Top = 21
            DataBinding.DataField = 'ie_education'
            DataBinding.DataSource = DataSourceCadreInfo
            Properties.DropDownListStyle = lsEditFixedList
            TabOrder = 0
            Width = 90
          end
          object cxDBComboBox12: TcxDBComboBox
            Left = 62
            Top = 55
            DataBinding.DataField = 'ie_degree'
            DataBinding.DataSource = DataSourceCadreInfo
            Properties.DropDownListStyle = lsEditFixedList
            TabOrder = 1
            Width = 90
          end
          object cxDBTextEdit13: TcxDBTextEdit
            Left = 237
            Top = 21
            DataBinding.DataField = 'ie_school'
            DataBinding.DataSource = DataSourceCadreInfo
            TabOrder = 2
            Width = 396
          end
        end
        object Button14: TButton
          Left = 552
          Top = 181
          Width = 34
          Height = 25
          Caption = #23548#20837
          TabOrder = 23
          OnClick = Button14Click
        end
        object Button15: TButton
          Left = 590
          Top = 181
          Width = 34
          Height = 25
          Caption = #23548#20986
          TabOrder = 24
          OnClick = Button15Click
        end
        object Button16: TButton
          Left = 628
          Top = 181
          Width = 34
          Height = 25
          Caption = #28165#38500
          TabOrder = 25
          OnClick = Button16Click
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #25193#23637#20449#24687
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label30: TLabel
          Left = 18
          Top = 21
          Width = 48
          Height = 13
          Caption = #26723#26696#32534#21495
        end
        object Label31: TLabel
          Left = 18
          Top = 51
          Width = 48
          Height = 13
          Caption = #36716#20837#26085#26399
        end
        object Label32: TLabel
          Left = 18
          Top = 80
          Width = 48
          Height = 13
          Caption = #36716#20986#26085#26399
        end
        object Label33: TLabel
          Left = 18
          Top = 112
          Width = 48
          Height = 13
          Caption = #31649#29702#21333#20301
        end
        object Label34: TLabel
          Left = 18
          Top = 143
          Width = 48
          Height = 13
          Caption = #24037#36164#26723#27425
        end
        object Label35: TLabel
          Left = 235
          Top = 21
          Width = 48
          Height = 13
          Caption = #26723#26696#20301#32622
        end
        object Label36: TLabel
          Left = 235
          Top = 51
          Width = 48
          Height = 13
          Caption = #26723#26696#26469#22788
        end
        object Label37: TLabel
          Left = 235
          Top = 80
          Width = 48
          Height = 13
          Caption = #26723#26696#21435#22788
        end
        object Label38: TLabel
          Left = 445
          Top = 112
          Width = 24
          Height = 13
          Caption = #22791#27880
        end
        object Label39: TLabel
          Left = 448
          Top = 21
          Width = 48
          Height = 13
          Caption = #27491#26412#21367#25968
        end
        object Label40: TLabel
          Left = 448
          Top = 52
          Width = 48
          Height = 13
          Caption = #21103#26412#21367#25968
        end
        object Label41: TLabel
          Left = 192
          Top = 143
          Width = 12
          Height = 13
          Caption = #32423
        end
        object Label42: TLabel
          Left = 307
          Top = 143
          Width = 12
          Height = 13
          Caption = #26723
        end
        object Label43: TLabel
          Left = 396
          Top = 143
          Width = 24
          Height = 13
          Caption = #37329#39069
        end
        object Label44: TLabel
          Left = 18
          Top = 206
          Width = 48
          Height = 13
          Caption = #35777#20214#31867#22411
        end
        object Label45: TLabel
          Left = 18
          Top = 236
          Width = 48
          Height = 13
          Caption = #24037#20316#30005#35805
        end
        object Label46: TLabel
          Left = 18
          Top = 265
          Width = 48
          Height = 13
          Caption = #23478#24237#20303#22336
        end
        object Label47: TLabel
          Left = 227
          Top = 206
          Width = 36
          Height = 13
          Caption = #35777#20214#21495
        end
        object Label48: TLabel
          Left = 239
          Top = 234
          Width = 24
          Height = 13
          Caption = #25163#26426
        end
        object Label49: TLabel
          Left = 425
          Top = 234
          Width = 24
          Height = 13
          Caption = #30701#21495
        end
        object Label50: TLabel
          Left = 24
          Top = 330
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'1'
        end
        object Label51: TLabel
          Left = 329
          Top = 330
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'2'
        end
        object Label52: TLabel
          Left = 24
          Top = 370
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'3'
        end
        object Label53: TLabel
          Left = 329
          Top = 370
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'4'
        end
        object Label54: TLabel
          Left = 24
          Top = 410
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'5'
        end
        object Label55: TLabel
          Left = 329
          Top = 410
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'6'
        end
        object Label56: TLabel
          Left = 24
          Top = 450
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'7'
        end
        object Label57: TLabel
          Left = 329
          Top = 450
          Width = 42
          Height = 13
          Caption = #23383#31526#20018'8'
        end
        object Label58: TLabel
          Left = 42
          Top = 482
          Width = 24
          Height = 13
          Caption = #22791#27880
        end
        object Shape1: TShape
          Left = 18
          Top = 183
          Width = 557
          Height = 1
        end
        object Shape2: TShape
          Left = 18
          Top = 308
          Width = 557
          Height = 1
        end
        object cxDBCalcEdit1: TcxDBCalcEdit
          Left = 428
          Top = 140
          DataBinding.DataField = 'pay_money'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 0
          Width = 147
        end
        object cxDBComboBox16: TcxDBComboBox
          Left = 70
          Top = 201
          DataBinding.DataField = 'papers_type'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 1
          Width = 120
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 70
          Top = 47
          DataBinding.DataField = 'transfer_in_date'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 2
          Width = 120
        end
        object cxDBDateEdit2: TcxDBDateEdit
          Left = 70
          Top = 78
          DataBinding.DataField = 'transfer_out_date'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 3
          Width = 120
        end
        object cxDBMemo2: TcxDBMemo
          Left = 70
          Top = 477
          DataBinding.DataField = 'remark'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 4
          Height = 103
          Width = 505
        end
        object cxDBSpinEdit1: TcxDBSpinEdit
          Left = 499
          Top = 16
          DataBinding.DataField = 'doc_num_1'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 5
          Width = 76
        end
        object cxDBSpinEdit2: TcxDBSpinEdit
          Left = 499
          Top = 47
          DataBinding.DataField = 'doc_num_2'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 6
          Width = 76
        end
        object cxDBTextEdit15: TcxDBTextEdit
          Left = 70
          Top = 16
          DataBinding.DataField = 'doc_id'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 7
          Width = 120
        end
        object cxDBTextEdit16: TcxDBTextEdit
          Left = 70
          Top = 109
          DataBinding.DataField = 'manage_unit'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 8
          Width = 336
        end
        object cxDBTextEdit17: TcxDBTextEdit
          Left = 70
          Top = 140
          DataBinding.DataField = 'pay_level_rank'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 9
          Width = 120
        end
        object cxDBTextEdit18: TcxDBTextEdit
          Left = 213
          Top = 140
          DataBinding.DataField = 'pay_level'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 10
          Width = 90
        end
        object cxDBTextEdit19: TcxDBTextEdit
          Left = 286
          Top = 16
          DataBinding.DataField = 'doc_location'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 11
          Width = 120
        end
        object cxDBTextEdit20: TcxDBTextEdit
          Left = 286
          Top = 47
          DataBinding.DataField = 'doc_from'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 12
          Width = 120
        end
        object cxDBTextEdit21: TcxDBTextEdit
          Left = 286
          Top = 78
          DataBinding.DataField = 'doc_to'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 13
          Width = 120
        end
        object cxDBTextEdit22: TcxDBTextEdit
          Left = 474
          Top = 109
          DataBinding.DataField = 'unit_remark'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 14
          Width = 101
        end
        object cxDBTextEdit23: TcxDBTextEdit
          Left = 70
          Top = 231
          DataBinding.DataField = 'tel_work'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 15
          Width = 120
        end
        object cxDBTextEdit24: TcxDBTextEdit
          Left = 70
          Top = 262
          DataBinding.DataField = 'adress'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 16
          Width = 505
        end
        object cxDBTextEdit25: TcxDBTextEdit
          Left = 266
          Top = 201
          DataBinding.DataField = 'papers_no'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 17
          Width = 309
        end
        object cxDBTextEdit26: TcxDBTextEdit
          Left = 266
          Top = 231
          DataBinding.DataField = 'tel_cell'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 18
          Width = 120
        end
        object cxDBTextEdit27: TcxDBTextEdit
          Left = 455
          Top = 231
          DataBinding.DataField = 'tel_short'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 19
          Width = 120
        end
        object cxDBTextEdit28: TcxDBTextEdit
          Left = 70
          Top = 326
          DataBinding.DataField = 'extent1'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 20
          Width = 200
        end
        object cxDBTextEdit29: TcxDBTextEdit
          Left = 375
          Top = 326
          DataBinding.DataField = 'extent2'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 21
          Width = 200
        end
        object cxDBTextEdit30: TcxDBTextEdit
          Left = 70
          Top = 366
          DataBinding.DataField = 'extent3'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 22
          Width = 200
        end
        object cxDBTextEdit31: TcxDBTextEdit
          Left = 375
          Top = 366
          DataBinding.DataField = 'extent4'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 23
          Width = 200
        end
        object cxDBTextEdit32: TcxDBTextEdit
          Left = 70
          Top = 406
          DataBinding.DataField = 'extent5'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 24
          Width = 200
        end
        object cxDBTextEdit33: TcxDBTextEdit
          Left = 375
          Top = 406
          DataBinding.DataField = 'extent6'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 25
          Width = 200
        end
        object cxDBTextEdit34: TcxDBTextEdit
          Left = 70
          Top = 446
          DataBinding.DataField = 'extent7'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 26
          Width = 200
        end
        object cxDBTextEdit35: TcxDBTextEdit
          Left = 375
          Top = 446
          DataBinding.DataField = 'extent8'
          DataBinding.DataSource = DataSourceCadreInfoExtend
          TabOrder = 27
          Width = 200
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = #24037#20316#31616#21382
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label59: TLabel
          Left = 24
          Top = 488
          Width = 72
          Height = 13
          Caption = #24403#21069#20998#31649#24037#20316
        end
        object Button1: TButton
          Left = 582
          Top = 112
          Width = 100
          Height = 30
          Caption = #28155#21152#34892
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 582
          Top = 148
          Width = 100
          Height = 30
          Caption = #21024#38500#34892
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 582
          Top = 216
          Width = 100
          Height = 30
          Caption = #19978#31227
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 582
          Top = 252
          Width = 100
          Height = 30
          Caption = #19979#31227
          TabOrder = 3
          OnClick = Button4Click
        end
        object cxDBMemo3: TcxDBMemo
          Left = 24
          Top = 503
          DataBinding.DataField = 'present_asg'
          DataBinding.DataSource = DataSourceCadreInfo
          TabOrder = 4
          Height = 77
          Width = 536
        end
        object cxGrid2: TcxGrid
          Left = 24
          Top = 16
          Width = 536
          Height = 449
          TabOrder = 5
          object cxGrid2DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = DataSourceCadreInfoJob
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
          end
          object cxGrid2Level1: TcxGridLevel
            GridView = cxGrid2DBTableView1
          end
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = #28145#24230#20998#26512
      ImageIndex = 3
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = #20219#32844#35814#24773
      ImageIndex = 4
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object cxPageControl2: TcxPageControl
          Left = 8
          Top = 40
          Width = 561
          Height = 513
          TabOrder = 0
          Properties.ActivePage = cxTabSheetPosition2
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 509
          ClientRectLeft = 4
          ClientRectRight = 557
          ClientRectTop = 24
          object cxTabSheetPosition1: TcxTabSheet
            Caption = #29616#20219#32844#35814#24773
            ImageIndex = 0
            object cxGrid4: TcxGrid
              Left = 0
              Top = 0
              Width = 553
              Height = 485
              Align = alClient
              TabOrder = 0
              object cxGrid4DBTableView1: TcxGridDBTableView
                OnDblClick = cxGrid4DBTableView1DblClick
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = DataSourceCadrePositionNow
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
              end
              object cxGrid4Level1: TcxGridLevel
                GridView = cxGrid4DBTableView1
              end
            end
          end
          object cxTabSheetPosition2: TcxTabSheet
            Caption = #26366#20219#32844#35814#24773
            ImageIndex = 1
            object cxGrid5: TcxGrid
              Left = 0
              Top = 0
              Width = 553
              Height = 485
              Align = alClient
              TabOrder = 0
              object cxGridDBTableView1: TcxGridDBTableView
                OnDblClick = cxGrid4DBTableView1DblClick
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = DataSourceCadrePositionOld
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
          end
        end
        object cxCheckBox2: TcxCheckBox
          Left = 11
          Top = 9
          Caption = #38145#23450#24178#37096#22522#26412#20449#24687#20013#30340#29616#20219#32844#21153#12289#20219#32844#26102#38388#65292#19981#38543#8220#20219#32844#35814#24773#8221#33258#21160#21464#21270
          TabOrder = 1
          Width = 438
        end
        object Button17: TButton
          Left = 600
          Top = 144
          Width = 94
          Height = 31
          Caption = #28155#21152
          TabOrder = 2
          OnClick = Button17Click
        end
        object Button18: TButton
          Left = 600
          Top = 195
          Width = 94
          Height = 31
          Caption = #21024#38500
          TabOrder = 3
          OnClick = Button18Click
        end
        object Button19: TButton
          Left = 600
          Top = 246
          Width = 94
          Height = 31
          Caption = #20462#25913
          TabOrder = 4
          OnClick = Button19Click
        end
      end
    end
    object cxTabSheet6: TcxTabSheet
      Caption = #23478#24237#25104#21592
      ImageIndex = 5
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Button5: TButton
          Left = 590
          Top = 120
          Width = 100
          Height = 30
          Caption = #28155#21152
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 590
          Top = 156
          Width = 100
          Height = 30
          Caption = #21024#38500
          TabOrder = 1
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 590
          Top = 243
          Width = 100
          Height = 30
          Caption = #19978#31227
          TabOrder = 2
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 590
          Top = 279
          Width = 100
          Height = 30
          Caption = #19979#31227
          TabOrder = 3
          OnClick = Button8Click
        end
        object cxGrid3: TcxGrid
          Left = 16
          Top = 16
          Width = 553
          Height = 513
          TabOrder = 4
          object cxGrid3DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = DataSourceCadreInfoFamily
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = cxGrid3DBTableView1
          end
        end
      end
    end
    object cxTabSheet7: TcxTabSheet
      Caption = #32771#23519#32771#26680
      ImageIndex = 6
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object cxTabSheet8: TcxTabSheet
      Caption = #22870#24809#35760#24405
      ImageIndex = 7
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 608
    Width = 948
    Height = 48
    Align = alBottom
    TabOrder = 2
    object Button9: TButton
      Left = 250
      Top = 12
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 0
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 331
      Top = 12
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 1
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 526
      Top = 12
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 2
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 442
      Top = 12
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 3
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 638
      Top = 12
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 4
      OnClick = Button13Click
    end
    object cxCheckBox1: TcxCheckBox
      Left = 39
      Top = 13
      Caption = #20801#35768#20462#25913
      Properties.OnChange = cxCheckBox1PropertiesChange
      State = cbsChecked
      TabOrder = 5
      Width = 121
    end
  end
  object DataSourceCadreInfo: TDataSource
    Left = 64
    Top = 24
  end
  object DataSourceCadreInfoExtend: TDataSource
    Left = 64
    Top = 72
  end
  object DataSourceCadreInfoJob: TDataSource
    Left = 64
    Top = 120
  end
  object DataSourceCadreInfoFamily: TDataSource
    Left = 64
    Top = 168
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 69
    Top = 344
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 77
    Top = 408
  end
  object DataSourceCadrePositionNow: TDataSource
    Left = 64
    Top = 216
  end
  object DataSourceCadrePositionOld: TDataSource
    Left = 64
    Top = 264
  end
end
