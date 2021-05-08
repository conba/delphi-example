unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Generics.Collections; {Delphi 2009 新增的泛型容器单元}

type
  TRec = record
    Name: string;
    Age: Word;
  end;

var
  Queue: TQueue<TRec>;  {定义一个泛型 TQueue 类, 这指定了要用于上面定义的 TRec 记录}

{建立}
procedure TForm1.FormCreate(Sender: TObject);
begin
  Queue := TQueue<TRec>.Create;

  Memo1.Clear;
  Button1.Caption := Button1.Caption + ' 入列';
  Button2.Caption := Button2.Caption + ' 出列';
  Button3.Caption := Button3.Caption + ' 下一个出列的...';
end;

{释放}
procedure TForm1.FormDestroy(Sender: TObject);
begin
  Queue.Free;
end;

{入列: Enqueue}
procedure TForm1.Button1Click(Sender: TObject);
var
  rec: TRec;
begin
  rec.Name := StringOfChar(Char(65 + Random(26)), 3);
  rec.Age := Random(150);
  Queue.Enqueue(rec);
  Text := Format('当前队列成员总数: %d', [Queue.Count]);

  {让 Memo1 配合显示}
  Memo1.Lines.Add(Format('%s, %d', [rec.Name, rec.Age]));
end;

{出列: Dequeue}
procedure TForm1.Button2Click(Sender: TObject);
var
  rec: TRec;
begin
  if Queue.Count = 0 then Exit;
  rec := Queue.Dequeue;
  ShowMessage(Format('%s, %d', [rec.Name, rec.Age]));
  Text := Format('当前队列成员总数: %d', [Queue.Count]);

  {让 Memo1 配合显示}
  Memo1.Lines.Delete(0);
end;

{下一个出列的元素: Peek}
procedure TForm1.Button3Click(Sender: TObject);
var
  rec: TRec;
begin
  if Queue.Count = 0 then Exit;
  rec := Queue.Peek;
  ShowMessage(Format('%s, %d', [rec.Name, rec.Age]));
end;

end.
