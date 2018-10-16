unit uDicOrg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, dxBarBuiltInMenu, cxPC, cxSplitter, cxInplaceContainer,
  cxTLData, cxDBTL, Vcl.ExtCtrls, cxMaskEdit, Data.DB, Vcl.StdCtrls,
  cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit, cxDropDownEdit,
  cxTextEdit, cxCheckBox, cxLabel, cxDBLabel, Vcl.Menus, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmDicOrg = class(TBaseForm)
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    DataSource1: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    Panel4: TPanel;
    Label1: TLabel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxCheckBox1: TcxCheckBox;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button1: TButton;
    Button2: TButton;
    cxDBLabel1: TcxDBLabel;
    Label8: TLabel;
    Button3: TButton;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    DataSource2: TDataSource;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FMaxSysId: Integer;
    FMaxOrderNo: Integer;
    procedure RefreshData();
    procedure AddData(AParentId: string);
  public
    { Public declarations }
  end;

var
  frmDicOrg: TfrmDicOrg;

implementation

{$R *.dfm}


procedure TfrmDicOrg.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from organizational_structure where deleted = 0 order by order_no');
  DataSource2.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from organizational_structure where deleted = 0 order by order_no');
  DataSource3.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from system_dic where type = ''org_type'' order by order_no');
  DataSource4.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from system_dic where type = ''org_finace'' order by order_no');
  cxDBTreeList1.FullExpand;
  cxCheckBox1.Checked := False;
  FMaxSysId := FSysDataBase.GetFieldMaxValue('organizational_structure', 'sys_id');
  FMaxOrderNo := FSysDataBase.GetFieldMaxValue('organizational_structure', 'order_no');

end;

procedure TfrmDicOrg.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmDicOrg.RefreshData;
begin
  FSysDataBase.RefreshDataSet(DataSource1.DataSet);
  FSysDataBase.RefreshDataSet(DataSource2.DataSet);
  FMaxSysId := FSysDataBase.GetFieldMaxValue('organizational_structure', 'sys_id');
  FMaxOrderNo := FSysDataBase.GetFieldMaxValue('organizational_structure', 'order_no');
end;

procedure TfrmDicOrg.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  Panel4.Enabled := cxCheckBox1.Checked;

  Button1.Enabled := cxCheckBox1.Checked;
  Button2.Enabled := cxCheckBox1.Checked;
  Button3.Enabled := cxCheckBox1.Checked;
  Button9.Enabled := cxCheckBox1.Checked;
  Button10.Enabled := cxCheckBox1.Checked;
  Button11.Enabled := cxCheckBox1.Checked;
  Button12.Enabled := cxCheckBox1.Checked;
end;

procedure TfrmDicOrg.Button10Click(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
  DataSource1.DataSet.FieldByName('is_del').AsInteger := 1;
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  RefreshData;
end;

procedure TfrmDicOrg.Button11Click(Sender: TObject);
begin
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
end;

procedure TfrmDicOrg.Button12Click(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmDicOrg.Button13Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmDicOrg.Button1Click(Sender: TObject);
var
  LSysId1, LOrder1, LSysId2, LOrder2: string;
begin
  if cxDBTreeList1.FocusedNode.getPrevSibling <> nil then  begin
    LSysId1 := cxDBTreeList1.FocusedNode.Values[1];
    LSysId2 := cxDBTreeList1.FocusedNode.getPrevSibling.Values[1];
    LOrder1 := cxDBTreeList1.FocusedNode.Values[2];
    LOrder2 := cxDBTreeList1.FocusedNode.getPrevSibling.Values[2];
    FSysDataBase.ExecSQL('update organizational_structure set order_no = ' + LOrder2 + ' where sys_id = ' + LSysId1);
    FSysDataBase.ExecSQL('update organizational_structure set order_no = ' + LOrder1 + ' where sys_id = ' + LSysId2);

    RefreshData;
  end;
end;

procedure TfrmDicOrg.Button2Click(Sender: TObject);
var
  LSysId1, LOrder1, LSysId2, LOrder2: string;
begin
  if cxDBTreeList1.FocusedNode.getNextSibling <> nil then  begin
    LSysId1 := cxDBTreeList1.FocusedNode.Values[1];
    LSysId2 := cxDBTreeList1.FocusedNode.getNextSibling.Values[1];
    LOrder1 := cxDBTreeList1.FocusedNode.Values[2];
    LOrder2 := cxDBTreeList1.FocusedNode.getNextSibling.Values[2];
    FSysDataBase.ExecSQL('update organizational_structure set order_no = ' + LOrder2 + ' where sys_id = ' + LSysId1);
    FSysDataBase.ExecSQL('update organizational_structure set order_no = ' + LOrder1 + ' where sys_id = ' + LSysId2);

    RefreshData;
  end;
end;

procedure TfrmDicOrg.AddData(AParentId: string);
begin
  FMaxSysId := FMaxSysId+1;
  FMaxOrderNo := FMaxOrderNo+1;
  DataSource1.DataSet.Append;
  DataSource1.DataSet.FieldByName('sys_id').AsInteger := FMaxSysId;
  DataSource1.DataSet.FieldByName('order_no').AsInteger := FMaxOrderNo;
  DataSource1.DataSet.FieldByName('parent_id').AsString := AParentId;
end;


procedure TfrmDicOrg.Button9Click(Sender: TObject);
begin
  AddData(DataSource1.DataSet.FieldByName('parent_id').AsString);
end;

procedure TfrmDicOrg.Button3Click(Sender: TObject);
begin
  AddData(DataSource1.DataSet.FieldByName('sys_id').AsString);
end;


end.
