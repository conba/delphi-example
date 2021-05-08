{******************************************************}
{ 产品名称：PMSL3.0                                    }
{ 单元描述：对话框                             }
{ 单元作者：Wenxh                                      }
{ 创建时间：2015-4-10                                  }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2015-4-10 Wenxh 增加：焦点设置参数
{******************************************************}
unit MessageDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, cxButtons,
  uPMButton, dxGDIPlusClasses;


const
  ButtonBetween = 20;    //button间距          2017-5-24
  ButtonWidth = 75;     //Button宽
  LeftSide = 16;        //左边距
  RightSide = 16;       //右边距
  SingleRowMaxCharacter = 100;    //单行提示显示最大字符个数
  ButtonAreaHeight = 56;      //button所在区域的高度
  BorderTotalHeight = 34;    //窗体边框的总高度(包括标题栏)
  BorderTotalWidth = 8;      //窗体边框的总宽度度

type
  //Button类型
  TMessageBoxButton = (MI_OK, MI_OKCancel, MI_YesNo, MI_YesNoCancel, MI_YesAllNoAllCancel);
  //ICON类型
  TMessageBoxIcon = (MI_Infomation, MI_Warning, MI_Error, MI_Question);
  //返回类型 MR_Close=点击右上角的关闭按钮
  TMessageBoxResult = (MR_None, MR_OK, MR_Yes, MR_No, MR_Cancel, MR_YesToAll, MR_NoToAll, MR_Close);
  TMessageBoxResultSet = set of TMessageBoxResult;
const
  // 取消含义 集合
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
    FbCanceled: Boolean; // 点击取消按钮
    FDefaultFocusedButton: TMessageBoxResult;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  // 新加了一个参数 AButtonCaptions 用来替换 按钮的文字
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

//用#13#10来填充源字符串使得显示在界面中的str不会过长
function AdjustString(str: string): string;
var
  lstr: string;
  ReturnPos: Integer;   //回车换行符号(#13#10)的位置
  strlen: Integer;   //源字符串的长度
  maxchar: Integer;  //一行最多的字符个数
//  operstr: string;  //两个字节的符号
//  ischioper: boolean;  //是否中文符号
begin
  Result := str;
  strlen := Length(str);
  if strlen > SingleRowMaxCharacter then
  begin
    //如果第SingleRowMaxCharacter个字符是汉字
    //取lstr时,Copy的第二个参数都加2,是为了处理SingleRowMaxCharacter个字符后就是#13#10的情况
    if ByteType(str, SingleRowMaxCharacter) <> mbSingleByte then
    begin
      maxchar := SingleRowMaxCharacter -1;
//      operstr := Copy(str, maxchar, 2);
//      if (operstr = '！') or (operstr = '？') or (operstr = '，') or
//          (operstr = '。') or (operstr = '”') or (operstr = '“') or
//          (operstr = '（') or (operstr = '）') then
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
    //在最左面SingleRowMaxCharacter个字符末尾填充#13#10
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
  minwidth: Integer;  //窗体最小的宽度
begin
  Result := MR_None;
  with TfrmMessageBox.Create(AOwner) do
  begin
    FDefaultFocusedButton := ADefaultFocusedButton;
    Caption := ACaption;
    //根据提示信息控制lblPrompt的换行
    lblPrompt.Caption := AdjustString(AText);
    
    //根据提示信息控制窗体大小
    Width := lblPrompt.Left + lblPrompt.Width + RightSide;
    Height := lblPrompt.Top + lblPrompt.Height + ButtonAreaHeight + BorderTotalHeight;

    //Icon显示
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

    //Button显示,首先确定窗体的宽度,然后确定Button的位置
    case AButtonFlag of
      MI_OK:
        begin
          btnOK.Visible := true;

          //窗体的宽度
          minwidth := ButtonWidth + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //按钮居中
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

          //窗体的宽度
          minwidth := 2*ButtonWidth + ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //按钮居中
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

          //窗体的宽度
          minwidth := 2*ButtonWidth + ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;
            
          //按钮居中
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

          //窗体的宽度
          minwidth := 3*ButtonWidth + 2*ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //按钮居中
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

          //窗体的宽度
          minwidth := 5*ButtonWidth + 4*ButtonBetween + LeftSide + RightSide + BorderTotalWidth;
          if Width < minwidth then
            Width := minwidth;

          //按钮居中
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

    //设置置顶显示
    FormStyle := fsStayOnTop;

    //返回结果
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

    //释放资源
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
  Application.BringToFront; // 2018-10-16 尝试解决，因各种因素，导致有时此窗体在主窗体后面导致点不到的问题 -by xkx
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
