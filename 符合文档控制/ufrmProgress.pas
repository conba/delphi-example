{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：进度条                                     }
{ 单元作者：Wenxh                                      }
{ 创建时间：2011.06.27                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2013-12-17 Wenxh 修正UpdateProgress可能存在的报错
{******************************************************}

unit ufrmProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxProgressBar,
  uPMProgressBar;

type
  TfrmProgress = class(TForm)
    pnlContainer: TShape;
    lblTitle: TLabel;
    Label1: TLabel;
    lblPer: TLabel;
    Timer1: TTimer;
    ProgressBar: TProgressBar;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowProgress(const aTitle: string; aMax: Integer = 100; bSysOnTop: boolean = false);
procedure ChangeProgressMode(bMarquee: Boolean= True);
procedure HideProgress;
procedure UpdateProgress(aValue: Integer = 1);
procedure UpdateProgressTitle(const aTitle: string);
function GetProgressTitle: string;
procedure UpdateProgressMax(aValue: Integer);
procedure GotoProgressMax;
procedure IncessantlyProgress;
function IsInProcess: boolean;

implementation
{$R *.dfm}

var
  frmProgress: TfrmProgress;

function IsInProcess: boolean;
begin
  Result := (frmProgress <> nil);
end;

procedure ShowProgress(const aTitle: string; aMax: Integer = 100; bSysOnTop: boolean = false);
begin
  if not Assigned(frmProgress) then
    frmProgress := TfrmProgress.Create(Application.MainForm);
  if bSysOnTop then
    frmprogress.FormStyle :=  fsStayOnTop;
  frmProgress.lblTitle.Caption := aTitle;
  frmProgress.ProgressBar.Max := aMax;
//  frmProgress.ProgressBar.Properties.Max := aMax;
  frmProgress.Show;
  EnableWindow(Application.Handle, False);
  frmProgress.Update;
end;

procedure ChangeProgressMode(bMarquee: Boolean= True);
begin
  if not Assigned(frmProgress) then Exit;
  if  bMarquee then
    frmProgress.ProgressBar.Style := pbstMarquee
  else
    frmProgress.ProgressBar.Style := pbstNormal;
end;

procedure HideProgress;
begin
  if not Assigned(frmProgress) then Exit;
  EnableWindow(Application.Handle, True);
  frmProgress.Timer1.Enabled := False;
  frmProgress.Hide;
  frmProgress.Free;
  frmProgress := nil;
end;

procedure UpdateProgress(aValue: Integer = 1);
var
  iPosition: Integer;
  aPosition, aMax: Double;
begin
  if Assigned(frmProgress) then
  begin
    iPosition := 100;
    aMax := frmProgress.ProgressBar.Max;
    frmProgress.ProgressBar.Position := frmProgress.ProgressBar.Position + aValue;

    aPosition := frmProgress.ProgressBar.Position;
    if aMax <> 0 then
      iPosition := Round(aPosition / aMax * 100);
    if iPosition < 0 then
      iPosition := Abs(iPosition);
    frmProgress.lblPer.Caption := Format('%-3d%%', [iPosition]);
    frmProgress.Update;
    Application.ProcessMessages;
  end;
end;

procedure UpdateProgressTitle(const aTitle: string);
begin
  if Assigned(frmProgress) then
  begin
    frmProgress.lblTitle.Caption := aTitle;
    frmProgress.Update;
    Application.ProcessMessages;
  end;
end;

function GetProgressTitle: string;
begin
  Result := '';
  if Assigned(frmProgress) then
  begin
    Result := frmProgress.lblTitle.Caption;
  end;
end;

procedure UpdateProgressMax(aValue: Integer);
begin
  if Assigned(frmProgress) then
  begin
    if aValue <= 0 then
      aValue := 1;
    frmProgress.ProgressBar.Max := aValue;
    frmProgress.Update;
    Application.ProcessMessages;
  end;
end;

procedure GotoProgressMax;
begin
  if Assigned(frmProgress) then
  begin
    frmProgress.ProgressBar.Position := frmProgress.ProgressBar.Max;
    frmProgress.Update;
    Application.ProcessMessages;
  end;
end;

procedure IncessantlyProgress;
begin
  if Assigned(frmProgress) then
    frmProgress.Timer1.Enabled := True;
end;

procedure TfrmProgress.Timer1Timer(Sender: TObject);
begin
  if ProgressBar.Position = ProgressBar.Max then
    ProgressBar.Position := 0;
  ProgressBar.Position := ProgressBar.Position + 10;
end;

initialization
  frmProgress := nil;

end.

