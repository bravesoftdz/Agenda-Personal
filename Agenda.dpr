{        Agenda Personal
              v1.0

    Autor: Francisco J. Sáez S.

- IDE: Delphi 10 Seattle, Delphi 10.2 Tokyo
- SGBD: Firebird 3.0

      Calabozo, 01/09/2017
}

program Agenda;

uses
  Forms,
  Principal in 'Principal.pas' {FPrinc},
  DataMod in 'DataMod.pas' {DMod: TDataModule},
  Password in 'Password.pas' {FPassw},
  UtilAgenda in 'UtilAgenda.pas',
  Contactos in 'Contactos.pas' {FContactos},
  AggContacto in 'AggContacto.pas' {FAggContacto},
  CambPassword in 'CambPassword.pas' {FCambPassword},
  AggActividad in 'AggActividad.pas' {FActividad},
  AggRecordatorio in 'AggRecordatorio.pas' {FAggRecordatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.Title:='Agenda Personal v1.0';
  Application.CreateForm(TDMod, DMod);
  Application.CreateForm(TFPrinc, FPrinc);
  Application.CreateForm(TFActividad, FActividad);
  Application.CreateForm(TFAggRecordatorio, FAggRecordatorio);
  Application.Run;
end.
