unit uAbstractCommand;

interface
uses
  uAbstractCommandIntf;

type
  TCommand = class(TInterfacedObject, ICommand)
  protected
    FCaption: string;
    function GetCaption: string;
    function GetClassName: string;
    procedure SetCaption(Const Value: string);
    //ִ�в���
    procedure Execute; virtual; abstract;
    //��ȡCommand�����
    function GetObject: Pointer;
  public
    constructor Create; virtual;
  end;

implementation

{ TCommand }

constructor TCommand.Create;
begin

end;

function TCommand.GetCaption: string;
begin
  Result := FCaption;
end;

function TCommand.GetClassName: string;
begin
  Result := Self.ClassName;
end;

function TCommand.GetObject: Pointer;
begin
  Result := Self;
end;

procedure TCommand.SetCaption(const Value: string);
begin
  FCaption := Value;
end;

end.
