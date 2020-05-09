unit CatEntidad;

interface

uses
  SysUtils;

const

  MAX_ENTIDADES = 33;

type

  TEntidad = class
  public
    idNumerico: Integer;
    codigo: String;
    nombreEntidad: String;
    nombreCorto: String;
    constructor Create(); overload;
    constructor Create(codigo: String; nombreEntidad: String;
      nombreCorto: String); overload;
  end;

  TArrEntidades = Array [1 .. MAX_ENTIDADES] of TEntidad;

  TCatEntidades = class
  private
    entidades: TArrEntidades;
  public
    constructor Create();
    function getEntidades(): TArrEntidades;
    function getEntidad(codigo : String): TEntidad;
  end;

  var
     catEntidades : TCatEntidades;

implementation


{ TEntidad }

constructor TEntidad.Create;
begin
    // constructor por default
end;

constructor TEntidad.Create(codigo, nombreEntidad, nombreCorto: String);
begin
   Self.idNumerico := StrToInt(codigo);
   Self.codigo := codigo;
   Self.nombreEntidad := nombreEntidad;
   Self.nombreCorto:= nombreCorto;
end;

{ TCatEntidades }

constructor TCatEntidades.Create;
begin
 entidades[01] :=  TEntidad.Create('01','AGUASCALIENTES','AGS');
 entidades[02] :=  TEntidad.Create('02','BAJA CALIFORNIA','BC');
 entidades[03] :=  TEntidad.Create('03','BAJA CALIFORNIA SUR','BCS');
 entidades[04] :=  TEntidad.Create('04','CAMPECHE','CAMP');
 entidades[05] :=  TEntidad.Create('05','COAHUILA DE ZARAGOZA','COAH');
 entidades[06] :=  TEntidad.Create('06','COLIMA','COL');
 entidades[07] :=  TEntidad.Create('07','CHIAPAS','CHIS');
 entidades[08] :=  TEntidad.Create('08','CHIHUAHUA','CHIH');
 entidades[09] :=  TEntidad.Create('09','CIUDAD DE MÉXICO','CDMX');
 entidades[10] :=  TEntidad.Create('10','DURANGO','DGO');
 entidades[11] :=  TEntidad.Create('11','GUANAJUATO','GTO');
 entidades[12] :=  TEntidad.Create('12','GUERRERO','GRO');
 entidades[13] :=  TEntidad.Create('13','HIDALGO','HGO');
 entidades[14] :=  TEntidad.Create('14','JALISCO','JAL');
 entidades[15] :=  TEntidad.Create('15','MÉXICO','MEX');
 entidades[16] :=  TEntidad.Create('16','MICHOACÁN DE OCAMPO','MICH');
 entidades[17] :=  TEntidad.Create('17','MORELOS','MOR');
 entidades[18] :=  TEntidad.Create('18','NAYARIT','NAY');
 entidades[19] :=  TEntidad.Create('19','NUEVO LEÓN','NL');
 entidades[20] :=  TEntidad.Create('20','OAXACA','OAX');
 entidades[21] :=  TEntidad.Create('21','PUEBLA','PUE');
 entidades[22] :=  TEntidad.Create('22','QUERÉTARO','QRO');
 entidades[23] :=  TEntidad.Create('23','QUINTANA ROO','QROO');
 entidades[24] :=  TEntidad.Create('24','SAN LUIS POTOSÍ','SLP');
 entidades[25] :=  TEntidad.Create('25','SINALOA','SIN');
 entidades[26] :=  TEntidad.Create('26','SONORA','SON');
 entidades[27] :=  TEntidad.Create('27','TABASCO','TAB');
 entidades[28] :=  TEntidad.Create('28','TAMAULIPAS','TAMPS');
 entidades[29] :=  TEntidad.Create('29','TLAXCALA','TLAX');
 entidades[30] :=  TEntidad.Create('30','VERACRUZ DE IGNACIO DE LA LLAVE','VER');
 entidades[31] :=  TEntidad.Create('31','YUCATÁN','YUC');
 entidades[32] :=  TEntidad.Create('32','ZACATECAS','ZAC');
 entidades[33] :=  TEntidad.Create('33','EXTRANJERO','EXT');
end;

function TCatEntidades.getEntidad(codigo: String): TEntidad;
var
  idNumerico : Integer;
begin
  idNumerico := StrToInt(codigo);
  result := entidades[idNumerico];
end;

function TCatEntidades.getEntidades: TArrEntidades;
begin
   result := entidades;
end;

initialization

  catEntidades := TCatEntidades.Create;

end.
