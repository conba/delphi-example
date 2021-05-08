unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses Generics.Collections; {Delphi 2009 新增的泛型容器单元}

var
  List: TList<string>;  {定义一个泛型 TList 类, 这指定了要用于 string}
  str: string = 'Test';

{建立}
procedure TForm13.FormCreate(Sender: TObject);
begin
  List := TList<string>.Create;

  Memo1.Clear;
  Edit1.Text := str;
  Button1.Caption := Button1.Caption + ' 显示';
  Button2.Caption := Button2.Caption + ' 添加';
  Button3.Caption := Button3.Caption + ' 插入';
  Button4.Caption := Button4.Caption + ' 删除1';
  Button5.Caption := Button5.Caption + ' 删除2';
  Button6.Caption := Button6.Caption + ' 查找';
  Button7.Caption := Button7.Caption + ' 排序';
  Button8.Caption := Button8.Caption + ' 翻转';
  Button9.Caption := Button9.Caption + ' 清空';
  Button10.Caption := Button10.Caption + ' 添加数组';
end;

{释放}
procedure TForm13.FormDestroy(Sender: TObject);
begin
  List.Free;
end;

procedure TForm13.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    str := Edit1.Text;
end;

{显示}
procedure TForm13.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  Memo1.Clear;
  for i := 0 to List.Count - 1 do
    Memo1.Lines.Add(List[i]);  {List[i] = List.Item[i]}
  Text := Format('当前总数: %d', [List.Count]);
end;

{添加}
procedure TForm13.Button2Click(Sender: TObject);
begin
  List.Add(str);
  Button1.Click; {刷新显示}
end;

{插入, 譬如插入在最前面}
procedure TForm13.Button3Click(Sender: TObject);
begin
  List.Insert(0, str);
  Button1.Click;
end;

{根据序号删除, 譬如删除第一个数据}
procedure TForm13.Button4Click(Sender: TObject);
begin
  List.Delete(0);
  Button1.Click;
end;

{根据内容删除, 譬如删除第一个数据}
procedure TForm13.Button5Click(Sender: TObject);
var
  s: string;
begin
  s := List[0];
  List.Remove(s);
  Button1.Click;
end;

{查找}
procedure TForm13.Button6Click(Sender: TObject);
var
  n: Integer;
begin
  n := List.IndexOf(str); {LastIndexOf 是从后面找; 也可用 List.Contains(str) 判断是否包含 str}
  if n = -1 then
    ShowMessage('没找到')
  else
    ShowMessageFmt('%s 是第 %d 个', [str, n+1]);
end;

{排序}
procedure TForm13.Button7Click(Sender: TObject);
begin
  List.Sort;
  Button1.Click;
end;

{翻转}
procedure TForm13.Button8Click(Sender: TObject);
begin
  List.Reverse;
  Button1.Click;
end;

{清空}
procedure TForm13.Button9Click(Sender: TObject);
begin
  List.Clear;
  Button1.Click;
end;

{添加数组}
procedure TForm13.Button10Click(Sender: TObject);
const
  arr: array[0..2] of string = ('CodeGear', 'Delphi', '2009');
begin
  List.Add('Embarcadero');
  List.AddRange(arr);
  Button1.Click;
end;

end.
