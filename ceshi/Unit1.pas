unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TGet_Trans = function (AInFile, AOutFile: PAnsiChar): Boolean; stdcall;

  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//  function UnDesQzhFile(AInFile, AOutFile: PChar): Boolean; stdcall;

var
  Form1: TForm1;

implementation
//  function UnDesQzhFile; external 'qzh3des.dll';

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  AHandle: Cardinal;
  AGet_Trans: TGet_Trans;
  b: Boolean;
  Str1, Str2: string;
begin
  Str1 := 'C:\台州房建施工测试项目(版本号：2).招标文件';
  Str2 := 'C:\zhaobiao.招标文件';
  AHandle := LoadLibrary(PChar('C:\qzh3des.dll'));
  @AGet_Trans := GetProcAddress(AHandle, 'UnDesQzhFile');
  if @AGet_Trans <> nil then
  begin
    b := AGet_Trans(PAnsiChar(Str1), PAnsiChar(Str2));
    if b then
      ShowMessage('1');
  end;
//  b := True;
//  b := UnDesQzhFile(PChar(Str1), PChar(Str2));
//  if b then
//   ShowMessage('1');
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  AHandle: Cardinal;
  AGet_Trans: TGet_Trans;
  b: Boolean;
  Str1, Str2: string;
begin
  AHandle := LoadLibraryA(PAnsiChar('C:\qzh3des.dll'));
  try
    @AGet_Trans := GetProcAddress(AHandle, 'UnDesQzhFile');
    if @AGet_Trans <> nil then
    begin
      Str1 := 'C:\台州房建施工测试项目(版本号：2).招标文件';
      Str2 := 'C:\zhaobiao.招标文件';
     if FileExists(Str1) then
       b := AGet_Trans(PAnsiChar(Str1), PAnsiChar(Str2));
      if b then
        ShowMessage('1');
    end;
  finally
     FreeLibrary(AHandle);
  end;
end;

end.
