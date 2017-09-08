unit CambPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UtilAgenda;

type
  TFCambPassword = class(TForm)
    BSalir: TButton;
    Query: TFDQuery;
    BAceptar: TButton;
    Label1: TLabel;
    EPasswActual: TEdit;
    EPassw1: TEdit;
    Label2: TLabel;
    EPassw2: TEdit;
    Label3: TLabel;
    procedure BAceptarClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCambPassword: TFCambPassword;

implementation

{$R *.dfm}

procedure TFCambPassword.BAceptarClick(Sender: TObject);
begin
  if (Encriptar(EPasswActual.Text)=Config.Password) and
     (EPassw1.Text=EPassw2.Text) then
  begin
    if (MessageDlg('�Desea guardar la nueva contrase�a?',mtConfirmation,[mbYes,
       mbNo],0)=mrYes) then
    begin
      Query.SQL.Text:='update Config set Password=:psw';
      Query.ParamByName('psw').AsString:=Encriptar(EPassw2.Text);
      Query.ExecSQL;
      Config.Password:=Encriptar(EPassw2.Text);
      ShowMessage('La nueva contrase�a se cambi� exitosamente');
    end
    else ShowMessage('No se guard� la nueva contrase�a');
    BSalir.SetFocus;
  end
  else
  begin
    ShowMessage('La(s) contrase�a(s) no coincide(n)');
    EPasswActual.SetFocus;
  end;
end;

procedure TFCambPassword.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFCambPassword.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

end.
