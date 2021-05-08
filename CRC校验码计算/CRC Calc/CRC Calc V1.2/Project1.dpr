program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormMain},
  Unit_CRC in 'Unit_CRC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
