unit uAbstractCommandIntf;

interface
type
  {*******************************Command***********************************}
  //Command基类接口
  ICommand = interface
  ['{E7A3F56B-4AE6-4438-856A-C8075625B093}']
    //获取Command标题
    function GetCaption: string;
    //获取类名
    function GetClassName: string;
    //设置Command标题
    procedure SetCaption(const Value: string);
    //执行操作
    procedure Execute;
    //获取Command类对象
    function GetObject: Pointer;
    {property}
    // 为command 添加标题是为了能够在日志中添加该command
    property Caption: string read GetCaption write SetCaption;
  end;

implementation

end.
