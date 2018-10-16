unit uImportExcel;

interface
  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,  Vcl.Dialogs,
    Excel2000, Vcl.OleServer,
    cxDropDownEdit, cxGridDBTableView,
    Datasnap.DBClient,
    uSysDataBase, uCadreFun;

  type
  TImportExcel = class(TComponent)
  private
    FSysDataBase: TSysDataBase;
    FLetterStr: string;
    FClientDataSet: TClientDataSet;
    FExcelApplication: TExcelApplication;
    FExcelWorkbook: TExcelWorkbook;
    FExcelWorksheet: TExcelWorksheet;

    FBeginRow: Integer;
    FEndRow:Integer;
    FBeginCol: Integer;
    FEndCol:Integer;

  protected
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetClientDataSet(ACds: TClientDataSet);
    procedure SaveClientDataSet();
    procedure InitCombobox(ABox: TcxComboBox);
    procedure InitGridCombobox(ACol: TcxGridDBColumn);
    procedure InitClientDataSet();
    procedure AppendClientDataSet(AField, AFieldName: string);
    function  GetColIndex(AStr: string): Integer;

    procedure SetRowInfo(ABeginRow, AEndRow: Integer);
    procedure SetColInfo(ABeginCol, AEndCol: string);
    procedure ImportFromFile(AFile: string);
  end;


implementation

{ TImportExcel }

constructor TImportExcel.Create;
begin
  FLetterStr := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  FExcelApplication := TExcelApplication.Create(Self);
  FExcelWorkbook := TExcelWorkbook.Create(Self);
  FExcelWorksheet := TExcelWorksheet.Create(Self);

  FSysDataBase := uSysDataBase.GetSysDataBase;

end;

destructor TImportExcel.Destroy;
begin

  inherited;
end;

procedure TImportExcel.SaveClientDataSet;
begin
  FClientDataSet.MergeChangeLog;
  FClientDataSet.SaveToFile(ExtractFileDir(ParamStr(0)) + '\importexcel.xml');
end;

procedure TImportExcel.SetClientDataSet(ACds: TClientDataSet);
begin
  FClientDataSet := ACds;
  if FileExists(ExtractFileDir(ParamStr(0)) + '\importexcel.xml') then  begin
    FClientDataSet.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\importexcel.xml');
  end else begin
    InitClientDataSet;
  end;
end;

procedure TImportExcel.SetColInfo(ABeginCol, AEndCol: string);
begin
  FBeginCol := GetColIndex(ABeginCol);
  FEndCol := GetColIndex(AEndCol);
end;

procedure TImportExcel.SetRowInfo(ABeginRow, AEndRow: Integer);
begin
  FBeginRow := ABeginRow;
  FEndRow := AEndRow;
end;

function TImportExcel.GetColIndex(AStr: string): Integer;
var
  LStr: string;
begin
  LStr := AStr;

  if AStr.IsEmpty then  begin
    Result := -1;
    Exit;
  end;

  if AStr.Length > 1 then LStr := AStr.Chars[1];

  Result := Pos(LStr, FLetterStr);
  if AStr.Length > 1 then Result := Result + 26;

end;

procedure TImportExcel.InitClientDataSet;
begin
  if FClientDataSet.Active then FClientDataSet.Close;  
  FClientDataSet.CreateDataSet;
  //���վ�����ֶΣ� ����f*
  AppendClientDataSet('fname', '����');
  AppendClientDataSet('fsex', '�Ա�');
  AppendClientDataSet('fbirthday', '��������');
  AppendClientDataSet('fnation', '����');
  AppendClientDataSet('fnative_place', '����');
  AppendClientDataSet('fbirth_place', '������');
  AppendClientDataSet('fpolitical_status', '������ò');
  AppendClientDataSet('fparty_time', '�뵳ʱ��');
  AppendClientDataSet('fwork_time', '����ʱ��');
  AppendClientDataSet('fenter_unit_time', '���뵥λʱ��');
  AppendClientDataSet('fpresent_asg', '����ְ��');
  AppendClientDataSet('fpresent_asg_time', '����ְʱ��');
  AppendClientDataSet('ftech_title', 'רҵ����ְ��');
  AppendClientDataSet('fft_school', 'ȫ���Ʊ�ҵԺУ');
  AppendClientDataSet('fft_school2', 'ȫ����רҵ');
  AppendClientDataSet('fft_education', 'ȫ����ѧ��');
  AppendClientDataSet('fft_degree', 'ȫ����ѧλ');
  AppendClientDataSet('fie_school', '��ְ��ҵԺУ');
  AppendClientDataSet('fie_school2', '��ְרҵ');
  AppendClientDataSet('fie_education', '��ְѧ��');
  AppendClientDataSet('fie_degree', '��ְѧλ');
//  AppendClientDataSet('f1', '���ڵ�λ');
  AppendClientDataSet('fjob_level', 'ְ�񼶱�');
  AppendClientDataSet('fjob_time', '��ְ��ʱ��');
  AppendClientDataSet('fpersonnel_identity', '��Ա���');

  //table extend......
  AppendClientDataSet('fpapers_no', '���֤����');
  AppendClientDataSet('ftel_work', '�칫�绰');
  AppendClientDataSet('ftel_cell', '˽�˵绰(�ֻ�)');
  AppendClientDataSet('fadress', 'סַ');
  AppendClientDataSet('fextent1', '�Զ����ֶ�1');
  AppendClientDataSet('fextent2', '�Զ����ֶ�2');
  AppendClientDataSet('fextent3', '�Զ����ֶ�3');
  AppendClientDataSet('fextent4', '�Զ����ֶ�4');
  FClientDataSet.First;
end;

procedure TImportExcel.AppendClientDataSet(AField, AFieldName: string);
begin
  FClientDataSet.Append;
  FClientDataSet.FieldByName('db_field').AsString := AField;
  FClientDataSet.FieldByName('db_field_name').AsString := AFieldName;
  FClientDataSet.FieldByName('excel_field').AsString := '';
end;

procedure TImportExcel.InitCombobox(ABox: TcxComboBox);
var
  i: Integer;
begin
  ABox.Properties.Items.Clear;
  for i := 0 to FLetterStr.Length - 1 do  begin
    ABox.Properties.Items.Add(FLetterStr.Chars[i]);
  end;
  for i := 0 to FLetterStr.Length - 1 do  begin
    ABox.Properties.Items.Add('A' + FLetterStr.Chars[i]);
  end;
end;

procedure TImportExcel.InitGridCombobox(ACol: TcxGridDBColumn);
var
  i: Integer;
begin
  (ACol.Properties as TcxComboBoxProperties).Items.Clear;
  for i := 0 to FLetterStr.Length - 1 do  begin
    (ACol.Properties as TcxComboBoxProperties).Items.Add(FLetterStr.Chars[i]);
  end;
  for i := 0 to FLetterStr.Length - 1 do  begin
    (ACol.Properties as TcxComboBoxProperties).Items.Add('A' + FLetterStr.Chars[i]);
  end;
end;

procedure TImportExcel.ImportFromFile(AFile: string);
var
  i, LMaxOrderNo: Integer;
  LStr, LSql, LSysId: string;

  LIndexname: Integer;
  LIndexsex: Integer;
  LIndexbirthday: Integer;
  LIndexnation: Integer;
  LIndexnative_place: Integer;
  LIndexbirth_place: Integer;
  LIndexpolitical_status: Integer;
  LIndexparty_time: Integer;
  LIndexwork_time: Integer;
  LIndexenter_unit_time: Integer;
  LIndexpresent_asg: Integer;
  LIndexpresent_asg_time: Integer;
  LIndextech_title: Integer;
  LIndexft_school: Integer;
  LIndexft_school2: Integer;
  LIndexft_education: Integer;
  LIndexft_degree: Integer;
  LIndexie_school: Integer;
  LIndexie_school2: Integer;
  LIndexie_education: Integer;
  LIndexie_degree: Integer;
  LIndexjob_level: Integer;
  LIndexjob_time: Integer;
  LIndexpersonnel_identity: Integer;
  LIndexpapers_no: Integer;
  LIndextel_work: Integer;
  LIndextel_cell: Integer;
  LIndexadress: Integer;
  LIndexextent1: Integer;
  LIndexextent2: Integer;
  LIndexextent3: Integer;
  LIndexextent4: Integer;

  function _GetItemStr(i, j: Integer):string;
  begin
    if j<0 then    begin
      Result := '';
    end else
    begin
      Result := FExcelWorksheet.Cells.Item[i, j];
    end;
  end;
  function _GetDateStr(AStr: string):string;
  begin
    if StrToDateDef(AStr, StrToDate('1900-9-9')) = StrToDate('1900-9-9') then   begin
      Result := '';
    end else    begin
      Result := AStr;
    end;
  end;
begin
  if not FileExists(AFile) then  begin
    ShowMessage('û���ҵ��ļ���');
    Exit;
  end;

  FExcelApplication.Connect; //����ExcelӦ�ó���
  FExcelApplication.Visible[0] := False;
  FExcelApplication.WorkBooks.Open(AFile, EmptyParam, EmptyParam,EmptyParam,
  EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0); //���ļ�

//  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
//  ExcelWorksheet1.ConnectTo(ExcelWorkbook1.ActiveSheet as _Worksheet);
  FExcelWorkbook.ConnectTo(FExcelApplication.Workbooks.Item[0]);
  FExcelWorksheet.ConnectTo(FExcelWorkbook.Sheets.Item[1] as _Worksheet);

  FClientDataSet.First;
  while not FClientDataSet.Eof do  begin
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fname') then LIndexName := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fsex') then LIndexSex := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fbirthday') then LIndexbirthday := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fnation') then LIndexnation := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fnative_place') then LIndexnative_place := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fbirth_place') then LIndexbirth_place := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fpolitical_status') then LIndexpolitical_status := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fparty_time') then LIndexparty_time := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fwork_time') then LIndexwork_time := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fenter_unit_time') then LIndexenter_unit_time := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fpresent_asg') then LIndexpresent_asg := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fpresent_asg_time') then LIndexpresent_asg_time := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('ftech_title') then LIndextech_title := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fft_school') then LIndexft_school := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fft_school2') then LIndexft_school2 := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fft_education') then LIndexft_education := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fft_degree') then LIndexft_degree := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fie_school') then LIndexie_school := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fie_school2') then LIndexie_school2 := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fie_education') then LIndexie_education := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fie_degree') then LIndexie_degree := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fjob_level') then LIndexjob_level := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fjob_time') then LIndexjob_time := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fpersonnel_identity') then LIndexpersonnel_identity := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fpapers_no') then LIndexpapers_no := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('ftel_work') then LIndextel_work := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('ftel_cell') then LIndextel_cell := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fadress') then LIndexadress := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fextent1') then LIndexextent1 := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fextent2') then LIndexextent2 := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fextent3') then LIndexextent3 := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);
    if FClientDataSet.FieldByName('db_field').AsString.Equals('fextent4') then LIndexextent4 := GetColIndex(FClientDataSet.FieldByName('excel_field').AsString);

    FClientDataSet.Next;
  end;

  for i := FBeginRow to FEndRow do    begin
    LStr := FExcelWorksheet.Cells.Item[i, LIndexname]; //get name
    if LStr.Trim.IsEmpty then    begin //����Ϊ�գ� ������
      Continue;
    end;

    LMaxOrderNo := FSysDataBase.GetFieldMaxValue('cadre_info', 'order_no') + 1;
    LSysId := FSysDataBase.GetStrGUID;
    LSql := 'insert into cadre_info(sys_id, order_no, name, sex, birthday, nation, native_place, birth_place, '+
            'political_status, party_time, work_time, enter_unit_time, present_asg, present_asg_time, tech_title, ' +
            'ft_school, ft_education, ft_degree, ie_school, ie_education, ie_degree, job_level, job_time, personnel_identity)'+
            'values(''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')';
    LSql := Format(LSql, [LSysId, LMaxOrderNo,
                          _GetItemStr(i, LIndexname),
                          _GetItemStr(i, LIndexsex),
                          _GetDateStr(_GetItemStr(i, LIndexbirthday)),
                          _GetItemStr(i, LIndexnation),
                          _GetItemStr(i, LIndexnative_place),
                          _GetItemStr(i, LIndexbirth_place),
                          _GetItemStr(i, LIndexpolitical_status),
                          _GetDateStr(_GetItemStr(i, LIndexparty_time)),
                          _GetDateStr(_GetItemStr(i, LIndexwork_time)),
                          _GetDateStr(_GetItemStr(i, LIndexenter_unit_time)),
                          _GetItemStr(i, LIndexpresent_asg),
                          _GetDateStr(_GetItemStr(i, LIndexpresent_asg_time)),
                          _GetItemStr(i, LIndextech_title),
                          _GetItemStr(i, LIndexft_school)+_GetItemStr(i, LIndexft_school2),
                          _GetItemStr(i, LIndexft_education),
                          _GetItemStr(i, LIndexft_degree),
                          _GetItemStr(i, LIndexie_school)+_GetItemStr(i, LIndexie_school2),
                          _GetItemStr(i, LIndexie_education),
                          _GetItemStr(i, LIndexie_degree),
                          _GetItemStr(i, LIndexjob_level),
                          _GetDateStr(_GetItemStr(i, LIndexjob_time)),
                          _GetItemStr(i, LIndexpersonnel_identity)
                        ]);
    FSysDataBase.ExecSQL(LSql);

    LSql := 'insert into cadre_info_extend(sys_id, tel_work, tel_cell, adress, extent1, extent2, extent3, extent4)' +
            ' values(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')';
    LSql := Format(LSql, [LSysId,
                          _GetItemStr(i, LIndextel_work),
                          _GetItemStr(i, LIndextel_cell),
                          _GetItemStr(i, LIndexadress),
                          _GetItemStr(i, LIndexextent1),
                          _GetItemStr(i, LIndexextent2),
                          _GetItemStr(i, LIndexextent3),
                          _GetItemStr(i, LIndexextent4)
                        ]);
    FSysDataBase.ExecSQL(LSql);

    uCadreFun.GetCadreFun.CreateNewCadre(LSysId);

  end;

end;

end.
