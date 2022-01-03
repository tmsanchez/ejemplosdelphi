unit uDMDatos;

interface

uses
  SysUtils, Classes, DB, DBClient, Forms, Variants;

const

   ABIERTO = 'A';
   EN_PROCESO = 'E';
   TERMINADO = 'T';
   NO_APLICA = 'N';
   ABIERTO_TXT = 'ABIERTO';
   EN_PROCESO_TXT = 'EN PROCESO';
   TERMINADO_TXT = 'TERMINADO';
   NO_APLICA_TXT = 'NO APLICA';


   DEFECTO = 'D';
   MEJORA = 'M';
   NUEVO_REQ = 'N';
   DEFECTO_TXT = 'DEFECTO';
   MEJORA_TXT = 'MEJORA';
   NUEVO_REQ_TXT = 'NUEVO REQ.';

   DATOS_FILE_NAME = 'tracking.xml';
   DATOS_COMBO_MODULO = 'modulos.txt';

type
  TDMDatos = class(TDataModule)
    cdsTracking: TClientDataSet;
    dsTracking: TDataSource;
    cdsTrackingFolio: TIntegerField;
    cdsTrackingFecha: TDateField;
    cdsTrackingModulo: TStringField;
    cdsTrackingDescripcion: TStringField;
    cdsTrackingObservaciones: TStringField;
    cdsTrackingEstado: TStringField;
    cdsTrackingMaxFolio: TAggregateField;
    cdsTrackingTipo: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTrackingNewRecord(DataSet: TDataSet);
    procedure cdsTrackingTipoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsTrackingTipoSetText(Sender: TField; const Text: String);
    procedure cdsTrackingEstadoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsTrackingEstadoSetText(Sender: TField; const Text: String);
    procedure cdsTrackingBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDatos: TDMDatos;

implementation

{$R *.dfm}

procedure TDMDatos.DataModuleCreate(Sender: TObject);
begin
   cdsTracking.FileName :=   ExtractFilePath(Application.ExeName) + DATOS_FILE_NAME;
   if not FileExists(cdsTracking.FileName ) then
     cdsTracking.CreateDataSet
    else
      cdsTracking.Open;
end;

procedure TDMDatos.cdsTrackingNewRecord(DataSet: TDataSet);
begin
   if varisNull(cdsTrackingMaxFolio.Value)  then
     cdsTrackingFolio.Value :=  1
   else
      cdsTrackingFolio.Value := cdsTrackingMaxFolio.Value + 1;


  cdsTrackingFecha.Value := Date;
  cdsTrackingEstado.Value := ABIERTO;
  cdsTrackingTipo.Value := DEFECTO;
end;

procedure TDMDatos.cdsTrackingTipoGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
   if Not Sender.IsNull then
      case Sender.AsString[1] of
       DEFECTO : Text := DEFECTO_TXT;
       MEJORA  : Text := MEJORA_TXT;
       NUEVO_REQ : Text := NUEVO_REQ_TXT;
      end;

end;

procedure TDMDatos.cdsTrackingTipoSetText(Sender: TField;
  const Text: String);
begin
   sENDER.AsString := Copy(Text,1,1);
end;

procedure TDMDatos.cdsTrackingEstadoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Not Sender.IsNull then
      case Sender.AsString[1] of
       ABIERTO : Text := ABIERTO_TXT;
       EN_PROCESO  : Text := EN_PROCESO_TXT;
       TERMINADO : Text := TERMINADO_TXT;
       NO_APLICA : Text := NO_APLICA_TXT;
      end;

end;

procedure TDMDatos.cdsTrackingEstadoSetText(Sender: TField;
  const Text: String);
begin
   Sender.AsString := Copy(Text,1,1);
end;

procedure TDMDatos.cdsTrackingBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

end.
