unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ActnList, UtilAgenda, System.DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, System.UITypes, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  TActividad = record
    Descripcion: string;
    Fecha: TDate;
    RecActividad: integer;
  end;

  TFPrinc = class(TForm)
    MainMenu: TMainMenu;
    Archivo1: TMenuItem;
    Contactos1: TMenuItem;
    N1: TMenuItem;
    Actividades1: TMenuItem;
    N2: TMenuItem;
    Apuntes1: TMenuItem;
    N3: TMenuItem;
    Salir1: TMenuItem;
    Configuracin1: TMenuItem;
    Cambiodecontrasea1: TMenuItem;
    ActionList: TActionList;
    ActSalir: TAction;
    ActContactos: TAction;
    QueryRec: TFDQuery;
    ActCambPssw: TAction;
    LActiv: TLabel;
    ActActividad: TAction;
    Recordatorio1: TMenuItem;
    ActRecordatorio: TAction;
    LRecord: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBNavigator1: TDBNavigator;
    DS2: TDataSource;
    DBNavigator2: TDBNavigator;
    QueryAct: TFDQuery;
    DS1: TDataSource;
    ImgLogo: TImage;
    procedure ActSalirExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActContactosExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActCambPsswExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActActividadExecute(Sender: TObject);
    procedure ActRecordatorioExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;
  Actividad: array of TActividad;

implementation

uses DataMod,Contactos,AggActividad,AggRecordatorio,CambPassword;

{$R *.dfm}

/// Actions ///

procedure TFPrinc.ActSalirExecute(Sender: TObject);
var
  Opc: boolean;
begin
  Self.FormCloseQuery(Self,Opc);
end;

procedure TFPrinc.ActActividadExecute(Sender: TObject);
begin
  MostrarVentana(TFActividad);
end;

procedure TFPrinc.ActCambPsswExecute(Sender: TObject);
begin
  MostrarVentana(TFCambPassword);
end;

procedure TFPrinc.ActContactosExecute(Sender: TObject);
begin
  MostrarVentana(TFContactos);
end;

procedure TFPrinc.ActRecordatorioExecute(Sender: TObject);
begin
  MostrarVentana(TFAggRecordatorio);
end;

/// Fin Actions ///

procedure TFPrinc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=MessageDlg('¿Desea salir?',mtConfirmation,[mbYes,mbNo],0)=mrYes;
  if CanClose then
  begin
    DMod.FDConn.Connected:=false;
    Application.Terminate;
  end;
end;

procedure TFPrinc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext(ActiveControl as TWinControl,True,True);
    Key:=#0;
  end;
end;

procedure TFPrinc.FormShow(Sender: TObject);
var
  DD,MM,AA: word;
begin
  ImgLogo.Hint:='Agenda Personal'+#13+'          v1.0';
  //se muestran las actividades del día:
  QueryAct.SQL.Text:='select * from Actividades where Fecha=:fch';
  QueryAct.ParamByName('fch').AsDate:=Now;
  QueryAct.Open;
  LActiv.Caption:=LActiv.Caption+IntToStr(QueryAct.RecordCount);
  //se muestran los recordatorios del día:
  DecodeDate(Date,AA,MM,DD);
  if DD=1 then
    QueryRec.SQL.Text:='select * from Recordatorios where Momento=0'
  else
    if (DaysInAMonth(YearOf(Date),MM)=DD) then
      QueryRec.SQL.Text:='select * from Recordatorios where Momento=1'
    else
    begin
      QueryRec.SQL.Text:='select * from Recordatorios where Dia=:dia';
      QueryRec.ParamByName('dia').AsSmallInt:=DD;
    end;
  QueryRec.Open;
  LRecord.Caption:=LRecord.Caption+IntToStr(QueryRec.RecordCount);
end;

end.
