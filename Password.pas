unit Password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, UtilAgenda, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFPassw = class(TForm)
    EPassw: TEdit;
    Label1: TLabel;
    BAceptar: TButton;
    BSalir: TButton;
    Query: TFDQuery;
    procedure BAceptarClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPassw: TFPassw;

implementation

uses DataMod;

{$R *.dfm}

procedure TFPassw.BAceptarClick(Sender: TObject);
begin
  DMod.PasswValido:=Encriptar(EPassw.Text)=Config.Password;
  if DMod.PasswValido then Close
  else
  begin
    ShowMessage('La contraseña no es válida');
    EPassw.SetFocus;
  end;
end;

procedure TFPassw.BSalirClick(Sender: TObject);
begin
  DMod.PasswValido:=false;
  Close;
end;

procedure TFPassw.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

end.
