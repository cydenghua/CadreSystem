unit uAppointPlanBatchInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls, Data.DB,
  uBaseForm;

type
  TfrmAppointPlanBatchInput = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FPlanId: string;
  public
    { Public declarations }
    procedure SetPlanId(APlanId: string);
  end;

var
  frmAppointPlanBatchInput: TfrmAppointPlanBatchInput;

implementation

{$R *.dfm}

procedure TfrmAppointPlanBatchInput.FormCreate(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmAppointPlanBatchInput.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmAppointPlanBatchInput.SetPlanId(APlanId: string);
begin
  FPlanId := APlanId;
end;

procedure TfrmAppointPlanBatchInput.Button1Click(Sender: TObject);
var
  s1, s2, s3, s4:string;
  LDataSet: TDataSet;
begin
  s1 := Trim(cxTextEdit1.Text);
  s2 := Trim(cxTextEdit2.Text);
  s3 := Trim(cxTextEdit3.Text);
  s4 := Trim(cxTextEdit4.Text);

  LDataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from appoint_plan_detail where plan_id = ' + FPlanId);
  with LDataSet  do  begin
    First;
    while not Eof do    begin
      Edit;
      if not s1.IsEmpty then FieldByName('report_unit').AsString := s1;
      if not s2.IsEmpty then FieldByName('unit_opinion').AsString := s2;
      if not s3.IsEmpty then FieldByName('opinion').AsString := s3;
      if not s4.IsEmpty then FieldByName('opinion2').AsString := s4;
      Next;
    end;
  end;

  FSysDataBase.SaveDataSet(LDataSet);
  Self.ModalResult := mrOk;
end;

procedure TfrmAppointPlanBatchInput.Button2Click(Sender: TObject);
begin
  Self.CloseModal;
end;

end.
