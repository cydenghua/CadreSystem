unit uTrainCadreEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.DateUtils,
  uBaseForm,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxGroupBox,
  cxRadioGroup, cxMemo, cxSpinEdit, cxDropDownEdit, cxCalendar, cxMaskEdit,
  Data.DB;

type
  TfrmTrainCadreEdit = class(TBaseForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxDBComboBox1: TcxDBComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBComboBox2: TcxDBComboBox;
    cxDBComboBox3: TcxDBComboBox;
    cxDBMemo1: TcxDBMemo;
    cxDBMemo2: TcxDBMemo;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxDBDateEdit2PropertiesChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FTrainId: string;
  public
    { Public declarations }
    procedure ShowData(ATrainId: string);
    procedure AddData;
  end;

var
  frmTrainCadreEdit: TfrmTrainCadreEdit;

implementation

{$R *.dfm}

uses uTrainCadreSetting;

procedure TfrmTrainCadreEdit.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from train_cadre where 1=3');
  InitCxComboBoxWithDicType(cxDBComboBox1, 'train_type');
//  InitCxComboBoxWithDicType(cxDBComboBox2, 'train_org');
  InitCxComboBoxWithDicType(cxDBComboBox3, 'train_mode');
  InitCxComboBoxWithSql(cxDBComboBox2, 'SELECT * FROM train_org where deleted <> 1 order by sys_id', 'name');
end;

procedure TfrmTrainCadreEdit.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmTrainCadreEdit.AddData;
begin
  DataSource1.DataSet.Append;
  DataSource1.DataSet.FieldByName('create_time').AsDateTime := Now;
end;

procedure TfrmTrainCadreEdit.ShowData(ATrainId: string);
begin
  FTrainId := ATrainId;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from train_cadre where sys_id = ' + QuotedStr(FTrainId));
end;

procedure TfrmTrainCadreEdit.cxDBDateEdit2PropertiesChange(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsEdit, dsInsert] then
    DataSource1.DataSet.FieldByName('days').AsInteger := Trunc(DaySpan(cxDBDateEdit1.Date, cxDBDateEdit2.Date)) + 1;
end;

procedure TfrmTrainCadreEdit.Button1Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := cxDBTextEdit1.Text;
  if LStr.Trim.IsEmpty then  begin
    ShowMessage('培训名称不能为空！');
    Exit;
  end;
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  ModalResult := mrOk;
end;

procedure TfrmTrainCadreEdit.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrainCadreEdit.Button3Click(Sender: TObject);
begin
  if Assigned(frmTrainCadreSetting) then  begin
    frmTrainCadreSetting.Free;
  end;
  frmTrainCadreSetting := TfrmTrainCadreSetting.Create(Self);
  frmTrainCadreSetting.ShowModal;
end;

end.
