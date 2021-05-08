unit uAbstractCommandIntf;

interface
type
  {*******************************Command***********************************}
  //Command����ӿ�
  ICommand = interface
  ['{E7A3F56B-4AE6-4438-856A-C8075625B093}']
    //��ȡCommand����
    function GetCaption: string;
    //��ȡ����
    function GetClassName: string;
    //����Command����
    procedure SetCaption(const Value: string);
    //ִ�в���
    procedure Execute;
    //��ȡCommand�����
    function GetObject: Pointer;
    {property}
    // Ϊcommand ��ӱ�����Ϊ���ܹ�����־����Ӹ�command
    property Caption: string read GetCaption write SetCaption;
  end;

implementation

end.
