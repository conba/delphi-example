program Project5;

uses
  Forms,
  Unit13 in 'Unit13.pas' {Form13},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
