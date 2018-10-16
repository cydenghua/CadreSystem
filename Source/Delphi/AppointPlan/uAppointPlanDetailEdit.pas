unit uAppointPlanDetailEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid,
  uBaseForm, dxBar, cxContainer, cxImage, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, cxCalendar, cxMemo, dxGDIPlusClasses, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAppointPlanDetailEdit = class(TBaseForm)
    Panel4: TPanel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSourceDetail: TDataSource;
    DataSourceFamily: TDataSource;
    DataSourceJob: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    DataSourceList: TDataSource;
    cxDBImage1: TcxDBImage;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBComboBox2: TcxDBComboBox;
    cxDBComboBox4: TcxDBComboBox;
    cxDBComboBox5: TcxDBComboBox;
    cxDBComboBox6: TcxDBComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBDateEdit3: TcxDBDateEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    cxDBMemo1: TcxDBMemo;
    cxDBMemo2: TcxDBMemo;
    cxDBMemo3: TcxDBMemo;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    cxDBMemo4: TcxDBMemo;
    cxDBTextEdit11: TcxDBTextEdit;
    Label1: TLabel;
    cxDBMemo5: TcxDBMemo;
    cxDBMemo6: TcxDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dxBarLargeButton6: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    { Private declarations }
    FPlanId: string;
    procedure DataListAfterScroll(DataSet: TDataSet);
  public
    { Public declarations }
    procedure ShowData(APlanId, APlanName, ACadreId: string);
  end;

var
  frmAppointPlanDetailEdit: TfrmAppointPlanDetailEdit;

implementation

{$R *.dfm}

uses uAppointPlanBatchInput, uAppointExec;

{ TfrmAppointPlanDetailEdit }

procedure TfrmAppointPlanDetailEdit.FormCreate(Sender: TObject);
begin
  inherited;//
  ScrollBox1.VertScrollBar.Position := 0;

  InitCxComboBoxWithDicType(cxDBComboBox1, 'sex');
  InitCxComboBoxWithDicType(cxDBComboBox2, 'nation');
//  InitCxComboBoxWithDicType(cxDBComboBox4, 'nation');
//  InitCxComboBoxWithDicType(cxDBComboBox5, 'nation');
  InitCxComboBoxWithDicType(cxDBComboBox6, 'health');

end;

procedure TfrmAppointPlanDetailEdit.FormShow(Sender: TObject);
begin
  inherited;//
  if not Assigned(DataSourceList.DataSet.AfterScroll) then  begin
    DataSourceList.DataSet.AfterScroll := DataListAfterScroll;
    DataListAfterScroll(DataSourceList.DataSet);
  end;
end;

procedure TfrmAppointPlanDetailEdit.ShowData(APlanId, APlanName, ACadreId: string);
begin
  FPlanId := APlanId;
  Self.Caption := '任免编辑表(' + APlanName + ')';
  DataSourceList.DataSet := FSysDataBase.GetDataSetBySql('select plan_id, cadre_id, name, order_no, result from appoint_plan_detail where plan_id = ' + APlanId);
//  DataSourceList.DataSet.AfterScroll := DataListAfterScroll;
  DataSourceList.DataSet.Locate('cadre_id', ACadreId, []);

  with  FSysDataBase.GetDataSetBySql('select * from appoint_plan where sys_id = ' + APlanId) do  begin
    Label2.Caption := '    制表日期：' + FieldByName('create_time').AsString;
    Label3.Caption := '      制表人：' + FieldByName('create_user').AsString;
    Label4.Caption := '计算年龄时间：' + FieldByName('age_begin').AsString;
  end;
end;

procedure TfrmAppointPlanDetailEdit.DataListAfterScroll(DataSet: TDataSet);
var
  LCadreId: string;
begin
  LCadreId := DataSourceList.DataSet.FieldByName('cadre_id').AsString;
  DataSourceDetail.DataSet := FSysDataBase.GetDataSetBySql('select * from appoint_plan_detail where plan_id = ' + FPlanId + ' and cadre_id = ' + QuotedStr(LCadreId));
  DataSourceFamily.DataSet := FSysDataBase.GetDataSetBySql('select * from appoint_plan_family where plan_id = ' + FPlanId + ' and cadre_id = ' + QuotedStr(LCadreId) + ' order by order_no');
  DataSourceJob.DataSet := FSysDataBase.GetDataSetBySql('select * from appoint_plan_job where plan_id = ' + FPlanId + ' and cadre_id = ' + QuotedStr(LCadreId) + ' order by order_no');
end;

procedure TfrmAppointPlanDetailEdit.dxBarLargeButton1Click(Sender: TObject);
begin//save
  FSysDataBase.SaveDataSet(DataSourceDetail.DataSet);
  FSysDataBase.SaveDataSet(DataSourceFamily.DataSet);
  FSysDataBase.SaveDataSet(DataSourceJob.DataSet);
end;

procedure TfrmAppointPlanDetailEdit.dxBarLargeButton2Click(Sender: TObject);
begin//refresh
  DataListAfterScroll(DataSourceList.DataSet);
end;

procedure TfrmAppointPlanDetailEdit.dxBarLargeButton3Click(Sender: TObject);
begin//exec
  frmAppointExec := TfrmAppointExec.Create(Self);
  frmAppointExec.ShowModal;
//  DataListAfterScroll(DataSourceList.DataSet);
end;

procedure TfrmAppointPlanDetailEdit.dxBarLargeButton4Click(Sender: TObject);
begin//word
  ShowMessage('todo');
end;

procedure TfrmAppointPlanDetailEdit.dxBarLargeButton5Click(Sender: TObject);
begin//exit
  Close;
end;

procedure TfrmAppointPlanDetailEdit.Button1Click(Sender: TObject);
begin //job add
  DataSourceJob.DataSet.Append;
end;

procedure TfrmAppointPlanDetailEdit.Button2Click(Sender: TObject);
begin //jod delete
  if not DataSourceJob.DataSet.IsEmpty then
    DataSourceJob.DataSet.Delete;
end;

procedure TfrmAppointPlanDetailEdit.Button3Click(Sender: TObject);
begin   //job up
  cxGrid2DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSourceJob.DataSet);
  cxGrid2DBTableView1.EndUpdate;
end;

procedure TfrmAppointPlanDetailEdit.Button4Click(Sender: TObject);
begin    //job down
  cxGrid2DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSourceJob.DataSet);
  cxGrid2DBTableView1.EndUpdate;
end;

procedure TfrmAppointPlanDetailEdit.Button5Click(Sender: TObject);
begin //family down
  cxGrid3DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSourceFamily.DataSet);
  cxGrid3DBTableView1.EndUpdate;
end;

procedure TfrmAppointPlanDetailEdit.Button6Click(Sender: TObject);
begin //family up
  cxGrid3DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSourceFamily.DataSet);
  cxGrid3DBTableView1.EndUpdate;
end;

procedure TfrmAppointPlanDetailEdit.Button7Click(Sender: TObject);
begin //family delete
  if not DataSourceFamily.DataSet.IsEmpty then
    DataSourceFamily.DataSet.Delete;
end;

procedure TfrmAppointPlanDetailEdit.Button8Click(Sender: TObject);
begin//family add
  DataSourceFamily.DataSet.Append;
end;

procedure TfrmAppointPlanDetailEdit.dxBarLargeButton6Click(Sender: TObject);
begin// batch input
  frmAppointPlanBatchInput := TfrmAppointPlanBatchInput.Create(Self);
  frmAppointPlanBatchInput.SetPlanId(FPlanId);
  frmAppointPlanBatchInput.ShowModal;
  DataListAfterScroll(DataSourceList.DataSet);
end;


end.
