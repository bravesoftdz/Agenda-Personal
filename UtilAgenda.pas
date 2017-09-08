unit UtilAgenda;

interface

uses Forms,SysUtils,StdCtrls,DCPrijndael,DCPsha1;

type
  //el registro TConfig
  TConfig = record
    Password: string;
  end;
  //el registro TContacto
  TContacto = record
    IDContacto: integer;
    Nombre,
    Direccion,
    Correo,
    Otro: string;
    Modificar: boolean;
  end;

var
  Config: TConfig;
  Contacto: TContacto;

  procedure MostrarVentana(AClass: TFormClass);
  function Encriptar(Cadena: string): string;
  function Desencriptar(Cadena: string): string;

implementation

procedure MostrarVentana(AClass: TFormClass);
begin
  with AClass.Create(Application) do
    try
      BorderIcons:=[biSystemMenu];
      BorderStyle:=bsSingle;
      //Color:=;
      KeyPreview:=true;
      Position:=poScreenCenter;
      ShowModal;
    finally Free;
  end;
end;

{Encripta una cadena de caracteres}
function Encriptar(Cadena: string): string;
var
  DCPr: TDCP_rijndael;
begin
  DCPr:=TDCP_rijndael.Create(nil);
  DCPr.InitStr('',TDCP_sha1);
  Result:=DCPr.EncryptString(Cadena);
  DCPr.Burn;
  DCPr.Free;
end;

{Desencripta una cadena de caracteres}
function Desencriptar(Cadena: string): string;
var
  DCPr: TDCP_rijndael;
begin
  DCPr:=TDCP_rijndael.Create(nil);
  DCPr.InitStr('',TDCP_sha1);
  Result:=DCPr.DecryptString(Cadena);
  DCPr.Burn;
  DCPr.Free;
end;

end.
