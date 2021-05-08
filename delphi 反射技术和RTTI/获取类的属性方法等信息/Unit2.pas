unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    Memo1: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses
  Rtti;
{$R *.dfm}　

//procedure TForm2.btn1Click(Sender: TObject);
//var
//  ctx:　TRttiContext;　
//　t:　TRttiType;
//begin
//　Memo1.Clear;　
//　for　t　in　ctx.GetTypes　do　Memo1.Lines.Add(t.Name);
//end;　

{ TForm2 }
//TRttiContext.GetTypes　
procedure TForm2.btn1Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
begin
  Memo1.Clear;
  for t in ctx.GetTypes do
    Memo1.Lines.Add(t.Name)
end;

//获取　TButton　类的方法
procedure TForm2.btn2Click(Sender: TObject);
var
　ctx:　TRttiContext;　
　t:　TRttiType;　
　m:　TRttiMethod;
begin
　Memo1.Clear;　
　t　:=　ctx.GetType(TButton);　　
  for m in t.GetMethods do
    Memo1.Lines.Add(m.ToString);　　
end;

// 获取TButton类的属性
procedure TForm2.btn3Click(Sender: TObject);
var
 ctx: TRttiContext;
 t: TRttiType;
 p: TRttiProperty;
begin
 Memo1.Clear;
 t := ctx.GetType(TButton);
 //for p in t.GetProperties do Memo1.Lines.Add(p.Name);
 for p in t.GetProperties do Memo1.Lines.Add(p.ToString);
end;

end.
