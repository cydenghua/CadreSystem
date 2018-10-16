unit uTrainCadreDetail;

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
  TfrmTrainCadreDetail = class(TBaseForm)
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
    dxBarButton9: TdxBarButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
  private
    { Private declarations }
    FTrainId: string;
    procedure AddCadreToTrain(ACadreId: string);
  public
    { Public declarations }
    procedure ShowData(ATrainId: string; ATrainName: string);
  end;

var
  frmTrainCadreDetail: TfrmTrainCadreDetail;

implementation

{$R *.dfm}

uses uGetCadre, uCadreInfo;

procedure TfrmTrainCadreDetail.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from train_cadre_detail where 1=2');
end;

procedure TfrmTrainCadreDetail.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmTrainCadreDetail.ShowData(ATrainId: string; ATrainName: string);
begin
  FTrainId := ATrainId;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from train_cadre_detail where train_id = ' + QuotedStr(ATrainId) + ' order by order_no');
  Label1.Caption := ATrainName;
end;

//refresh
procedure TfrmTrainCadreDetail.dxBarButton9Click(Sender: TObject);
begin
    FSysDataBase.RefreshDataSet(DataSource1.DataSet);
end;

//add cadre
procedure TfrmTrainCadreDetail.dxBarButton1Click(Sender: TObject);
var
  I: Integer;
  LStr: string;
begin
  if FTrainId.IsEmpty then Exit;
  if Assigned(frmGetCadre) then  begin
    FreeAndNil(frmGetCadre);
  end;
  frmGetCadre := TfrmGetCadre.Create(Self);
  frmGetCadre.ShowModal;
  if frmGetCadre.ModalResult = mrOk then  begin
    for I := 0 to frmGetCadre.FResList.Count-1 do    begin
      AddCadreToTrain(frmGetCadre.FResList.Strings[I]);
    end;
    FSysDataBase.RefreshDataSet(DataSource1.DataSet);
  end;
end;

procedure TfrmTrainCadreDetail.AddCadreToTrain(ACadreId: string);
var
  LDataSet: TDataSet;
begin
  if not FSysDataBase.DataIsExists('select train_id from train_cadre_detail where train_id = ' + FTrainId + ' and cadre_id = ' + QuotedStr(ACadreId)) then  begin
    DataSource1.DataSet.Append;
    DataSource1.DataSet.FieldByName('train_id').AsString := FTrainId;
    DataSource1.DataSet.FieldByName('cadre_id').AsString := ACadreId;
    DataSource1.DataSet.FieldByName('order_no').AsInteger := FSysDataBase.GetFieldMaxValueWhere('train_cadre_detail', 'order_no', 'train_id=' + FTrainId) + 1;


    LDataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where sys_id =' + QuotedStr(ACadreId));
    if LDataSet.IsEmpty then Exit;
    FSysDataBase.CopyDataSet(LDataSet, DataSource1.DataSet, QuotedStr('order_no'));
    FSysDataBase.SaveDataSet(DataSource1.DataSet);
    LDataSet.Free;
  end;
end;

//delete
procedure TfrmTrainCadreDetail.dxBarButton2Click(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then Exit;

  if Application.MessageBox(PWideChar('È·¶¨ÒªÉ¾³ý¡¶' + DataSource1.DataSet.FieldByName('name').AsString +'¡·£¿'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    DataSource1.DataSet.Delete;
    FSysDataBase.SaveDataSet(DataSource1.DataSet);
  end;
end;

//cadre info
procedure TfrmTrainCadreDetail.dxBarButton6Click(Sender: TObject);
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
procedure TfrmTrainCadreDetail.dxBarButton7Click(Sender: TObject);
begin//
  cxGrid1DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSource1.DataSet);
  cxGrid1DBTableView1.EndUpdate;
end;

//down
procedure TfrmTrainCadreDetail.dxBarButton5Click(Sender: TObject);
var
  LOrderNo1, LOrderNo2: Integer;
  LSql: string;
begin  //
  cxGrid1DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSource1.DataSet);
  cxGrid1DBTableView1.EndUpdate;
end;

end.


