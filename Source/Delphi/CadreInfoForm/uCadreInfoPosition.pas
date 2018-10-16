unit uCadreInfoPosition;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxDBEdit, Data.DB, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  Vcl.StdCtrls, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalendar,
  Vcl.ExtCtrls;

type
  TfrmCadreInfoPosition = class(TBaseForm)
    DataSource1: TDataSource;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxDBComboBox1: TcxDBComboBox;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxDBComboBox2: TcxDBComboBox;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBComboBox3: TcxDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxDBRadioGroup1PropertiesChange(Sender: TObject);
    procedure cxDBComboBox3PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddData(ACadreId, ACadreName: string);
    procedure EditData(ASysId, ACadreName: string);
  end;

var
  frmCadreInfoPosition: TfrmCadreInfoPosition;

implementation

{$R *.dfm}

procedure TfrmCadreInfoPosition.FormCreate(Sender: TObject);
begin
  inherited;//
  InitCxComboBoxWithDicType(cxDBComboBox1, 'position');
  InitCxComboBoxWithDicType(cxDBComboBox2, 'position');
  InitCxComboBoxWithSql(cxDBComboBox3, 'select * from  organizational_structure order by order_no', 'name');
end;

procedure TfrmCadreInfoPosition.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmCadreInfoPosition.AddData(ACadreId, ACadreName: string);
begin
  Label1.Caption := ACadreName;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_position where 1=2');
  DataSource1.DataSet.Append;
  DataSource1.DataSet.FieldByName('cadre_id').AsString := ACadreId;
  DataSource1.DataSet.FieldByName('status').AsString := '1';

end;

procedure TfrmCadreInfoPosition.EditData(ASysId, ACadreName: string);
begin
  Label1.Caption := ACadreName;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info_position where sys_id = ' + QuotedStr(ASysId));
end;

procedure TfrmCadreInfoPosition.Button1Click(Sender: TObject);
begin
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  ModalResult := mrOk;
end;


procedure TfrmCadreInfoPosition.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadreInfoPosition.cxDBComboBox3PropertiesChange(Sender: TObject);
var
  LStr: TStrObj;
begin
  LStr := (cxDBComboBox3.ItemObject as TStrObj);
  if LStr <> nil then  begin
    DataSource1.DataSet.FieldByName('org_id').AsString := LStr.FStr;
  end;
end;

procedure TfrmCadreInfoPosition.cxDBRadioGroup1PropertiesChange(
  Sender: TObject);
begin
  cxGroupBox2.Visible := cxDBRadioGroup1.ItemIndex = 1;
  if cxGroupBox2.Visible then  begin
    Self.Height := Self.Height +100;
  end else  begin
    Self.Height := Self.Height -100;
  end;
end;

end.
