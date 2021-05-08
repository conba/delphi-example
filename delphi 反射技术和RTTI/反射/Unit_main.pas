unit Unit_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TypInfo;

type
  TForm_main = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
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
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  PTKeyDog = ^TKeyDog;

  TKeyDog = record
    id: Integer;
    projectname: string;
    city: string;
    letter: string;
    hash: string;
    code: string;
    note: string;
    filepath: string;
    userid: Integer;
  end;

  { 自定义的类 }
  TMyClass = class(TComponent)
  public
    procedure msg(const str: string);
    function Add(const a, b: Integer): Integer;
  end;


  // 编译指令 Methodinfo 是 Delphi 2009 新增的, 只有它打开了, ObjAuto 才可以获取 public 区的信息.
  // 这样, ObjAuto 可以获取 TClass3 的 public、published 和默认区域的信息.
{$M+}
{$METHODINFO ON}

  TClass3 = class
    function Fun3: string;
  private
    function Fun3Private: string;
  protected
    function Fun3Protected: string;
  public
    function Fun3Public: string;
  published
    function Fun3Published: string;
  end;
{$METHODINFO OFF}
{$M-}

var
  Form_main: TForm_main;

implementation

uses
  Rtti, ObjAuto;
{$R *.dfm}

// 获取对象的 RTTI 属性与事件的函数
function GetPropertyAndEventList(obj: TObject;
  pList, eList: TStringList): Boolean;
var
  ClassTypeInfo: PTypeInfo; { 类的信息结构指针 }
  ClassDataInfo: PTypeData; { 类的数据结构指针 }
  propertyList: PPropList; { TPropInfo 是属性的数据结构;
    PPropList 是其指针;
    TPropList 是属性结构指针的列表数组;
    PPropList 是指向这个数组的指针 }

  num: Integer; { 记录属性的总数 }
  size: Integer; { 记录属性结构的大小 }
  i: Integer;
begin
  ClassTypeInfo := obj.ClassInfo; { 先获取: 类的信息结构指针 }
  ClassDataInfo := GetTypeData(ClassTypeInfo); { 再获取: 类的数据结构指针 }
  num := ClassDataInfo.PropCount; { 属性总数 }
  size := SizeOf(TPropInfo); { 属性结构大小 }

  GetMem(propertyList, size * num); { 给属性数组分配内存 }

  GetPropInfos(ClassTypeInfo, propertyList); { 获取属性列表 }

  for i := 0 to num - 1 do
  begin
    if propertyList[i].PropType^.Kind = tkMethod then { 如果是事件; 事件也是属性吗, 给分出来 }
      eList.Add(propertyList[i].Name)
    else
      pList.Add(propertyList[i].Name);
  end;

  pList.Sort;
  eList.Sort; { 排序 }

  FreeMem(propertyList); { 释放属性数组的内存 }

  Result := True;
end;

procedure TForm_main.Button10Click(Sender: TObject);
var
  obj: TMyClass;
  t: TRttiType;
  m1, m2: TRttiMethod;
  r: TValue; // TRttiMethod.Invoke 的返回类型
begin
  t := TRttiContext.Create.GetType(TMyClass);
  { 获取 TMyClass 类的两个方法 }
  m1 := t.GetMethod('msg'); { procedure }
  m2 := t.GetMethod('Add'); { function }

  obj := TMyClass.Create(Self); { 调用需要依赖一个已存在的对象 }

  { 调用 msg 过程 }
  m1.Invoke(obj, ['Delphi 2010']); { 将弹出信息框 }

  { 调用 Add 函数 }
  r := m2.Invoke(obj, [1, 2]); { 其返回值是个 TValue 类型的结构 }
  ShowMessage(IntToStr(r.AsInteger)); { 3 }

  obj.Free;
end;

procedure TForm_main.Button11Click(Sender: TObject);
var
  obj: TMyClass;
  t: TRttiType;
  p: TRttiProperty;
  r: TValue;
begin
  obj := TMyClass.Create(Self);
  t := TRttiContext.Create.GetType(TMyClass);

  p := t.GetProperty('Name'); // 继承自TComponent的name

  r := p.GetValue(obj);
  ShowMessage(r.AsString); { 原来的 }

  p.SetValue(obj, 'NewName');
  r := p.GetValue(obj);
  ShowMessage(r.AsString); { NewName }

  obj.Free;
end;

procedure TForm_main.Button12Click(Sender: TObject);
var
  t: TRttiType;
  p: TRttiProperty;
  r: TValue;
begin
  t := TRttiContext.Create.GetType(TButton);

  p := t.GetProperty('Align');
  p.SetValue(Button1, TValue.FromOrdinal(TypeInfo(TAlign), Ord(alLeft)));

  r := p.GetValue(Button1);
  ShowMessage(IntToStr(r.AsOrdinal)); { 3 }
end;

procedure TForm_main.Button13Click(Sender: TObject);
var
  MiArr: TMethodInfoArray;
  Mi: PMethodInfoHeader;
  obj: TClass3;
begin
  obj := TClass3.Create;
  MiArr := GetMethods(obj.ClassType);

  Memo1.Clear;
  for Mi in MiArr do
    Memo1.Lines.Add(string(Mi.Name));

  obj.Free;
end;

procedure TForm_main.Button1Click(Sender: TObject);
var
  propertyL, EventL: TStringList;
begin
  // 属性
  propertyL := TStringList.Create;
  // 事件
  EventL := TStringList.Create;

  Memo1.Clear;
  Memo2.Clear;

  GetPropertyAndEventList(Self, propertyL, EventL); { 调用函数, 第一个参数是对象名 }
  Memo1.Lines := propertyL;
  Memo2.Lines := EventL;

  propertyL.Free;
  EventL.Free;
end;

procedure TForm_main.Button2Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
begin
  Memo1.Clear;
  for t in ctx.GetTypes do
    Memo1.Lines.Add(t.Name);
end;

procedure TForm_main.Button3Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  m: TRttiMethod;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);
  // for m in t.GetMethods do Memo1.Lines.Add(m.Name);
  for m in t.GetMethods do
    Memo1.Lines.Add(m.ToString);
end;

procedure TForm_main.Button4Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  p: TRttiProperty;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);
  // for p in t.GetProperties do Memo1.Lines.Add(p.Name);
  for p in t.GetProperties do
    Memo1.Lines.Add(p.ToString);
end;

procedure TForm_main.Button5Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  f: TRttiField;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);
  // for f in t.GetFields do Memo1.Lines.Add(f.Name);
  for f in t.GetFields do
    Memo1.Lines.Add(f.ToString);
end;

// http://my.oschina.net/hermer/blog/320075
procedure TForm_main.Button6Click(Sender: TObject);
var
  ctx: TRttiContext;
  t: TRttiType;
  ms: TArray<TRttiMethod>;
  ps: TArray<TRttiProperty>;
  fs: TArray<TRttiField>;
begin
  Memo1.Clear;
  t := ctx.GetType(TButton);

  ms := t.GetMethods;
  ps := t.GetProperties;
  fs := t.GetFields;

  Memo1.Lines.Add(Format('%s 类共有 %d 个方法', [t.Name, Length(ms)]));
  Memo1.Lines.Add(Format('%s 类共有 %d 个属性', [t.Name, Length(ps)]));
  Memo1.Lines.Add(Format('%s 类共有 %d 个字段', [t.Name, Length(fs)]));
end;

procedure TForm_main.Button7Click(Sender: TObject);
var
  t: TRttiRecordType;
  f: TRttiField;
begin
  Memo1.Clear;
  t := TRttiContext.Create.GetType(TypeInfo(TPoint)).AsRecord;
  Memo1.Lines.Add(t.QualifiedName);
  Memo1.Lines.Add(Format('Size: %d', [t.TypeSize]));
  Memo1.Lines.Add(EmptyStr);

  Memo1.Lines.Add(Format('字段数: %d', [Length(t.GetFields)]));
  Memo1.Lines.Add(Format('方法数: %d', [Length(t.GetMethods)]));
  Memo1.Lines.Add(Format('属性数: %d', [Length(t.GetProperties)]));
  Memo1.Lines.Add(EmptyStr);

  Memo1.Lines.Add('全部字段:');
  for f in t.GetFields do
    Memo1.Lines.Add(f.ToString);
end;

procedure TForm_main.Button8Click(Sender: TObject);
var
  t: TRttiRecordType;
  f: TRttiField;
begin
  Memo1.Clear;
  t := TRttiContext.Create.GetType(TypeInfo(TKeyDog)).AsRecord;
  Memo1.Lines.Add(t.QualifiedName);
  Memo1.Lines.Add(Format('Size: %d', [t.TypeSize]));
  Memo1.Lines.Add(EmptyStr);

  Memo1.Lines.Add(Format('字段数: %d', [Length(t.GetFields)]));
  Memo1.Lines.Add(Format('方法数: %d', [Length(t.GetMethods)]));
  Memo1.Lines.Add(Format('属性数: %d', [Length(t.GetProperties)]));
  Memo1.Lines.Add(EmptyStr);

  Memo1.Lines.Add('全部字段:');
  for f in t.GetFields do
    Memo1.Lines.Add(f.ToString);
end;

procedure TForm_main.Button9Click(Sender: TObject);
var
  t: TRttiOrdinalType;
begin
  Memo1.Clear;

  // 先从类型名获取类型信息对象
  t := TRttiContext.Create.GetType(TypeInfo(Byte)) as TRttiOrdinalType;
  Memo1.Lines.Add(Format('%s - %s', [t.Name, t.QualifiedName]));
  Memo1.Lines.Add(Format('Size: %d', [t.TypeSize]));
  Memo1.Lines.Add('QualifiedName: ' + t.QualifiedName);
  Memo1.Lines.Add(Format('Min,Max: %d , %d', [t.MinValue, t.MaxValue]));
  Memo1.Lines.Add(EmptyStr); // 空字串

  // 可以用 AsOrdinal 方法代替前面的 as TRttiOrdinalType
  t := TRttiContext.Create.GetType(TypeInfo(Word)).AsOrdinal;
  Memo1.Lines.Add(Format('%s: %s', [t.Name, t.QualifiedName]));
  Memo1.Lines.Add(Format('Size: %d', [t.TypeSize]));
  Memo1.Lines.Add(Format('Min,Max: %d , %d', [t.MinValue, t.MaxValue]));
  Memo1.Lines.Add(EmptyStr);

  // 也可以直接强制转换
  t := TRttiOrdinalType(TRttiContext.Create.GetType(TypeInfo(Integer)));
  Memo1.Lines.Add(Format('%s: %s', [t.Name, t.QualifiedName]));
  Memo1.Lines.Add(Format('Size: %d', [t.TypeSize]));
  Memo1.Lines.Add(Format('Min,Max: %d , %d', [t.MinValue, t.MaxValue]));
  Memo1.Lines.Add(EmptyStr);
end;

{ TMyClass }

function TMyClass.Add(const a, b: Integer): Integer;
begin
  Result := a + b;
end;

procedure TMyClass.msg(const str: string);
begin
  MessageDlg(str, mtInformation, [mbYes], 0);
end;

{ TClass3 }

function TClass3.Fun3: string;
begin
  Result := 'Fun3';
end;

function TClass3.Fun3Private: string;
begin
  Result := 'Fun3Private';
end;

function TClass3.Fun3Protected: string;
begin
  Result := 'Fun3Protected';
end;

function TClass3.Fun3Public: string;
begin
  Result := 'Fun3Public';
end;

function TClass3.Fun3Published: string;
begin
  Result := 'Fun3Published';
end;

end.

