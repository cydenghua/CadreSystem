program CadreSystem;

uses
  Vcl.Forms,
  uMainForm in '..\MainForm\uMainForm.pas' {frmMainForm},
  uEncrypt in '..\Common\uEncrypt.pas',
  uSysConfig in '..\Common\uSysConfig.pas',
  uSysDataBase in '..\Common\uSysDataBase.pas',
  uSysUser in '..\Common\uSysUser.pas',
  uBaseForm in '..\FrameWork\uBaseForm.pas',
  uCommonBaseForm in '..\FrameWork\uCommonBaseForm.pas',
  uDialogBaseForm in '..\FrameWork\uDialogBaseForm.pas',
  uAlterPassWord in '..\LoginForm\uAlterPassWord.pas' {frmAlterPassWord},
  uLoginDialog in '..\LoginForm\uLoginDialog.pas' {frmLoginDialog},
  uSqlExec in '..\Public\uSqlExec.pas' {frmSqlExec},
  uCadreInfo in '..\CadreInfoForm\uCadreInfo.pas' {frmCadreInfo},
  uDataImport in '..\DataImport\uDataImport.pas' {frmDataImport},
  uImportBase in '..\DataImport\uImportBase.pas',
  uImportWordRM in '..\DataImport\uImportWordRM.pas',
  uFProgress in '..\Public\uFProgress.pas' {FProgress},
  uOrgStructureForm in '..\OrgStructureForm\uOrgStructureForm.pas' {frmOrgStructure},
  uImportExcel in '..\DataImport\uImportExcel.pas',
  uGridSetting in '..\SystemSetting\uGridSetting.pas' {frmGridSetting},
  uCadreFun in '..\Public\uCadreFun.pas',
  uDicOrg in '..\OrgStructureForm\uDicOrg.pas' {frmDicOrg},
  uDicBase in '..\SystemSetting\uDicBase.pas' {frmDicBase},
  uGetCadre in '..\CadreInfoForm\uGetCadre.pas' {frmGetCadre},
  uCadreInfoPosition in '..\CadreInfoForm\uCadreInfoPosition.pas' {frmCadreInfoPosition},
  uAppointPlanEdit in '..\AppointPlan\uAppointPlanEdit.pas' {frmAppointPlanEdit},
  uAppointPlanDetail in '..\AppointPlan\uAppointPlanDetail.pas' {frmAppointPlanDetail},
  uListCadreDetail in '..\ListCadre\uListCadreDetail.pas' {frmListCadreDetail},
  uListCadreEdit in '..\ListCadre\uListCadreEdit.pas' {frmListCadreEdit},
  uTrainCadreEdit in '..\TrainCadre\uTrainCadreEdit.pas' {frmTrainCadreEdit},
  uTrainCadreSetting in '..\TrainCadre\uTrainCadreSetting.pas' {frmTrainCadreSetting},
  uTrainCadreDetail in '..\TrainCadre\uTrainCadreDetail.pas' {frmTrainCadreDetail},
  uAppointPlanDetailEdit in '..\AppointPlan\uAppointPlanDetailEdit.pas' {frmAppointPlanDetailEdit},
  uAppointPlanBatchInput in '..\AppointPlan\uAppointPlanBatchInput.pas' {frmAppointPlanBatchInput},
  uAppointExec in '..\AppointPlan\uAppointExec.pas' {frmAppointExec};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '干部管理系统';

//  begin longin
//  frmLoginDialog := TfrmLoginDialog.Create(Application);
//  frmLoginDialog.ShowModal;
//  if frmLoginDialog.ModalResult <> 1 then  begin
//    uSysDataBase.GetSysDataBase.Free;
//  end else begin
//    Application.CreateForm(TfrmMainForm, frmMainForm);
//  end;
    Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
