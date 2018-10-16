unit uTrainCadreSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxPC, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmTrainCadreSetting = class(TBaseForm)
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    Panel5: TPanel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Button13: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrainCadreSetting: TfrmTrainCadreSetting;

implementation

{$R *.dfm}

procedure TfrmTrainCadreSetting.FormCreate(Sender: TObject);
begin
  inherited;//
  cxPageControl1.ActivePageIndex := 0;

  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'SELECT * FROM train_org where deleted <> 1 order by sys_id');
  DataSource2.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from system_dic where type = ''train_type'' and deleted <>1 order by order_no');
  DataSource3.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from system_dic where type = ''train_mode'' and deleted <>1 order by order_no');

end;

procedure TfrmTrainCadreSetting.FormShow(Sender: TObject);
begin
  inherited;//
end;

//close
procedure TfrmTrainCadreSetting.Button13Click(Sender: TObject);
begin
  Close;
end;

//org add
procedure TfrmTrainCadreSetting.Button1Click(Sender: TObject);
begin
  DataSource1.DataSet.Append;
  DataSource1.DataSet.FieldByName('deleted').AsInteger := 0;
end;

//org delete
procedure TfrmTrainCadreSetting.Button2Click(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
  DataSource1.DataSet.FieldByName('deleted').AsInteger := 1;
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  FSysDataBase.RefreshDataSet(DataSource1.DataSet);
end;

//org save
procedure TfrmTrainCadreSetting.Button3Click(Sender: TObject);
begin
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
end;

//type add
procedure TfrmTrainCadreSetting.Button7Click(Sender: TObject);
begin
  DataSource2.DataSet.Append;
  DataSource2.DataSet.FieldByName('deleted').AsInteger := 0;
  DataSource2.DataSet.FieldByName('order_no').AsInteger := FSysDataBase.GetFieldMaxValueWhere('system_dic', 'order_no', 'type = ''train_type''')+1;
  DataSource2.DataSet.FieldByName('type').AsString := 'train_type';
  DataSource2.DataSet.FieldByName('sys_id').AsString := 'train_type'+IntToStr(DataSource2.DataSet.FieldByName('order_no').AsInteger);
end;

//type delete
procedure TfrmTrainCadreSetting.Button8Click(Sender: TObject);
begin
  DataSource2.DataSet.Edit;
  DataSource2.DataSet.FieldByName('deleted').AsInteger := 1;
  FSysDataBase.SaveDataSet(DataSource2.DataSet);
  FSysDataBase.RefreshDataSet(DataSource2.DataSet);
end;

//type save
procedure TfrmTrainCadreSetting.Button9Click(Sender: TObject);
begin
  FSysDataBase.SaveDataSet(DataSource2.DataSet);
end;

//mode add
procedure TfrmTrainCadreSetting.Button10Click(Sender: TObject);
begin
  DataSource3.DataSet.Append;
  DataSource3.DataSet.FieldByName('deleted').AsInteger := 0;
  DataSource3.DataSet.FieldByName('order_no').AsInteger := FSysDataBase.GetFieldMaxValueWhere('system_dic', 'order_no', 'type = ''train_mode''')+1;
  DataSource3.DataSet.FieldByName('type').AsString := 'train_mode';
  DataSource3.DataSet.FieldByName('sys_id').AsString := 'train_mode'+IntToStr(DataSource2.DataSet.FieldByName('order_no').AsInteger);
end;

//mode delete
procedure TfrmTrainCadreSetting.Button11Click(Sender: TObject);
begin
  DataSource3.DataSet.Edit;
  DataSource3.DataSet.FieldByName('deleted').AsInteger := 1;
  FSysDataBase.SaveDataSet(DataSource3.DataSet);
  FSysDataBase.RefreshDataSet(DataSource3.DataSet);
end;

//mode save
procedure TfrmTrainCadreSetting.Button12Click(Sender: TObject);
begin
  FSysDataBase.SaveDataSet(DataSource3.DataSet);
end;


end.
