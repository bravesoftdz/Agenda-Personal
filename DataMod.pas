unit DataMod;

interface

uses
  SysUtils, Classes, DB, UtilAgenda, Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, FireDAC.Comp.UI, Dialogs;

type
  TDMod = class(TDataModule)
    FDConn: TFDConnection;
    Query: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PasswValido: boolean;
  end;

var
  DMod: TDMod;

implementation

uses Password;

{$R *.dfm}

procedure TDMod.DataModuleCreate(Sender: TObject);
begin
  //FDConn.DatabaseFileName:='DBAgenda.abs';
  FDConn.Connected:=true;
  //si es la primera vez, crear un registro en tabla Config:
 // showmessage('conectado!');
  Query.SQL.Text:='select * from Config';
  Query.Open;
  if Query.RecordCount=0 then
  begin
    Query.SQL.Text:='insert into Config (Password) values (:psw)';
    Query.ParamByName('psw').AsString:=Encriptar('00000000');
    Query.ExecSQL;
  end;
  //se carga todos los valores de configuración del programa:
  Query.SQL.Text:='select * from Config';
  Query.Open;
  Config.Password:=Query['Password'];
  //se muestra la ventana de password inicial:
  MostrarVentana(TFPassw);
  if not PasswValido then
  begin
    FDConn.Connected:=false;
    Application.Terminate;
  end;
end;

end.
