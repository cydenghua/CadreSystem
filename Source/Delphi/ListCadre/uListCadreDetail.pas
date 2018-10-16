unit uListCadreDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, dxBar, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmListCadreDetail = class(TBaseForm)
    Panel1: TPanel;
    Label1: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    DataSource1: TDataSource;
    dxBarButton9: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
  private
    { Private declarations }
    FListId: string;
  public
    { Public declarations }
    procedure ShowData(AListId: string);
    procedure AddCadreToList(ACadreId: string);
    procedure SyncCadreData(ACadreId: string);
    procedure SyncData;
  end;

var
  frmListCadreDetail: TfrmListCadreDetail;

implementation

{$R *.dfm}

uses uGetCadre, uCadreInfo;

procedure TfrmListCadreDetail.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre_info a left join list_cadre_info_extend b on a.list_id = b.list_id and a.cadre_id = b.cadre_id where 1=2');
end;

procedure TfrmListCadreDetail.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmListCadreDetail.ShowData(AListId: string);
begin
  FListId := AListId;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre_info a left join list_cadre_info_extend b on a.list_id = b.list_id and a.cadre_id = b.cadre_id where a.list_id = ' + QuotedStr(AListId) + ' order by a.order_no');
//  Label1.Caption := APlanName;
  with FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre where sys_id = ' + QuotedStr(AListId)) do  begin
    if not IsEmpty then    begin
      if FieldByName('list_type').AsInteger = 1 then      begin
        Label1.Caption := FieldByName('name').AsString + '（动态）';
        SyncData;
      end else
      begin
        Label1.Caption := FieldByName('name').AsString + '（静态）';
      end;
    end;
    Free;
  end;
end;

//add cadre
procedure TfrmListCadreDetail.AddCadreToList(ACadreId: string);
var
  LDataSet1: TDataSet;
begin
  if not FSysDataBase.DataIsExists('select list_id from list_cadre_info where list_id = ' + FListId + ' and cadre_id = ' + QuotedStr(ACadreId)) then  begin
    //table list_cadre_info
    LDataSet1 := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre_info where 1=2');
    LDataSet1.Append;
    LDataSet1.FieldByName('list_id').AsString := FListId;
    LDataSet1.FieldByName('cadre_id').AsString := ACadreId;
    LDataSet1.FieldByName('order_no').AsInteger := FSysDataBase.GetFieldMaxValueWhere('list_cadre_info', 'order_no', 'list_id=' + FListId) + 1;
    FSysDataBase.SaveDataSet(LDataSet1);
    LDataSet1.Free;

    //table list_cadre_info_extend
    LDataSet1 := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre_info_extend where 1=2');
    LDataSet1.Append;
    LDataSet1.FieldByName('list_id').AsString := FListId;
    LDataSet1.FieldByName('cadre_id').AsString := ACadreId;
    FSysDataBase.SaveDataSet(LDataSet1);
    LDataSet1.Free;

    SyncCadreData(ACadreId);
  end;
end;

//add cadre
procedure TfrmListCadreDetail.dxBarButton1Click(Sender: TObject);
var
  I: Integer;
  LStr: string;
begin
  if FListId.IsEmpty then Exit;
  if Assigned(frmGetCadre) then  begin
    FreeAndNil(frmGetCadre);
  end;
  frmGetCadre := TfrmGetCadre.Create(Self);
  frmGetCadre.ShowModal;
  if frmGetCadre.ModalResult = mrOk then  begin
    for I := 0 to frmGetCadre.FResList.Count-1 do    begin
      AddCadreToList(frmGetCadre.FResList.Strings[I]);
    end;
    FSysDataBase.RefreshDataSet(DataSource1.DataSet);
  end;
end;

//delete
procedure TfrmListCadreDetail.dxBarButton2Click(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then Exit;

  if Application.MessageBox(PWideChar('确定要删除《' + DataSource1.DataSet.FieldByName('name').AsString +'》？'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    DataSource1.DataSet.Delete;
    FSysDataBase.SaveDataSet(DataSource1.DataSet);
  end;
end;

//show cadre info
procedure TfrmListCadreDetail.dxBarButton6Click(Sender: TObject);
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
procedure TfrmListCadreDetail.dxBarButton7Click(Sender: TObject);
begin
  cxGrid1DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSource1.DataSet);
  cxGrid1DBTableView1.EndUpdate;
end;

//down
procedure TfrmListCadreDetail.dxBarButton5Click(Sender: TObject);
begin  //
  cxGrid1DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSource1.DataSet);
  cxGrid1DBTableView1.EndUpdate;
end;

//refresh
procedure TfrmListCadreDetail.dxBarButton9Click(Sender: TObject);
begin
  FSysDataBase.RefreshDataSet(DataSource1.DataSet);
end;

//sync
procedure TfrmListCadreDetail.SyncCadreData(ACadreId: string);
var
  LDataSet1, LDataSet2: TDataSet;
begin
  //table list_cadre_info
  LDataSet1 := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre_info where list_id = ' + FListId + ' and cadre_id = '+ QuotedStr(ACadreId));
  LDataSet2 := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where sys_id =' + QuotedStr(ACadreId));
  if LDataSet2.IsEmpty then Exit;
  FSysDataBase.CopyDataSet(LDataSet2, LDataSet1, QuotedStr('order_no'));
  FSysDataBase.SaveDataSet(LDataSet1);
  LDataSet1.Free;
  LDataSet2.Free;

  //table list_cadre_info_extend
  LDataSet1 := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre_info_extend where list_id = ' + FListId + ' and cadre_id = '+ QuotedStr(ACadreId));
  LDataSet2 := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_extend where sys_id =' + QuotedStr(ACadreId));
  if LDataSet2.IsEmpty then Exit;
  FSysDataBase.CopyDataSet(LDataSet2, LDataSet1, '');
  FSysDataBase.SaveDataSet(LDataSet1);
  LDataSet1.Free;
  LDataSet2.Free;
end;

procedure TfrmListCadreDetail.SyncData;
begin
  DataSource1.DataSet.First;
  while not DataSource1.DataSet.Eof do  begin
    SyncCadreData(DataSource1.DataSet.FieldByName('cadre_id').AsString);
    DataSource1.DataSet.Next;
  end;
  FSysDataBase.RefreshDataSet(DataSource1.DataSet);
end;

end.


