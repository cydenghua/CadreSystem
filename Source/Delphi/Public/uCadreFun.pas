unit uCadreFun;

interface

uses
  Classes, SysUtils, System.Variants,
  uSysDataBase;

type
  TCadreFun = class(TComponent)
  private
    { private declarations }
    FSysDataBase: TSysDataBase;
  protected
    { protected declarations }
  public
    { public declarations }

    constructor Create; virtual;
    destructor Destroy; override;

    procedure CreateNewCadre(ASysId: string);//����һ���¸ɲ���Ϣ�� ȷ��������������

  published
    { published declarations }
  end;

var
  g_CadreFun: TCadreFun;
  function GetCadreFun:TCadreFun;

implementation

  function GetCadreFun:TCadreFun;
  begin
    if not Assigned(g_CadreFun) then
      g_CadreFun := TCadreFun.Create;
    Result := g_CadreFun;
  end;

{ TCadreFun }


constructor TCadreFun.Create;
begin
  FSysDataBase := uSysDataBase.GetSysDataBase;
end;

destructor TCadreFun.Destroy;
begin

  inherited;
end;

procedure TCadreFun.CreateNewCadre(ASysId: string);
var
  LSql: string;
  LMaxOrderNo: Integer;
begin
  LSql := 'select * from cadre_info where sys_id = ' + QuotedStr(ASysId);
  if not FSysDataBase.DataIsExists(LSql) then  begin
    LMaxOrderNo := FSysDataBase.GetFieldMaxValue('cadre_info', 'order_no') + 1;
    LSql := 'insert into cadre_info(sys_id, name, order_no) values(' + QuotedStr(ASysId) + ', ''NEW'', ''' + IntToStr(LMaxOrderNo) + ''')';
    FSysDataBase.ExecSQL(LSql);
  end;

  LSql := 'select * from cadre_info_extend where sys_id = ' + QuotedStr(ASysId);
  if not FSysDataBase.DataIsExists(LSql) then  begin
    LSql := 'insert into cadre_info_extend(sys_id) values(' + QuotedStr(ASysId) + ')';
    FSysDataBase.ExecSQL(LSql);
  end;
end;

end.
