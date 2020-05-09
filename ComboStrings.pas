unit ComboStrings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmComboStrings = class(TForm)
    cboEntidades: TComboBox;
    Label1: TLabel;
    memInfo: TMemo;
    procedure cboEntidadesChange(Sender: TObject);
  private
    { Private declarations }
    procedure muestraEntidad(clave: String; nombreLargo: String;
      nombreCorto: String);
    procedure muestraDatosEntidadSeleccionada();
  public
    { Public declarations }
  end;

var
  frmComboStrings: TfrmComboStrings;

implementation

{$R *.dfm}

procedure TfrmComboStrings.cboEntidadesChange(Sender: TObject);
begin
  muestraDatosEntidadSeleccionada();
end;

procedure TfrmComboStrings.muestraEntidad(clave, nombreLargo,
  nombreCorto: String);
begin
  memInfo.Clear;
  memInfo.Lines.add('Clave: ' + clave);
  memInfo.Lines.add('Nombre Largo: ' + nombreLargo);
  memInfo.Lines.add('Nombre Corto: ' + nombreCorto);
end;

procedure TfrmComboStrings.muestraDatosEntidadSeleccionada;
begin
  if cboEntidades.ItemIndex < 1  then Exit;
  
  case cboEntidades.ItemIndex  of
    01:
      muestraEntidad('01', 'AGUASCALIENTES', 'AGS  ');
    02:
      muestraEntidad('02', 'BAJA CALIFORNIA', 'BC   ');
    03:
      muestraEntidad('03', 'BAJA CALIFORNIA SUR', 'BCS  ');
    04:
      muestraEntidad('04', 'CAMPECHE', 'CAMP ');
    05:
      muestraEntidad('05', 'COAHUILA DE ZARAGOZA', 'COAH ');
    06:
      muestraEntidad('06', 'COLIMA', 'COL  ');
    07:
      muestraEntidad('07', 'CHIAPAS', 'CHIS ');
    08:
      muestraEntidad('08', 'CHIHUAHUA', 'CHIH ');
    09:
      muestraEntidad('09', 'CIUDAD DE MÉXICO', 'CDMX ');
    10:
      muestraEntidad('10', 'DURANGO', 'DGO  ');
    11:
      muestraEntidad('11', 'GUANAJUATO', 'GTO  ');
    12:
      muestraEntidad('12', 'GUERRERO', 'GRO  ');
    13:
      muestraEntidad('13', 'HIDALGO', 'HGO  ');
    14:
      muestraEntidad('14', 'JALISCO', 'JAL  ');
    15:
      muestraEntidad('15', 'MÉXICO', 'MEX  ');
    16:
      muestraEntidad('16', 'MICHOACÁN DE OCAMPO', 'MICH ');
    17:
      muestraEntidad('17', 'MORELOS', 'MOR  ');
    18:
      muestraEntidad('18', 'NAYARIT', 'NAY  ');
    19:
      muestraEntidad('19', 'NUEVO LEÓN', 'NL   ');
    20:
      muestraEntidad('20', 'OAXACA', 'OAX  ');
    21:
      muestraEntidad('21', 'PUEBLA', 'PUE  ');
    22:
      muestraEntidad('22', 'QUERÉTARO', 'QRO  ');
    23:
      muestraEntidad('23', 'QUINTANA ROO', 'QROO ');
    24:
      muestraEntidad('24', 'SAN LUIS POTOSÍ', 'SLP  ');
    25:
      muestraEntidad('25', 'SINALOA', 'SIN  ');
    26:
      muestraEntidad('26', 'SONORA', 'SON  ');
    27:
      muestraEntidad('27', 'TABASCO', 'TAB  ');
    28:
      muestraEntidad('28', 'TAMAULIPAS', 'TAMPS');
    29:
      muestraEntidad('29', 'TLAXCALA', 'TLAX ');
    30:
      muestraEntidad('30', 'VERACRUZ DE IGNACIO DE LA LLAVE', 'VER  ');
    31:
      muestraEntidad('31', 'YUCATÁN', 'YUC  ');
    32:
      muestraEntidad('32', 'ZACATECAS', 'ZAC  ');
    33:
      muestraEntidad('33', 'EXTRANJERO', 'EXT');

  end;
end;

end.
