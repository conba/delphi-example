program Project5;

uses
  ExceptionLog,
  Forms,
  Unit13 in 'Unit13.pas' {Form13},
  uSpeakChineseIntf in 'uSpeakChineseIntf.pas',
  uSpeakEnglishIntf in 'uSpeakEnglishIntf.pas',
  uManImpl in 'uManImpl.pas',
  uChineseImpl in 'uChineseImpl.pas',
  uEnglishImpl in 'uEnglishImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
