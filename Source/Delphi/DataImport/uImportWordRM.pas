unit uImportWordRM;

interface

uses
  Word2000, Data.DB, System.SysUtils, System.StrUtils, System.Classes,
  Vcl.ExtCtrls, Vcl.Clipbrd, Vcl.Forms,
  uImportBase, uCadreFun;

type

  TRewirteType = (tName, tNameBirthday);

  TImportRM = class(TImportBase)
  private
    FImage: TImage;
    FRewriteType: TRewirteType;
    function IsTime(AStr: string): Boolean;
    function DocStrToDate(AStr: string): TDateTime;
  protected

  public
    constructor Create;
    destructor Destroy; override;
    procedure SetRewriteType(AType: TRewirteType);
    procedure ExecImport; override;
  end;

implementation

{ TImportRM }

uses uFProgress;

constructor TImportRM.Create;
begin
  inherited Create;
  FImage := TImage.Create(nil);
  FRewriteType := tNameBirthday;
end;

destructor TImportRM.Destroy;
begin
  FImage.Free;
  inherited;
end;

procedure TImportRM.ExecImport;
var
  LCadreIndex, LTableIndex, LCadreCount, LMaxOrderNo, i: Integer;
  LCell: Cell;
  LData: TDataSet;
  LStrs: TStrings;
  LBirthDay: TDate;
  LSysId, LStrTime, LStrContent, s: string;
begin
  inherited;
  LStrs := TStringList.Create;
  LoadWordFile;
  LMaxOrderNo := FSysDataBase.GetFieldMaxValue('cadre_info', 'order_no');
  LCadreCount := FWordDoc.Tables.Count div 2;
  for LCadreIndex := 1 to LCadreCount do    begin
    LSysId := FSysDataBase.GetStrGUID;
    UpdateProgress('正在导入第 ' + IntToStr(LCadreIndex) + ' 个档案， 总计 ' + IntToStr(LCadreCount) + ' 个');
    LTableIndex := LCadreIndex*2-1;
    LStrContent := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(2).Range.Text);
    LStrContent := LStrContent.Replace(' ', '');
    LStrTime := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(6).Range.Text);;
    LBirthDay := DocStrToDate(LStrTime);
    if FRewriteType = tName then    begin
      s := 'select * from cadre_info where name = ' + QuotedStr(LStrContent);
    end else    begin
      s := 'select * from cadre_info where name = ' + QuotedStr(LStrContent) + ' and birthday = ' + QuotedStr(DateToStr(LBirthDay));
    end;
    //基本信息
    LData := FSysDataBase.GetDataSetBySql(s);
    with LData do    begin
      if FieldByName('sys_id').AsString.IsEmpty then    begin
        Append;
        FieldByName('sys_id').AsString := LSysId;
      end else      begin
        Edit;
        LSysId := FieldByName('sys_id').AsString;
      end;
      FieldByName('name').AsString                 := LStrContent;//Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(2).Range.Text);
      FieldByName('sex').AsString                  := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(4).Range.Text);
      FieldByName('birthday').AsDateTime           := LBirthDay;// DocStrToDate(LStrTime);
      FieldByName('nation').AsString               := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(9).Range.Text);
//      FieldByName('political_status').AsString     := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item().Range.Text;
//      FieldByName('party_time').AsString           := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(15).Range.Text;
      FieldByName('birth_place').AsString          := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(13).Range.Text);
//      FieldByName('work_time').AsString            := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(17).Range.Text;
//      FieldByName('enter_unit_time').AsString      := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item().Range.Text;
      FieldByName('health_condition').AsString     := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(19).Range.Text);
//      FieldByName('job_level').AsString            := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
//      FieldByName('job_time').AsString             := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
//      FieldByName('pre_job_time').AsString         := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
      FieldByName('present_asg').AsString          := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(34).Range.Text);
//      FieldByName('present_asg_time').AsString     := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
//      FieldByName('present_asg_short').AsString    := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
//      FieldByName('personnel_identity').AsString   := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
//      FieldByName('cadre_type').AsString           := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
      FieldByName('tech_title').AsString           := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(21).Range.Text);
//      FieldByName('tech_title_time').AsString      := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
//      FieldByName('tech_title_level').AsString     := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
      FieldByName('tech_skill').AsString           := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(23).Range.Text);
      FieldByName('ft_education').AsString         := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(26).Range.Text);
      FieldByName('ft_school').AsString            := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(28).Range.Text);
//      FieldByName('ft_degree').AsString            := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
      FieldByName('ie_education').AsString         := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(30).Range.Text);
      FieldByName('ie_school').AsString            := Trim(FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(32).Range.Text);
//      FieldByName('ie_degree').AsString            := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item();
      inc(LMaxOrderNo);
      FieldByName('order_no').AsInteger := LMaxOrderNo;
      FieldByName('photo').AsString := '';

//      FWordDoc.InlineShapes.Item(LCadreIndex).Range.CopyAsPicture;      //复制照片
      if FWordDoc.Tables.Item(LTableIndex).Range.InlineShapes.Count > 0 then      begin
        FWordDoc.Tables.Item(LTableIndex).Range.InlineShapes.Item(1).Range.CopyAsPicture;
        Application.ProcessMessages;
        Sleep(100);
        FImage.Picture.Bitmap.Assign(Clipboard);
        FImage.Picture.Bitmap.SaveToFile('d:\a.jpg');
  //      TBlobField().LoadFromFile('d:\a.jpg');
        TBlobField(FieldByName('photo')).LoadFromFile('d:\a.jpg');
      end;
      FSysDataBase.SaveDataSet(LData);
    end;

    //工作简历
    LData := FSysDataBase.GetDataSetBySql('select * from cadre_info_job where sys_id = ' + QuotedStr(LSysId));
    with LData do    begin
      while not IsEmpty do Delete;      
      s := FWordDoc.Tables.Item(LTableIndex).Range.Cells.Item(40).Range.Text;
      s := StringReplace(s, #$D, '#', [rfReplaceAll,rfIgnoreCase]);
      LStrs.Clear;
      LStrs.Delimiter := '#';
      LStrs.DelimitedText := s;
      i := 0;
      while i< LStrs.Count do   begin
        if IsTime(LStrs.Strings[i])  then          begin
          LStrTime := LStrs.Strings[i];
        end   else   begin
          LStrContent := LStrContent + LStrs.Strings[i];
        end;
        inc(i);
        if (i >= LStrs.Count) or IsTime(LStrs.Strings[i]) then        begin
          Append;
          FieldByName('sys_id').AsString := LSysId;
          FieldByName('time').AsString := LStrTime;
          FieldByName('content').AsString := LStrContent;
          FieldByName('order_no').AsInteger := i;
          FSysDataBase.SaveDataSet(LData);
          LStrContent := EmptyStr;
        end;
      end;
    end;

    //家庭成员
    LData := FSysDataBase.GetDataSetBySql('select * from cadre_info_family where sys_id = ' + QuotedStr(LSysId) );
    with LData do    begin
      while not IsEmpty do Delete;
      s := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(13).Range.Text);
//      if not s.IsEmpty then
      for i := 0 to 6 do    begin
        s := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(13 + i*5).Range.Text);
        if not s.IsEmpty then      begin
          Append;
          FieldByName('sys_id').AsString := LSysId;
          FieldByName('order_no').AsInteger := i;
          FieldByName('title').AsString := s;
          FieldByName('name').AsString := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(14 + i*5).Range.Text);
//          FieldByName('birthday').AsString := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(15 + i*5).Range.Text);
          FieldByName('political_status').AsString := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(16 + i*5).Range.Text);
          FieldByName('work_info').AsString := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(17 + i*5).Range.Text);
          FSysDataBase.SaveDataSet(LData);
        end;
      end;
    end;

    //奖惩情况
    s := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(2).Range.Text);
    //年度考核结果
    s := Trim(FWordDoc.Tables.Item(LTableIndex+1).Range.Cells.Item(4).Range.Text);

    uCadreFun.GetCadreFun.CreateNewCadre(LSysId);
  end;


//  for i := 1 to FWordDoc.Tables.Count do  begin          //第 i 个表     //第 j 个Cell
//    for j := 1 to FWordDoc.Tables.Item(i).Range.Cells.Count do    begin
//      LCell := FWordDoc.Tables.Item(i).Range.Cells.Item(j);
//      s := LCell.Range.Text;
//    end;
//  end;

//  for i := 1 to FWordDoc.InlineShapes.Count do  begin
//    FWordDoc.InlineShapes.Item(i).Range.CopyAsPicture;
//  end;
end;


function TImportRM.IsTime(AStr: string): Boolean;
begin   // 19xx  or  2***
  Result := (AStr.Substring(0, 1) = '1') or (AStr.Substring(0, 1) = '2');
end;

procedure TImportRM.SetRewriteType(AType: TRewirteType);
begin
  FRewriteType := AType;
end;

function TImportRM.DocStrToDate(AStr: string): TDateTime;
var
  LStrYear, LStrMonth: string;
begin
  LStrYear := LeftStr(AStr, 4);
  LStrMonth := RightStr(LeftStr(AStr, 7), 2);
  Result := StrToDate(LStrYear + '-' + LStrMonth + '-01');
end;
end.

