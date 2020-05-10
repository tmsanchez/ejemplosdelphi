object frmComboObjetos: TfrmComboObjetos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Combo con Objetos'
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
  OnCreate = FormCreate
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
    DropDownCount = 33
    TabOrder = 0
    OnChange = cboEntidadesChange
  end
  object memInfo: TMemo
    Left = 8
    Top = 80
    Width = 273
    Height = 89
    Lines.Strings = (
      'memInfo')
    TabOrder = 1
  end
end
