unit uDicBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm;

type
  TfrmDicBase = class(TBaseForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDicBase: TfrmDicBase;

implementation

{$R *.dfm}

procedure TfrmDicBase.FormCreate(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmDicBase.FormShow(Sender: TObject);
begin
  inherited;//
end;

end.
