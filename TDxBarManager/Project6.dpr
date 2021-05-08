program Project6;

uses
  Forms,
  Unit13 in 'Unit13.pas' {Form13},
  uIMan in 'uIMan.pas',
  uTChineseMan in 'uTChineseMan.pas',
  uTEnglish in 'uTEnglish.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
