program Project1;

uses
  Forms,
  mian in 'mian.pas' {Form1},
  ufmQtxmCalculator in 'ufmQtxmCalculator.pas' {fmQtxmCalculator},
  Unit2 in 'Unit2.pas' {Form2},
  uQtxmCalculatorConst in 'uQtxmCalculatorConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmQtxmCalculator, fmQtxmCalculator);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
