unit uOrgStructureForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  uBaseForm, cxTextEdit, dxBar, Vcl.ExtCtrls, cxCalendar, cxMemo;

type
  TfrmOrgStructure = class(TBaseForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    Panel1: TPanel;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    Label1: TLabel;
    Label2: TLabel;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
  private
    { Private declarations }
    FDisplayChild: Boolean;
    FOrgId: string;
    FAllId: string;

    procedure DisplayData();
    procedure showCadreDetail;
  public
    { Public declarations }
    procedure ShowData(AOrgName, ARootId, AAllId: string);
  end;

var
  frmOrgStructure: TfrmOrgStructure;

implementation

{$R *.dfm}

uses uGetCadre, uCadreInfo;

{ TfrmOrgStructure }

procedure TfrmOrgStructure.FormCreate(Sender: TObject);
begin
  inherited;//
  FDisplayChild := False;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where 1=2');
end;

procedure TfrmOrgStructure.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmOrgStructure.showCadreDetail;
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  if Assigned(frmCadreInfo) then  begin
    frmCadreInfo.Free;
  end;
  frmCadreInfo := TfrmCadreInfo.Create(Self);
  frmCadreInfo.ShowDataById(DataSource1.DataSet.FieldByName('sys_id').AsString);
  frmCadreInfo.Show;
end;

procedure TfrmOrgStructure.ShowData(AOrgName, ARootId, AAllId: string);
begin
  Label2.Caption := AOrgName;
  FOrgId := ARootId;
  FAllId := AAllId;
  DisplayData;
end;

procedure TfrmOrgStructure.dxBarButton3Click(Sender: TObject);
begin
  FDisplayChild := not FDisplayChild;
  DisplayData;
end;

procedure TfrmOrgStructure.dxBarButton4Click(Sender: TObject);
begin
  showCadreDetail;
end;

procedure TfrmOrgStructure.dxBarButton5Click(Sender: TObject);
var
  LStr: string;
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  LStr := 'delete from org_cadre where org_id = ' + QuotedStr(FOrgId) + ' and cadre_id = ' + QuotedStr(DataSource1.DataSet.FieldByName('sys_id').AsString);
  FSysDataBase.ExecSQL(LStr);
  FSysDataBase.RefreshDataSet(DataSource1.DataSet);
end;

procedure TfrmOrgStructure.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  showCadreDetail;
end;

procedure TfrmOrgStructure.DisplayData;
begin
  if FDisplayChild then  begin
    DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where sys_id in (select cadre_id from org_cadre where org_id in ('''+ FOrgId +''') )');
    dxBarButton3.Caption := '显示下级';
  end else
  begin
    DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where sys_id in (select cadre_id from org_cadre where org_id in ('+ FAllId +') )');
    dxBarButton3.Caption := '隐藏下级';
  end;

  Label1.Caption := '当前人数：' + IntToStr(DataSource1.DataSet.RecordCount) +'人';
end;

procedure TfrmOrgStructure.dxBarButton10Click(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  if Assigned(frmCadreInfo) then  begin
    frmCadreInfo.Free;
  end;
  frmCadreInfo := TfrmCadreInfo.Create(Self);
  frmCadreInfo.ShowDataByIdWithPosition(DataSource1.DataSet.FieldByName('sys_id').AsString);
  frmCadreInfo.Show;
end;

procedure TfrmOrgStructure.dxBarButton1Click(Sender: TObject);
var
  I: Integer;
  LStr: string;
begin
  if Assigned(frmGetCadre) then  begin
    FreeAndNil(frmGetCadre);
  end;
  frmGetCadre := TfrmGetCadre.Create(Self);
  frmGetCadre.ShowModal;
  if frmGetCadre.ModalResult = mrOk then  begin
    for I := 0 to frmGetCadre.FResList.Count-1 do    begin
      LStr := 'select * from org_cadre where org_id = ' + QuotedStr(FOrgId) + ' and cadre_id = ' + QuotedStr(frmGetCadre.FResList.Strings[I]);
      if not FSysDataBase.DataIsExists(LStr) then      begin
        LStr := 'insert into org_cadre(org_id, cadre_id) values(' + QuotedStr(FOrgId) + ',' + QuotedStr(frmGetCadre.FResList.Strings[I])+ ')';
        FSysDataBase.ExecSQL(LStr);
      end;
    end;
    FSysDataBase.RefreshDataSet(DataSource1.DataSet);
  end;
end;

end.
