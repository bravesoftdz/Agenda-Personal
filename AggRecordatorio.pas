unit AggRecordatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, {System.DateUtils,} Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFAggRecordatorio = class(TForm)
    MmRecordat: TMemo;
    Query: TFDQuery;
    RGMomRecordat: TRadioGroup;
    BSalir: TButton;
    BGuardar: TButton;
    Label2: TLabel;
    Label1: TLabel;
    CBDia: TComboBox;
    procedure BGuardarClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure MmRecordatChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ValInicial;
  public
    { Public declarations }
  end;

var
  FAggRecordatorio: TFAggRecordatorio;

implementation

{$R *.dfm}

procedure TFAggRecordatorio.ValInicial;
begin
  MmRecordat.Clear;
  MmRecordat.SetFocus;
  RGMomRecordat.ItemIndex:=2;
  CBDia.ItemIndex:=0;
  BGuardar.Enabled:=false;
end;

procedure TFAggRecordatorio.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFAggRecordatorio.FormShow(Sender: TObject);
begin
  ValInicial;
end;

procedure TFAggRecordatorio.MmRecordatChange(Sender: TObject);
begin
  BGuardar.Enabled:=MmRecordat.Text<>'';
end;

procedure TFAggRecordatorio.BGuardarClick(Sender: TObject);
var
  Dia: byte;
begin
  //se determina el día del recordatorio:
  case RGMomRecordat.ItemIndex of
    0: Dia:=1;
    1: Dia:=30;
    2: Dia:=StrToInt(CBDia.Text);
  end;
  //
  if (MessageDlg('¿Desea guardar este recordatorio?',mtConfirmation,
     [mbYes,mbNo],0)=mrYes) then
  begin
    Query.SQL.Text:='insert into Recordatorios (Descripcion,Dia,Momento) '+
                    'values (:dsc,:dia,:mom)';
    Query.ParamByName('dsc').AsString:=Trim(MmRecordat.Text);
    Query.ParamByName('dia').AsInteger:=Dia;
    Query.ParamByName('mom').AsInteger:=RGMomRecordat.ItemIndex;
    Query.ExecSQL;
    ShowMessage('El recordatorio se guardó exitosamente');
  end
  else ShowMessage('El recordatorio NO se guardó');
  ValInicial;
end;

end.
