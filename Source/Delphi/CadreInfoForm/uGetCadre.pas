unit uGetCadre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxGroupBox, Vcl.ExtCtrls, cxListBox, Data.DB, cxDBEdit;

type

  TUser = class(TObject)
  public
    FUserName: string;
    FUserId: string;
  end;

  TfrmGetCadre = class(TBaseForm)
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    cxListBoxUnSelect: TcxListBox;
    cxListBoxSelect: TcxListBox;
    Edit1: TEdit;
    Button7: TButton;
    Button8: TButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure InitUnSelectedList;
    function MoveListItems(ASourceLst, ADestLst: TcxListBox; AMoveAll: Boolean):Boolean;
  public
    { Public declarations }
    FResList: TStringList;
  end;

var
  frmGetCadre: TfrmGetCadre;

implementation

{$R *.dfm}

procedure TfrmGetCadre.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from cadre_info order by order_no');

  cxListBoxSelect.Items.Clear;
  cxListBoxUnSelect.Items.Clear;
  InitUnSelectedList;
end;

procedure TfrmGetCadre.InitUnSelectedList;
var
  LUser: TUser;
  LIndex: Integer;
  LStr: string;
begin
  cxListBoxUnSelect.Items.Clear;
  with DataSource1.DataSet do  begin
    First;
    while not Eof do    begin
      LUser := TUser.Create;
      LUser.FUserName := FieldByName('name').AsString;
      LUser.FUserId := FieldByName('sys_id').AsString;
      LStr := LUser.FUserName + '£®' + FieldByName('sex').AsString +'£©';

      LIndex := cxListBoxSelect.Items.IndexOf(LStr);
      if LIndex > -1 then      begin
        if FieldByName('sys_id').AsString.Equals((cxListBoxSelect.Items.Objects[LIndex] as TUser).FUserId) then        begin
          Next;
          Continue;
        end;
      end;

      cxListBoxUnSelect.AddItem(LStr, LUser);

      Next;
    end;
  end;
end;

function TfrmGetCadre.MoveListItems(ASourceLst, ADestLst: TcxListBox;
  AMoveAll: Boolean): Boolean;
var
  i:Integer;
begin
  Result := True;

  if AMoveAll then
    ASourceLst.SelectAll;

  ASourceLst.InnerListBox.CopySelection(ADestLst.InnerListBox);     //œ»“∆∂Ø
  ASourceLst.DeleteSelected;                           //‘Ÿ…æ≥˝
end;

procedure TfrmGetCadre.Button1Click(Sender: TObject);
begin
  MoveListItems(cxListBoxSelect, cxListBoxUnSelect, False);
end;

procedure TfrmGetCadre.Button2Click(Sender: TObject);
begin
  MoveListItems(cxListBoxUnSelect, cxListBoxSelect, False);
end;

procedure TfrmGetCadre.Button3Click(Sender: TObject);
begin
  MoveListItems(cxListBoxSelect, cxListBoxUnSelect, True);
end;

procedure TfrmGetCadre.Button4Click(Sender: TObject);
begin
  MoveListItems(cxListBoxUnSelect, cxListBoxSelect, True);
end;

procedure TfrmGetCadre.Button6Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmGetCadre.Button7Click(Sender: TObject);
begin
  DataSource1.DataSet.Filtered := False;
  DataSource1.DataSet.Filter := '';
  DataSource1.DataSet.Filter := 'name like ''%' + Trim(Edit1.Text) +'%''';
  DataSource1.DataSet.Filtered := True;
  InitUnSelectedList;
end;

procedure TfrmGetCadre.Button8Click(Sender: TObject);
begin
  DataSource1.DataSet.Filtered := False;
  InitUnSelectedList;
end;

procedure TfrmGetCadre.Button5Click(Sender: TObject);
var
  I: Integer;
  LStr: string;
begin
  if FResList = nil then FResList := TStringList.Create;
  FResList.Clear;

  for I := 0 to cxListBoxSelect.Items.Count - 1 do  begin
    LStr := (cxListBoxSelect.Items.Objects[I] as TUser).FUserId;

    if FResList.IndexOf(LStr) < 0 then  begin
      FResList.Add(LStr);
    end;
  end;

  ModalResult := mrOk;
end;

end.
