unit uBaseForm;

interface

uses
  Forms, SysUtils, System.Classes,

  dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxClasses, cxLookAndFeels, dxSkinsForm, cxGridCustomTableView,
  cxGridDBTableView, cxGridCustomView, cxGridTableView, cxDBEdit, cxDropDownEdit,
  cxTextEdit, cxedit,

  uSysDataBase, uSysUser, uSysConfig;

type
  TStrObj = class(TObject)
  public
    FStr: string;
  end;

  TBaseForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure GridViewDisplay();
    procedure GridViewDisplayDo(GridView: TcxGridDBTableView);
    procedure GridViewAddOrderColumn(GridView: TcxGridDBTableView);
    procedure OrderColumnGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);

  protected
    procedure InitCxComboBoxWithDicType(cxDBComboBox: TcxCustomComboBox; AType: string);
    procedure InitCxComboBoxWithSql(cxDBComboBox: TcxCustomComboBox; ASql: string; AField: string);
  public
    { Public declarations }
    FSysDataBase: TSysDataBase;
    FSysUser: TSysUser;
    FSysConfig: TSysConfig;
    FSkin: TdxSkinController;
  end;

implementation

procedure TBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  FSysDataBase := uSysDataBase.GetSysDataBase;
  FSysUser := uSysUser.GetSysUser;

  FSysConfig := uSysConfig.SysConfig;
//  if not Self.SetQueryDataBase then
//    raise Exception.Create('Err25: SetQueryConnErr.');
//
  FSkin := TdxSkinController.Create(Self);
  FSkin.NativeStyle := False;
  FSkin.Kind := lfFlat;
  FSkin.SkinName := FSysConfig.SkinName;
  FSkin.UseSkins := True;

end;

procedure TBaseForm.FormShow(Sender: TObject);
begin
  GridViewDisplay;
end;

procedure TBaseForm.GridViewDisplay;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do  begin
    if Self.Components[i] is TcxGridDBTableView then   begin
      GridViewDisplayDo(Self.Components[i] as TcxGridDBTableView);
    end;
  end;
end;

procedure TBaseForm.GridViewDisplayDo(GridView: TcxGridDBTableView);
var
  iIndex: Integer;
  LSql: string;
  LColumn: TcxGridDBColumn;
begin
//  GridView.OptionsView.DataRowHeight := 30;       //delete for: 设置height会导致cell不能自动换行
  GridView.OptionsView.HeaderHeight := 35;
  GridView.OptionsView.CellAutoHeight := True;   //设置cell能自动换行

  LSql := 'select * from grid_view_config where form = ' + QuotedStr(Self.Name)
       + ' and grid = ' + QuotedStr(GridView.Name)
       + ' order by order_no asc';

  with FSysDataBase.GetDataSetBySql(LSql) do    begin
    GridView.ClearItems; //清空数据
    if IsEmpty then   begin
      (GridView.DataController as IcxCustomGridDataController).DeleteAllItems;  //删除所有列
      (GridView.DataController as IcxCustomGridDataController).CreateAllItems(false); //创建数据源中的所有列
      GridView.ApplyBestFit; //让列宽自适应 .BestFitMaxWidth;

      for iIndex := 0 to GridView.ColumnCount-1 do  begin
        GridView.Columns[iIndex].HeaderAlignmentHorz := taCenter;
        LSql := 'insert into grid_view_config(form, grid, field, order_no, value_type, caption, caption_align, width, visible) '
            + 'values(''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, %d, ''%s'')';
        LSql := LSql.Format(LSql, [Self.Name, GridView.Name,
        GridView.Columns[iIndex].DataBinding.FieldName,
        iIndex,
        GridView.Columns[iIndex].DataBinding.ValueType,
        GridView.Columns[iIndex].Caption,
        Ord(GridView.Columns[iIndex].HeaderAlignmentHorz),
        GridView.Columns[iIndex].Width, '1']);
        FSysDataBase.ExecSQL(LSql);
      end;
    end else    begin
      if GridView.Tag = 9 then GridViewAddOrderColumn(GridView);
      First;
      while not Eof do      begin
        if 1 = FieldByName('visible').AsInteger then        begin
          LColumn := GridView.CreateColumn;
          LColumn.DataBinding.FieldName := FieldByName('field').AsString;
          LColumn.DataBinding.ValueType := FieldByName('value_type').AsString;
          LColumn.Caption := FieldByName('caption').AsString;
          LColumn.Width := FieldByName('width').AsInteger;
          LColumn.HeaderAlignmentHorz := TAlignment(FieldByName('caption_align').AsInteger);

  //        if (nil <> LColumn.Properties) and (nil <> LColumn.Properties.Alignment) then        begin
  //          LColumn.Properties.Alignment.Horz := TcxEditHorzAlignment(2);//taCenter;   //表格水平方向
  //          LColumn.Properties.Alignment.Vert := TcxEditVertAlignment(2);// TAlignment(1); //taCenter;
  //        end;

//        LColumn.Visible := (1 = FieldByName('visible').AsInteger);

//          if FieldByName('properties').AsString.Equals('Memo') then          begin
//            LColumn.PropertiesClassName := 'TcxMemoProperties';
//          end;

          LColumn.GetProperties.Alignment.Horz := taCenter;
        end;

        Next;
      end;
    end;
  end;
end;

procedure TBaseForm.GridViewAddOrderColumn(GridView: TcxGridDBTableView);
var
  LColumn: TcxGridDBColumn;
begin
  LColumn := GridView.CreateColumn;
  LColumn.Caption := '序号';
  LColumn.Width := 50;
  LColumn.HeaderAlignmentHorz := taCenter;
  LColumn.OnGetDataText := OrderColumnGetDataText;

  LColumn.PropertiesClassName := 'TcxTextEditProperties';
  LColumn.Properties.Alignment.Horz := taCenter;
end;

procedure TBaseForm.OrderColumnGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
  AText := IntToStr(ARecordIndex+1);
end;

procedure TBaseForm.InitCxComboBoxWithDicType(cxDBComboBox: TcxCustomComboBox; AType: string);
begin
  InitCxComboBoxWithSql(cxDBComboBox,
    'select * from system_dic where type = ' + QuotedStr(AType) + ' order by order_no asc', 'name');
end;

procedure TBaseForm.InitCxComboBoxWithSql(cxDBComboBox: TcxCustomComboBox; ASql: string; AField: string);
var
  LStrObj: TStrObj;
begin
  cxDBComboBox.Properties.Items.Clear;
  with FSysDataBase.GetDataSetBySql(ASql) do  begin
    First;
    while not Eof do    begin
//      cxDBComboBox.Properties.Items.Add(FieldByName(AField).AsString);
      LStrObj := TStrObj.Create;
      LStrObj.FStr := FieldByName('sys_id').AsString;
      cxDBComboBox.Properties.Items.AddObject(FieldByName(AField).AsString, LStrObj);
      Next;
    end;
  end;
end;

end.
