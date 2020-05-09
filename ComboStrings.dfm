object frmComboStrings: TfrmComboStrings
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Combo con Strings'
  ClientHeight = 321
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 100
    Height = 13
    Caption = 'Selecciona la Entidad'
  end
  object cboEntidades: TComboBox
    Left = 8
    Top = 27
    Width = 273
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'SELECCIONE UNA ENTIDAD'
    OnChange = cboEntidadesChange
    Items.Strings = (
      'SELECCIONE UNA ENTIDAD'
      'AGUASCALIENTES'#9
      'BAJA CALIFORNIA'#9
      'BAJA CALIFORNIA SUR'#9
      'CAMPECHE'#9
      'COAHUILA DE ZARAGOZA'#9
      'COLIMA'#9
      'CHIAPAS'#9
      'CHIHUAHUA'#9
      'CIUDAD DE M'#201'XICO'#9
      'DURANGO'#9
      'GUANAJUATO'#9
      'GUERRERO'#9
      'HIDALGO'#9
      'JALISCO'#9
      'M'#201'XICO'#9
      'MICHOAC'#193'N DE OCAMPO'#9
      'MORELOS'#9
      'NAYARIT'#9
      'NUEVO LE'#211'N'#9
      'OAXACA'#9
      'PUEBLA'#9
      'QUER'#201'TARO'#9
      'QUINTANA ROO'#9
      'SAN LUIS POTOS'#205#9
      'SINALOA'#9
      'SONORA'#9
      'TABASCO'#9
      'TAMAULIPAS'#9
      'TLAXCALA'#9
      'VERACRUZ DE IGNACIO DE LA LLAVE'#9
      'YUCAT'#193'N'#9
      'ZACATECAS'#9
      'EXTRANJERO'#9)
  end
  object memInfo: TMemo
    Left = 8
    Top = 64
    Width = 273
    Height = 89
    Lines.Strings = (
      'memInfo')
    TabOrder = 1
  end
end
