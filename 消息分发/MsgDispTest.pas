unit MsgDispTest;

interface
uses
  Dialogs, Messages;

type
  TMyMsg = record   //�Զ�����Ϣ�ṹ
    Msg: Cardinal;  //��4�ֽڱ�������Ϣ���
    MsgText: ShortString; //��Ϣ����������
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
  ShowMessage('2000����Ϣ����Ϣ��' + msg.MsgText);
end;

procedure TMsgAccepter.AcceptMsg2002(var msg: TMyMsg);
begin
  ShowMessage('2002����Ϣ����Ϣ��' + msg.MsgText);
end;

procedure TMsgAccepter.DefaultHandler(var Message);
begin
//  inherited;
  ShowMessage('����ʶ����Ϣ' + TMyMsg(message).MsgText);
end;

end.
