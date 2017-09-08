object FActividad: TFActividad
  Left = 0
  Top = 0
  Caption = 'Agregar actividad'
  ClientHeight = 333
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 109
    Height = 16
    Caption = 'Actividad a realizar'
  end
  object Label2: TLabel
    Left = 96
    Top = 221
    Width = 125
    Height = 16
    Caption = 'Fecha de la actividad:'
  end
  object DTPFecha: TDateTimePicker
    Left = 240
    Top = 216
    Width = 186
    Height = 27
    Date = 42982.467697974530000000
    Time = 42982.467697974530000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object MmActividad: TMemo
    Left = 48
    Top = 46
    Width = 577
    Height = 142
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MmActividad')
    MaxLength = 200
    ParentFont = False
    TabOrder = 0
    OnChange = MmActividadChange
  end
  object BGuardar: TButton
    Left = 264
    Top = 276
    Width = 129
    Height = 33
    Caption = 'Guardar'
    TabOrder = 2
    OnClick = BGuardarClick
  end
  object BSalir: TButton
    Left = 550
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 3
    OnClick = BSalirClick
  end
  object Query: TFDQuery
    Connection = DMod.FDConn
    Left = 320
    Top = 96
  end
end
