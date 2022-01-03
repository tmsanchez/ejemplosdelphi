object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ejemplo Combos'
  ClientHeight = 356
  ClientWidth = 391
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
  object btnComboStrings: TButton
    Left = 80
    Top = 64
    Width = 217
    Height = 57
    Caption = 'Combo con Strings'
    TabOrder = 0
    OnClick = btnComboStringsClick
  end
  object btnComboObjetos: TButton
    Left = 80
    Top = 144
    Width = 217
    Height = 57
    Caption = 'Combo con Objetos'
    TabOrder = 1
    OnClick = btnComboObjetosClick
  end
  object btnSalir: TButton
    Left = 80
    Top = 216
    Width = 217
    Height = 57
    Caption = 'Salir'
    TabOrder = 2
    OnClick = btnSalirClick
  end
end
