unit uSqlExec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, uBaseForm, Vcl.ExtCtrls, System.StrUtils;

type
  TfrmSqlExec = class(TBaseForm)
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSqlExec: TfrmSqlExec;

implementation

{$R *.dfm}

procedure TfrmSqlExec.FormCreate(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmSqlExec.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmSqlExec.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  if Trim(Memo1.Text) = EmptyStr then Exit;
  try
    DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, Memo1.Text);

    for I := 0 to DBGrid1.Columns.Count-1 do
    if DBGrid1.Columns[I].Width > 100 then
    DBGrid1.Columns[I].Width := 100;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TfrmSqlExec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


end.
