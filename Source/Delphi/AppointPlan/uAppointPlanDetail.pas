unit uAppointPlanDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, dxBar, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls,
  uBaseForm;

type
  TfrmAppointPlanDetail = class(TBaseForm)
    Panel1: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    DataSource1: TDataSource;
    Label1: TLabel;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
  private
    { Private declarations }
    FPlanId: string;
    procedure AddCadreToPlan(ACadreId: string);
    procedure AddCadreToPlanOrder(ACadreId: string; AOrderId: Integer);
    procedure CopyInfoFromCadreInfo;
  public
    { Public declarations }
    procedure ShowData(APlanId, APlanName: string);
  end;

var
  frmAppointPlanDetail: TfrmAppointPlanDetail;

implementation

{$R *.dfm}

uses uGetCadre, uCadreInfo, uAppointPlanDetailEdit;

procedure TfrmAppointPlanDetail.FormCreate(Sender: TObject);
begin
  inherited;//
  FPlanId := '';
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from appoint_plan_detail where 1=2');

end;

procedure TfrmAppointPlanDetail.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmAppointPlanDetail.ShowData(APlanId, APlanName: string);
begin
  FPlanId := APlanId;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from appoint_plan_detail where plan_id = ' + QuotedStr(APlanId) + ' order by order_no');
  Label1.Caption := APlanName;
end;

//add cadre
procedure TfrmAppointPlanDetail.dxBarButton1Click(Sender: TObject);
var
  I: Integer;
  LStr: string;
begin
  if FPlanId.IsEmpty then Exit;
  if Assigned(frmGetCadre) then  begin
    FreeAndNil(frmGetCadre);
  end;
  frmGetCadre := TfrmGetCadre.Create(Self);
  frmGetCadre.ShowModal;
  if frmGetCadre.ModalResult = mrOk then  begin
    for I := 0 to frmGetCadre.FResList.Count-1 do    begin
      AddCadreToPlan(frmGetCadre.FResList.Strings[I]);
    end;
    FSysDataBase.RefreshDataSet(DataSource1.DataSet);
  end;
end;

procedure TfrmAppointPlanDetail.AddCadreToPlan(ACadreId: string);
begin
  AddCadreToPlanOrder(ACadreId, FSysDataBase.GetFieldMaxValueWhere('appoint_plan_detail', 'order_no', 'plan_id=' + FPlanId) + 1);
end;

procedure TfrmAppointPlanDetail.AddCadreToPlanOrder(ACadreId: string; AOrderId: Integer);
begin
  if not FSysDataBase.DataIsExists('select plan_id from appoint_plan_detail where plan_id = ' + FPlanId + ' and cadre_id = ' + QuotedStr(ACadreId)) then  begin
    DataSource1.DataSet.Append;
    DataSource1.DataSet.FieldByName('plan_id').AsString := FPlanId;
    DataSource1.DataSet.FieldByName('cadre_id').AsString := ACadreId;
    DataSource1.DataSet.FieldByName('order_no').AsInteger := AOrderId;
    CopyInfoFromCadreInfo;
  end;
end;

procedure TfrmAppointPlanDetail.CopyInfoFromCadreInfo;
var
  I: Integer;
  LCadreId, LStr: string;
  LDataSet: TDataSet;
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  LCadreId := DataSource1.DataSet.FieldByName('cadre_id').AsString;

  LDataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where sys_id =' + QuotedStr(LCadreId));
  if LDataSet.IsEmpty then Exit;
  FSysDataBase.CopyDataSet(LDataSet, DataSource1.DataSet, QuotedStr('order_no'));
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  LDataSet.Free;

  //appoint_plan_job
  FSysDataBase.ExecSQL('delete from appoint_plan_job where plan_id = ' + QuotedStr(FPlanId) + ' and cadre_id = ' + QuotedStr(LCadreId));
  LStr := ' insert into appoint_plan_job(plan_id, cadre_id, order_no, time, content)' +
          ' select ' + QuotedStr(FPlanId) +',sys_id, order_no, time, content' +
          ' from cadre_info_job where sys_id = ' + QuotedStr(LCadreId);
  FSysDataBase.ExecSQL(LStr);

  //appoint_plan_family
  FSysDataBase.ExecSQL('delete from appoint_plan_family where plan_id = ' + QuotedStr(FPlanId) + ' and cadre_id = ' + QuotedStr(LCadreId));
  LStr := ' insert into appoint_plan_family(plan_id, cadre_id, order_no, title, name, birthday, political_status,work_info)' +
          ' select ' + QuotedStr(FPlanId) +',sys_id, order_no, title, name, birthday, political_status,work_info' +
          ' from cadre_info_family where sys_id = ' + QuotedStr(LCadreId);
  FSysDataBase.ExecSQL(LStr);
end;

//delete cadre from plan
procedure TfrmAppointPlanDetail.dxBarButton2Click(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then Exit;

  if Application.MessageBox(PWideChar('确定要删除《' + DataSource1.DataSet.FieldByName('name').AsString +'》？'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    DataSource1.DataSet.Delete;
    FSysDataBase.SaveDataSet(DataSource1.DataSet);
  end;
end;

//edit detail
procedure TfrmAppointPlanDetail.dxBarButton3Click(Sender: TObject);
begin
  if (EmptyStr = FPlanId) or (DataSource1.DataSet.IsEmpty) then Exit;
  if Assigned(frmAppointPlanDetailEdit) then  begin
    frmAppointPlanDetailEdit.Free;
  end;
  frmAppointPlanDetailEdit := tfrmAppointPlanDetailEdit.Create(Self);
  frmAppointPlanDetailEdit.ShowData(FPlanId, Label1.Caption, DataSource1.DataSet.FieldByName('cadre_id').AsString);
  frmAppointPlanDetailEdit.ShowModal;
end;

//refresh cadre info
procedure TfrmAppointPlanDetail.dxBarButton4Click(Sender: TObject);
var
  I: Integer;
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  if Application.MessageBox(PWideChar('从干部信息库中重新设置《' + DataSource1.DataSet.FieldByName('name').AsString +'》的任免信息？'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    for I := 0 to DataSource1.DataSet.FieldCount-1 do    begin
      if DataSource1.DataSet.Fields[I].FieldName.Equals('plan_id')
        or DataSource1.DataSet.Fields[I].FieldName.Equals('cadre_id')
        or DataSource1.DataSet.Fields[I].FieldName.Equals('order_no') then
        Continue;
      DataSource1.DataSet.Edit;
      DataSource1.DataSet.Fields[I].AsVariant := null;
    end;
    CopyInfoFromCadreInfo;
  end;
end;

//cadre info
procedure TfrmAppointPlanDetail.dxBarButton6Click(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  if Assigned(frmCadreInfo) then  begin
    frmCadreInfo.Free;
  end;
  frmCadreInfo := TfrmCadreInfo.Create(Self);
  frmCadreInfo.ShowDataById(DataSource1.DataSet.FieldByName('cadre_id').AsString);
  frmCadreInfo.Show;
end;

//up
procedure TfrmAppointPlanDetail.dxBarButton7Click(Sender: TObject);
begin//
  cxGrid1DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSource1.DataSet);
  cxGrid1DBTableView1.EndUpdate;
end;

//down
procedure TfrmAppointPlanDetail.dxBarButton5Click(Sender: TObject);
begin  //
  cxGrid1DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSource1.DataSet);
  cxGrid1DBTableView1.EndUpdate;
end;

//refresh
procedure TfrmAppointPlanDetail.dxBarButton9Click(Sender: TObject);
begin
  FSysDataBase.RefreshDataSet(DataSource1.DataSet);
end;

end.


