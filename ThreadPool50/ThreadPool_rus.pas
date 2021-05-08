unit ThreadPool;
{*************************************************************}
{                                                             }
{   Компонента для обработки очереди запросов в пуле потоков  }
{                                                             }
{   Copyright (c) 2001, Алексей Петров, AKPetrov@pisem.net    }
{                                                             }
{    Для не коммерческого использования - бесплатно           }
{    По вопросам коммерческого использования -                }
{         свяжитесь с автором                                 }
{                                                             }
{*************************************************************}
{  Логика работы: В очередь из вне добавляются запросы на     }
{  обработку. Подразумеваентся, что обработка - длительная    }
{  процедура.                                                 }
{  Запросы выполняются в нескольких потоках, число которых    }
{  динамически изменяется в зависимости от нагрузки.          }
{*************************************************************}

{Инструкция по использованию:

 Запросы на обработку помещаются вызовом AddRequest. Для каждого типа запроса необходимо
 описать потомка от TThreadPoolDataObject со всеми необходимыми полями для хранения его данных.
 Рекомендуется для него создать конструктор с всеми данными в качестве параметров.
 В качестве параметра AddRequest передается экземпляр класса. Разрушением экземпляра занимается
 осуществляется компонентом после завершения обработки.

 Пример использования:
   aPool.AddRequest(TMyRequest.Create(Параметр 1, Параметр 2, ...));

 Событие OnProcessRequest вызывается в контексте одного из потоков пула и предназначено для
 собственно выполнение длительной операции.
 Работать с визуальными компонентами VCL в рамках данного метода - нельзя (см. справку по TThread).
 Если осуществляется работа с БД - необходимо позаботиться о использовании независимого соединения в каждом из потоков
 во избежание конфликтов.
 Для инициализации такого соединения предназначены события: OnThreadInitializing, OnThreadFinalizing

 OnThreadInitializing, OnThreadFinalizing могут использоваться для инициализации
 и наоборот потоков при их создании - так-же вызываются в контексте потока.

 Событие OnEmpty вызывается в контексте одного из потоков после выборки последнего запроса из
 очереди и после завершения обработки последнего запроса.
}

interface
uses
  Windows,
  Classes;

// Можно отключить формирование логов, что немного ускорит работу
// для того, чтоб логи записывались, нужно переменную WriteLog инициализировать.
// {$DEFINE NOLOGS}

type
  // TCriticalSection в SycObjs не доделали в Борланде...
  // Да еще FSection приватной сделали - не поправишь :)
  TCriticalSection = class 
  protected
    FSection: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enter;
    procedure Leave;
    function TryEnter: Boolean; // вот это они и забыли
  end;

type
  // Объект представляет собой базовый класс хранилища информации для запроса.
  TThreadPoolDataObject = class
  public
    // Функция используется при добавлении запроса в очередь с флагом CheckForDoubles
    // Для поиска идентичных запросов в очереди.
    function IsTheSame(DataObj: TThreadPoolDataObject): Boolean; virtual;
    // Текстовое представление экземпляра. Используется только для отоброжения в Log-ах
    // и в тексте состояния. В боевом состоянии (когда NOLOGS определен) - не нужно.
    function TextForLog: string; virtual;
  end;

type
  TPoolOfThreads = class;

  // Эти потоки создаются только внутри пула. 
  TThreadState = ( tcsInitializing, tcsWaiting, tcsGetting, tcsProcessing, tcsProcessed, tcsTerminating, tcsCheckingDown);
  TThreadInPool = class(TThread)
  private
    // Временный Event на период создания.
    hInitFinished: THandle;
    sInitError: string;
  private
    procedure WriteLog(const Str: string; Level: Integer=0);
  protected
    // Состояние (текущий вид деятельности) потока для отображения
    FCurState: TThreadState;
    // Призак завершения потока. Событие выставляется в методе Terminate
    // И постоянно ожидается одновременно с семафором наличия запросов в очереди.
    hThreadTerminated: THandle;
    // Ссылка на на пулл потоков, которому поток принадлежит.
    FPool: TPoolOfThreads;

    // Объект, обрабатывающийся в данный момент или nil.
    csProcessingDataObject: TCriticalSection;
    FProcessingDataObject: TThreadPoolDataObject;
    // Функция проверяет, не такой-же ли объект я обрабатываю
    function IamCurrentlyProcess(DataObj: TThreadPoolDataObject):Boolean;

    procedure Execute; override;
  protected
    // Среднее время ожидания запроса потоком.
    FAverageWaitingTime: Integer;
    // GetTickCount на момент последнего входа в состояние ожидания запроса
    uWaitingStart: DWORD;
    // Среднее время обработки запроса
    FAverageProcessing: Integer;
    // GetTickCount на момент последнего входа в Processing
    uProcessingStart: DWORD;
    // Вычисление "среднего" времени.
    // Среднее считается не строго математически, а как величина с убывающим влиянием старых результатов:
    // Последняя величина имеет вес 1/3, предпоследняя: 2/9, 4/27 и т.д.
    function NewAverage(OldAvg, NewVal: Integer): Integer;
  protected
    // Признак "поток помер"
    function IsDead: Boolean;
    // Поток завершен - можно убивать смело
    function isFinished: Boolean;
    // Среднее время нахождения в состоянии ожидания запроса для обработки за последние
    // 3 обращения (в ms). Если долго - есть повод наростить число потоков
    function AverageWaitingTime: DWORD;
    // Среднее время обработки запроса - для балансирования числа потоков
    function AverageProcessingTime: DWORD;
    // Признак того, что поток является "бездельником", т.е. по долгу ждет работы
    function isLoafer: Boolean;
    // Возвращает в виде строки информацию о работе потока.
    function InfoText: string;
  public
    // Это поле для обратной связи (Как обычно :)
    Tag: Integer;

    constructor Create(aPool: TPoolOfThreads);
    destructor Destroy; override;

    procedure Terminate;
  end;

  // Вызываются при создании/разрушении потока.
  // Если хочется заблокировать создание - нужно Except-нуть.
  TThreadInPoolInitializing = procedure (Sender: TPoolOfThreads; aThread: TThreadInPool) of object;
  TThreadInPoolFinalizing = procedure (Sender: TPoolOfThreads; aThread: TThreadInPool) of object;

  // Метод обработки запроса. Вызывается из потоков...
  TProcessRequest = procedure (Sender: TPoolOfThreads; aDataObj: TThreadPoolDataObject; aThread: TThreadInPool) of object;

  // Метод вызывается, когда
  //  1. Из очереди выбран последний запрос
  //  2. Последний поток завершил обработку: теперь все в состоянии ожидания
  TEmptyKind = (ekQueueEmpty, ekProcessingFinished);
  TQueueEmpty = procedure (Sender: TPoolOfThreads; EmptyKind: TEmptyKind) of object;

  TPoolOfThreads = class(TComponent)
  private
    // Ининциализация и наоборот каждого потока
    FThreadInitializing: TThreadInPoolInitializing;
    FThreadFinalizing: TThreadInPoolFinalizing;
    // Обработка запроса
    FProcessRequest: TProcessRequest;
    // Очистка очереди
    FQueueEmpty: TQueueEmpty;
    procedure WriteLog(const Str: string; Level: Integer=0);
    function GetAuthor: string;
    procedure SetAuthor(const Value: string);
  protected
    // Методы поддержки "событий". Если перекрывать, используя наследование вместо "of object"
    // inherited при этом вызывать не нужно
    procedure DoThreadInitializing(aThread: TThreadInPool); virtual;
    procedure DoThreadFinalizing(aThread: TThreadInPool); virtual;
    procedure DoProcessRequest(aDataObj: TThreadPoolDataObject; aThread: TThreadInPool); virtual;
    procedure DoQueueEmpty(EmptyKind: TEmptyKind); virtual;
  private
    // Добавление в очередь - штатным образом через TList.Add
    // Взятие на обработку: В очередь заносится nil. Когда достигается конец
    // очереди - выполняется Pack
    csQueueManagment: TCriticalSection;
    FQueue: TList;

    // Потоки обработки
    csThreadManagment: TCriticalSection;
    FThreads: TList;
    // Умирающие потоки: те, которым сказали Terminate
    FThreadsKilling: TList;

    // Параметры управления потоками
    FThreadsMin, FThreadsMax: Integer;
    // Максимальное время обработки запроса в ms, после которого поток считается дохлым,
    // что влечет за собой его убийство (мягкое) и рождение нового
    FThreadDeadTimeout: DWORD;

    // Среднее время нахождение потоков в состоянии ожидания запросов
    function PoolAverageWaitingTime: Integer;
  protected
    // Семафор - счетчик запросов в очереди
    hSemRequestCount: THandle;
    // Ожидаемый таймер, тикающий каждые 30 сек для проверки:
    // Не поубивать ли потоки в пуле.
    hTimCheckPoolDown: THandle;
    // Позиция в очереди, из которой в прошлый раз брали запрос.
    FLastGetPoint: Integer;
    // Проверка пулла потоков: не поубивать ли кого.
    procedure CheckPoolDown;
    // Или посоздавать?
    procedure CheckThreadsForGrow;
    // Проверить боевые на дохлость и заменить при необходимости
    procedure KillDeadThreads;
    // Очистка отстойника.
    procedure FreeFinishedThreads;
    // Функция вызывается потоком после того, как он убедился в наличаи запросов на
    // обработку дождавшись семафора hSemRequestCount
    procedure GetRequest(out Request: TThreadPoolDataObject);
    // Вызывается, когда поток завершил обработку запроса, чтоб вызвать
    // OnEmpty, если нужно.
    procedure DoProcessed;
  public
    // Добавляет запрос к очереди.
    // Наличие флага CheckForDoubles предотвращает добавление запроса, идентичного уже имеющемуся в
    // очереди или на обработке одним из потоков (кроме зависших)
    // Если добавления не произошло (по причине повтора) возвращает False
    function AddRequest(aDataObject: TThreadPoolDataObject; CheckForDoubles: Boolean = False): boolean; overload;
    // Если не определен NOLOGS - информация о пуле (число потоков и ряд их параметров)
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
  // Процедура записи логов.
  TLogWriteProc = procedure (
    const Str: string; // Строка для логирования.
    LogID: Integer=0;  // № лога. Используется для разделения логов по thread-ам
                       // 0 - основной Log, ThreadId - лог конкретного Thread-а
    Level: Integer=0   // Значимость сообщения: Level=0 - трассировка, 10 - серьезные ошибки
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
      // Поиск идентичных объектов в очереди
      for i := 0 to FQueue.Count-1 do
        if (FQueue[i]<>nil) and aDataObject.IsTheSame(TThreadPoolDataObject(FQueue[i])) then
          Exit; // Нашли - уходим
    csThreadManagment.Enter;
    try
      CheckThreadsForGrow;
      if CheckForDoubles then
        // Поиск идентичных объектов в зубах у потоков.
        for i := 0 to FThreads.Count-1 do
          if TThreadInPool(FThreads[i]).IamCurrentlyProcess(aDataObject) then
            Exit; // Нашли - уходим

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
    // Проверим боевые.
    KillDeadThreads;
    // Проверим отстойник.
    FreeFinishedThreads;

    // Нужно посмотреть: не слишком ли много потоков у нас развелось
    // Слишком много, это когда среднее время ожидания работы у потоков перевалило через 50%
    // от среднего времени их обработки
    // Если слишком много - одного убьем и посмотрим, что из этого вышло.
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

    // Проверить: нет ли надобности в наращивании числа потоков.
    if FThreads.Count<FThreadsMin then
    begin
      WriteLog('FThreads.Count<FThreadsMin', 4);
      // Их почему-то меньше минимума: безусловно наростить до минимума
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
      // Минимум набран. Если максимум не достигнут - провереть интенсивность работы
      // существующих потоков - если никто не ждет - надо наращивать.
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
      // Если среднее время нахождение в ожидании стала маленьким - пора еще потокм плодить.
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
  if (FLastGetPoint<FQueue.Count) then // Очередь не пуста
    Exit;
  csThreadManagment.Enter;
  try
    for i := 0 to FThreads.Count-1 do
      if TThreadInPool(FThreads[i]).FCurState in [tcsProcessing] then
        Exit; // Если хоть один поток работает - значит еще не конец.
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
  // запросы у нас есть !!!
  // 1. Ищем от текущей точки до конца TList-а элементы, отличные от nil
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

    // Найденый отдаем, а в очереди - забиваем нулем.
    Request := TThreadPoolDataObject(FQueue[FLastGetPoint]);
    FQueue[FLastGetPoint] := nil;
    inc(FLastGetPoint);
    if (FLastGetPoint=FQueue.Count) then // Очередь пуста
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
      'Пулл потоков: Min=%d, Max=%d, ThreadsCount=%d, KillThCount=%d, Queue.Count=%d'#13#10,
      [ThreadsMin, ThreadsMax, FThreads.Count, FThreadsKilling.Count, FQueue.Count]
    );
    if FThreads.Count>0 then
      Result := Result + 'Боевые потоки:'#13#10;
    for i := 0 to FThreads.Count-1 do
      Result := Result + TThreadInPool(FThreads[i]).InfoText+#13#10;
    if FThreadsKilling.Count>0 then
      Result := Result + 'Отстойник (умирающие потоки):'#13#10;
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
  // Проверяем, нет ли дохлых потоков. Если есть - дохлых заменяем на живых.
  // А дохлых - в отстойник (чтоб там добить).
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
        // Поток завершают
        WriteLog('TThreadInPool.Execute:: Terminate event signaled ', 5);
        FCurState := tcsTerminating;
        Break;
      end;
      WAIT_OBJECT_0 + ord(hidRequest):
      begin
        WriteLog('TThreadInPool.Execute:: Request semaphore signaled ', 3);
        // Дождались - обновим статистику времени ожидания по потоку:

        WaitedTime := GetTickCount - uWaitingStart;
        FAverageWaitingTime := NewAverage(FAverageWaitingTime, WaitedTime);
        FCurState := tcsGetting;
        // В очереди есть наш запрос. Пул - отдай мой запрос.
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

        // Сейчас начнем ждать следующий
        uWaitingStart := GetTickCount;
      end;
      WAIT_OBJECT_0 + ord(hidCheckPoolDown):
      begin
        // Нужно проверить все потоки пулла: не поубиватьли кого.
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
