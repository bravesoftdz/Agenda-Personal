object FPassw: TFPassw
  Left = 227
  Top = 334
  Caption = 'FPassw'
  ClientHeight = 231
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 152
    Top = 48
    Width = 65
    Height = 16
    Caption = 'Contrase'#241'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EPassw: TEdit
    Left = 78
    Top = 88
    Width = 227
    Height = 24
    MaxLength = 25
    PasswordChar = '*'
    TabOrder = 0
  end
  object BAceptar: TButton
    Left = 103
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = BAceptarClick
  end
  object BSalir: TButton
    Left = 207
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 2
    OnClick = BSalirClick
  end
  object Query: TFDQuery
    Connection = DMod.FDConn
    Left = 40
    Top = 120
  end
end
