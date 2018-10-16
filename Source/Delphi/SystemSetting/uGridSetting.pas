unit uGridSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, dxBar, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxCheckBox, cxDropDownEdit;

type
  TfrmGridSetting = class(TBaseForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    FDQuery1: TFDQuery;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridSetting: TfrmGridSetting;

implementation

{$R *.dfm}

procedure TfrmGridSetting.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet:= FSysDataBase.GetDataSetBySql(Self, 'select * from grid_view_config order by form, grid, order_no');
end;

procedure TfrmGridSetting.FormShow(Sender: TObject);
begin
//  inherited;//
end;

procedure TfrmGridSetting.dxBarLargeButton1Click(Sender: TObject);
begin
  FSysDataBase.SaveDataSet(DataSource1.DataSet);
end;

procedure TfrmGridSetting.dxBarLargeButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGridSetting.dxBarLargeButton3Click(Sender: TObject);
begin
  (cxGrid1DBTableView1.DataController.DataSet as TFDQuery).CancelUpdates;
  cxGrid1DBTableView1.DataController.DataSet.Refresh;
end;

end.
