{******************************************************}
{ ��Ʒ���ƣ�PMSL3.0                                    }
{ ��Ԫ�������Ի���                             }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2015-4-10                                  }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
// 2015-4-10 Wenxh ���ӣ��������ò���
{******************************************************}
unit MessageDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, cxButtons,
  uPMButton, dxGDIPlusClasses;


const
  ButtonBetween = 20;    //button���          2017-5-24
  ButtonWidth = 75;     //Button��
  LeftSide = 16;        //��߾�
  RightSide = 16;       //�ұ߾�
  SingleRowMaxCharacter = 100;    //������ʾ��ʾ����ַ�����
  ButtonAreaHeight = 56;      //button��������ĸ߶�
  BorderTotalHeight = 34;    //����߿���ܸ߶�(����������)
  BorderTotalWidth = 8;      //����߿���ܿ�ȶ�

type
  //Button����
  TMessageBoxButton = (MI_OK, MI_OKCancel, MI_YesNo, MI_YesNoCancel, MI_YesAllNoAllCancel);
  //ICON����
  TMessageBoxIcon = (MI_Infomation, MI_Warning, MI_Error, MI_Question);
  //�������� MR_Close=������ϽǵĹرհ�ť
  TMessageBoxResult = (MR_None, MR_OK, MR_Yes, MR_No, MR_Cancel, MR_YesToAll, MR_NoToAll, MR_Close);
  TMessageBoxResultSet = set of TMessageBoxResult;
const
  // ȡ������ ����
  cst_MessageBoxResult_CancelSet = [MR_Cancel, MR_Close];

type
  TfrmMessageBox = class(TForm)
    imgError: TImage;
    lblPrompt: TLabel;
    imgInfo: TImage;
    imgWarning: TImage;
    imgQuestion: TImage;
    btnOK: TPMButton;
    btnYesAll: TPMButton;
    btnYes: TPMButton;
    btnNo: TPMButton;
    btnCancel: TPMButton;
    btnNoAll: TPMButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FbCanceled: Boolean; // ���ȡ����ť
    FDefaultFocusedButton: TMessageBoxResult;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  // �¼���һ������ AButtonCaptions �����滻 ��ť������
  function dsMessageBox(AOwner: TComponent; const AText, ACaption: PChar;
    AButtonFlag: TMessageBoxButton; AIconFlag: TMessageBoxIcon;
    ADefaultFocusedButton: TMessageBoxResult; AButtonCaptions: array of string):
    TMessageBoxResult; overload;

  function dsMessageBox(AOwner: TComponent; const AText, ACaption: PChar;
    AButtonFlag: TMessageBoxButton; AIconFlag: TMessageBoxIcon;
    ADefaultFocusedButton: TMessageBoxResult = MR_None): TMessageBoxResult;
    overload;

implementation

{$R *.dfm}

//��#13#10�����Դ�ַ���ʹ����ʾ�ڽ����е�str�������
function AdjustString(str: string): string;
var
  lstr: string;
  ReturnPos: Integer;   //�س����з���(#13#10)��λ��
  strlen: Integer;   //Դ�ַ����ĳ���
  maxchar: Integer;  //һ�������ַ�����
//  operstr: string;  //�����ֽڵķ���
//  ischioper: boolean;  //�Ƿ����ķ���
begin
  Result := str;
  strlen := Length(str);
  if strlen > SingleRowMaxCharacter then
  begin
    //�����SingleRowMaxCharacter���ַ��Ǻ���
    //ȡlstrʱ,Copy�ĵڶ�����������2,��Ϊ�˴���SingleRowMaxCharacter���ַ������#13#10�����
    if ByteType(str, SingleRowMaxCharacter) <> mbSingleByte then
    begin
      maxchar := SingleRowMaxCharacter -1;
//      operstr := Copy(str, maxchar, 2);
//      if (operstr = '��') or (operstr = '��') or (operstr = '��') or
//          (operstr = '��') or (operstr = '��') or (operstr = '��') or
//          (operstr = '��') or (operstr = '��') then
//      begin
//        maxchar := SingleRowMaxCharacter - 2;
//        ischioper := true;
//      end;
    end
    else
    begin
      maxchar := SingleRowMaxCharacter;
    end;

    lstr := Copy(str, 1, maxchar + 2);
    //��������SingleRowMaxCharacter���ַ�ĩβ���#13#10
    ReturnPos := Pos(#13#10, lstr);
    if ReturnPos > 0 then
    begin
      Result := Copy(str, 1, ReturnPos) +
          AdjustString(Copy(str, ReturnPos+2, strlen));
    end
    else
    begin
//      if ischioper then
//        Result := lstr + #13#10 + AdjustString(Copy(str, maxchar+3, strlen))
//      else
        Result := lstr + #13#10 + AdjustString(Copy(str, maxchar+1, strlen));
    end;
  end;
end;

function dsMessageBox(AOwner: TComponent; const AText, ACaption: PChar;
  AButtonFlag: TMessageBoxButton; AIconFlag: TMessageBoxIcon;
  ADefaultFocusedButton: TMessageBoxResult; AButtonCaptions: array of string):
  TMessageBoxResult; overload;
var
  minwidth: Integer;  //������С�Ŀ��
begin
  Result := MR_None;
  with TfrmMessageBox.Create(AOwner) do
  begin
    FDefaultFocusedButton := ADefaultFocusedButton;
    Caption := ACaption;
    //������ʾ��Ϣ����lblPrompt�Ļ���
    lblPrompt.Caption := AdjustString(AText);
    
    //������ʾ��Ϣ���ƴ����С
    Width := lblPrompt.Left + lblPrompt.Width + RightSide;
    Height := lblPrompt.Top + lblPrompt.Height + ButtonAreaHeight + BorderTotalHeight;

    //Icon��ʾ
    case AIconFlag of
      MI_Infomation:
        imgInfo.Visible := true;
      MI_Warning:
        imgWarning.Visible := true;
      MI_Error:
        imgError.Visible := true;
      MI_Question:
        imgQuestion.Visible := true;
    end;

    //Button��ʾ,����ȷ������Ŀ��,Ȼ��ȷ��Button��λ��
    case AButtonFlag of
      MI_OK:
        begin
          btnOK.Visible := true;

          //����Ŀ��
          minwidth := ButtonWidth + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //��ť����
          btnOK.Left := (Width - ButtonWidth - BorderTotalWidth) div 2 + 4;
          btnOK.Default := true;
          btnOK.Cancel := true;
          if Length(AButtonCaptions) > 0 then
            btnOK.Caption := AButtonCaptions[0];
        end;
      MI_OKCancel:
        begin
          btnOK.Visible := true;
          btnCancel.Visible := true;

          //����Ŀ��
          minwidth := 2*ButtonWidth + ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //��ť����
          btnOK.Left := (Width - 2*ButtonWidth - ButtonBetween - BorderTotalWidth) div 2 + 4;
          btnCancel.Left := btnOK.Left + ButtonWidth + ButtonBetween;
          btnOK.Default := true;
          btnCancel.Cancel := True;
          if Length(AButtonCaptions) > 0 then
            btnOK.Caption := AButtonCaptions[0];
          if Length(AButtonCaptions) > 1 then
            btnCancel.Caption := AButtonCaptions[1];
        end;
      MI_YesNo:
        begin
          btnYes.Visible := true;
          btnNo.Visible := true;

          //����Ŀ��
          minwidth := 2*ButtonWidth + ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;
            
          //��ť����
          btnYes.Left := (Width - 2*ButtonWidth - ButtonBetween - BorderTotalWidth) div 2 + 4;
          btnNo.Left := btnYes.Left + ButtonWidth + ButtonBetween;
          btnYes.Default := true;
          btnNo.Cancel := true;
          if Length(AButtonCaptions) > 0 then
            btnYes.Caption := AButtonCaptions[0];
          if Length(AButtonCaptions) > 1 then
            btnNo.Caption := AButtonCaptions[1];
        end;
      MI_YesNoCancel:
        begin
          btnYes.Visible := true;
          btnNo.Visible := true;
          btnCancel.Visible := true;

          //����Ŀ��
          minwidth := 3*ButtonWidth + 2*ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //��ť����
          btnYes.Left := (Width - 3*ButtonWidth - 2*ButtonBetween - BorderTotalWidth) div 2 + 4;
          btnNo.Left := btnYes.Left + ButtonWidth + ButtonBetween;
          btnCancel.Left := btnNo.Left + ButtonWidth + ButtonBetween;
          btnYes.Default := true;
          btnCancel.Cancel  := true;
          if Length(AButtonCaptions) > 0 then
            btnYes.Caption := AButtonCaptions[0];
          if Length(AButtonCaptions) > 1 then
            btnNo.Caption := AButtonCaptions[1];
          if Length(AButtonCaptions) > 2 then
            btnCancel.Caption := AButtonCaptions[2];
        end;
      MI_YesAllNoAllCancel:
        begin
          btnYes.Visible := true;
          btnNo.Visible := true;
          btnCancel.Visible := true;
          btnYesAll.Visible := true;
          btnNoAll.Visible := true;

          //����Ŀ��
          minwidth := 5*ButtonWidth + 4*ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //��ť����
          btnYes.Left := (Width - 5*ButtonWidth - 4*ButtonBetween - BorderTotalWidth) div 2 + 4;
          btnYesAll.Left := btnYes.Left + ButtonWidth + ButtonBetween;
          btnNo.Left := btnYesAll.Left + ButtonWidth + ButtonBetween;
          btnNoAll.Left := btnNo.Left + ButtonWidth + ButtonBetween;
          btnCancel.Left := btnNoAll.Left + ButtonWidth + ButtonBetween;
          btnYes.Default := true;
          btnCancel.Cancel  := true;
          if Length(AButtonCaptions) > 0 then
            btnYes.Caption := AButtonCaptions[0];
          if Length(AButtonCaptions) > 1 then
            btnNo.Caption := AButtonCaptions[1];
          if Length(AButtonCaptions) > 2 then
            btnCancel.Caption := AButtonCaptions[2];
          if Length(AButtonCaptions) > 3 then
            btnYesAll.Caption := AButtonCaptions[3];
          if Length(AButtonCaptions) > 4 then
            btnNoAll.Caption := AButtonCaptions[4];
        end;
    end;

    //�����ö���ʾ
    FormStyle := fsStayOnTop;

    //���ؽ��
    modalresult := ShowModal;
    case modalresult of
      MrOk:
        Result := MR_OK;
      mrCancel:
        if FbCanceled then
          Result := MR_Cancel
        else
          Result := MR_Close;
      mrYes:
        Result := MR_Yes;
      mrNo:
        Result := MR_No;
      mrYesToAll:
        Result := MR_YesToAll;
      mrNoToAll:
        Result := MR_NoToAll;
    end;

    //�ͷ���Դ
    Free;
  end;
end;

function dsMessageBox(AOwner: TComponent; const AText, ACaption: PChar;
  AButtonFlag: TMessageBoxButton; AIconFlag: TMessageBoxIcon;
  ADefaultFocusedButton: TMessageBoxResult = MR_None): TMessageBoxResult;
begin
  Result := dsMessageBox(AOwner, AText, ACaption, AButtonFlag, AIconFlag,
    ADefaultFocusedButton, []);
end;

procedure TfrmMessageBox.btnCancelClick(Sender: TObject);
begin
  FbCanceled := True;
end;

constructor TfrmMessageBox.Create(AOwner: TComponent);
begin
  inherited;
  FbCanceled := False;
  Application.BringToFront; // 2018-10-16 ���Խ������������أ�������ʱ�˴�������������浼�µ㲻�������� -by xkx
end;

procedure TfrmMessageBox.FormShow(Sender: TObject);
begin
  case FDefaultFocusedButton of
    MR_None: ;
    MR_OK: btnOK.SetFocus;
    MR_Yes: btnYes.SetFocus;
    MR_No: btnNo.SetFocus;
    MR_Cancel: btnCancel.SetFocus;
    MR_YesToAll: btnYesAll.SetFocus;
    MR_NoToAll: btnNoAll.SetFocus;
  end;
end;

end.
