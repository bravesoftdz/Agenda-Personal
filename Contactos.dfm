object FContactos: TFContactos
  Left = 200
  Top = 140
  Caption = 'Contactos'
  ClientHeight = 565
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBar: TStatusBar
    Left = 0
    Top = 546
    Width = 720
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object EFiltro: TEdit
    Left = 16
    Top = 32
    Width = 345
    Height = 21
    TabOrder = 0
    OnChange = EFiltroChange
  end
  object DBGrid: TDBGrid
    Left = 16
    Top = 80
    Width = 345
    Height = 457
    TabStop = False
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PpMenu
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Touch.ParentTabletOptions = False
    Touch.TabletOptions = [toPressAndHold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Nombre'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 376
    Top = 80
    Width = 337
    Height = 241
    Caption = ' Datos personales '
    TabOrder = 5
    DesignSize = (
      337
      241)
    object Label1: TLabel
      Left = 24
      Top = 16
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
    object Label2: TLabel
      Left = 24
      Top = 56
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
    object Label3: TLabel
      Left = 24
      Top = 120
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
    object Label4: TLabel
      Left = 24
      Top = 160
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
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 297
      Height = 24
      TabStop = False
      DataField = 'Nombre'
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 297
      Height = 49
      TabStop = False
      DataField = 'Direccion'
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 136
      Width = 297
      Height = 24
      TabStop = False
      DataField = 'Correo'
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 176
      Width = 297
      Height = 49
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'Otro'
      DataSource = DS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 376
    Top = 328
    Width = 337
    Height = 153
    Caption = ' Tel'#233'fonos '
    TabOrder = 6
    object DBGrid2: TDBGrid
      Left = 16
      Top = 24
      Width = 305
      Height = 113
      TabStop = False
      DataSource = DST
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Numero'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tipo'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object BAgregar: TButton
    Left = 384
    Top = 28
    Width = 150
    Height = 33
    Caption = 'Agregar contacto...'
    TabOrder = 1
    OnClick = BAgregarClick
  end
  object BModificar: TButton
    Left = 558
    Top = 28
    Width = 150
    Height = 33
    Caption = 'Modificar contacto...'
    TabOrder = 2
    OnClick = BAgregarClick
  end
  object BSalir: TButton
    Left = 639
    Top = 504
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 7
    OnClick = BSalirClick
  end
  object DS: TDataSource
    DataSet = QryLista
    OnDataChange = DSDataChange
    Left = 200
    Top = 248
  end
  object DST: TDataSource
    DataSet = QryTlf
    Left = 544
    Top = 408
  end
  object QryLista: TFDQuery
    Connection = DMod.FDConn
    Left = 104
    Top = 328
  end
  object QryTlf: TFDQuery
    Connection = DMod.FDConn
    Left = 464
    Top = 408
  end
  object Query: TFDQuery
    Connection = DMod.FDConn
    Left = 312
    Top = 120
  end
  object PpMenu: TPopupMenu
    Left = 112
    Top = 208
    object Modificarcontacto1: TMenuItem
      Caption = 'Modificar contacto...'
      OnClick = Modificarcontacto1Click
    end
  end
end
