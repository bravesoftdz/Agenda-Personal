object FCambPassword: TFCambPassword
  Left = 0
  Top = 0
  Caption = 'Cambio de password'
  ClientHeight = 270
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 145
    Top = 26
    Width = 103
    Height = 16
    Caption = 'Contrase'#241'a actual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 145
    Top = 74
    Width = 102
    Height = 16
    Caption = 'Nueva contrase'#241'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 123
    Top = 122
    Width = 146
    Height = 16
    Caption = 'Repetir nueva contrase'#241'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BSalir: TButton
    Left = 210
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 4
    OnClick = BSalirClick
  end
  object BAceptar: TButton
    Left = 106
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 3
    OnClick = BAceptarClick
  end
  object EPasswActual: TEdit
    Left = 90
    Top = 48
    Width = 227
    Height = 21
    MaxLength = 25
    PasswordChar = '*'
    TabOrder = 0
  end
  object EPassw1: TEdit
    Left = 90
    Top = 96
    Width = 227
    Height = 21
    MaxLength = 25
    PasswordChar = '*'
    TabOrder = 1
  end
  object EPassw2: TEdit
    Left = 90
    Top = 144
    Width = 227
    Height = 21
    MaxLength = 25
    PasswordChar = '*'
    TabOrder = 2
  end
  object Query: TFDQuery
    Connection = DMod.FDConn
    Left = 32
    Top = 64
  end
end
