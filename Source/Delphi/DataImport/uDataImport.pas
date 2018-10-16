unit uDataImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.ExtCtrls, Vcl.FileCtrl, uBaseForm, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Datasnap.DBClient,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxSpinEdit, dxGDIPlusClasses,
  uImportExcel;

type


  TfrmDataImport = class(TBaseForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxRadioGroup1: TcxRadioGroup;
    Label1: TLabel;
    cxComboBox1: TcxComboBox;
    cxRadioGroup2: TcxRadioGroup;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    Edit3: TEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1db_field_name: TcxGridDBColumn;
    cxGrid1DBTableView1excel_field: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1db_field: TStringField;
    ClientDataSet1db_field_name: TStringField;
    ClientDataSet1excel_field: TStringField;
    DataSource1: TDataSource;
    Button2: TButton;
    Button3: TButton;
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FImportExcel: TImportExcel;
    function Searchfile(path: string): TStringList;
    procedure ImportWordRM(AFileList: TStringList); overload;
    procedure ImportWordRM(AFile: string); overload;
  public
    { Public declarations }
  end;

var
  frmDataImport: TfrmDataImport;

implementation

{$R *.dfm}

uses uImportWordRM, uFProgress;

procedure TfrmDataImport.FormCreate(Sender: TObject);
begin
  inherited;
  InitCxComboBoxWithSql(cxComboBox1, 'select * from organizational_structure', 'name');

  //import execl
  FImportExcel := TImportExcel.Create;
  FImportExcel.InitGridCombobox(cxGrid1DBTableView1excel_field);
  FImportExcel.SetClientDataSet(ClientDataSet1);
end;

procedure TfrmDataImport.Button1Click(Sender: TObject);
var
    strDirectory:String;
begin
  if cxRadioGroup1.ItemIndex = 1 then  begin
    SelectDirectory('', '', strDirectory);
    Edit1.Text := strDirectory;
  end else  begin
    if OpenDialog1.Execute then    begin
      Edit1.Text := OpenDialog1.FileName;
    end;
  end;
end;

procedure TfrmDataImport.Button2Click(Sender: TObject);
var
  LImport: TImportRM;
begin
  if cxRadioGroup1.ItemIndex = 1 then        begin
    ImportWordRM(Searchfile(Edit1.Text));
  end else      begin
    ImportWordRM(Edit1.Text);
  end;
end;

procedure TfrmDataImport.Button3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmDataImport.cxRadioGroup1PropertiesChange(Sender: TObject);
begin
  if cxRadioGroup1.ItemIndex = 1 then  begin
    Label2.Caption := '文件目录：';
  end else  begin
    Label2.Caption := '文件路径：';
  end;
end;

function TfrmDataImport.Searchfile(path: string): TStringList;
var
  SearchRec: TSearchRec;
  found: integer;
begin
  Result := TStringList.Create;
  found := FindFirst(path + '\' + '*.*', faAnyFile, SearchRec);
  while found = 0 do
  begin
    if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
      (SearchRec.Attr <> faDirectory)
      and ExtractFileExt(SearchRec.Name).Contains('doc') then
      Result.Add(path + '\' + SearchRec.Name);
    found := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
end;

procedure TfrmDataImport.ImportWordRM(AFileList: TStringList);
var
  LIndex: Integer;
begin
  for LIndex := 0 to AFileList.Count-1 do begin
    ImportWordRM(AFileList.Strings[LIndex]);
  end;
end;

procedure TfrmDataImport.ImportWordRM(AFile: string);
var
  LImport: TImportRM;
begin
  ShowProgress(Self, '开始导入...');
  try
    LImport := TImportRM.Create;
    try
      LImport.SetFilePath(AFile);
      if cxRadioGroup2.ItemIndex = 1 then        begin
        LImport.SetRewriteType(tNameBirthday);
      end else      begin
        LImport.SetRewriteType(tName);
      end;
      LImport.ExecImport;
    finally
      LImport.Free;
    end;
  finally
    HideProgress;
  end;
end;

/////////////////////////  Excel格式_干部表  begin /////////////////////////////
procedure TfrmDataImport.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then  begin
    Edit2.Text := OpenDialog1.FileName;
  end;
end;


procedure TfrmDataImport.Button5Click(Sender: TObject);
begin
  FImportExcel.SetRowInfo(cxSpinEdit1.Value, cxSpinEdit2.Value);
  FImportExcel.ImportFromFile(Edit2.Text);
  Button7.Click;
end;

procedure TfrmDataImport.Button7Click(Sender: TObject);
begin
  FImportExcel.SaveClientDataSet;
end;

procedure TfrmDataImport.Button8Click(Sender: TObject);
begin
  FImportExcel.InitClientDataSet;
end;

/////////////////////////  Excel格式_干部表  end   /////////////////////////////

end.
