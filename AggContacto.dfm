object FAggContacto: TFAggContacto
  Left = 233
  Top = 194
  BorderStyle = bsSingle
  Caption = 'Agregar/modificar contacto'
  ClientHeight = 497
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    418
    497)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Nombre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 48
    Width = 52
    Height = 13
    Caption = 'Direcci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 112
    Width = 38
    Height = 13
    Caption = 'Correo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 152
    Width = 25
    Height = 13
    Caption = 'Otro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 208
    Width = 44
    Height = 13
    Caption = 'N'#250'mero'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 240
    Top = 208
    Width = 24
    Height = 13
    Caption = 'Tipo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ENombre: TEdit
    Left = 24
    Top = 24
    Width = 369
    Height = 21
    MaxLength = 30
    TabOrder = 0
    OnChange = ENombreChange
    OnExit = ENombreExit
  end
  object EDirec: TEdit
    Left = 24
    Top = 64
    Width = 369
    Height = 42
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    MaxLength = 100
    OEMConvert = True
    TabOrder = 1
    OnExit = ENombreExit
  end
  object ECorreo: TEdit
    Left = 24
    Top = 127
    Width = 369
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 50
    TabOrder = 2
    OnExit = ENombreExit
  end
  object EOtro: TEdit
    Left = 24
    Top = 168
    Width = 369
    Height = 38
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    MaxLength = 100
    TabOrder = 3
    OnExit = ENombreExit
  end
  object ENumero: TEdit
    Left = 24
    Top = 224
    Width = 145
    Height = 21
    MaxLength = 15
    NumbersOnly = True
    TabOrder = 4
    OnChange = ENumeroChange
    OnExit = ENombreExit
  end
  object CBTipo: TComboBox
    Left = 240
    Top = 224
    Width = 153
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    OnChange = ENumeroChange
    Items.Strings = (
      'Celular'
      'Fax'
      'Habitaci'#243'n'
      'Trabajo')
  end
  object BAggNum: TButton
    Left = 108
    Top = 264
    Width = 113
    Height = 25
    Caption = 'Agregar n'#250'mero'
    TabOrder = 6
    OnClick = BAggNumClick
  end
  object SGrid: TStringGrid
    Left = 71
    Top = 304
    Width = 273
    Height = 120
    TabStop = False
    ColCount = 2
    Ctl3D = True
    DefaultColWidth = 125
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    ParentCtl3D = False
    PopupMenu = PMenu
    TabOrder = 7
  end
  object BGuardar: TButton
    Left = 136
    Top = 440
    Width = 137
    Height = 33
    Caption = 'Guardar'
    TabOrder = 8
    OnClick = BGuardarClick
  end
  object BSalir: TButton
    Left = 320
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 9
    OnClick = BSalirClick
  end
  object BCancelar: TButton
    Left = 236
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = BCancelarClick
  end
  object Query: TFDQuery
    Connection = DMod.FDConn
    Left = 32
    Top = 272
  end
  object PMenu: TPopupMenu
    Left = 368
    Top = 272
    object Modificarestenmero1: TMenuItem
      Caption = 'Modificar este n'#250'mero'
      OnClick = Modificarestenmero1Click
    end
    object Eliminarestenmero1: TMenuItem
      Caption = 'Eliminar este n'#250'mero'
      OnClick = Eliminarestenmero1Click
    end
  end
end
