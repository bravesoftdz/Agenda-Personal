unit AggContacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, DB, UtilAgenda, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  THackSGrid = class(TStringGrid);
  TFAggContacto = class(TForm)
    ENombre: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EDirec: TEdit;
    ECorreo: TEdit;
    EOtro: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    ENumero: TEdit;
    CBTipo: TComboBox;
    BAggNum: TButton;
    SGrid: TStringGrid;
    BGuardar: TButton;
    BSalir: TButton;
    Query: TFDQuery;
    PMenu: TPopupMenu;
    Modificarestenmero1: TMenuItem;
    Eliminarestenmero1: TMenuItem;
    BCancelar: TButton;
    procedure BGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BAggNumClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ENombreExit(Sender: TObject);
    procedure ENombreChange(Sender: TObject);
    procedure ENumeroChange(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure Eliminarestenmero1Click(Sender: TObject);
    procedure Modificarestenmero1Click(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValInicial;
    procedure ActivaBGuardar;
    procedure ActivaBAggNum;
    procedure GuardarContacto;
  public
    { Public declarations }
  end;

var
  FAggContacto: TFAggContacto;
  NumModificado: boolean;
  FilaAModificar: byte;

implementation

{$R *.dfm}

uses DataMod;

procedure TFAggContacto.ValInicial;
begin
  ENombre.SetFocus;
  ENombre.Clear;
  EDirec.Clear;
  ECorreo.Clear;
  EOtro.Clear;
  ENumero.Clear;
  CBTipo.ItemIndex:=-1;
  SGrid.RowCount:=2;
  SGrid.Cells[0,1]:='';
  SGrid.Cells[1,1]:='';
  ActivaBGuardar;
  ActivaBAggNum;
end;

procedure TFAggContacto.ActivaBGuardar;
begin
  BGuardar.Enabled:=(ENombre.Text<>'') and (SGrid.Cells[0,1]<>'');
end;

procedure TFAggContacto.ActivaBAggNum;
begin
  BAggNum.Enabled:=(ENumero.Text<>'') and (CBTipo.Text<>'');
end;

procedure TFAggContacto.GuardarContacto;
var
  I: byte;
  Texto: string;
begin
  Contacto.Nombre:=Trim(ENombre.Text);
  Contacto.Direccion:=Trim(EDirec.Text);
  Contacto.Correo:=Trim(ECorreo.Text);
  Contacto.Otro:=Trim(EOtro.Text);
  if Contacto.Modificar then
  begin
    Query.SQL.Text:='update Contactos set Nombre=:nom,Direccion=:dir,'+
      'Correo=:crr,Otro=:otr where IDContacto=:idc';
    Texto:='actualizado';
  end
  else
  begin
    Query.SQL.Text:='insert into Contactos (Nombre,Direccion,Correo,Otro) '+
                    'values (:nom,:dir,:crr,:otr)';
    Texto:='agregado';
  end;
  Query.ParamByName('nom').AsString:=Contacto.Nombre;
  Query.ParamByName('dir').AsString:=Contacto.Direccion;
  Query.ParamByName('crr').AsString:=Contacto.Correo;
  Query.ParamByName('otr').AsString:=Contacto.Otro;
  Query.ExecSQL;
  //en caso de ser un nuevo contacto, obtener la clave primaria:
  if not Contacto.Modificar then
  begin
    Query.SQL.Text:='select max(IDContacto) as IDCont from Contactos';
    Query.Open;
    Contacto.IDContacto:=Query.FieldByName('IDCont').AsInteger;
  end;
  //se eliminan los teléfonos existentes:
  Query.SQL.Text:='delete from Telefonos where IDContacto=:idc';
  Query.ParamByName('idc').AsInteger:=Contacto.IDContacto;
  Query.ExecSQL;
  //se agregan los teléfonos del stringgrid:
  for I:=1 to SGrid.RowCount-1 do
  begin
    Query.SQL.Text:='insert into Telefonos (IDContacto,Numero,Tipo) values '+
                    '(:idc,:num,:tip)';
    Query.ParamByName('idc').AsInteger:=Contacto.IDContacto;
    Query.ParamByName('num').AsString:=SGrid.Cells[0,I];
    Query.ParamByName('tip').AsString:=SGrid.Cells[1,I];
    Query.ExecSQL;
  end;
  ShowMessage('El contacto fue '+Texto+' exitosamente');
  Close;
end;

procedure TFAggContacto.BGuardarClick(Sender: TObject);
begin
  if not Contacto.Modificar then
  begin
    Query.SQL.Text:='select Nombre from Contactos where Nombre=:nom';
    Query.ParamByName('nom').AsString:=Trim(ENombre.Text);
    Query.Open;
    if Query.IsEmpty then GuardarContacto
    else
    begin
      ShowMessage('Este nombre ya está registrado');
      ENombre.SetFocus;
    end;
  end
  else GuardarContacto;
end;

procedure TFAggContacto.FormShow(Sender: TObject);
var
  I: byte;
begin
  ValInicial;
  SGrid.Cells[0,0]:='Número';
  SGrid.Cells[1,0]:='Tipo';
  if Contacto.Modificar then
  begin
    BGuardar.Caption:='Actualizar';
    ENombre.Text:=Contacto.Nombre;
    EDirec.Text:=Contacto.Direccion;
    ECorreo.Text:=Contacto.Correo;
    EOtro.Text:=Contacto.Otro;
    Query.SQL.Text:='select * from Telefonos where IDContacto=:idc';
    Query.ParamByName('idc').AsInteger:=Contacto.IDContacto;
    Query.Open;
    if Query.IsEmpty then SGrid.RowCount:=Query.RecordCount+2
    else SGrid.RowCount:=Query.RecordCount+1;
    for I:=1 to Query.RecordCount do
    begin
      SGrid.Cells[0,I]:=Query['Numero'];
      SGrid.Cells[1,I]:=Query['Tipo'];
      Query.Next;
    end;
    BGuardar.Enabled:=true;
  end;

end;

procedure TFAggContacto.Modificarestenmero1Click(Sender: TObject);
begin
  ENumero.Text:=SGrid.Cells[0,SGrid.Row];
  CBTipo.ItemIndex:=CBTipo.Items.IndexOf(SGrid.Cells[1,SGrid.Row]);
  FilaAModificar:=SGrid.Row;
  NumModificado:=true;
  BAggNum.Caption:='Modificar número';
  ActivaBAggNum;
end;

procedure TFAggContacto.BAggNumClick(Sender: TObject);
begin
  if NumModificado then
  begin
    SGrid.Cells[0,FilaAModificar]:=ENumero.Text;
    SGrid.Cells[1,FilaAModificar]:=CBTipo.Text;
  end
  else
  begin
    if (SGrid.RowCount>1) and (SGrid.Cells[0,1]<>'') then
      SGrid.RowCount:=SGrid.RowCount+1;
    SGrid.Cells[0,SGrid.RowCount-1]:=ENumero.Text;
    SGrid.Cells[1,SGrid.RowCount-1]:=CBTipo.Text;
  end;
  ActivaBGuardar;
  ENumero.Clear;
  ENumero.SetFocus;
  CBTipo.ItemIndex:=-1;
end;

procedure TFAggContacto.BCancelarClick(Sender: TObject);
begin
  ENumero.Clear;
  CBTipo.ItemIndex:=-1;
  FilaAModificar:=0;
  NumModificado:=false;
  BAggNum.Caption:='Agregar número';
  ActivaBAggNum;
end;

procedure TFAggContacto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
  begin
    SelectNext(ActiveControl,True,True);
    Key:=#0;
  end;
end;

procedure TFAggContacto.ENombreExit(Sender: TObject);
begin
  TEdit(Sender).Text:=Trim(TEdit(Sender).Text);
end;

procedure TFAggContacto.Eliminarestenmero1Click(Sender: TObject);
begin
  THackSGrid(SGrid).DeleteRow(SGrid.Row);
end;

procedure TFAggContacto.ENombreChange(Sender: TObject);
begin
  ActivaBGuardar;
end;

procedure TFAggContacto.ENumeroChange(Sender: TObject);
begin
  ActivaBAggNum;
end;

procedure TFAggContacto.BSalirClick(Sender: TObject);
begin
  Close;
end;

end.
