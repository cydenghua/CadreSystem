unit uCadreInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, uBaseForm, Vcl.Grids, Vcl.DBGrids,
  dxBarBuiltInMenu, cxPC, dxSkinscxPCPainter, cxContainer, cxTextEdit, cxDBEdit,
  Vcl.StdCtrls, cxImage, cxMaskEdit, cxDropDownEdit, cxMemo, cxGroupBox,
  cxCalendar, cxSpinEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxCalc,
  cxCheckBox, Vcl.ExtDlgs;

type
  TfrmCadreInfo = class(TBaseForm)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSourceCadreInfo: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    DataSourceCadreInfoExtend: TDataSource;
    DataSourceCadreInfoJob: TDataSource;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    DataSourceCadreInfoFamily: TDataSource;
    Panel2: TPanel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    cxCheckBox1: TcxCheckBox;
    Panel3: TPanel;
    cxDBComboBox1: TcxDBComboBox;
    cxDBComboBox13: TcxDBComboBox;
    cxDBComboBox14: TcxDBComboBox;
    cxDBComboBox2: TcxDBComboBox;
    cxDBComboBox3: TcxDBComboBox;
    cxDBComboBox4: TcxDBComboBox;
    cxDBComboBox5: TcxDBComboBox;
    cxDBComboBox6: TcxDBComboBox;
    cxDBComboBox7: TcxDBComboBox;
    cxDBImage1: TcxDBImage;
    cxDBMemo1: TcxDBMemo;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Image1: TImage;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBComboBox8: TcxDBComboBox;
    cxDBTextEdit11: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    cxDBComboBox9: TcxDBComboBox;
    cxDBComboBox10: TcxDBComboBox;
    cxDBTextEdit12: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    cxDBComboBox11: TcxDBComboBox;
    cxDBComboBox12: TcxDBComboBox;
    cxDBTextEdit13: TcxDBTextEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxDBComboBox16: TcxDBComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBMemo2: TcxDBMemo;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    cxDBTextEdit18: TcxDBTextEdit;
    cxDBTextEdit19: TcxDBTextEdit;
    cxDBTextEdit20: TcxDBTextEdit;
    cxDBTextEdit21: TcxDBTextEdit;
    cxDBTextEdit22: TcxDBTextEdit;
    cxDBTextEdit23: TcxDBTextEdit;
    cxDBTextEdit24: TcxDBTextEdit;
    cxDBTextEdit25: TcxDBTextEdit;
    cxDBTextEdit26: TcxDBTextEdit;
    cxDBTextEdit27: TcxDBTextEdit;
    cxDBTextEdit28: TcxDBTextEdit;
    cxDBTextEdit29: TcxDBTextEdit;
    cxDBTextEdit30: TcxDBTextEdit;
    cxDBTextEdit31: TcxDBTextEdit;
    cxDBTextEdit32: TcxDBTextEdit;
    cxDBTextEdit33: TcxDBTextEdit;
    cxDBTextEdit34: TcxDBTextEdit;
    cxDBTextEdit35: TcxDBTextEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Panel5: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    cxDBMemo3: TcxDBMemo;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    Label59: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    Panel9: TPanel;
    Panel10: TPanel;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    cxPageControl2: TcxPageControl;
    cxTabSheetPosition1: TcxTabSheet;
    cxTabSheetPosition2: TcxTabSheet;
    cxCheckBox2: TcxCheckBox;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGrid5: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSourceCadrePositionNow: TDataSource;
    DataSourceCadrePositionOld: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure cxGrid4DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure DataCadreAfterScroll(DataSet: TDataSet);
    procedure UpdatePosition;
  public
    { Public declarations }
    procedure ShowDataAll();
    procedure ShowDataById(AId: string);
    procedure ShowDataByIdWithPosition(AId: string);
  end;

var
  frmCadreInfo: TfrmCadreInfo;

implementation

{$R *.dfm}

uses uCadreFun, uCadreInfoPosition;

procedure TfrmCadreInfo.FormCreate(Sender: TObject);
begin
  inherited;
  cxPageControl1.ActivePageIndex := 0;
  cxPageControl2.ActivePageIndex := 0;

  DataSourceCadreInfo.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where 2=1');
  DataSourceCadreInfoExtend.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_extend where 1=2');
  DataSourceCadreInfoJob.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_job where 1=2');
  DataSourceCadreInfoFamily.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_family where 1=2' );
  DataSourceCadrePositionNow.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_position where 1=2' );
  DataSourceCadrePositionOld.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_position where 1=2' );

  InitCxComboBoxWithDicType(cxDBComboBox1, 'sex');
  InitCxComboBoxWithDicType(cxDBComboBox2, 'nation');
  InitCxComboBoxWithDicType(cxDBComboBox3, 'political');
//  InitCxComboBoxWithDicType(cxDBComboBox4, 'political');
//  InitCxComboBoxWithDicType(cxDBComboBox5, 'political');
  InitCxComboBoxWithDicType(cxDBComboBox6, 'health');
  InitCxComboBoxWithDicType(cxDBComboBox7, 'job');
  InitCxComboBoxWithDicType(cxDBComboBox14, 'response');
  InitCxComboBoxWithDicType(cxDBComboBox13, 'cadre_type');
  InitCxComboBoxWithDicType(cxDBComboBox8, 'tech_level');
  InitCxComboBoxWithDicType(cxDBComboBox9, 'education');
  InitCxComboBoxWithDicType(cxDBComboBox10, 'degree');
  InitCxComboBoxWithDicType(cxDBComboBox11, 'education');
  InitCxComboBoxWithDicType(cxDBComboBox12, 'degree');
  InitCxComboBoxWithDicType(cxDBComboBox16, 'papers_type');

  cxCheckBox1.Checked := False;
  //暂时屏蔽，  todo
  cxTabSheet4.TabVisible := False;
  cxTabSheet7.TabVisible := False;
  cxTabSheet8.TabVisible := False;
end;

procedure TfrmCadreInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadreInfo := nil;
end;

procedure TfrmCadreInfo.FormShow(Sender: TObject);
begin
  inherited;
  cxPageControl1.LookAndFeel.NativeStyle := False;
  cxPageControl1.LookAndFeel.SkinName := FSysConfig.SkinName;
end;

procedure TfrmCadreInfo.ShowDataAll;
begin
  DataSourceCadreInfo.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where is_del <> 1');
  DataCadreAfterScroll(DataSourceCadreInfo.DataSet);
  DataSourceCadreInfo.DataSet.AfterScroll := DataCadreAfterScroll;
end;

procedure TfrmCadreInfo.ShowDataById(AId: string);
begin
  DataSourceCadreInfo.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info where sys_id = ' + QuotedStr(AId));
  DataCadreAfterScroll(DataSourceCadreInfo.DataSet);
  DataSourceCadreInfo.DataSet.AfterScroll := DataCadreAfterScroll;
  Panel1.Visible := False;
  Button9.Visible := False;
  Button10.Visible := False;
end;

procedure TfrmCadreInfo.ShowDataByIdWithPosition(AId: string);
begin
  ShowDataById(AId);
  cxPageControl1.ActivePage := cxTabSheet5;
end;

procedure TfrmCadreInfo.DataCadreAfterScroll(DataSet: TDataSet);
var
  LSysId: string;
begin
  LSysId := DataSet.FieldByName('sys_id').AsString;
  DataSourceCadreInfoExtend.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_extend where sys_id =' + QuotedStr(LSysId));
  DataSourceCadreInfoJob.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_job where sys_id =' + QuotedStr(LSysId) + ' order by order_no' );
  DataSourceCadreInfoFamily.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_family where sys_id =' + QuotedStr(LSysId) + ' order by order_no' );
  DataSourceCadrePositionNow.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_position where cadre_id =' + QuotedStr(LSysId) + ' and status = 1 order by begin_time' );
  DataSourceCadrePositionOld.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_position where cadre_id =' + QuotedStr(LSysId) + ' and status = 0 order by begin_time' );
end;

//工作简历   新增
procedure TfrmCadreInfo.Button1Click(Sender: TObject);
var
  LOrderNo: Integer;
begin //
  if DataSourceCadreInfoJob.DataSet.IsEmpty then
  begin
    LOrderNo := 1;
  end else  begin
    DataSourceCadreInfoJob.DataSet.Last;
    LOrderNo := DataSourceCadreInfoJob.DataSet.FieldByName('order_no').AsInteger + 1;
  end;

  DataSourceCadreInfoJob.DataSet.Append;
  DataSourceCadreInfoJob.DataSet.FieldByName('sys_id').Value := DataSourceCadreInfo.DataSet.FieldByName('sys_id').Value;
  DataSourceCadreInfoJob.DataSet.FieldByName('order_no').AsInteger := LOrderNo;
end;

//工作简历   删除
procedure TfrmCadreInfo.Button2Click(Sender: TObject);
begin    //
  if (DataSourceCadreInfoJob.DataSet = nil) or DataSourceCadreInfoJob.DataSet.IsEmpty then Exit;
  if Application.MessageBox('您确定要删除吗？', '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then  begin
    DataSourceCadreInfoJob.DataSet.Delete;
  end;
end;


//工作简历   上移
procedure TfrmCadreInfo.Button3Click(Sender: TObject);
var
  LOrderNo1, LOrderNo2: Integer;
  LSql: string;
begin//
//  if 1 = DataSourceCadreInfoJob.DataSet.RecNo then Exit;
//
//  LOrderNo1 := DataSourceCadreInfoJob.DataSet.FieldByName('order_no').AsInteger;
//  DataSourceCadreInfoJob.DataSet.Prior;
//  LOrderNo2 := DataSourceCadreInfoJob.DataSet.FieldByName('order_no').AsInteger;
//
//  LSql := 'update cadre_info_job set order_no = 99999 where order_no = ' + IntToStr(LOrderNo1);
//  LSql := LSql + ';update cadre_info_job set order_no = ' + IntToStr(LOrderNo1) + ' where order_no = ' + IntToStr(LOrderNo2);
//  LSql := LSql + ';update cadre_info_job set order_no = '+ IntToStr(LOrderNo2) +'  where order_no = 99999';
//
//  FSysDataBase.ExecSQL(LSql);
//  FSysDataBase.RefreshDataSet(DataSourceCadreInfoJob.DataSet);
  cxGrid2DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSourceCadreInfoJob.DataSet);
  cxGrid2DBTableView1.EndUpdate;
end;

//工作简历   下移
procedure TfrmCadreInfo.Button4Click(Sender: TObject);
var
  LOrderNo1, LOrderNo2: Integer;
  LSql: string;
begin  //
  cxGrid2DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSourceCadreInfoJob.DataSet);
  cxGrid2DBTableView1.EndUpdate;
//  if DataSourceCadreInfoJob.DataSet.RecordCount = DataSourceCadreInfoJob.DataSet.RecNo then Exit;
//
//  LOrderNo1 := DataSourceCadreInfoJob.DataSet.FieldByName('order_no').AsInteger;
//  DataSourceCadreInfoJob.DataSet.Next;
//  LOrderNo2 := DataSourceCadreInfoJob.DataSet.FieldByName('order_no').AsInteger;
//
//  LSql := 'update cadre_info_job set order_no = 99999 where order_no = ' + IntToStr(LOrderNo1);
//  LSql := LSql + ';update cadre_info_job set order_no = ' + IntToStr(LOrderNo1) + ' where order_no = ' + IntToStr(LOrderNo2);
//  LSql := LSql + ';update cadre_info_job set order_no = '+ IntToStr(LOrderNo2) +'  where order_no = 99999';
//
//  FSysDataBase.ExecSQL(LSql);
//  FSysDataBase.RefreshDataSet(DataSourceCadreInfoJob.DataSet);
end;

//家庭成员  新增
procedure TfrmCadreInfo.Button5Click(Sender: TObject);
var
  LOrderNo: Integer;
begin //
  if DataSourceCadreInfoFamily.DataSet.IsEmpty then
  begin
    LOrderNo := 1;
  end else  begin
    DataSourceCadreInfoFamily.DataSet.Last;
    LOrderNo := DataSourceCadreInfoFamily.DataSet.FieldByName('order_no').AsInteger + 1;
  end;

  DataSourceCadreInfoFamily.DataSet.Append;
  DataSourceCadreInfoFamily.DataSet.FieldByName('sys_id').Value := DataSourceCadreInfo.DataSet.FieldByName('sys_id').Value;
  DataSourceCadreInfoFamily.DataSet.FieldByName('order_no').AsInteger := LOrderNo;
end;

//家庭成员  删除
procedure TfrmCadreInfo.Button6Click(Sender: TObject);
begin//family delete
  if (DataSourceCadreInfoFamily.DataSet = nil) or DataSourceCadreInfoFamily.DataSet.IsEmpty then Exit;
  if Application.MessageBox('您确定要删除吗？', '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then  begin
    DataSourceCadreInfoFamily.DataSet.Delete;
  end;
end;

//家庭成员  上移
procedure TfrmCadreInfo.Button7Click(Sender: TObject);
begin//
  cxGrid3DBTableView1.BeginUpdate();
  FSysDataBase.MoveUp(DataSourceCadreInfoFamily.DataSet);
  cxGrid3DBTableView1.EndUpdate;
end;

//家庭成员  下移
procedure TfrmCadreInfo.Button8Click(Sender: TObject);
begin
  cxGrid3DBTableView1.BeginUpdate();
  FSysDataBase.MoveDown(DataSourceCadreInfoFamily.DataSet);
  cxGrid3DBTableView1.EndUpdate;
end;

procedure TfrmCadreInfo.Button9Click(Sender: TObject);
var
  LStr: string;
begin//add
  LStr := FSysDataBase.GetStrGUID;
  uCadreFun.GetCadreFun.CreateNewCadre(LStr);
  DataSourceCadreInfo.DataSet.Refresh;
  DataSourceCadreInfo.DataSet.Locate('sys_id', LStr, []);
end;

procedure TfrmCadreInfo.Button10Click(Sender: TObject);
var
  LSysId: string;
begin//delete
  LSysId := DataSourceCadreInfo.DataSet.FieldByName('sys_id').AsString;
  FSysDataBase.ExecSQL('update cadre_info set is_del = 1 where sys_id = ' + QuotedStr(LSysId));

  DataSourceCadreInfo.DataSet.Next;
  LSysId := DataSourceCadreInfo.DataSet.FieldByName('sys_id').AsString;

  FSysDataBase.RefreshDataSet(DataSourceCadreInfo.DataSet);
  DataSourceCadreInfo.DataSet.Locate('sys_id', LSysId, []);
end;

procedure TfrmCadreInfo.Button11Click(Sender: TObject);
begin//save
  FSysDataBase.SaveDataSet(DataSourceCadreInfoExtend.DataSet);
  FSysDataBase.SaveDataSet(DataSourceCadreInfoJob.DataSet);
  FSysDataBase.SaveDataSet(DataSourceCadreInfoFamily.DataSet);
  FSysDataBase.SaveDataSet(DataSourceCadreInfo.DataSet);//必须最后保存，否则其他数据无法保存
end;

procedure TfrmCadreInfo.Button12Click(Sender: TObject);
begin    //refresh
  FSysDataBase.RefreshDataSet(DataSourceCadreInfo.DataSet);
end;

procedure TfrmCadreInfo.Button13Click(Sender: TObject);
begin//close
  Self.Close;
end;

procedure TfrmCadreInfo.Button14Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then  begin
    DataSourceCadreInfo.DataSet.Edit;
    try
      TBlobField(DataSourceCadreInfo.DataSet.FieldByName('photo')).LoadFromFile(OpenPictureDialog1.FileName);
    except on E: Exception do
      ShowMessage('请选择正确的jpg文件： ' + E.Message);
    end;
  end;
end;

procedure TfrmCadreInfo.Button15Click(Sender: TObject);
begin
  SavePictureDialog1.FileName := DataSourceCadreInfo.DataSet.FieldByName('name').AsString + '.jpg';
  if SavePictureDialog1.Execute then  begin
    cxDBImage1.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

procedure TfrmCadreInfo.Button16Click(Sender: TObject);
begin                 //clear
  DataSourceCadreInfo.DataSet.Edit;
  DataSourceCadreInfo.DataSet.FieldByName('photo').AsString := '';
end;

procedure TfrmCadreInfo.Button17Click(Sender: TObject);
begin
  if Assigned(frmCadreInfoPosition) then  begin
    frmCadreInfoPosition.Free;
  end;
  frmCadreInfoPosition := TfrmCadreInfoPosition.Create(Self);
  frmCadreInfoPosition.AddData(DataSourceCadreInfo.DataSet.FieldByName('sys_id').AsString, DataSourceCadreInfo.DataSet.FieldByName('name').AsString);
  frmCadreInfoPosition.ShowModal;

  if frmCadreInfoPosition.ModalResult = mrOk then  begin
    FSysDataBase.RefreshDataSet(DataSourceCadrePositionNow.DataSet);
    FSysDataBase.RefreshDataSet(DataSourceCadrePositionOld.DataSet);
    UpdatePosition;
  end;
end;

procedure TfrmCadreInfo.Button19Click(Sender: TObject);
begin
  if Assigned(frmCadreInfoPosition) then  begin
    frmCadreInfoPosition.Free;
  end;
  frmCadreInfoPosition := TfrmCadreInfoPosition.Create(Self);
  if cxTabSheetPosition1.Visible then  begin
    frmCadreInfoPosition.EditData(DataSourceCadrePositionNow.DataSet.FieldByName('sys_id').AsString, DataSourceCadreInfo.DataSet.FieldByName('name').AsString);
  end;
  if cxTabSheetPosition2.Visible then  begin
    frmCadreInfoPosition.EditData(DataSourceCadrePositionOld.DataSet.FieldByName('sys_id').AsString, DataSourceCadreInfo.DataSet.FieldByName('name').AsString);
  end;
  frmCadreInfoPosition.ShowModal;

  if frmCadreInfoPosition.ModalResult = mrOk then  begin
    FSysDataBase.RefreshDataSet(DataSourceCadrePositionNow.DataSet);
    FSysDataBase.RefreshDataSet(DataSourceCadrePositionOld.DataSet);
    UpdatePosition;
  end;
end;

procedure TfrmCadreInfo.UpdatePosition;
var
  LName, LTime: string;
begin
  if cxCheckBox2.Checked then Exit;
  if DataSourceCadrePositionNow.DataSet.IsEmpty then Exit;

  LName := '';
  LTime := '';
  with DataSourceCadrePositionNow.DataSet do  begin
    First;
    while not Eof do    begin
      if LName.Length > 0 then      begin
        LName := LName + ',';
      end;
      LName := LName + FieldByName('org_name').AsString + FieldByName('name').AsString;

      if LTime.IsEmpty then   begin
        LTime := FieldByName('begin_time').AsString;
      end;
      Next;
    end;
  end;

  FSysDataBase.ExecSQL('update cadre_info set present_asg = ' + QuotedStr(LName) + ', present_asg_time = ' + QuotedStr(LTime) + ' where sys_id = ' + QuotedStr(DataSourceCadreInfo.DataSet.FieldByName('sys_id').AsString));
  FSysDataBase.RefreshDataSet(DataSourceCadreInfo.DataSet);
end;

procedure TfrmCadreInfo.Button18Click(Sender: TObject);
var
  LDataSet: TDataSet;
begin
  if cxTabSheetPosition1.Visible then  begin
    LDataSet := DataSourceCadrePositionNow.DataSet;
  end;
  if cxTabSheetPosition2.Visible then  begin
    LDataSet := DataSourceCadrePositionOld.DataSet;
  end;
  LDataSet.Edit;
  LDataSet.FieldByName('status').AsInteger := 9;
  FSysDataBase.SaveDataSet(LDataSet);
  FSysDataBase.RefreshDataSet(LDataSet);

  if cxTabSheetPosition1.Visible then  begin
    UpdatePosition;
  end;
end;

procedure TfrmCadreInfo.cxGrid4DBTableView1DblClick(Sender: TObject);
begin
  Button19.Click;
end;

procedure TfrmCadreInfo.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  Button9.Enabled := cxCheckBox1.Checked;
  Button10.Enabled := cxCheckBox1.Checked;
  Button11.Enabled := cxCheckBox1.Checked;
  Button12.Enabled := cxCheckBox1.Checked;

  Panel3.Enabled := cxCheckBox1.Checked;
  Panel4.Enabled := cxCheckBox1.Checked;
  Panel5.Enabled := cxCheckBox1.Checked;
  Panel6.Enabled := cxCheckBox1.Checked;
  Panel8.Enabled := cxCheckBox1.Checked;
  Panel9.Enabled := cxCheckBox1.Checked;
  Panel10.Enabled := cxCheckBox1.Checked;

  Button17.Enabled := cxCheckBox1.Checked;
  Button18.Enabled := cxCheckBox1.Checked;
  Button19.Enabled := cxCheckBox1.Checked;

end;


end.

