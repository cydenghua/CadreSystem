unit uAppointPlanEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxTextEdit, Data.DB, Vcl.StdCtrls,
  uBaseForm;

type
  TfrmAppointPlanEdit = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DataSource1: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBComboBox1: TcxDBComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddData;
    procedure EditData(ASysId: string);
  end;

var
  frmAppointPlanEdit: TfrmAppointPlanEdit;

implementation

{$R *.dfm}

procedure TfrmAppointPlanEdit.FormCreate(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmAppointPlanEdit.AddData;
begin
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from appoint_plan where 1=2');
  DataSource1.DataSet.Append;
  DataSource1.DataSet.FieldByName('create_time').AsDateTime := Now;
  DataSource1.DataSet.FieldByName('age_begin').AsDateTime := Now;
end;

procedure TfrmAppointPlanEdit.EditData(ASysId: string);
begin
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from appoint_plan where sys_id = ' + ASysId);
end;

procedure TfrmAppointPlanEdit.Button1Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := cxDBTextEdit1.Text;
  if LStr.Trim.IsEmpty then  begin
    ShowMessage('方案名称不能为空！');
    Exit;
  end;
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  ModalResult := mrOk;
end;

procedure TfrmAppointPlanEdit.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
