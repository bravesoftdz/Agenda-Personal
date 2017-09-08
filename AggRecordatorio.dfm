object FAggRecordatorio: TFAggRecordatorio
  Left = 0
  Top = 0
  Caption = 'Agregar recordatorio'
  ClientHeight = 385
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
  object Label2: TLabel
    Left = 238
    Top = 277
    Width = 118
    Height = 16
    Caption = 'D'#237'a del recordatorio:'
  end
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 73
    Height = 16
    Caption = 'Recordatorio'
  end
  object MmRecordat: TMemo
    Left = 48
    Top = 51
    Width = 577
    Height = 142
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MmActividad')
    MaxLength = 100
    ParentFont = False
    TabOrder = 0
    OnChange = MmRecordatChange
  end
  object RGMomRecordat: TRadioGroup
    Left = 48
    Top = 199
    Width = 577
    Height = 57
    Caption = ' Recordar esta actividad '
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'A inicio de mes'
      'A final de mes'
      'Al d'#237'a indicado')
    TabOrder = 1
    WordWrap = True
  end
  object BSalir: TButton
    Left = 550
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 4
    OnClick = BSalirClick
  end
  object BGuardar: TButton
    Left = 264
    Top = 332
    Width = 129
    Height = 33
    Caption = 'Guardar'
    TabOrder = 3
    OnClick = BGuardarClick
  end
  object CBDia: TComboBox
    Left = 374
    Top = 274
    Width = 57
    Height = 24
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29')
  end
  object Query: TFDQuery
    Connection = DMod.FDConn
    Left = 320
    Top = 96
  end
end
