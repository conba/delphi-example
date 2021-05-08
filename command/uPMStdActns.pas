unit uPMStdActns;

interface
uses
  SysUtils, Classes, ActnList, uAbstractCommandIntf, Forms;

type
  TOnInitCommandEvent = procedure(ACommand: ICommand) of object;
  TOnValidateEvent = function: Boolean of object;

  TPMAction = class(TAction)
  private
    FRadioitem: Boolean;
    FCommandClass: TClass;
    FOnInitCommandEvent: TOnInitCommandEvent;
    FOnValidateEvent: TOnValidateEvent;
    procedure SetRadioitem(const Value: Boolean);
    procedure DoCommandExecute(sender: TObject);
  protected
    function NewCommandInstance: ICommand; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; override;
    procedure SetCommandClass(ACommandClass: TClass);
  published
    property Radioitem: Boolean read FRadioitem write SetRadioitem;
    property OnInitCommandEvent: TOnInitCommandEvent read FOnInitCommandEvent
      write FOnInitCommandEvent;
    property OnValidateEvent: TOnValidateEvent read FOnValidateEvent
      write FOnValidateEvent;
  end;

implementation
uses
  uAbstractCommand;

procedure AppendFiledata(FileName, Data: string; bAddData: Boolean = False);
var
  TF: TextFile;
  StrDire: string;
begin
  try
    Data := FormatDateTime('yy-MM-DD HH:MM:SS', Now()) + '  ' + Data + #13;
    StrDire := ExtractFilePath(FileName);
    if StrDire <> '' then
      ForceDirectories(StrDire);

    AssignFile(tf,FileName);
    if FileExists(FileName) then
      append(tf)
    else
      rewrite(tf);

    writeln(tf, Data);
    closefile(tf);
  except
  end;
end;
{ TPMAction }

constructor TPMAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Enabled := True;
  OnExecute := DoCommandExecute;
end;

destructor TPMAction.Destroy;
begin

  inherited;
end;

procedure TPMAction.DoCommandExecute(sender: TObject);
var
  aCommand: ICommand;
  AFileName: string;
begin
  // 创建一个Command对象
  aCommand = NewCommandInstance;
  try
    if aCommand <> nil then
    begin
      // 在执行前先初始化
      if Assigned(FOnInitCommandEvent) then
        OnInitCommandEvent(aCommand);
      // 执行前先判断那些是否可执行
      if Assigned(FOnValidateEvent) then
        if not OnValidateEvent then Exit;
      aCommand.Execute;
      AFileName := ExtractFilePath(Application.ExeName) + 'pmss.log';
      AppendFiledata(AFileName, aCommand.GetClassName + ' ' + aCommand.Caption);
    end;
  except
    on e: Exception do
    begin
      AppendFiledata('ys.log', 'Action Name:' + Self.Name);
      raise Exception.Create('Action Execute Exception：' + e.Message);
    end;
  end;
end;

function TPMAction.Execute: Boolean;
begin
  Result := inherited Execute;
end;

function TPMAction.NewCommandInstance: ICommand;
var
  Instance: TCommand;
  CommandInstance: ICommand;
begin
  Result := nil;
  // 首先检测CommandClass是否存在
  if FCommandClass <> nil then
  begin
    // 首先创建一个实例，必须通过TBusinessCommand 向上转型
    Instance := TCommand(FCommandClass.NewInstance);
    Instance.Create;
    if Supports(Instance, ICommand, CommandInstance) then
      Result := CommandInstance;
  end;
end;

procedure TPMAction.SetCommandClass(ACommandClass: TClass);
begin
  FCommandClass := ACommandClass;
end;

procedure TPMAction.SetRadioitem(const Value: Boolean);
begin
  FRadioitem := Value;
end;

end.
