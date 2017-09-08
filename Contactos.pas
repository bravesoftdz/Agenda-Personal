unit Contactos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ComCtrls, Mask, DBCtrls,
  UtilAgenda, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TFContactos = class(TForm)
    SBar: TStatusBar;
    DS: TDataSource;
    DBGrid: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    BAgregar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    EFiltro: TEdit;
    DST: TDataSource;
    BModificar: TButton;
    BSalir: TButton;
    QryLista: TFDQuery;
    QryTlf: TFDQuery;
    Query: TFDQuery;
    PpMenu: TPopupMenu;
    Modificarcontacto1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure EFiltroChange(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure BSalirClick(Sender: TObject);
    procedure BAgregarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Modificarcontacto1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarListado;
  public
    { Public declarations }
  end;

var
  FContactos: TFContactos;

implementation

uses DataMod,AggContacto;

{$R *.dfm}

procedure TFContactos.ActualizarListado;
begin
  QryLista.SQL.Text:='select * from Contactos order by Nombre';
  QryLista.Open;
  SBar.SimpleText:=' Total contactos registrados: '+IntToStr(QryLista.RecordCount);
end;

procedure TFContactos.FormShow(Sender: TObject);
begin
  EFiltro.Clear;
  EFiltro.SetFocus;
  ActualizarListado;
end;

procedure TFContactos.Modificarcontacto1Click(Sender: TObject);
begin
  BModificar.Click;
end;

procedure TFContactos.EFiltroChange(Sender: TObject);
var
  Cad: string;
begin
  Cad:=QuotedStr('%'+EFiltro.Text+'%');
  QryLista.SQL.Text:='select * from Contactos where Nombre like '+
                     Cad+' order by Nombre';
  QryLista.Open;
  SBar.SimpleText:=' Total contactos registrados: '+IntToStr(QryLista.RecordCount);
end;

procedure TFContactos.DSDataChange(Sender: TObject; Field: TField);
begin
  BModificar.Enabled:=not QryLista.IsEmpty;
  if not QryLista.IsEmpty then
  begin
    //se carga el registro del contacto marcado en el dbgrid:
    Contacto.IDContacto:=QryLista.FieldByName('IDContacto').AsInteger;
    Contacto.Nombre:=QryLista.FieldByName('Nombre').AsString;
    Contacto.Direccion:=QryLista.FieldByName('Direccion').AsString;
    Contacto.Correo:=QryLista.FieldByName('Correo').AsString;
    Contacto.Otro:=QryLista.FieldByName('Otro').AsString;
    //se muestran los teléfonos del contacto:
    QryTlf.SQL.Text:='select * from Telefonos where IDContacto=:idc';
    QryTlf.ParamByName('idc').AsInteger:=Contacto.IDContacto;
    QryTlf.Open;
  end;
end;

procedure TFContactos.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFContactos.BAgregarClick(Sender: TObject);
begin
  Contacto.Modificar:=TButton(Sender).Caption='Modificar contacto...';
  MostrarVentana(TFAggContacto);
  ActualizarListado;
end;

procedure TFContactos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    SelectNext(ActiveControl{ as TWinControl},True,True);
    Key := #0;
  end;
end;

end.
