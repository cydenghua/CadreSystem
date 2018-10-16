unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxLabel, dxBar, cxBarEditItem, dxBarExtItems, cxClasses,
  System.Actions, Vcl.ActnList,
  uBaseForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxNavBarBase, dxNavBarCollns, dxNavBar, dxSkinsdxNavBarPainter, dxSkinsdxBarPainter,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, Data.DB,
  cxMaskEdit, cxSplitter, Vcl.ComCtrls, dxtree, Vcl.ImgList,
  System.DateUtils;

type
  TfrmMainForm = class(TBaseForm)
    MainAction: TActionList;
    actUserManager: TAction;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Group4: TdxNavBarGroup;
    dxNavBar1Group5: TdxNavBarGroup;
    cxBarEditItem1: TcxBarEditItem;
    dxNavBar1Group1Control: TdxNavBarGroupControl;
    cxDBTreeList1: TcxDBTreeList;
    DataSource1: TDataSource;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    actExecSql: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton1: TdxBarLargeButton;
    actCadreInfo: TAction;
    cxSplitter1: TcxSplitter;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    actImportData: TAction;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    actGridSetting: TAction;
    dxBarButton3: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    actDicOrg: TAction;
    actDicBase: TAction;
    dxNavBar1Group2Control: TdxNavBarGroupControl;
    Panel1: TPanel;
    dxTreeView1: TdxTreeView;
    cxImageList1: TcxImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dxNavBar1Group3Control: TdxNavBarGroupControl;
    dxTreeView2: TdxTreeView;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dxNavBar1Group4Control: TdxNavBarGroupControl;
    dxTreeView3: TdxTreeView;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actExecSqlExecute(Sender: TObject);
    procedure actCadreInfoExecute(Sender: TObject);
    procedure actImportDataExecute(Sender: TObject);
    procedure cxDBTreeList1Click(Sender: TObject);
    procedure actGridSettingExecute(Sender: TObject);
    procedure actDicOrgExecute(Sender: TObject);
    procedure actDicBaseExecute(Sender: TObject);
    procedure dxTreeView1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure dxNavBar1ActiveGroupChanged(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure dxTreeView2Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure dxTreeView3Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSkin();
    procedure dxBarButtonSkinClick(Sender: TObject);
    function GetSubNode(ANode: TcxTreeListNode): string;
    procedure InitAppointPlanTree;
    procedure InitListCadreTree;
    procedure InitTrainCadreTree;
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.dfm}

uses uSysDataBase, uSqlExec, uCadreInfo, uDataImport, uOrgStructureForm,
  uGridSetting, uDicOrg, uDicBase, uAppointPlanEdit, uAppointPlanDetail,
  uListCadreDetail, uListCadreEdit, uTrainCadreEdit, uTrainCadreSetting,
  uTrainCadreDetail;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := FSysConfig.SystemName;
  dxNavBar1.ActiveGroupIndex := 0;
  LoadSkin;
  InitAppointPlanTree;
  InitListCadreTree;
  InitTrainCadreTree;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  uSysDataBase.GetSysDataBase.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  inherited;
  dxBarManager1.LookAndFeel.NativeStyle := False;
  dxBarManager1.LookAndFeel.SkinName := FSysConfig.SkinName;

  dxNavBar1.LookAndFeel.NativeStyle := False;
  dxNavBar1.LookAndFeel.SkinName := FSysConfig.SkinName;

  if DataSource1.DataSet = nil then begin
    DataSource1.DataSet := FSysDataBase.GetDataSetBySql('select * from organizational_structure');
    cxDBTreeList1.FullExpand;
  end;
end;

procedure TfrmMainForm.dxBarButton9Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMainForm.dxBarButtonSkinClick(Sender: TObject);
begin
  Self.FSkin.SkinName := (Sender as TdxBarButton).Caption;
  Self.FSysConfig.SkinName := Self.FSkin.SkinName;
  Self.FSysConfig.SaveToFile;
end;

procedure TfrmMainForm.LoadSkin;
var
  aItemLink: TdxBarItemLink;
  aBarButton: TdxBarButton;
  i: Integer;
  LSkinList: TStringList;
begin
  LSkinList := TStringList.Create;
  LSkinList.Add('Black');
  LSkinList.Add('Blue');
  LSkinList.Add('GlassOceans');
  LSkinList.Add('LiquidSky');
  LSkinList.Add('MoneyTwins');
  LSkinList.Add('Pumpkin');
  LSkinList.Add('Seven');
  LSkinList.Add('Sharp');
  LSkinList.Add('Silver');
  LSkinList.Add('Springtime');
  LSkinList.Add('Stardust');
  LSkinList.Add('Summer2008');
  LSkinList.Add('Valentine');
  LSkinList.Add('Xmas2008Blue');
  LSkinList.Add('DevExpressDarkStyle');
  LSkinList.Add('DevExpressStyle');
  LSkinList.Add('SevenClassic');
  LSkinList.Add('SharpPlus');
  LSkinList.Add('TheAsphaltWorld');
  LSkinList.Add('VS2010');
  LSkinList.Add('Whiteprint');
  LSkinList.Add('Office2013White');
  LSkinList.Add('Office2013LightGray');
  LSkinList.Add('Office2013DarkGray');
  LSkinList.Add('MetropolisDark');

  dxBarSubItem5.ItemLinks.Clear;
  for i := 1 to LSkinList.Count-1 do  begin
    aBarButton := TdxBarButton.Create(Self);//内存资源由Self负责管理
    aBarButton.Caption := LSkinList.Strings[i];// Format('菜单项%d',[i]);
    aBarButton.OnClick:= dxBarButtonSkinClick; //mi_ItemOnClick; //动态添加Button的Onclick单击事件
    aItemLink := dxBarSubItem5.ItemLinks.Add;
    aItemLink.Item := aBarButton;
  end;
end;

procedure TfrmMainForm.actCadreInfoExecute(Sender: TObject);
begin
  if Assigned(frmCadreInfo) then  begin
    frmCadreInfo.Free;
  end;
  frmCadreInfo := TfrmCadreInfo.Create(Self);
  frmCadreInfo.ShowDataAll;
  frmCadreInfo.Show;
end;

procedure TfrmMainForm.actDicBaseExecute(Sender: TObject);
begin
  if Assigned(frmDicBase) then  begin
    FreeAndNil(frmDicBase);
  end;
  frmDicBase := TfrmDicBase.Create(Self);
  frmDicBase.Show;
end;

procedure TfrmMainForm.actDicOrgExecute(Sender: TObject);
begin
  if Assigned(frmDicOrg) then  begin
    FreeAndNil(frmDicOrg);
  end;
  frmDicOrg := TfrmDicOrg.Create(Self);
  frmDicOrg.Show;
end;

procedure TfrmMainForm.actExecSqlExecute(Sender: TObject);
var
  LFrmSqlExec: TfrmSqlExec;
begin
  LFrmSqlExec := TfrmSqlExec.Create(Self);
  LFrmSqlExec.Show;
end;

procedure TfrmMainForm.actGridSettingExecute(Sender: TObject);
begin
  if Assigned(frmGridSetting) then  begin
    FreeAndNil(frmGridSetting);
  end;
  frmGridSetting := TfrmGridSetting.Create(Self);
  frmGridSetting.ShowModal;
end;

procedure TfrmMainForm.actImportDataExecute(Sender: TObject);
begin
  if Assigned(frmDataImport) then  begin
    FreeAndNil(frmDataImport);
  end;
  frmDataImport := TfrmDataImport.Create(Self);
  frmDataImport.ShowModal;
end;

procedure TfrmMainForm.cxDBTreeList1Click(Sender: TObject);
begin
  if nil = cxDBTreeList1.FocusedNode then Exit;
  if not Assigned(frmOrgStructure) then  begin
    frmOrgStructure := TfrmOrgStructure.Create(Self);
  end;
  frmOrgStructure.ShowData(cxDBTreeList1.FocusedNode.Texts[0], cxDBTreeList1.FocusedNode.Texts[1], GetSubNode(cxDBTreeList1.FocusedNode));
  frmOrgStructure.Show;
end;

function TfrmMainForm.GetSubNode(ANode: TcxTreeListNode): string;
var
  LIndex: Integer;
begin
  Result := ANode.Texts[1];
  for LIndex := 0 to ANode.Count-1 do  begin
    Result := Result + ',' + QuotedStr(ANode.Items[LIndex].Texts[1]);
    if ANode.Items[LIndex].HasChildren then  begin
      Result := Result + ',' + GetSubNode(ANode.Items[LIndex]);
    end;
  end;
end;

procedure TfrmMainForm.dxNavBar1ActiveGroupChanged(Sender: TObject);
begin
  if dxNavBar1.ActiveGroupIndex = 0 then  begin
    if not Assigned(frmOrgStructure) then  begin
      frmOrgStructure := TfrmOrgStructure.Create(Self);
    end;
    frmOrgStructure.Show;
  end;
  if dxNavBar1.ActiveGroupIndex = 1 then  begin
    if not Assigned(frmAppointPlanDetail) then  begin
      frmAppointPlanDetail := TfrmAppointPlanDetail.Create(Self);
    end;
    frmAppointPlanDetail.Show;
  end;
  if dxNavBar1.ActiveGroupIndex = 2 then  begin
    if not Assigned(frmListCadreDetail) then  begin
      frmListCadreDetail := TfrmListCadreDetail.Create(Self);
    end;
    frmListCadreDetail.Show;
  end;
  if dxNavBar1.ActiveGroupIndex = 3 then  begin
    if not Assigned(frmTrainCadreDetail) then  begin
      frmTrainCadreDetail := TfrmTrainCadreDetail.Create(Self);
    end;
    frmTrainCadreDetail.Show;
  end;

end;

procedure TfrmMainForm.InitAppointPlanTree;
var
  LNodeAll, LNodeRecent, LNodeHistory, LNodeSearch, LNodeYear, LNodeTmp: TTreeNode;
  LInt, LYear, LYearOld: Integer;
  LDouble: Double;
begin
  LYear := 0;
  LYearOld := 0;
  LNodeYear := nil;

  dxTreeView1.Items.Clear;
  LNodeAll := dxTreeView1.Items.AddChildObject(nil, '所有任免', nil);
  LNodeRecent := dxTreeView1.Items.AddChildObject(nil, '近三个月任免', nil);
  LNodeHistory := dxTreeView1.Items.AddChildObject(nil, '历史任免', nil);
  LNodeSearch := dxTreeView1.Items.AddChildObject(nil, '查找', nil);

  LNodeAll.ImageIndex := 0;
  LNodeAll.SelectedIndex := 0;
  LNodeRecent.ImageIndex := 1;
  LNodeRecent.SelectedIndex := 1;
  LNodeHistory.ImageIndex := 2;
  LNodeHistory.SelectedIndex := 2;
  LNodeSearch.ImageIndex := 3;
  LNodeSearch.SelectedIndex := 3;

  with FSysDataBase.GetDataSetBySql(Self, 'select * from appoint_plan where deleted <> 1 order by sys_id desc') do  begin
    First;
    while not Eof do    begin
      //add to all
      LNodeTmp := dxTreeView1.Items.AddChildObject(LNodeAll, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      //add to recent
      if MonthSpan(Now, FieldByName('create_time').AsDateTime) < 3 then      begin
        LNodeTmp := dxTreeView1.Items.AddChildObject(LNodeRecent, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
        LNodeTmp.ImageIndex := 4;
        LNodeTmp.SelectedIndex := 5;
      end;

      LYear := YearOf(FieldByName('create_time').AsDateTime);
      if LYear <> LYearOld then LNodeYear := nil;
      LYearOld := LYear;

      //add to history
      if LNodeYear = nil then      begin
        LNodeYear := dxTreeView1.Items.AddChildObject(LNodeHistory, IntToStr(LYear) + '年', nil);
        LNodeYear.ImageIndex := 6;
        LNodeYear.SelectedIndex := 6;
      end;
      LNodeTmp := dxTreeView1.Items.AddChildObject(LNodeYear, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      Next;
    end;
  end;

  LNodeAll.Expand(True);
  LNodeRecent.Expand(True);
  LNodeHistory.Expand(False);
end;

procedure TfrmMainForm.dxTreeView1Click(Sender: TObject);
var
  LNode:TTreeNode;
  LPlanId: Integer;
  X,Y:Integer;
begin
  with dxTreeView1 do  begin
    X:=ScreenToClient(Mouse.CursorPos).X;
    Y:=ScreenToClient(Mouse.CursorPos).Y;
    LNode:=GetNodeAt(X,Y);
  end;
  if (LNode<>nil) and (LNode = dxTreeView1.Selected) then  begin
    if LNode.Data = nil then Exit;
    LPlanId := Integer(LNode.Data);

    if not Assigned(frmAppointPlanDetail) then  begin
      frmAppointPlanDetail := TfrmAppointPlanDetail.Create(Self);
    end;
    frmAppointPlanDetail.ShowData(IntToStr(LPlanId), LNode.Text);
    frmAppointPlanDetail.Show;
  end;
end;

//add appoint plan
procedure TfrmMainForm.Label1Click(Sender: TObject);
begin
  if Assigned(frmAppointPlanEdit) then  begin
    FreeAndNil(frmAppointPlanEdit);
  end;
  frmAppointPlanEdit := TfrmAppointPlanEdit.Create(Self);
  frmAppointPlanEdit.AddData;
  frmAppointPlanEdit.ShowModal;

  if frmAppointPlanEdit.ModalResult = mrOk then  begin
    InitAppointPlanTree;
  end;
end;

//delete appoint plan
procedure TfrmMainForm.Label2Click(Sender: TObject);
var
  LNodeTmp: TTreeNode;
  LPlanId: Integer;
begin   //
  LNodeTmp := dxTreeView1.Selected;
  if LNodeTmp = nil then Exit;
  if LNodeTmp.Data = nil then Exit;
  LPlanId := Integer(LNodeTmp.Data);
  if Application.MessageBox(PWideChar('确定要删除《' + LNodeTmp.Text +'》？'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    FSysDataBase.ExecSQL('update appoint_plan set deleted = 1 where sys_id = ' + IntToStr(LPlanId));
    InitAppointPlanTree;
  end;
//  ShowMessage('plan id is ' + IntToStr(LPlanId) + ' level is ' + IntToStr(dxTreeView1.Selected.Level));
end;

//alter appoint plan
procedure TfrmMainForm.Label3Click(Sender: TObject);
var
  LNodeTmp: TTreeNode;
  LPlanId: Integer;
begin   //
  LNodeTmp := dxTreeView1.Selected;
  if LNodeTmp = nil then Exit;
  if LNodeTmp.Data = nil then Exit;
  LPlanId := Integer(LNodeTmp.Data);

  if Assigned(frmAppointPlanEdit) then  begin
    FreeAndNil(frmAppointPlanEdit);
  end;
  frmAppointPlanEdit := TfrmAppointPlanEdit.Create(Self);
  frmAppointPlanEdit.EditData(IntToStr(LPlanId));
  frmAppointPlanEdit.ShowModal;

  if frmAppointPlanEdit.ModalResult = mrOk then  begin
    InitAppointPlanTree;
  end;
end;

procedure TfrmMainForm.dxTreeView2Click(Sender: TObject);
var
  LNode:TTreeNode;
  LId: Integer;
  X,Y:Integer;
begin
  with dxTreeView2 do  begin
    X:=ScreenToClient(Mouse.CursorPos).X;
    Y:=ScreenToClient(Mouse.CursorPos).Y;
    LNode:=GetNodeAt(X,Y);
  end;
  if (LNode<>nil) and (LNode = dxTreeView2.Selected) then  begin
    if LNode.Data = nil then Exit;
    LId := Integer(LNode.Data);

    if not Assigned(frmListCadreDetail) then  begin
      frmListCadreDetail := TfrmListCadreDetail.Create(Self);
    end;
    frmListCadreDetail.ShowData(IntToStr(LId));
    frmListCadreDetail.Show;
  end;
end;

//list add
procedure TfrmMainForm.Label4Click(Sender: TObject);
begin
  if Assigned(frmListCadreEdit) then frmListCadreEdit.Free;
  frmListCadreEdit := TfrmListCadreEdit.Create(Self);
  frmListCadreEdit.AddData;
  frmListCadreEdit.ShowModal;

  if frmListCadreEdit.ModalResult = mrOk then  begin
    InitListCadreTree;
  end;
end;

//list delete
procedure TfrmMainForm.Label5Click(Sender: TObject);
var
  LNodeTmp: TTreeNode;
  LId: Integer;
begin   //
  LNodeTmp := dxTreeView2.Selected;
  if LNodeTmp = nil then Exit;
  if LNodeTmp.Data = nil then Exit;
  LId := Integer(LNodeTmp.Data);
  if Application.MessageBox(PWideChar('确定要删除《' + LNodeTmp.Text +'》？'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    FSysDataBase.ExecSQL('update list_cadre set deleted = 1 where sys_id = ' + IntToStr(LId));
    InitAppointPlanTree;
  end;
end;

//list edit
procedure TfrmMainForm.Label6Click(Sender: TObject);
var
  LNodeTmp: TTreeNode;
  LId: Integer;
begin   //
  LNodeTmp := dxTreeView2.Selected;
  if LNodeTmp = nil then Exit;
  if LNodeTmp.Data = nil then Exit;
  LId := Integer(LNodeTmp.Data);

  if Assigned(frmListCadreEdit) then  begin
    FreeAndNil(frmListCadreEdit);
  end;
  frmListCadreEdit := TfrmListCadreEdit.Create(Self);
  frmListCadreEdit.ShowData(IntToStr(LId));
  frmListCadreEdit.ShowModal;

  if frmListCadreEdit.ModalResult = mrOk then  begin
    InitListCadreTree;
  end;
end;

procedure TfrmMainForm.InitListCadreTree;
var
  LNodeAll, LNodeHistory, LNodeYear, LNodeTmp: TTreeNode;
  LInt, LYear, LYearOld: Integer;
  LDouble: Double;
begin
  LYear := 0;
  LYearOld := 0;
  LNodeYear := nil;

  dxTreeView2.Items.Clear;
  LNodeAll := dxTreeView2.Items.AddChildObject(nil, '所有名册', nil);
  LNodeHistory := dxTreeView2.Items.AddChildObject(nil, '历史名册', nil);

  LNodeAll.ImageIndex := 0;
  LNodeAll.SelectedIndex := 0;
  LNodeHistory.ImageIndex := 2;
  LNodeHistory.SelectedIndex := 2;

  with FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre where deleted <> 1 order by filing_time desc') do  begin
    First;
    while not Eof do    begin
      //add to all
      LNodeTmp := dxTreeView2.Items.AddChildObject(LNodeAll, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      LYear := FieldByName('filing_time').AsInteger;
      if LYear <> LYearOld then LNodeYear := nil;
      LYearOld := LYear;

      //add to history
      if LNodeYear = nil then      begin
        LNodeYear := dxTreeView2.Items.AddChildObject(LNodeHistory, IntToStr(LYear) + '年', nil);
        LNodeYear.ImageIndex := 6;
        LNodeYear.SelectedIndex := 6;
      end;
      LNodeTmp := dxTreeView2.Items.AddChildObject(LNodeYear, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      Next;
    end;
  end;

  LNodeAll.Expand(True);
  LNodeHistory.Expand(False);
end;

procedure TfrmMainForm.InitTrainCadreTree;
var
  LNodeAll, LNodeTime, LNodeYear, LNodeType, LNodeTmp: TTreeNode;
  LYear, LYearOld: Integer;
  LStr, LStrOld: string;
begin
  LYear := 0;
  LYearOld := 0;
  LNodeYear := nil;

  dxTreeView3.Items.Clear;
  LNodeAll := dxTreeView3.Items.AddChildObject(nil, '全部培训', nil);
  LNodeTime := dxTreeView3.Items.AddChildObject(nil, '按时间', nil);
  LNodeType := dxTreeView3.Items.AddChildObject(nil, '按培训类型', nil);

  LNodeAll.ImageIndex := 0;
  LNodeAll.SelectedIndex := 0;

  with FSysDataBase.GetDataSetBySql(Self, 'SELECT * FROM train_cadre where deleted <> 1 order by sys_id') do  begin
    First;
    while not Eof do    begin
      //add to all
      LNodeTmp := dxTreeView3.Items.AddChildObject(LNodeAll, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;
      Next;
    end;
  end;
  with FSysDataBase.GetDataSetBySql(Self, 'SELECT * FROM train_cadre where deleted <> 1 order by begin_date') do  begin
    First;
    while not Eof do    begin
      //add to time
      LYear := YearOf(FieldByName('begin_date').AsDateTime);
      if LYear <> LYearOld then LNodeYear := nil;
      LYearOld := LYear;

      if LNodeYear = nil then      begin
        LNodeYear := dxTreeView3.Items.AddChildObject(LNodeTime, IntToStr(LYear) + '年', nil);
        LNodeYear.ImageIndex := 6;
        LNodeYear.SelectedIndex := 6;
      end;
      LNodeTmp := dxTreeView3.Items.AddChildObject(LNodeYear, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      Next;
    end;
  end;

  LNodeYear := nil;
  LStrOld := '';
  with FSysDataBase.GetDataSetBySql(Self, 'SELECT * FROM train_cadre where deleted <> 1 order by genre') do  begin
    First;
    while not Eof do    begin
      //add to type
      LStr := FieldByName('genre').AsString;
      if not SameStr(LStr,LStrOld) then LNodeYear := nil;
      LStrOld := LStr;

      if LNodeYear = nil then      begin
        LNodeYear := dxTreeView3.Items.AddChildObject(LNodeType, LStr, nil);
        LNodeYear.ImageIndex := 6;
        LNodeYear.SelectedIndex := 6;
      end;
      LNodeTmp := dxTreeView3.Items.AddChildObject(LNodeYear, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      Next;
    end;
    LNodeType.Expand(True);
  end;

  LNodeYear := nil;
  LStrOld := '';
  LNodeType := dxTreeView3.Items.AddChildObject(nil, '按培训方式', nil);
  with FSysDataBase.GetDataSetBySql(Self, 'SELECT * FROM train_cadre where deleted <> 1 order by mode') do  begin
    First;
    while not Eof do    begin
      //add to type
      LStr := FieldByName('mode').AsString;
      if not SameStr(LStr,LStrOld) then LNodeYear := nil;
      LStrOld := LStr;

      if LNodeYear = nil then      begin
        LNodeYear := dxTreeView3.Items.AddChildObject(LNodeType, LStr, nil);
        LNodeYear.ImageIndex := 6;
        LNodeYear.SelectedIndex := 6;
      end;
      LNodeTmp := dxTreeView3.Items.AddChildObject(LNodeYear, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      Next;
    end;
    LNodeType.Expand(True);
  end;

  LNodeYear := nil;
  LStrOld := '';
  LNodeType := dxTreeView3.Items.AddChildObject(nil, '按培训机构', nil);
  with FSysDataBase.GetDataSetBySql(Self, 'SELECT * FROM train_cadre where deleted <> 1 order by organization') do  begin
    First;
    while not Eof do    begin
      //add to type
      LStr := FieldByName('organization').AsString;
      if not SameStr(LStr,LStrOld) then LNodeYear := nil;
      LStrOld := LStr;

      if LNodeYear = nil then      begin
        LNodeYear := dxTreeView3.Items.AddChildObject(LNodeType, LStr, nil);
        LNodeYear.ImageIndex := 6;
        LNodeYear.SelectedIndex := 6;
      end;
      LNodeTmp := dxTreeView3.Items.AddChildObject(LNodeYear, FieldByName('name').AsString, Pointer(FieldByName('sys_id').AsInteger));
      LNodeTmp.ImageIndex := 4;
      LNodeTmp.SelectedIndex := 5;

      Next;
    end;
    LNodeType.Expand(True);
  end;

  LNodeTime.Expand(True);
  LNodeAll.Expand(True);
end;

//train add
procedure TfrmMainForm.Label7Click(Sender: TObject);
begin      //
  if Assigned(frmTrainCadreEdit) then frmTrainCadreEdit.Free;
  frmTrainCadreEdit := TfrmTrainCadreEdit.Create(Self);
  frmTrainCadreEdit.AddData;
  frmTrainCadreEdit.ShowModal;
  if frmTrainCadreEdit.ModalResult = mrOk then  begin
    InitTrainCadreTree;
  end;
end;

//train delete
procedure TfrmMainForm.Label8Click(Sender: TObject);
var
  LNodeTmp: TTreeNode;
  LId: Integer;
begin   //
  LNodeTmp := dxTreeView3.Selected;
  if LNodeTmp = nil then Exit;
  if LNodeTmp.Data = nil then Exit;
  LId := Integer(LNodeTmp.Data);
  if Application.MessageBox(PWideChar('确定要删除《' + LNodeTmp.Text +'》？'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK    then  begin
    FSysDataBase.ExecSQL('update train_cadre  set deleted = 1 where sys_id = ' + IntToStr(LId));
    InitAppointPlanTree;
  end;
end;

//train modify
procedure TfrmMainForm.Label9Click(Sender: TObject);
var
  LNodeTmp: TTreeNode;
  LId: Integer;
begin   //
  LNodeTmp := dxTreeView3.Selected;
  if LNodeTmp = nil then Exit;
  if LNodeTmp.Data = nil then Exit;
  LId := Integer(LNodeTmp.Data);

  if Assigned(frmTrainCadreEdit) then  begin
    FreeAndNil(frmTrainCadreEdit);
  end;
  frmTrainCadreEdit := TfrmTrainCadreEdit.Create(Self);
  frmTrainCadreEdit.ShowData(IntToStr(LId));
  frmTrainCadreEdit.ShowModal;

  if frmTrainCadreEdit.ModalResult = mrOk then  begin
    InitTrainCadreTree;
  end;
end;

//train set
procedure TfrmMainForm.Label10Click(Sender: TObject);
begin
  if Assigned(frmTrainCadreSetting) then  begin
    frmTrainCadreSetting.Free;
  end;
  frmTrainCadreSetting := TfrmTrainCadreSetting.Create(Self);
  frmTrainCadreSetting.ShowModal;
end;

procedure TfrmMainForm.dxTreeView3Click(Sender: TObject);
var
  LNode:TTreeNode;
  LId: Integer;
  X,Y:Integer;
begin
  with dxTreeView3 do  begin
    X:=ScreenToClient(Mouse.CursorPos).X;
    Y:=ScreenToClient(Mouse.CursorPos).Y;
    LNode:=GetNodeAt(X,Y);
  end;
  if (LNode<>nil) and (LNode = dxTreeView3.Selected) then  begin
    if LNode.Data = nil then Exit;
    LId := Integer(LNode.Data);

    if not Assigned(frmTrainCadreDetail) then  begin
      frmTrainCadreDetail := TfrmTrainCadreDetail.Create(Self);
    end;
    frmTrainCadreDetail.ShowData(IntToStr(LId), LNode.Text);
    frmTrainCadreDetail.Show;
  end;
end;


end.
