program Project5;

uses
  ExceptionLog,
  Forms,
  uFrmGameStart in 'uFrmGameStart.pas' {frmGame},
  uPlayer in 'uPlayer.pas',
  uWeapon in 'uWeapon.pas',
  uMonster in 'uMonster.pas',
  uPlayerA in 'uPlayerA.pas',
  uFrmWeapon in 'uFrmWeapon.pas' {FrmWeapon},
  uSword in 'uSword.pas',
  uBow in 'uBow.pas',
  uGosla in 'uGosla.pas',
  uGame in 'uGame.pas',
  uConst in 'uConst.pas',
  uFrmPlayer in 'uFrmPlayer.pas' {FrmPlayer},
  uWindRunner in 'uWindRunner.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TfrmGame, frmGame);
  Application.Run;
end.
