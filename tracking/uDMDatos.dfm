object DMDatos: TDMDatos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 885
  Top = 224
  Height = 161
  Width = 292
  object cdsTracking: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    BeforeDelete = cdsTrackingBeforeDelete
    OnNewRecord = cdsTrackingNewRecord
    Left = 40
    Top = 32
    object cdsTrackingFolio: TIntegerField
      FieldName = 'Folio'
    end
    object cdsTrackingFecha: TDateField
      FieldName = 'Fecha'
      EditMask = '!99/99/00;1;_'
    end
    object cdsTrackingTipo: TStringField
      FieldName = 'Tipo'
      OnGetText = cdsTrackingTipoGetText
      OnSetText = cdsTrackingTipoSetText
      Size = 1
    end
    object cdsTrackingModulo: TStringField
      FieldName = 'Modulo'
      Required = True
      Size = 30
    end
    object cdsTrackingDescripcion: TStringField
      FieldName = 'Descripcion'
      Required = True
      Size = 80
    end
    object cdsTrackingObservaciones: TStringField
      FieldName = 'Observaciones'
      Size = 255
    end
    object cdsTrackingEstado: TStringField
      FieldName = 'Estado'
      OnGetText = cdsTrackingEstadoGetText
      OnSetText = cdsTrackingEstadoSetText
      Size = 1
    end
    object cdsTrackingMaxFolio: TAggregateField
      FieldName = 'MaxFolio'
      Active = True
      Expression = 'MAX(FOLIO)'
    end
  end
  object dsTracking: TDataSource
    DataSet = cdsTracking
    Left = 192
    Top = 32
  end
end
