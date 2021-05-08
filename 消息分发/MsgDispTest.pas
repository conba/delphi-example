unit MsgDispTest;

interface
uses
  Dialogs, Messages;

type
  TMyMsg = record   //自定义消息结构
    Msg: Cardinal;  //首4字节必须是消息编号
    MsgText: ShortString; //消息的文字描述
  end;

  TMsgAccepter = class
  private
    procedure AcceptMsg2000(var msg: TMyMsg); message 2000;
    procedure AcceptMsg2002(var msg: TMyMsg); message 2002;
  public
    procedure DefaultHandler(var Message); override;
  end;
implementation

{ TMsgAccepter }

procedure TMsgAccepter.AcceptMsg2000(var msg: TMyMsg);
begin
  ShowMessage('2000的消息，信息是' + msg.MsgText);
end;

procedure TMsgAccepter.AcceptMsg2002(var msg: TMyMsg);
begin
  ShowMessage('2002的消息，信息是' + msg.MsgText);
end;

procedure TMsgAccepter.DefaultHandler(var Message);
begin
//  inherited;
  ShowMessage('不认识的消息' + TMyMsg(message).MsgText);
end;

end.
