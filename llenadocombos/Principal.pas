unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnComboStrings: TButton;
    btnComboObjetos: TButton;
    btnSalir: TButton;
    procedure btnComboStringsClick(Sender: TObject);
    procedure btnComboObjetosClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ComboObjetos, ComboStrings;

procedure TfrmPrincipal.btnComboObjetosClick(Sender: TObject);
begin
   frmComboObjetos.ShowModal;
end;

procedure TfrmPrincipal.btnComboStringsClick(Sender: TObject);
begin
   frmComboStrings.ShowModal;
end;

procedure TfrmPrincipal.btnSalirClick(Sender: TObject);
begin
   Application.Terminate;
end;

end.
