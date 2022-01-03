unit Ventanas;

interface

uses Windows, DBGrids, Grids, DB, Dialogs, Graphics;

type
   TVentanas = class (TObject )
      class procedure alternaColores(dbGrdDatos: TDbGrid;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
   end;

implementation

{ TVentanas }

class procedure TVentanas.alternaColores(dbGrdDatos: TDbGrid; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Dataset : Tdataset;
   RecNo: integer;
begin
  with  dbGrdDatos.Canvas do begin
    // Determine the background (and font) color
    with Brush do begin
      if gdFocused in State then
      begin
        Color := clHighlight;
        Font.Color := clHighlightText;
      end
      else if gdSelected in State then
      begin
        Color := clHighlight;
        //Color := clYellow;
        Font.Color := clHighlightText;
        //Font.Color := clBlack;
      end
      else if gdFixed in State then
      begin
        Color := dbGrdDatos.FixedColor;
      end
      else begin

          // Determine the row number
          if dbGrdDatos.Datasource <> nil then begin
            DataSet := dbGrdDatos.Datasource.DataSet;
            if DataSet <> nil then begin
              RecNo := DataSet.RecNo;
              if RecNo = -1 then begin
                RecNo := DataSet.RecordCount + 1;
                if RecNo = 0 then RecNo := 1;
              end;
            end else
              RecNo := 1;
          end else
            RecNo := 1;
          if (RecNo And 1) = 0 then
            //Color := $FFFFEE   // Background color for odd rows
            Color := clWhite   // Background color for odd rows
          else
            //Color := $EEFFFF;  // Background color for even rows
            //Color := $00F0F0F0;  // Background color for even rows
            //Color := $00EEEEEE;
            //Color := clBtnFace;
            Color := clSkyBlue;

        end;
      end;
    end;


    dbGrdDatos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    if gdFocused in State then    // Does the cell have the focus?
      dbGrdDatos.Canvas.DrawFocusRect(Rect);  // Draw focus rectangle


end;

end.
