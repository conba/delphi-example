unit uJson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SuperObject, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, uPMTreeList;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo2: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    FsJson: string;
    procedure ChooseFile;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  s, c, s1: string;
  Arr: array[0..2] of string;
  i: Integer;
const
  AFbfx_Dv_FileName: array [0..2] of string = ('，', '.', '/');
begin
//  s := '，' ;
//  s1 := ',';
//  if SameText(s, '，') then
//
//  if s[1] in ['1', 'z', ',', '，']  then
//
//  for c in AFbfx_Dv_FileName do
//  begin
//    if SameText(s, c) then
//    ShowMessage(c);
//  end;
  ChooseFile;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  jo: ISuperObject;
begin
  if SameText(FsJson, EmptyStr) then
  begin
    ChooseFile;
  end;
  if not SameText(FsJson, EmptyStr) then
  begin
//    jo := TSuperObject.ParseString(PWideChar(FsJson), False);
    // 也可以用so
    jo := SO(PWideChar(FsJson));
    Memo2.Text := jo.AsString;
//    Memo2.Lines.Add('version中的值为:' + jo['version'].AsString);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  jo, jo1: ISuperObject;
begin
  jo1 := So();
  jo1.S['name'] := '你你你';
  jo := SO('{"bh": null,"ww":"哈哈哈"}');
  jo.S['bh'] := '001';
  jo.S['name'] := 'xkx';
  jo.S['name11'] := '';
  // 加数组
  jo.ForcePath('ztgc2', stNull);
  jo.s['ztgc'] := #13#10;
  jo.c['aa'] := 0.0001;
  jo.s['bb'] := '你好';
  jo.s['cc'] := '啦啦\r\n哈哈';
//  jo.O['ztgc'].S['5'] := '5';
//
//  // 加{}
//  jo.O['ztgc'].ForcePath('dwgc', stObject);
//  jo.O['ztgc'].O['dwgc'].ForcePath('zygc', stObject);
  // 加[]
//  jo.O['ztgc'].O['dwgc'].O['zygc'].ForcePath('list', stArray);
//    jo.O['ztgc'].O['dwgc'].O['zygc'].A['list'].S[3] := 'a\r\n';
//  jo.O['ztgc'].O['dwgc'].O['zygc'].A['list'].Add(so('a''r''\\''n'+ 'b'));
//  jo.O['ztgc'].O['dwgc'].O['zygc'].A['list'].Add(so(1));
//  jo.O['ztgc'].O['dwgc'].O['zygc'].A['list'].Add(so(true));
//  jo.O['ztgc'].O['dwgc'].O['zygc'].A['list'].Add(so());
//  jo.A['arr'] := '[]';

//  jo1.ForcePath('dwgc', stArray);
//  jo1.ForcePath('dwgc', stObject);
//  jo.A['ztgc'].Add(so('11'));
//  jo.DataType;
  Memo2.Text := jo.AsString;
//  Memo2.Text := jo.AsJSon(true, true);

  // 保存json文件
  jo.SaveTo('c:\1.json', False, False);
//    Memo2.Lines.Add('version中的值为:' + jo['version'].AsString);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  jo, item, jo1: ISuperObject;
  item1, item2: TSuperAvlEntry;
  s: string;
  i: Integer;
  d: Double;
  b: Boolean;
begin
  Memo2.Text := '';
  if SameText(FsJson, EmptyStr) then
  begin
    ChooseFile;
  end;
  if not SameText(FsJson, EmptyStr) then
  begin
    // 也可以用so
    jo := SO(PWideChar(FsJson));
    jo1 := jo.O['children'];
    for item in jo1 do
      Memo2.Lines.Add(item.AsJSon(False, False));

    //数组式访问
//    ShowMessage(jo['name'].AsString);
//    ShowMessage(jo['age'].AsString);
//    ShowMessage(jo['sex'].AsString);
//    ShowMessage(jo['weight'].AsString);
//    ShowMessage(jo['addresses'].AsString);
//    ShowMessage(jo['tel'].AsString);
//    ShowMessage(jo['children'].AsString);

    //指定返回类型
//    s := jo['name'].AsString;
//    i := jo['age'].AsInteger;
//    b := jo['sex'].AsBoolean;
//    d := jo['weight'].AsDouble;
//
//    ShowMessage(s);
//    ShowMessage(IntToStr(i));
//    ShowMessage(BoolToStr(b, True));
//    ShowMessage(FloatToStr(d));
//
//    s := jo.S['name'];
//    i := jo.I['age'];
//    b := jo.B['sex'];
//    d := jo.D['weight'];
//
//    ShowMessage(s);
//    ShowMessage(IntToStr(i));
//    ShowMessage(BoolToStr(b, True));
//    ShowMessage(FloatToStr(d));

    // 内嵌对象访问
//    ShowMessage(jo['addresses.address'].AsString);
//    ShowMessage(jo['addresses.pc'].AsString);

       //遍历对象
//     for item in jo do
//     begin
//       Memo2.Lines.Add(item.AsJSon(False, False));
////       ShowMessage(item.AsJSon(False, False));
//     end;

//使用 TSuperAvlEntry 或 TSuperTableString 遍历数组
//      for item1 in jo.AsObject do
//      begin
//        if SameText(item1.Name, 'children') then
//        begin
//          jo1 := item1.Value;
////          Memo2.Lines.Add(jo1.AsJSon(False, False));
////          for item2 in jo1.AsObject do
////          begin
////            ShowMessageFmt('Name: %s; Value: %s', [item2.Name, item2.Value.AsString]);
////          end;
//          for item in jo1 do
//           Memo2.Lines.Add(item.AsJSon(False, False));
//           begin
//             for item2 in item.AsObject do
//             begin
//               Memo2.Lines.Add(item2.Name + '--' + item2.Value.AsString);
////                ShowMessageFmt('Name: %s; Value: %s', [item2.Name, item2.Value.AsString]);
//             end;
////             Memo2.Lines.Add(item.S['name']);
////             Memo2.Lines.Add(item.AsJSon(False, False));
//      //       ShowMessage(item.AsJSon(False, False));
//           end;
//           break;
//        end;
////        ShowMessageFmt('Name: %s; Value: %s', [item1.Name, item1.Value.AsString]);
//      end;
//    Memo2.Lines.Add(jo.O['addresses'].O['address'].AsString);
  end;
end;

procedure TForm1.ChooseFile;
var
  sList: TStringlist;
  AEd: TEncoding;
const
  cst_fileOpenPath = 'C:\Users\Administrator\Desktop\Json导出';
begin
  sList := TStringList.Create;
  with TOpenDialog.Create(nil) do
  try
    Filter := 'Json|*.json;*.txt';
    if DirectoryExists(cst_fileOpenPath) then
      InitialDir := cst_fileOpenPath;
    if Execute then
    begin
      // 如果不传编码方式加载json中文会乱码
      sList.LoadFromFile(FileName, AEd.UTF8);
      if SameText(sList.GetText, EmptyStr) then
        sList.LoadFromFile(FileName);
      FsJson := sList.GetText;
      Memo1.Text := FsJson;
    end;
  finally
    Free;
    sList.Free;
  end;
end;

end.
