unit ThreadPoolRegister;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ThreadPool,
  DsgnIntf, StdCtrls, Buttons, Spin, ExtCtrls;

type
  TfrmPoolOfThreadEditor = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    seMin: TSpinEdit;
    seMax: TSpinEdit;
    seDeadTimeOut: TSpinEdit;
    Panel2: TPanel;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    StaticText1: TLabel;
    StaticText2: TStaticText;
    Label6: TLabel;
    Label7: TLabel;
    procedure StaticText2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPoolOfThreadComponentEditor = class (TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation
uses
  Consts, ShellAPI;

{$R *.DFM}
{$R ThreadPool.dcr}

procedure Register;
begin
  RegisterComponents('System', [TPoolOfThreads]);
  RegisterComponentEditor(TPoolOfThreads, TPoolOfThreadComponentEditor);
end;


{ TPoolOfThreadComponentEditor }

procedure TPoolOfThreadComponentEditor.ExecuteVerb(Index: Integer);
begin
  if Index=0 then
    with TfrmPoolOfThreadEditor.Create(nil) do
    try
      if Component.Owner=nil then
        Caption := Component.Name + ' - Pool of thread'
      else
        Caption := Component.Owner.Name+'.'+Component.Name + ' - Pool of thread';
      seMin.Value := TPoolOfThreads(Component).ThreadsMin;
      seMax.Value := TPoolOfThreads(Component).ThreadsMax;
      seDeadTimeOut.Value := TPoolOfThreads(Component).ThreadDeadTimeout div 1000;
      if ShowModal<>mrOK then
        Exit;
      TPoolOfThreads(Component).ThreadsMin := seMin.Value;
      TPoolOfThreads(Component).ThreadsMax := seMax.Value;
      TPoolOfThreads(Component).ThreadDeadTimeout := seDeadTimeOut.Value * 1000;
    finally
      Free;
    end
  else
    raise EListError.CreateFmt(SListIndexError, [Index]);
end;

function TPoolOfThreadComponentEditor.GetVerb(Index: Integer): string;
begin
  if Index=0 then
    Result := '&Edit...'
  else
    raise EListError.CreateFmt(SListIndexError, [Index]);
end;

function TPoolOfThreadComponentEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TfrmPoolOfThreadEditor.StaticText2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'mailto: AKPetrov@pisem.net',nil, nil, SW_SHOWNORMAL);
end;

end.
