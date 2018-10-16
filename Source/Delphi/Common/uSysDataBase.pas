unit uSysDataBase;

interface

uses
  Classes, SysUtils, System.Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.DApt,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite;

type
  TSysDataBase = class(TComponent)
  private
    { Private declarations }
    FDManager: TFDManager;
    FDConnection: TFDConnection;
    FDMoniFlatFileClientLink: TFDMoniFlatFileClientLink;

    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDSQLiteBackup: TFDSQLiteBackup;

    constructor Create; virtual;
    destructor Destroy; override;
  public
    { Public declarations }

    function GetStrGUID():string;
    function ExecSQL(const ASql: string):Integer;
    function ExecSQLScalar(const ASQL: String): Variant;
    function GetDataSetBySql(const ASql: string): TDataSet; overload;
    function GetDataSetBySql(AOwner: TComponent; const ASql: string): TDataSet; overload;
    function GetMaxSysId(const ADefinition:string; const AStep: Integer = 1):Integer;
    function GetFieldMaxValue(const ATableName:string; const AFieldName: string):Integer;
    function GetFieldMaxValueWhere(const ATableName:string; const AFieldName: string; const AWhere: string):Integer;
    function GetSysDateTime:TDateTime;

    procedure SaveDataSet(ADataSet: TDataSet);
    procedure RefreshDataSet(ADataSet: TDataSet);
    function DataIsExists(ASql: string):Boolean;
    procedure CopyDataSet(ASouce, ADest: TDataSet; AFilterField: string);
    procedure MoveData(ADataSet: TDataSet; AOrientation: string);
    procedure MoveDown(ADataSet: TDataSet);
    procedure MoveUp(ADataSet: TDataSet);

  end;

var
  g_SysDataBase: TSysDataBase;
  function GetSysDataBase:TSysDataBase;

implementation

  function GetSysDataBase:TSysDataBase;
  begin
    if not Assigned(g_SysDataBase) then
      g_SysDataBase := TSysDataBase.Create;
    Result := g_SysDataBase;
  end;

{ TSysDataBase }

constructor TSysDataBase.Create;
var
  oParams: TStrings;
begin
//  if not FileExists('ConnectionDefs.ini') then  begin
//    raise Exception.Create('Err48: not found ConnectionDefs file.');
//  end;
//
//  FDManager := TFDManager.Create(Self);
//  FDManager.ConnectionDefFileAutoLoad := False;
//  FDManager.ConnectionDefFileName := 'ConnectionDefs.ini';
//  FDManager.LoadConnectionDefFile;
//
//  FDConnection := TFDConnection.Create(Self);
//  FDConnection.ConnectionDefName := 'db_cadre';
//  FDConnection.Connected := True;

  FDPhysSQLiteDriverLink := TFDPhysSQLiteDriverLink.Create(Self);
  FDSQLiteBackup := TFDSQLiteBackup.Create(Self);

  FDManager := TFDManager.Create(Self);
  FDManager.ConnectionDefFileAutoLoad := False;

  FDMoniFlatFileClientLink := TFDMoniFlatFileClientLink.Create(Self);
  FDMoniFlatFileClientLink.FileName := ExtractFilePath(ParamStr(0)) + 'sqllog.txt';
  FDMoniFlatFileClientLink.Tracing := True;

  oParams := TStringList.Create;
  oParams.Add('DriverID=SQLite');
  oParams.Add('Database=CadreData.db');
  oParams.Add('LockingMode=Normal');
  oParams.Add('StringFormat=Unicode');
  oParams.Add('MonitorBy=FlatFile');
  oParams.Add('Pooled=True');
  oParams.Add('PoolMaximumItems=10');
//  oParams.Add('Password=game1999');
  FDManager.AddConnectionDef('cadre_db', 'SQLite', oParams);

  FDConnection := TFDConnection.Create(Self);
  FDConnection.ConnectionDefName := 'cadre_db';
  FDConnection.Connected := True;

  FDConnection.ConnectionIntf.Tracing := False;
  FDConnection.ConnectionIntf.Tracing := True;
end;

destructor TSysDataBase.Destroy;
begin
//  FDConnection.Connected := True;
  inherited;
end;

function TSysDataBase.GetStrGUID: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;


function TSysDataBase.ExecSQL(const ASql: string): Integer;
begin
  Result := FDConnection.ExecSQL(ASql);
end;

function TSysDataBase.ExecSQLScalar(const ASQL: String): Variant;
begin
  Result := FDConnection.ExecSQLScalar(ASQL);
end;

function TSysDataBase.GetDataSetBySql(AOwner: TComponent; const ASql: string): TDataSet;
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(AOwner);
  try
    LQuery.CachedUpdates := True;
    LQuery.Connection := FDConnection;
    LQuery.Open(ASql);
    Result := LQuery;
  except
  end;
end;

procedure TSysDataBase.SaveDataSet(ADataSet: TDataSet);
var
  LQuery: TFDQuery;
  LErrors: Integer;
begin
  LQuery := ADataSet as TFDQuery;
  if LQuery.State in [dsEdit, dsInsert] then LQuery.Post;

  FDConnection.StartTransaction;
  LErrors := LQuery.ApplyUpdates;

  if LErrors = 0 then  begin
    LQuery.CommitUpdates;
    FDConnection.Commit;
  end else
  begin
    FDConnection.Rollback;
  end;
end;

procedure TSysDataBase.RefreshDataSet(ADataSet: TDataSet);
var
  LQuery: TFDQuery;
begin
  LQuery := ADataSet as TFDQuery;
  LQuery.CancelUpdates;
  LQuery.Refresh;
end;

function TSysDataBase.GetDataSetBySql(const ASql: string): TDataSet;
begin
  Result := GetDataSetBySql(nil, ASql);
end;

function TSysDataBase.GetFieldMaxValue(const ATableName: string; const AFieldName: string): Integer;
begin
  Result := GetFieldMaxValueWhere(ATableName, AFieldName, '');
end;

function TSysDataBase.GetFieldMaxValueWhere(const ATableName, AFieldName,
  AWhere: string): Integer;
var
  LSql: string;
  LVar: Variant;
begin
  LSql := 'select max(cast(' + AFieldName + ' as int)) from ' + ATableName;
  if not AWhere.IsEmpty then  begin
    LSql := LSql + ' where ' + AWhere;
  end;
  LVar := ExecSQLScalar(LSql);

  if LVar = Null then  begin //如果不存在记录
    Result := 0;
  end else  begin
    Result := LVar;
  end;
end;

function TSysDataBase.GetMaxSysId(const ADefinition: string;
  const AStep: Integer): Integer;
var
  LSql: string;
  LVar: Variant;
begin
  LSql := 'select curr_id from sys_id_generator ' + #10
        + 'where definition = ''%s''';
  LVar := ExecSQLScalar(LSql);

  if LVar = Null then  begin //如果不存在记录
    LSql := 'insert into sys_id_generator(definition, curr_id, description) ' + #10
          + 'values(''%s'', 1000, ''%s_sysid'')';  //id全部从1000开始
    LSql := Format(LSql, [ADefinition, ADefinition]);
    ExecSQL(LSql);
  end;

  LSql := 'update sys_id_generator set curr_id = curr_id + %d' + #10
        + 'where definition = ''%s''';
  LSql := Format(LSql, [AStep, ADefinition]);
  if ExecSQL(LSql) = 1 then   begin       //更新成功， 获取数据
    LSql := 'select curr_id from sys_id_generator ' + #10
          + 'where definition = ''%s''';
    LSql := Format(LSql, [ADefinition]);
    Result := ExecSQLScalar(LSql);
  end;
end;

function TSysDataBase.GetSysDateTime: TDateTime;
begin
  Result := FDConnection.ExecSQLScalar('select getdate() as res');//Self.GetDataSetBySql('select getdate() as res').Fields[0].AsDateTime;
end;

function TSysDataBase.DataIsExists(ASql: string): Boolean;
begin
  with GetDataSetBySql(ASql) do  begin
    Result := not IsEmpty;
    Free;
  end;
end;

procedure TSysDataBase.CopyDataSet(ASouce, ADest: TDataSet;
  AFilterField: string);
var
  I: Integer;
  LStr: string;
begin
  for I := 0 to ADest.FieldCount-1 do  begin
    LStr := ADest.FieldDefList[I].Name;
    if AFilterField.Contains(QuotedStr(LStr)) then Continue;
    if ASouce.FindField(LStr) <> nil   then    begin
      ADest.Edit;
      ADest.FindField(LStr).Value := ASouce.FindField(LStr).Value;
    end;
  end;
end;

procedure TSysDataBase.MoveData(ADataSet: TDataSet; AOrientation: string);
var
  LOrderCurr, LOrderDown, LOrderTmp: string;
begin//
  if ADataSet.IsEmpty then Exit;
  LOrderTmp := '-999';

  LOrderCurr := ADataSet.FieldByName('order_no').AsString;

  if AOrientation.Equals('down') then  begin
    ADataSet.Next;
  end;
  if AOrientation.Equals('up') then  begin
    ADataSet.Prior;
  end;

  LOrderDown  := ADataSet.FieldByName('order_no').AsString;
  if LOrderCurr.Equals(LOrderDown) then Exit;

  if ADataSet.Locate('order_no', LOrderCurr, []) then begin
    ADataSet.Edit;
    ADataSet.FieldByName('order_no').AsString := LOrderTmp;
    ADataSet.Post;
  end;
  if ADataSet.Locate('order_no', LOrderDown, []) then begin
    ADataSet.Edit;
    ADataSet.FieldByName('order_no').AsString := LOrderCurr;
    ADataSet.Post;
  end;
  if ADataSet.Locate('order_no', LOrderTmp, []) then begin
    ADataSet.Edit;
    ADataSet.FieldByName('order_no').AsString := LOrderDown;
    ADataSet.Post;
  end;

  (ADataSet as TFDQuery).IndexFieldNames:= 'order_no';
  (ADataSet as TFDQuery).IndexesActive := True;
end;

procedure TSysDataBase.MoveDown(ADataSet: TDataSet);
begin//
  MoveData(ADataSet, 'down');
end;


procedure TSysDataBase.MoveUp(ADataSet: TDataSet);
begin
  MoveData(ADataSet, 'up');
end;

initialization
  g_SysDataBase := nil;
end.
