unit observer;

interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs;

type
  TState = string;

  TObserver = class;

  TSubject = class
  private
    FObservers: TList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    // ע��۲��߶���
    procedure Attach(observer: TObserver);
    // ע���۲��߶���
    procedure Detach(observer: TObserver);
    procedure Notify();
  end;

  TConcreteSubject = class(TSubject)
  private
    FSubjectState: TState;
    function GetSubjectState: TState;
    procedure SetSubjectState(Value: TState);
  public
    property SubjectState: TState read GetSubjectState write SetSubjectState;
  end;

  TObserver = class
  public
    procedure Update; virtual; abstract;
  end;

  TConcreteObserver = class(TObserver)
  private
    FName: string;
    FObserverState: TState;
    FSubject: TConcreteSubject;
  public
    constructor Create(subject: TConcreteSubject; name: string);
    procedure Update; override;
  end;

implementation

{ TSubject }

procedure TSubject.Attach(observer: TObserver);
begin
  if FObservers.IndexOf(observer) < 0 then
    FObservers.Add(Observer)
end;

constructor TSubject.Create;
begin
  FObservers := TList.Create;
end;

destructor TSubject.Destroy;
var
  i: Integer;
begin
  for I := 0 to FObservers.Count - 1 do
    TObserver(FObservers[i]).Free;

  FObservers.Free;
  inherited;
end;

procedure TSubject.Detach(observer: TObserver);
begin
  FObservers.Remove(observer);
end;

procedure TSubject.Notify;
var
  i: Integer;
begin
  for I := 0 to FObservers.Count - 1 do
    TObserver(FObservers[i]).Update;
end;

{ TConcreteSubject }

function TConcreteSubject.GetSubjectState: TState;
begin
  Result := FSubjectState;
end;

procedure TConcreteSubject.SetSubjectState(Value: TState);
begin
  FSubjectState := Value;
end;

{ TConcreteObserver }

constructor TConcreteObserver.Create(subject: TConcreteSubject; name: string);
begin
  FSubject := subject;
  FName := Name;
  ShowMessage('�����۲���' + FName);
end;

procedure TConcreteObserver.Update;
begin
  FObserverState := FSubject.SubjectState;
  // һ���д���
  ShowMessage('�۲���' + FName + '��״ֵ̬�ı�Ϊ��' + FObserverState);
end;

end.
