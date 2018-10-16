object frmSqlExec: TfrmSqlExec
  Left = 0
  Top = 0
  Caption = #25968#25454#26597#35810
  ClientHeight = 506
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 830
    Height = 137
    Align = alTop
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 178
    Width = 830
    Height = 328
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 41
    Align = alTop
    TabOrder = 2
    object Button1: TButton
      Left = 113
      Top = 1
      Width = 112
      Height = 39
      Align = alLeft
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 1
      Top = 1
      Width = 112
      Height = 39
      Align = alLeft
      Caption = #25191#34892
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    Left = 320
    Top = 344
  end
end
