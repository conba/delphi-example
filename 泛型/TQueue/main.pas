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

uses Generics.Collections; {Delphi 2009 �����ķ���������Ԫ}

type
  TRec = record
    Name: string;
    Age: Word;
  end;

var
  Queue: TQueue<TRec>;  {����һ������ TQueue ��, ��ָ����Ҫ�������涨��� TRec ��¼}

{����}
procedure TForm1.FormCreate(Sender: TObject);
begin
  Queue := TQueue<TRec>.Create;

  Memo1.Clear;
  Button1.Caption := Button1.Caption + ' ����';
  Button2.Caption := Button2.Caption + ' ����';
  Button3.Caption := Button3.Caption + ' ��һ�����е�...';
end;

{�ͷ�}
procedure TForm1.FormDestroy(Sender: TObject);
begin
  Queue.Free;
end;

{����: Enqueue}
procedure TForm1.Button1Click(Sender: TObject);
var
  rec: TRec;
begin
  rec.Name := StringOfChar(Char(65 + Random(26)), 3);
  rec.Age := Random(150);
  Queue.Enqueue(rec);
  Text := Format('��ǰ���г�Ա����: %d', [Queue.Count]);

  {�� Memo1 �����ʾ}
  Memo1.Lines.Add(Format('%s, %d', [rec.Name, rec.Age]));
end;

{����: Dequeue}
procedure TForm1.Button2Click(Sender: TObject);
var
  rec: TRec;
begin
  if Queue.Count = 0 then Exit;
  rec := Queue.Dequeue;
  ShowMessage(Format('%s, %d', [rec.Name, rec.Age]));
  Text := Format('��ǰ���г�Ա����: %d', [Queue.Count]);

  {�� Memo1 �����ʾ}
  Memo1.Lines.Delete(0);
end;

{��һ�����е�Ԫ��: Peek}
procedure TForm1.Button3Click(Sender: TObject);
var
  rec: TRec;
begin
  if Queue.Count = 0 then Exit;
  rec := Queue.Peek;
  ShowMessage(Format('%s, %d', [rec.Name, rec.Age]));
end;

end.
