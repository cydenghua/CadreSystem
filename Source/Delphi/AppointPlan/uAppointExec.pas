unit uAppointExec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, Vcl.ExtCtrls, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC, Vcl.StdCtrls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMemo, Vcl.ImgList,
  cxImageComboBox;

type
  TfrmAppointExec = class(TBaseForm)
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxImageComboBox1: TcxImageComboBox;
    cxImageList1: TcxImageList;
    cxMemo1: TcxMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label10: TLabel;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppointExec: TfrmAppointExec;

implementation

{$R *.dfm}

procedure TfrmAppointExec.FormCreate(Sender: TObject);
begin
  inherited;//
  cxPageControl1.Properties.HideTabs := True;
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TfrmAppointExec.FormShow(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmAppointExec.Button1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex > 0 then
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex - 1;
end;

procedure TfrmAppointExec.Button2Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex < cxPageControl1.PageCount-1 then
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
end;

procedure TfrmAppointExec.Button3Click(Sender: TObject);
begin
  Self.CloseModal;
end;

end.
