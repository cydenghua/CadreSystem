unit uImportBase;

interface

uses
  System.SysUtils, Vcl.Forms, Winapi.Windows, comobj, Word2000, system.Variants,
  uSysDataBase;

type
  TImportBase = class(TObject)
  private
  protected
    FSysDataBase: TSysDataBase;
    FFilePth: string;
    FWordApp: TWordApplication;
    FWordDoc: TWordDocument;
    procedure LoadWordFile();
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetFilePath(APath: string);
    procedure ExecImport; virtual;
  end;

implementation

{ TImportBase }

constructor TImportBase.Create;
begin
  FSysDataBase := uSysDataBase.GetSysDataBase;

  if not Assigned(FWordApp) then
  begin
    FWordApp := TWordApplication.Create(nil);
    FWordApp.Visible := false;
  end;
  if not Assigned(FWordDoc) then
    FWordDoc := TWordDocument.Create(nil);

end;

destructor TImportBase.Destroy;
begin
  if Assigned(FWordDoc) then
  begin              // ===== 关闭文件 =====
    FWordDoc.Close;
    FWordDoc.Disconnect;
    FWordDoc.Destroy;
    FWordDoc := nil;
  end;
  if Assigned(FWordApp) then
  begin             // ===== 关闭Word =====
    FWordApp.Quit;
    FWordApp.Disconnect;
    FWordApp.Destroy;
    FWordApp := nil;
  end;
  inherited;
end;

procedure TImportBase.SetFilePath(APath: string);
begin
  FFilePth := APath;
end;

procedure TImportBase.ExecImport;
begin
end;

procedure TImportBase.LoadWordFile;
var
  DocInx, FileName, CfCversions, IsReadOnly, AddToRctFiles, PswDocument, PswTemplate, Revert, WPswDocument, WPswTemplate, FormatWord: OleVariant;
begin
  IsReadOnly := true;
  CfCversions := EmptyParam;
  AddToRctFiles := EmptyParam;
  PswDocument := EmptyParam;
  PswTemplate := EmptyParam;
  Revert := EmptyParam;
  WPswDocument := EmptyParam;
  WPswTemplate := EmptyParam;
  FormatWord := EmptyParam;
  FWordApp.Documents.open(FFilePth, CfCversions, IsReadOnly, AddToRctFiles, PswDocument, PswTemplate, Revert, WPswDocument, WPswTemplate, FormatWord, EmptyParam, EmptyParam);

  FWordDoc.ConnectTo(FWordApp.Documents.Item(1));
end;

end.

