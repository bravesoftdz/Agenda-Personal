unit AggActividad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, {System.DateUtils,} System.UITypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFActividad = class(TForm)
    DTPFecha: TDateTimePicker;
    Label1: TLabel;
    MmActividad: TMemo;
    BGuardar: TButton;
    BSalir: TButton;
    Label2: TLabel;
    Query: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure MmActividadChange(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValInicial;
  public
    { Public declarations }
  end;

var
  FActividad: TFActividad;

implementation

{$R *.dfm}

procedure TFActividad.ValInicial;
begin
  MmActividad.Clear;
  MmActividad.SetFocus;
  DTPFecha.Date:=Date;
  BGuardar.Enabled:=false;
end;

procedure TFActividad.BGuardarClick(Sender: TObject);
begin
  if (MessageDlg('¿Desea guardar esta actividad?',mtConfirmation,
     [mbYes,mbNo],0)=mrYes) then
  begin
    Query.SQL.Text:='insert into Actividades (Descripcion,Fecha) '+
                    'values (:dsc,:fec)';
    Query.ParamByName('dsc').AsString:=Trim(MmActividad.Text);
    Query.ParamByName('fec').AsDate:=DTPFecha.Date;
    Query.ExecSQL;
    ShowMessage('La actividad se guardó exitosamente');
  end
  else ShowMessage('La actividad NO se guardó');
  ValInicial;
end;

procedure TFActividad.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFActividad.FormShow(Sender: TObject);
begin
  ValInicial;
end;

procedure TFActividad.MmActividadChange(Sender: TObject);
begin
  BGuardar.Enabled:=MmActividad.Text<>'';
end;

end.
