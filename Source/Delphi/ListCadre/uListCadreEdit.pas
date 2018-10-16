unit uListCadreEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.DateUtils,  uBaseForm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit, cxMaskEdit,
  cxSpinEdit, cxTextEdit, Vcl.StdCtrls, dxGDIPlusClasses, cxImage, Data.DB;

type
  TfrmListCadreEdit = class(TBaseForm)
    DataSource1: TDataSource;
    cxImage1: TcxImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FListId: string;
  public
    { Public declarations }
    procedure ShowData(AListId: string);
    procedure AddData;
  end;

var
  frmListCadreEdit: TfrmListCadreEdit;

implementation

{$R *.dfm}

procedure TfrmListCadreEdit.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre where 1=2');
end;

procedure TfrmListCadreEdit.ShowData(AListId: string);
begin
  FListId := AListId;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from list_cadre where sys_id = ' + QuotedStr(AListId));
end;

procedure TfrmListCadreEdit.AddData;
begin
  DataSource1.DataSet.Append;
  DataSource1.DataSet.FieldByName('create_time').AsDateTime := Now;
  DataSource1.DataSet.FieldByName('filing_time').AsInteger := YearOf(Now);
  DataSource1.DataSet.FieldByName('list_type').AsInteger := 1;
end;

procedure TfrmListCadreEdit.Button1Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := cxDBTextEdit1.Text;
  if LStr.Trim.IsEmpty then  begin
    ShowMessage('名册名称不能为空！');
    Exit;
  end;
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
  ModalResult := mrOk;
end;

procedure TfrmListCadreEdit.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
