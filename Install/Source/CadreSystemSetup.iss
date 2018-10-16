; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

[Setup]
AppName=干部管理系统
AppVerName=v1.0
AppVersion=1.0.0.0
AppCopyright=?1998-2008 Codejock Software
DefaultDirName={pf}\CadreSystem
DefaultGroupName=CadreSystem
Compression=lzma
SolidCompression=true
WizardImageFile=compiler:Office2007.bmp
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
UninstallDisplayIcon={app}\SkinHelper.exe
OutputDir=E:\MY_WORK\PersonnelSystem\Install
OutputBaseFilename=SetupCadreSystem
VersionInfoVersion=1.0.0.3
VersionInfoCompany=Codejock Software
VersionInfoDescription=ISSkin Example Setup
VersionInfoTextVersion=1, 0, 0, 3

[Files]
; Add the ISSkin DLL used for skinning Inno Setup installations.
Source: compiler:ISSkin.dll; DestDir: {app}; Flags: dontcopy

; Add the Visual Style resource contains resources used for skinning,
; you can also use Microsoft Visual Styles (*.msstyles) resources.
Source: compiler:IsSkins\Office2007.cjstyles; DestDir: {tmp}; Flags: dontcopy


;Source: "MyProg.exe"; DestDir: "{app}"; Check: MyProgCheck; BeforeInstall: BeforeMyProgInstall('MyProg.exe'); AfterInstall: AfterMyProgInstall('MyProg.exe')
Source: "E:\MY_WORK\PersonnelSystem\Bin\CadreSystem.exe"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\MY_WORK\PersonnelSystem\Bin\Config.ini"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\MY_WORK\PersonnelSystem\Bin\ConnectionDefs.ini"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\MY_WORK\PersonnelSystem\Bin\CadreData.db"; DestDir: "{app}"; Flags: ignoreversion;
Source: "E:\MY_WORK\PersonnelSystem\Bin\CadreData.db"; DestDir: "{app}\backup"; Flags: ignoreversion;
Source: "E:\MY_WORK\PersonnelSystem\bin\frx\*"; DestDir: "{app}\frx"; Flags: ignoreversion;
Source: "E:\MY_WORK\PersonnelSystem\Install\bpl\*"; DestDir: "{app}"; Flags: ignoreversion;

[Icons]
Name: "{userdesktop}\干部管理"; Filename: "{app}\CadreSystem.exe"


; The following code block is used to load the ISS, pass in
; an empty string ('') as the second parameter to LoadSkin to use
; the Blue color scheme, this is the default color scheme for
; Office2007.cjstyles.
[Code]
// Importing LoadSkin API from ISSkin.DLL
procedure LoadSkin(lpszPath: AnsiString; lpszIniFileName: AnsiString);
external 'LoadSkin@files:isskin.dll stdcall';

// Importing UnloadSkin API from ISSkin.DLL
procedure UnloadSkin();
external 'UnloadSkin@files:isskin.dll stdcall';

// Importing ShowWindow Windows API from User32.DLL
function ShowWindow(hWnd: Integer; uType: Integer): Integer;
external 'ShowWindow@user32.dll stdcall';

function InitializeSetup(): Boolean;
begin
	ExtractTemporaryFile('Office2007.cjstyles');
	LoadSkin(AnsiString(ExpandConstant('{tmp}\Office2007.cjstyles')), '');
	Result := True;
end;

procedure DeinitializeSetup();
begin
	// Hide Window before unloading skin so user does not get
	// a glimse of an unskinned window before it is closed.
	ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	UnloadSkin();
end;
