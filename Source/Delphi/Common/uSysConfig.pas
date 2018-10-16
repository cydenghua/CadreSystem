unit uSysConfig;

interface

uses
  Classes, SysUtils, IniFiles, Forms, Windows;

const
  csSystemSection = 'system';
  csSkinSection = 'skin';

  {Section: system}
  csSystemName = 'sys_name';
  csSystemTime = 'sys_time';

  {Section: skin}
  csSkinName = 'skin_name';

type
  TSysConfig = class(TObject)
  private
    {Section: system}
    FSystemName: string;
    FSystemTime: Integer;

    {Section: skin}
    FSkinName: string;

    FConfigFilePath: string;
    constructor Create;
    destructor Destroy; override;
  public
    procedure LoadSettings(Ini: TIniFile);
    procedure SaveSettings(Ini: TIniFile);

    procedure LoadFromFile;
    procedure SaveToFile;

    {Section: system}
    property SystemName: string read FSystemName write FSystemName;
    property SystemTime: Integer read FSystemTime write FSystemTime;

    {Section: skin}
    property SkinName: string read FSkinName write FSkinName;
  end;

var
  SysConfig: TSysConfig = nil;

implementation

procedure TSysConfig.LoadSettings(Ini: TIniFile);
begin
  if Ini <> nil then  begin
    {Section: system}
    FSystemName := Ini.ReadString(csSystemSection, csSystemName, '�ɲ�����ϵͳ');
    FSystemTime := Ini.ReadInteger(csSystemSection, csSystemTime, 3);

    {Section: skin}
    FSkinName := Ini.ReadString(csSkinSection, csSkinName, 'Springtime');
  end;
end;

procedure TSysConfig.SaveSettings(Ini: TIniFile);
begin
  if Ini <> nil then  begin
    {Section: system}
    Ini.WriteString(csSystemSection, csSystemName, FSystemName);
    Ini.WriteInteger(csSystemSection, csSystemTime, FSystemTime);

    {Section: skin}
    Ini.WriteString(csSkinSection, csSkinName, FSkinName);
  end;
end;

constructor TSysConfig.Create;
begin
  {system}
  FSystemName := '�ɲ�����ϵͳ';
  FSystemTime := 0;

  {skin}
  FSkinName := 'Valentine';

//////////////////////////////////////////////////////
  FConfigFilePath := GetCurrentDir + '\Config.ini';
  if FileExists(FConfigFilePath) then  begin
    LoadFromFile;
  end  else  begin
    SaveToFile;
  end;
end;

destructor TSysConfig.Destroy;
begin

  inherited;
end;

procedure TSysConfig.LoadFromFile;
var
  Ini: TIniFile;
begin
  if FileExists(FConfigFilePath) then  begin
    Ini := TIniFile.Create(FConfigFilePath);
    try
      LoadSettings(Ini);
    finally
      Ini.Free;
    end;
  end;
end;

procedure TSysConfig.SaveToFile;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FConfigFilePath);
  try
    SaveSettings(Ini);
  finally
    Ini.Free;
  end;
end;

initialization
  SysConfig := TSysConfig.Create;

finalization
  SysConfig.Free;

end.


