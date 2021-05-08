unit ThreadPool;
{*************************************************************}
{                                                             }
{   ���������� ��� ��������� ������� �������� � ���� �������  }
{                                                             }
{   Copyright (c) 2001, ������� ������, AKPetrov@pisem.net    }
{                                                             }
{    ��� �� ������������� ������������� - ���������           }
{    �� �������� ������������� ������������� -                }
{         ��������� � �������                                 }
{                                                             }
{*************************************************************}
{  ������ ������: � ������� �� ��� ����������� ������� ��     }
{  ���������. ����������������, ��� ��������� - ����������    }
{  ���������.                                                 }
{  ������� ����������� � ���������� �������, ����� �������    }
{  ����������� ���������� � ����������� �� ��������.          }
{*************************************************************}

{���������� �� �������������:

 ������� �� ��������� ���������� ������� AddRequest. ��� ������� ���� ������� ����������
 ������� ������� �� TThreadPoolDataObject �� ����� ������������ ������ ��� �������� ��� ������.
 ������������� ��� ���� ������� ����������� � ����� ������� � �������� ����������.
 � �������� ��������� AddRequest ���������� ��������� ������. ����������� ���������� ����������
 �������������� ����������� ����� ���������� ���������.

 ������ �������������:
   aPool.AddRequest(TMyRequest.Create(�������� 1, �������� 2, ...));

 ������� OnProcessRequest ���������� � ��������� ������ �� ������� ���� � ������������� ���
 ���������� ���������� ���������� ��������.
 �������� � ����������� ������������ VCL � ������ ������� ������ - ������ (��. ������� �� TThread).
 ���� �������������� ������ � �� - ���������� ������������ � ������������� ������������ ���������� � ������ �� �������
 �� ��������� ����������.
 ��� ������������� ������ ���������� ������������� �������: OnThreadInitializing, OnThreadFinalizing

 OnThreadInitializing, OnThreadFinalizing ����� �������������� ��� �������������
 � �������� ������� ��� �� �������� - ���-�� ���������� � ��������� ������.

 ������� OnEmpty ���������� � ��������� ������ �� ������� ����� ������� ���������� ������� ��
 ������� � ����� ���������� ��������� ���������� �������.
}

interface
uses
  Windows,
  Classes;

// ����� ��������� ������������ �����, ��� ������� ������� ������
// ��� ����, ���� ���� ������������, ����� ���������� WriteLog ����������������.
// {$DEFINE NOLOGS}

type
  // TCriticalSection � SycObjs �� �������� � ��������...
  // �� ��� FSection ��������� ������� - �� ��������� :)
  TCriticalSection = class 
  protected
    FSection: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enter;
    procedure Leave;
    function TryEnter: Boolean; // ��� ��� ��� � ������
  end;

type
  // ������ ������������ ����� ������� ����� ��������� ���������� ��� �������.
  TThreadPoolDataObject = class
  public
    // ������� ������������ ��� ���������� ������� � ������� � ������ CheckForDoubles
    // ��� ������ ���������� �������� � �������.
    function IsTheSame(DataObj: TThreadPoolDataObject): Boolean; virtual;
    // ��������� ������������� ����������. ������������ ������ ��� ����������� � Log-��
    // � � ������ ���������. � ������ ��������� (����� NOLOGS ���������) - �� �����.
    function TextForLog: string; virtual;
  end;

type
  TPoolOfThreads = class;

  // ��� ������ ��������� ������ ������ ����. 
  TThreadState = ( tcsInitializing, tcsWaiting, tcsGetting, tcsProcessing, tcsProcessed, tcsTerminating, tcsCheckingDown);
  TThreadInPool = class(TThread)
  private
    // ��������� Event �� ������ ��������.
    hInitFinished: THandle;
    sInitError: string;
  private
    procedure WriteLog(const Str: string; Level: Integer=0);
  protected
    // ��������� (������� ��� ������������) ������ ��� �����������
    FCurState: TThreadState;
    // ������ ���������� ������. ������� ������������ � ������ Terminate
    // � ��������� ��������� ������������ � ��������� ������� �������� � �������.
    hThreadTerminated: THandle;
    // ������ �� �� ���� �������, �������� ����� �����������.
    FPool: TPoolOfThreads;

    // ������, ���������������� � ������ ������ ��� nil.
    csProcessingDataObject: TCriticalSection;
    FProcessingDataObject: TThreadPoolDataObject;
    // ������� ���������, �� �����-�� �� ������ � �����������
    function IamCurrentlyProcess(DataObj: TThreadPoolDataObject):Boolean;

    procedure Execute; override;
  protected
    // ������� ����� �������� ������� �������.
    FAverageWaitingTime: Integer;
    // GetTickCount �� ������ ���������� ����� � ��������� �������� �������
    uWaitingStart: DWORD;
    // ������� ����� ��������� �������
    FAverageProcessing: Integer;
    // GetTickCount �� ������ ���������� ����� � Processing
    uProcessingStart: DWORD;
    // ���������� "��������" �������.
    // ������� ��������� �� ������ �������������, � ��� �������� � ��������� �������� ������ �����������:
    // ��������� �������� ����� ��� 1/3, �������������: 2/9, 4/27 � �.�.
    function NewAverage(OldAvg, NewVal: Integer): Integer;
  protected
    // ������� "����� �����"
    function IsDead: Boolean;
    // ����� �������� - ����� ������� �����
    function isFinished: Boolean;
    // ������� ����� ���������� � ��������� �������� ������� ��� ��������� �� ���������
    // 3 ��������� (� ms). ���� ����� - ���� ����� ��������� ����� �������
    function AverageWaitingTime: DWORD;
    // ������� ����� ��������� ������� - ��� �������������� ����� �������
    function AverageProcessingTime: DWORD;
    // ������� ����, ��� ����� �������� "������������", �.�. �� ����� ���� ������
    function isLoafer: Boolean;
    // ���������� � ���� ������ ���������� � ������ ������.
    function InfoText: string;
  public
    // ��� ���� ��� �������� ����� (��� ������ :)
    Tag: Integer;

    constructor Create(aPool: TPoolOfThreads);
    destructor Destroy; override;

    procedure Terminate;
  end;

  // ���������� ��� ��������/���������� ������.
  // ���� ������� ������������� �������� - ����� Except-����.
  TThreadInPoolInitializing = procedure (Sender: TPoolOfThreads; aThread: TThreadInPool) of object;
  TThreadInPoolFinalizing = procedure (Sender: TPoolOfThreads; aThread: TThreadInPool) of object;

  // ����� ��������� �������. ���������� �� �������...
  TProcessRequest = procedure (Sender: TPoolOfThreads; aDataObj: TThreadPoolDataObject; aThread: TThreadInPool) of object;

  // ����� ����������, �����
  //  1. �� ������� ������ ��������� ������
  //  2. ��������� ����� �������� ���������: ������ ��� � ��������� ��������
  TEmptyKind = (ekQueueEmpty, ekProcessingFinished);
  TQueueEmpty = procedure (Sender: TPoolOfThreads; EmptyKind: TEmptyKind) of object;

  TPoolOfThreads = class(TComponent)
  private
    // �������������� � �������� ������� ������
    FThreadInitializing: TThreadInPoolInitializing;
    FThreadFinalizing: TThreadInPoolFinalizing;
    // ��������� �������
    FProcessRequest: TProcessRequest;
    // ������� �������
    FQueueEmpty: TQueueEmpty;
    procedure WriteLog(const Str: string; Level: Integer=0);
    function GetAuthor: string;
    procedure SetAuthor(const Value: string);
  protected
    // ������ ��������� "�������". ���� �����������, ��������� ������������ ������ "of object"
    // inherited ��� ���� �������� �� �����
    procedure DoThreadInitializing(aThread: TThreadInPool); virtual;
    procedure DoThreadFinalizing(aThread: TThreadInPool); virtual;
    procedure DoProcessRequest(aDataObj: TThreadPoolDataObject; aThread: TThreadInPool); virtual;
    procedure DoQueueEmpty(EmptyKind: TEmptyKind); virtual;
  private
    // ���������� � ������� - ������� ������� ����� TList.Add
    // ������ �� ���������: � ������� ��������� nil. ����� ����������� �����
    // ������� - ����������� Pack
    csQueueManagment: TCriticalSection;
    FQueue: TList;

    // ������ ���������
    csThreadManagment: TCriticalSection;
    FThreads: TList;
    // ��������� ������: ��, ������� ������� Terminate
    FThreadsKilling: TList;

    // ��������� ���������� ��������
    FThreadsMin, FThreadsMax: Integer;
    // ������������ ����� ��������� ������� � ms, ����� �������� ����� ��������� ������,
    // ��� ������ �� ����� ��� �������� (������) � �������� ������
    FThreadDeadTimeout: DWORD;

    // ������� ����� ���������� ������� � ��������� �������� ��������
    function PoolAverageWaitingTime: Integer;
  protected
    // ������� - ������� �������� � �������
    hSemRequestCount: THandle;
    // ��������� ������, �������� ������ 30 ��� ��� ��������:
    // �� ��������� �� ������ � ����.
    hTimCheckPoolDown: THandle;
    // ������� � �������, �� ������� � ������� ��� ����� ������.
    FLastGetPoint: Integer;
    // �������� ����� �������: �� ��������� �� ����.
    procedure CheckPoolDown;
    // ��� �����������?
    procedure CheckThreadsForGrow;
    // ��������� ������ �� �������� � �������� ��� �������������
    procedure KillDeadThreads;
    // ������� ����������.
    procedure FreeFinishedThreads;
    // ������� ���������� ������� ����� ����, ��� �� �������� � ������� �������� ��
    // ��������� ���������� �������� hSemRequestCount
    procedure GetRequest(out Request: TThreadPoolDataObject);
    // ����������, ����� ����� �������� ��������� �������, ���� �������
    // OnEmpty, ���� �����.
    procedure DoProcessed;
  public
    // ��������� ������ � �������.
    // ������� ����� CheckForDoubles ������������� ���������� �������, ����������� ��� ���������� �
    // ������� ��� �� ��������� ����� �� ������� (����� ��������)
    // ���� ���������� �� ��������� (�� ������� �������) ���������� False
    function AddRequest(aDataObject: TThreadPoolDataObject; CheckForDoubles: Boolean = False): boolean; overload;
    // ���� �� ��������� NOLOGS - ���������� � ���� (����� ������� � ��� �� ����������)
    function InfoText: string;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ThreadsMin: Integer read FThreadsMin write FThreadsMin default 0;
    property ThreadsMax: Integer read FThreadsMax write FThreadsMax default 1;
    property ThreadDeadTimeout: DWORD read FThreadDeadTimeout write FThreadDeadTimeout default 0;
    property Author: string read GetAuthor write SetAuthor;

    property OnThreadInitializing: TThreadInPoolInitializing read FThreadInitializing write FThreadInitializing;
    property OnThreadFinalizing: TThreadInPoolFinalizing read FThreadFinalizing write FThreadFinalizing;
    property OnProcessRequest: TProcessRequest read FProcessRequest write FProcessRequest;
    property OnQueueEmpty: TQueueEmpty read FQueueEmpty write FQueueEmpty;
  end;

type
  // ��������� ������ �����.
  TLogWriteProc = procedure (
    const Str: string; // ������ ��� �����������.
    LogID: Integer=0;  // � ����. ������������ ��� ���������� ����� �� thread-��
                       // 0 - �������� Log, ThreadId - ��� ����������� Thread-�
    Level: Integer=0   // ���������� ���������: Level=0 - �����������, 10 - ��������� ������
  );

var
  WriteLog: TLogWriteProc;

implementation
uses
  SysUtils;

{ TThreadPoolDataObject }

function TThreadPoolDataObject.IsTheSame(
  DataObj: TThreadPoolDataObject): Boolean;
begin
  Result := False;
end;

function TThreadPoolDataObject.TextForLog: string;
begin
  Result := 'Request';
end;

{ TPoolOfThreads }

function TPoolOfThreads.AddRequest(aDataObject: TThreadPoolDataObject;
  CheckForDoubles: Boolean): boolean;
var
  i: Integer;
begin
  {$ifndef NOLOGS}WriteLog('AddRequest('+aDataObject.TextForLog+')', 2);{$endif}
  Result := False;
  csQueueManagment.Enter;
  try
    if CheckForDoubles then
      // ����� ���������� �������� � �������
      for i := 0 to FQueue.Count-1 do
        if (FQueue[i]<>nil) and aDataObject.IsTheSame(TThreadPoolDataObject(FQueue[i])) then
          Exit; // ����� - ������
    csThreadManagment.Enter;
    try
      CheckThreadsForGrow;
      if CheckForDoubles then
        // ����� ���������� �������� � ����� � �������.
        for i := 0 to FThreads.Count-1 do
          if TThreadInPool(FThreads[i]).IamCurrentlyProcess(aDataObject) then
            Exit; // ����� - ������

    finally
      csThreadManagment.Leave;
    end;

    FQueue.Add(aDataObject);
    ReleaseSemaphore(hSemRequestCount, 1, nil);
    WriteLog('ReleaseSemaphore(hSemRequestCount)', 1);
    Result := True;
  finally
    csQueueManagment.Leave;
  end;
  {$ifndef NOLOGS}WriteLog('Added Request('+aDataObject.TextForLog+')', 1);{$endif}
end;

procedure TPoolOfThreads.CheckPoolDown;
var
  i: Integer;
begin
  WriteLog('TPoolOfThreads.CheckPoolDown', 1);
  csThreadManagment.Enter;
  try
    WriteLog(InfoText, 2);
    // �������� ������.
    KillDeadThreads;
    // �������� ���������.
    FreeFinishedThreads;

    // ����� ����������: �� ������� �� ����� ������� � ��� ���������
    // ������� �����, ��� ����� ������� ����� �������� ������ � ������� ���������� ����� 50%
    // �� �������� ������� �� ���������
    // ���� ������� ����� - ������ ����� � ���������, ��� �� ����� �����.
    for i := FThreads.Count-1  downto FThreadsMin do
      if TThreadInPool(FThreads[i]).isLoafer then
      begin
        TThreadInPool(FThreads[i]).Terminate;
        FThreadsKilling.Add(FThreads[i]);
        FThreads.Delete(i);
        Break;
      end;
  finally
    csThreadManagment.Leave;
  end;
end;

procedure TPoolOfThreads.CheckThreadsForGrow;
var
  AvgWait: Integer;
  i: Integer;
begin
  csThreadManagment.Enter;
  try

    KillDeadThreads;

    // ���������: ��� �� ���������� � ����������� ����� �������.
    if FThreads.Count<FThreadsMin then
    begin
      WriteLog('FThreads.Count<FThreadsMin', 4);
      // �� ������-�� ������ ��������: ���������� ��������� �� ��������
      for i:=FThreads.Count to FThreadsMin-1 do
      try
        FThreads.Add(TThreadInPool.Create(Self));
      except
        on e: Exception do
          WriteLog(
            'TThreadInPool.Create raise: '+e.ClassName+#13#10#9'Message: '+e.Message,
            9
          );
      end
    end
    else
      // ������� ������. ���� �������� �� ��������� - ��������� ������������� ������
      // ������������ ������� - ���� ����� �� ���� - ���� ����������.
    if FThreads.Count<FThreadsMax then
    begin
      WriteLog('FThreads.Count<FThreadsMax', 3);

      AvgWait := PoolAverageWaitingTime;
      {$ifndef NOLOGS}
      WriteLog(Format(
        'FThreads.Count (%d)<FThreadsMax(%d), AvgWait=%d',
        [FThreads.Count, FThreadsMax, AvgWait]),
        4
      );
      {$endif}

      if AvgWait<100 then
      // ���� ������� ����� ���������� � �������� ����� ��������� - ���� ��� ������ �������.
      try
        FThreads.Add(TThreadInPool.Create(Self));
      except
        on e: Exception do
          WriteLog(
            'TThreadInPool.Create raise: '+e.ClassName+#13#10#9'Message: '+e.Message,
            9
          );
      end
    end;
  finally
    csThreadManagment.Leave;
  end;
end;

constructor TPoolOfThreads.Create(AOwner: TComponent);
var
  DueTo: Int64;
begin
  WriteLog('TPoolOfThreads.Create', 5);

  inherited;
  csQueueManagment := TCriticalSection.Create;
  FQueue := TList.Create;
  csThreadManagment:= TCriticalSection.Create;
  FThreads:= TList.Create;
  FThreadsKilling:= TList.Create;
  FThreadsMin := 0;
  FThreadsMax := 1;
  FThreadDeadTimeout := 0;
  FLastGetPoint := 0;


  hSemRequestCount  := CreateSemaphore(nil, 0, $7FFFFFFF, nil);

  hTimCheckPoolDown := CreateWaitableTimer(nil, False, nil);
  DueTo := -1;
  SetWaitableTimer(hTimCheckPoolDown, DueTo, 30000, nil, nil, False);
end;

destructor TPoolOfThreads.Destroy;
var
  n, i: Integer;
  Handles: array of THandle;
begin
  WriteLog('TPoolOfThreads.Destroy', 5);
  csThreadManagment.Enter;

  SetLength(Handles, FThreads.Count);
  n := 0;
  for i := 0 to FThreads.Count-1 do
    if FThreads[i]<>nil then
    begin
      Handles[n] := TThreadInPool(FThreads[i]).Handle;
      TThreadInPool(FThreads[i]).Terminate;
      Inc(n);
    end;
  WaitForMultipleObjects(n, @Handles[0], True, 30000);

  for i := 0 to FThreads.Count-1 do
    TThreadInPool(FThreads[i]).Free;
  FThreads.Free;
  FThreadsKilling.Free;
  csThreadManagment.Free;

  csQueueManagment.Enter;
  for i := FQueue.Count-1 downto 0 do
    TObject(FQueue[i]).Free;
  FQueue.Free;
  csQueueManagment.Free;

  CloseHandle(hSemRequestCount);
  CloseHandle(hTimCheckPoolDown);
  inherited;
end;

procedure TPoolOfThreads.DoProcessed;
var
  i: Integer;
begin
  if (FLastGetPoint<FQueue.Count) then // ������� �� �����
    Exit;
  csThreadManagment.Enter;
  try
    for i := 0 to FThreads.Count-1 do
      if TThreadInPool(FThreads[i]).FCurState in [tcsProcessing] then
        Exit; // ���� ���� ���� ����� �������� - ������ ��� �� �����.
  finally
    csThreadManagment.Leave;
  end;
  DoQueueEmpty(ekProcessingFinished);
end;

procedure TPoolOfThreads.DoProcessRequest(aDataObj: TThreadPoolDataObject;
  aThread: TThreadInPool);
begin
  if Assigned (FProcessRequest) then
    FProcessRequest(Self, aDataObj, aThread);
end;

procedure TPoolOfThreads.DoQueueEmpty(EmptyKind: TEmptyKind);
begin
  if Assigned (FQueueEmpty) then
    FQueueEmpty(Self, EmptyKind);
end;

procedure TPoolOfThreads.DoThreadFinalizing(aThread: TThreadInPool);
begin
  if Assigned (FThreadFinalizing) then
    FThreadFinalizing(Self, aThread);
end;

procedure TPoolOfThreads.DoThreadInitializing(aThread: TThreadInPool);
begin
  if Assigned (FThreadInitializing) then
    FThreadInitializing(Self, aThread);
end;

procedure TPoolOfThreads.FreeFinishedThreads;
var
  i: Integer;
begin
  if csThreadManagment.TryEnter then
  try
    for i := FThreadsKilling.Count-1 downto 0 do
      if TThreadInPool(FThreadsKilling[i]).isFinished then
      begin
        TThreadInPool(FThreadsKilling[i]).Free;
        FThreadsKilling.Delete(i);
      end;
  finally
    csThreadManagment.Leave
  end;
end;

function TPoolOfThreads.GetAuthor: string;
begin
  Result := 'Alex Petrov. AKPetrov@pisem.net';
end;

procedure TPoolOfThreads.GetRequest(out Request: TThreadPoolDataObject);
begin
  WriteLog('TPoolOfThreads.GetRequest', 2);
  // ������� � ��� ���� !!!
  // 1. ���� �� ������� ����� �� ����� TList-� ��������, �������� �� nil
  csQueueManagment.Enter;
  try
    while (FLastGetPoint<FQueue.Count) and (FQueue[FLastGetPoint]=nil) do
      Inc(FLastGetPoint);

    Assert(FLastGetPoint<FQueue.Count);

    if (FQueue.Count>127) and (FLastGetPoint>= (3*FQueue.Count) div 4) then
    begin
      WriteLog('FQueue.Pack', 1);
      FQueue.Pack;
      FLastGetPoint := 0;
    end;

    // �������� ������, � � ������� - �������� �����.
    Request := TThreadPoolDataObject(FQueue[FLastGetPoint]);
    FQueue[FLastGetPoint] := nil;
    inc(FLastGetPoint);
    if (FLastGetPoint=FQueue.Count) then // ������� �����
    begin
      DoQueueEmpty(ekQueueEmpty);
      FQueue.Clear;
      FLastGetPoint := 0;
    end;
  finally
    csQueueManagment.Leave;
  end;
end;

function TPoolOfThreads.InfoText: string;
{$ifdef NOLOGS}
begin
  Result := '';
end;
{$else}
var
  i: Integer;
begin
  csQueueManagment.Enter;
  csThreadManagment.Enter;
  try
    if (FThreads.Count=0) and (FThreadsKilling.Count=1) and
       TThreadInPool(FThreadsKilling[0]).isFinished then
      FreeFinishedThreads;

    Result := Format(
      '���� �������: Min=%d, Max=%d, ThreadsCount=%d, KillThCount=%d, Queue.Count=%d'#13#10,
      [ThreadsMin, ThreadsMax, FThreads.Count, FThreadsKilling.Count, FQueue.Count]
    );
    if FThreads.Count>0 then
      Result := Result + '������ ������:'#13#10;
    for i := 0 to FThreads.Count-1 do
      Result := Result + TThreadInPool(FThreads[i]).InfoText+#13#10;
    if FThreadsKilling.Count>0 then
      Result := Result + '��������� (��������� ������):'#13#10;
    for i := 0 to FThreadsKilling.Count-1 do
      Result := Result + TThreadInPool(FThreadsKilling[i]).InfoText+#13#10;
  finally
    csThreadManagment.Leave;
    csQueueManagment.Leave;
  end;
end;
{$endif}

procedure TPoolOfThreads.KillDeadThreads;
var
  i: Integer;
begin
  // ���������, ��� �� ������ �������. ���� ���� - ������ �������� �� �����.
  // � ������ - � ��������� (���� ��� ������).
  if csThreadManagment.TryEnter then
  try
    for i := 0 to FThreads.Count-1 do
      if TThreadInPool(FThreads[i]).IsDead then
      begin
        TThreadInPool(FThreads[i]).Terminate;
        FThreadsKilling.Add(FThreads[i]);
        try
          FThreads[i] := TThreadInPool.Create(Self);
        except
          on e: Exception do
          begin
            FThreads[i] := nil;
            WriteLog(
              'TThreadInPool.Create raise: '+e.ClassName+#13#10#9'Message: '+e.Message,
              9
            );
          end;
        end;
      end;
  finally
    csThreadManagment.Leave
  end;
end;

function TPoolOfThreads.PoolAverageWaitingTime: Integer;
var
  i: Integer;
begin
  Result := 0;
  if FThreads.Count>0 then
  begin
    for i := 0 to FThreads.Count-1 do
      Inc(result, TThreadInPool(FThreads[i]).AverageWaitingTime);
    Result := Result div FThreads.Count
  end
  else
    Result := 1;
end;

procedure TPoolOfThreads.SetAuthor(const Value: string);
begin

end;

procedure TPoolOfThreads.WriteLog(const Str: string; Level: Integer);
begin
  {$ifndef NOLOGS}
  ThreadPool.WriteLog(Str, 0, Level);
  {$endif}
end;

{ TThreadInPool }

function TThreadInPool.AverageProcessingTime: DWORD;
begin
  if (FCurState in [tcsProcessing]) then
    Result := NewAverage(FAverageProcessing, GetTickCount - uProcessingStart)
  else
    Result := FAverageProcessing
end;

function TThreadInPool.AverageWaitingTime: DWORD;
begin
  if (FCurState in [tcsWaiting, tcsCheckingDown]) then
    Result := NewAverage(FAverageWaitingTime, GetTickCount - uWaitingStart)
  else
    Result := FAverageWaitingTime
end;

constructor TThreadInPool.Create(aPool: TPoolOfThreads);
begin
  WriteLog('TThreadInPool.Create', 5);
  inherited Create(True);
  FPool := aPool;

  FAverageWaitingTime := 1000;
  FAverageProcessing  := 3000;

  sInitError := '';
  hInitFinished := CreateEvent(nil, True, False, nil);
  hThreadTerminated := CreateEvent(nil, True, False, nil);
  csProcessingDataObject := TCriticalSection.Create;
  try
    WriteLog('TThreadInPool.Create::Resume', 3);
    Resume;
    WaitForSingleObject(hInitFinished, INFINITE);
    if sInitError<>'' then
      raise Exception.Create(sInitError);
  finally
    CloseHandle(hInitFinished);
  end;
  WriteLog('TThreadInPool.Create::Finished', 3);
end;

destructor TThreadInPool.Destroy;
begin
  WriteLog('TThreadInPool.Destroy', 5);
  CloseHandle(hThreadTerminated);
  csProcessingDataObject.Free;
  inherited;
end;

procedure TThreadInPool.Execute;
type
  THandleID = (hidTerminateThread, hidRequest, hidCheckPoolDown);
var
  WaitedTime: Integer;
  Handles: array[THandleID] of THandle;
begin
  WriteLog('TThreadInPool.Execute', 3);
  FCurState := tcsInitializing;
  try
    FPool.DoThreadInitializing(Self);
  except
    on e: Exception do
      sInitError := e.Message;
  end;
  SetEvent(hInitFinished);

  WriteLog('TThreadInPool.Execute::Initialized', 3);

  Handles[hidTerminateThread] := hThreadTerminated;
  Handles[hidRequest]         := FPool.hSemRequestCount;
  Handles[hidCheckPoolDown]   := FPool.hTimCheckPoolDown;

  uWaitingStart := GetTickCount;
  FProcessingDataObject := nil;

  while not terminated do
  begin
    FCurState := tcsWaiting;
    case WaitForMultipleObjects(Length(Handles), @Handles, False, INFINITE)-WAIT_OBJECT_0 of
      WAIT_OBJECT_0 + ord(hidTerminateThread):
      begin
        // ����� ���������
        WriteLog('TThreadInPool.Execute:: Terminate event signaled ', 5);
        FCurState := tcsTerminating;
        Break;
      end;
      WAIT_OBJECT_0 + ord(hidRequest):
      begin
        WriteLog('TThreadInPool.Execute:: Request semaphore signaled ', 3);
        // ��������� - ������� ���������� ������� �������� �� ������:

        WaitedTime := GetTickCount - uWaitingStart;
        FAverageWaitingTime := NewAverage(FAverageWaitingTime, WaitedTime);
        FCurState := tcsGetting;
        // � ������� ���� ��� ������. ��� - ����� ��� ������.
        if WaitedTime<5 then
          FPool.CheckThreadsForGrow;
        FPool.GetRequest(FProcessingDataObject);
        uProcessingStart := GetTickCount;
        FCurState := tcsProcessing;
        try
          {$ifndef NOLOGS}WriteLog('Processing: '+FProcessingDataObject.TextForLog, 2);{$endif}
          FPool.DoProcessRequest(FProcessingDataObject, Self);
        except
          on e: Exception do
            WriteLog(
              'OnProcessRequest for '+FProcessingDataObject.TextForLog+
              #13#10'raise Exception: '+e.Message,
              8
            );
        end;
        csProcessingDataObject.Enter;
        try
          FProcessingDataObject.Free;
          FProcessingDataObject := nil;
        finally
          csProcessingDataObject.Leave;
        end;
        FAverageProcessing := NewAverage(FAverageProcessing, GetTickCount - uProcessingStart);
        FCurState := tcsProcessed;

        FPool.DoProcessed;

        // ������ ������ ����� ���������
        uWaitingStart := GetTickCount;
      end;
      WAIT_OBJECT_0 + ord(hidCheckPoolDown):
      begin
        // ����� ��������� ��� ������ �����: �� ����������� ����.
        WriteLog('TThreadInPool.Execute:: CheckPoolDown timer signaled ', 4);
        FCurState := tcsCheckingDown;
        FPool.CheckPoolDown;
      end;
    end;
  end;
  FCurState := tcsTerminating;

  FPool.DoThreadFinalizing(Self);
end;

function TThreadInPool.IamCurrentlyProcess(
  DataObj: TThreadPoolDataObject): Boolean;
begin
  csProcessingDataObject.Enter;
  try
    Result := (FProcessingDataObject<>nil) and DataObj.IsTheSame(FProcessingDataObject);
  finally
    csProcessingDataObject.Leave;
  end;
end;

function TThreadInPool.InfoText: string;
const
  ThreadStateNames: array [TThreadState] of string =
  (
    'tcsInitializing',
    'tcsWaiting',
    'tcsGetting',
    'tcsProcessing',
    'tcsProcessed',
    'tcsTerminating',
    'tcsCheckingDown'
  );
begin
  {$ifndef NOLOGS}
  Result := Format(
    '%5d: %15s, AverageWaitingTime=%6d, AverageProcessingTime=%6d',
    [ThreadID, ThreadStateNames[FCurState], AverageWaitingTime, AverageProcessingTime]
  );
  case FCurState of
    tcsWaiting:
      Result := Result+', WaitingTime='+IntToStr(GetTickCount - uWaitingStart);
    tcsProcessing:
      Result := Result + ', ProcessingTime='+IntToStr(GetTickCount - uProcessingStart);
  end;

  csProcessingDataObject.Enter;
  try
    if FProcessingDataObject<>nil then
      Result := Result + ' '+FProcessingDataObject.TextForLog;
  finally
    csProcessingDataObject.Leave;
  end;
  {$endif}
end;

function TThreadInPool.IsDead: Boolean;
begin
  Result :=
    Terminated or
    (FPool.ThreadDeadTimeout>0) and (FCurState=tcsProcessing) and (GetTickCount - uProcessingStart > FPool.ThreadDeadTimeout);
  if Result then
    WriteLog('Thread dead', 5);
end;

function TThreadInPool.isFinished: Boolean;
begin
  Result := WaitForSingleObject(Handle, 0)=WAIT_OBJECT_0;
end;

function TThreadInPool.isLoafer: Boolean;
begin
  Result :=
    (FCurState in [tcsWaiting, tcsCheckingDown]) and
    (AverageWaitingTime>100) and
    (AverageWaitingTime*2>AverageProcessingTime);
end;

function TThreadInPool.NewAverage(OldAvg,
  NewVal: Integer): Integer;
begin
  Result := (OldAvg * 2 + NewVal) div 3;
end;

procedure TThreadInPool.Terminate;
begin
  WriteLog('TThreadInPool.Terminate', 5);
  inherited Terminate;
  SetEvent(hThreadTerminated);
end;

procedure TThreadInPool.WriteLog(const Str: string; Level: Integer);
begin
  {$ifndef NOLOGS}
  ThreadPool.WriteLog(Str, ThreadID, Level);
  {$endif}
end;

{ TCriticalSection }

constructor TCriticalSection.Create;
begin
  InitializeCriticalSection(FSection);
end;

destructor TCriticalSection.Destroy;
begin
  DeleteCriticalSection(FSection);
end;

procedure TCriticalSection.Enter;
begin
  EnterCriticalSection(FSection);
end;

procedure TCriticalSection.Leave;
begin
  LeaveCriticalSection(FSection);
end;

function TCriticalSection.TryEnter: Boolean;
begin
  Result := TryEnterCriticalSection(FSection);
end;

procedure NoLogs(const Str: string; LogID: Integer=0; Level: Integer=0);
begin
end;

initialization
  WriteLog := NoLogs;
end.
