program tmsgTracking;

uses
  Forms,
  MidasLib,
  Principal in 'Principal.pas' {frmPrincipal},
  uDMDatos in 'uDMDatos.pas' {DMDatos: TDataModule},
  Ventanas in 'Ventanas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMDatos, DMDatos);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
