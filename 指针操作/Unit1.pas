unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  pListNode = ^TListNode;
  TListNode = record
    iValue: Integer;
    next: pListNode;
  end;

  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitList(Head: TListNode);
    procedure Reverse(Head: TListNode);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  Head: TListNode;
  Node: pListNode;
begin
  InitList(Head);
  Node := Head.next;
  while(Node <> nil) do
  begin
    ShowMessage(IntToStr(Node^.iValue));
    Node := Node^.next;
  end;
end;

{ TForm1 }

procedure TForm1.InitList(Head: TListNode);
var
  Node, Node1, Node2, Node3, Node4, Node5: pListNode;
  LN: pListNode;
begin
  New(Node);
  Node.iValue := 1;
  Node.next := nil;
  Head.next := @Node;
  ShowMessage(IntToStr(Head.next.iValue));
  New(Node1);
  Node1.iValue := 2;
  Node1.next := nil;
  Node^.next := @Node1;
  New(Node2);
  Node2.iValue := 2;
  Node2.next := nil;
  Node1^.next := @Node2;
  New(Node3);
  Node3.iValue := 2;
  Node3.next := nil;
  Node2^.next := @Node3;
  New(Node4);
  Node4.iValue := 2;
  Node4.next := nil;
  Node3^.next := @Node4;
  New(Node5);
  Node5.iValue := 2;
  Node5.next := nil;
  Node4^.next := @Node5;
  LN := Head.next;
  while(LN <> nil) do
  begin
    ShowMessage(IntToStr(LN^.iValue));
    LN := LN^.next;
  end;
end;

procedure TForm1.Reverse(Head: TListNode);
begin

end;

end.
