program EjemploCombos;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  CatEntidad in 'CatEntidad.pas',
  ComboStrings in 'ComboStrings.pas' {frmComboStrings},
  ComboObjetos in 'ComboObjetos.pas' {frmComboObjetos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmComboStrings, frmComboStrings);
  Application.CreateForm(TfrmComboObjetos, frmComboObjetos);
  Application.Run;
end.
