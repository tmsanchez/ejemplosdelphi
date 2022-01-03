{*******************************************************}
{                                                       }
{       Programa para dar seguimiento a un proyecto     }
{                                                       }
{                                                       }
{       Por: tmsanchez                                  }
{       email: tmsanchez@gmail.com                      }
{                                                       }
{                                                       }
{*******************************************************}

unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Mask,
  ImgList, jpeg, ActnList, XPMan, Buttons, ToolWin, TeeProcs, TeEngine, Chart,
  Series;

type
  TAnchoColumnas = array of Integer;

  TfrmPrincipal = class(TForm)
    pnlCabecera: TPanel;
    pgCtrlPrincipal: TPageControl;
    tsListado: TTabSheet;
    grdDatos: TDBGrid;
    tsDetalle: TTabSheet;
    lblFolio: TLabel;
    lblFecha: TLabel;
    lblModulo: TLabel;
    lblDescripcion: TLabel;
    lblObservaciones: TLabel;
    lblEstado: TLabel;
    lblTipo: TLabel;
    edtFolio: TDBEdit;
    edtFecha: TDBEdit;
    edtDescripcion: TDBEdit;
    memObservaciones: TDBMemo;
    cboEstado: TDBComboBox;
    cboTipo: TDBComboBox;
    cboModulo: TDBComboBox;
    imgLstIconos: TImageList;
    imgCabecera: TImage;
    acLstMain: TActionList;
    acInicio: TAction;
    acAnterior: TAction;
    acSiguiente: TAction;
    acFin: TAction;
    acNuevo: TAction;
    acAbrir: TAction;
    acGuardar: TAction;
    acDeshacer: TAction;
    xpMan: TXPManifest;
    tblCabecera: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    btnGuardaDetalle: TBitBtn;
    btnDehacerDetalle: TBitBtn;
    tsModulos: TTabSheet;
    memModulos: TMemo;
    btnGuardarModulo: TBitBtn;
    bgnDeshacerEditarModulo: TBitBtn;
    lblInstruccionModulos: TLabel;
    btnEditarModulos: TBitBtn;
    tsResumen: TTabSheet;
    chrtStatus: TChart;
    serieEstatus: TPieSeries;
    chrtTipo: TChart;
    serieTipo: TPieSeries;
    acSalir: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure grdDatosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure grdDatosDblClick(Sender: TObject);
    procedure acInicioExecute(Sender: TObject);
    procedure acAnteriorExecute(Sender: TObject);
    procedure acSiguienteExecute(Sender: TObject);
    procedure acFinExecute(Sender: TObject);
    procedure acNuevoExecute(Sender: TObject);
    procedure acAbrirExecute(Sender: TObject);
    procedure acDeshacerExecute(Sender: TObject);
    procedure acGuardarExecute(Sender: TObject);
    procedure btnEditarModulosClick(Sender: TObject);
    procedure pgCtrlPrincipalChange(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
  private
    { Private declarations }
    columnas : TAnchoColumnas;
    archivoModulos : String;
    totalAbierto: integer;
    totalEnProceso : Integer;
    totalNoAplica : Integer;
    totalTerminado : Integer;
    totalDefecto : integer;
    totalMejora  : integer;
    totalNuevoReq : integer;
    procedure calculaTotales;
    procedure generaGraficas;
    procedure generaGraficaEstatus;
    procedure generaGraficaTipo;
    procedure regresaADetalle;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uDMDatos, Ventanas;

{$R *.dfm}


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   archivoModulos := ExtractFilePath(Application.ExeName) + DATOS_COMBO_MODULO;
   cboModulo.Clear;
   cboModulo.Items.LoadFromFile( archivoModulos );
   DMDatos.cdsTracking.IndexFieldNames := grdDatos.Columns[0].FieldName;
   tsModulos.TabVisible := False;
   pgCtrlPrincipal.ActivePage := tsListado;
end;

procedure TfrmPrincipal.grdDatosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bitmap : TBitmap;
  fixRect : TRect;
  bmpWidth : integer;

  imgIndex : integer;
begin

   TVentanas.alternaColores(grdDatos,Rect,DataCol,Column,State);

  fixRect := Rect;

  if Column.Field = DMDatos.cdsTrackingTipo then
  begin

    case DMDatos.cdsTrackingTipo.Value[1] of
     DEFECTO : imgIndex:= 0;
     MEJORA : imgIndex:= 1;
     NUEVO_REQ : imgIndex := 2;
    end;


    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList
      //(using the "Salary" field's value)
      imgLstIconos.GetBitmap(imgIndex,bitmap);
      //Fix the bitmap dimensions
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      grdDatos.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle,
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;

  if Column.Field = DMDatos.cdsTrackingEstado then
  begin
    case DMDatos.cdsTrackingEstado.Value[1] of
     ABIERTO : imgIndex:= 3;
     EN_PROCESO : imgIndex:= 4;
     NO_APLICA : imgIndex := 5;
     TERMINADO : imgINdex := 6;
    end;


    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList
      //(using the "Salary" field's value)
      imgLstIconos.GetBitmap(imgIndex,bitmap);
      //Fix the bitmap dimensions
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      grdDatos.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle,
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;


  //draw default text (fixed position)


  grdDatos.DefaultDrawColumnCell(
     fixRect,
     DataCol,
     Column,
     State);

end;

procedure TfrmPrincipal.grdDatosTitleClick(Column: TColumn);
begin
   DMDatos.cdsTracking.IndexFieldNames := Column.FieldName;
end;

procedure TfrmPrincipal.pgCtrlPrincipalChange(Sender: TObject);
begin
  if pgCtrlPrincipal.ActivePage = tsResumen then
  begin
    generaGraficas;
  end;
end;

procedure TfrmPrincipal.regresaADetalle;
begin
   tsListado.TabVisible := True;
   tsDetalle.TabVisible := True;
   tsResumen.TabVisible := True;
   tsModulos.TabVisible := False;
   pgCtrlPrincipal.ActivePage := tsDetalle;
end;

procedure TfrmPrincipal.generaGraficaEstatus;
begin
   serieEstatus.Clear;
   serieEstatus.Add(totalAbierto,ABIERTO_TXT,clRed);
   serieEstatus.Add(totalEnProceso,EN_PROCESO_TXT,clOlive);
   serieEstatus.Add(totalNoAplica,NO_APLICA_TXT,clYellow);
   serieEstatus.Add(totalTerminado,TERMINADO_TXT,clGreen);
end;

procedure TfrmPrincipal.generaGraficas;
begin
   calculaTotales;
   generaGraficaEstatus;
   generaGraficaTipo;
end;

procedure TfrmPrincipal.generaGraficaTipo;
begin
   serieTipo.Clear;
   serieTipo.Add(totalDefecto,DEFECTO_TXT,clRed );
   serieTipo.Add(totalMejora,MEJORA_TXT, clMoneyGreen);
   serieTipo.Add(totalNuevoReq,NUEVO_REQ_TXT, clSkyBlue);
end;

procedure TfrmPrincipal.grdDatosDblClick(Sender: TObject);
begin
   acAbrirExecute(nil);
end;

procedure TfrmPrincipal.acInicioExecute(Sender: TObject);
begin
  DMDatos.cdsTracking.First;
end;

procedure TfrmPrincipal.acAnteriorExecute(Sender: TObject);
begin
   DMDatos.cdsTracking.Prior;
end;

procedure TfrmPrincipal.acSalirExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.acSiguienteExecute(Sender: TObject);
begin
   DMDatos.cdsTracking.Next;
end;

procedure TfrmPrincipal.acFinExecute(Sender: TObject);
begin
   DMDatos.cdsTracking.Last;
end;

procedure TfrmPrincipal.acNuevoExecute(Sender: TObject);
begin
   pgCtrlPrincipal.ActivePage := tsDetalle;
   DMDatos.cdsTracking.Append;
   cboTipo.SetFocus;
end;

procedure TfrmPrincipal.acAbrirExecute(Sender: TObject);
begin
   DMDatos.cdsTracking.Edit;
   pgCtrlPrincipal.ActivePage := tsDetalle;
   cboTipo.SetFocus;   
end;

procedure TfrmPrincipal.acDeshacerExecute(Sender: TObject);
begin
  if pgCtrlPrincipal.ActivePage = tsDetalle then
  begin
     DMDatos.cdsTracking.Cancel;
  end
  else if pgCtrlPrincipal.ActivePage = tsModulos then
  begin
     memModulos.Lines.SaveToFile(archivoModulos);
     regresaADetalle;
  end;
end;

procedure TfrmPrincipal.acGuardarExecute(Sender: TObject);
begin
  if pgCtrlPrincipal.ActivePage = tsDetalle then
  begin
    DMDatos.cdsTracking.Post
  end
  else if pgCtrlPrincipal.ActivePage = tsModulos then
  begin
     memModulos.Lines.SaveToFile(archivoModulos);
     cboModulo.Items.LoadFromFile( archivoModulos );
     regresaADetalle;
  end;
end;

procedure TfrmPrincipal.btnEditarModulosClick(Sender: TObject);
begin
   tsModulos.TabVisible := True;
   pgCtrlPrincipal.ActivePage := tsModulos;
   tsListado.TabVisible := False;
   tsDetalle.TabVisible := False;
   tsResumen.TabVisible := False;

   memModulos.Lines.LoadFromFile(archivoModulos);

end;

procedure TfrmPrincipal.calculaTotales;
begin
   totalAbierto:= 0;
   totalEnProceso := 0;
   totalNoAplica := 0;
   totalTerminado := 0;

   totalDefecto := 0;
   totalMejora := 0;
   totalNuevoReq := 0;

   with DMDatos do
   begin
      cdsTracking.First;
      while not cdsTracking.Eof do
      begin
        case cdsTrackingEstado.Value[1] of
           ABIERTO : Inc(totalAbierto);
           EN_PROCESO : iNC(totalEnProceso);
           NO_APLICA : Inc(totalNoAplica);
           TERMINADO : Inc(totalTerminado);
        end;
        case cdsTrackingTipo.Value[1] of
           DEFECTO : Inc(totalDefecto);
           MEJORA  : Inc(totalMejora);
           NUEVO_REQ : iNC(totalNuevoReq);
        end;
        cdsTracking.Next;
      end;
   end;
end;

end.
