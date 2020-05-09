unit ComboObjetos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmComboObjetos = class(TForm)
    cboEntidades: TComboBox;
    Label1: TLabel;
    memInfo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure cboEntidadesChange(Sender: TObject);
  private
    { Private declarations }
    procedure llenaComboEntidades();
    procedure muestraEntidad(clave: String; nombreLargo: String;
      nombreCorto: String);
    procedure muestraDatosEntidadSeleccionada();
  public
    { Public declarations }
  end;

var
  frmComboObjetos: TfrmComboObjetos;

implementation

{$R *.dfm}

uses CatEntidad;

procedure TfrmComboObjetos.FormCreate(Sender: TObject);
begin
  llenaComboEntidades();
end;

procedure TfrmComboObjetos.llenaComboEntidades;
var
  entidad: TEntidad;
begin
  cboEntidades.Items.Clear;
  cboEntidades.Items.Add('SELECCIONE UNA ENTIDAD');
  for entidad in catEntidades.getEntidades do
  begin
    cboEntidades.AddItem(entidad.nombreEntidad, entidad);
  end;
  cboEntidades.ItemIndex := 0;
end;

procedure TfrmComboObjetos.cboEntidadesChange(Sender: TObject);
begin
  muestraDatosEntidadSeleccionada();
end;

procedure TfrmComboObjetos.muestraDatosEntidadSeleccionada;
var
  entidadSeleccionada: TEntidad;
begin
  if cboEntidades.ItemIndex < 1  then Exit;

  // obtenemos el objeto seleccionado
  entidadSeleccionada := cboEntidades.Items.Objects[cboEntidades.ItemIndex]
    as TEntidad;

  muestraEntidad(entidadSeleccionada.codigo, entidadSeleccionada.nombreEntidad,
    entidadSeleccionada.nombreCorto);
end;

procedure TfrmComboObjetos.muestraEntidad(clave, nombreLargo,
  nombreCorto: String);
begin
  memInfo.Clear;
  memInfo.Lines.add('Clave: ' + clave);
  memInfo.Lines.add('Nombre Largo: ' + nombreLargo);
  memInfo.Lines.add('Nombre Corto: ' + nombreCorto);
end;

end.
