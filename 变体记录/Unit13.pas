unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  WdFileType = (Files, Dirs);  // 类型信息

  TWdFileInfo = record
    FName: string[10];   // 文件名
    case typeid: wdFileType of    // 根据是文件夹还是文件决定
      Files: (FSize: Integer);    // 文件大小
      Dirs: (DSize: Integer;      // 文件夹大小
      ContainFileCount: Integer;  // 包含文件的个数
      ContainDirCount: Integer);  // 包含文件夹的个数
  end;

  TForm13 = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    pp : array[0..1] of TWdFileInfo;//一个变体记录数组
    procedure ShowInfo;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.FormCreate(Sender: TObject);
begin
  //初始化是为记录赋值
  with pp[0] do
  begin
    Fname := 'PP0';
    typeid := Files;
    //fsize和dsize实际用的是同一块存储空间，
    //这里两个都赋值了，存储空间中记录的自然是后者
    Fsize := 10;
    Dsize := 100;
    ContainFileCount := 1;
    ContainDirCount := 2;
  end;
  with pp[1] do
  begin
    Fname := 'PP1';
    typeid := Dirs;
    Fsize := 0;
    Dsize := 100;
    ContainFileCount := 11;
    ContainDirCount := 222;
  end;
  Memo1.Clear;
  ShowInfo;
end;

procedure TForm13.btn1Click(Sender: TObject);
begin
  mmo1.Clear;
end;

procedure TForm13.ShowInfo;
var
  i : integer;
  fs : string;
begin
  Memo1.Lines.Add('变体记录信息显示');
  for i := 0 to 1 do
  begin
  fs := Format('PP%d的大小是(%d)'+#13+'Fsize:(%d),Dsize:(%d)'+#13+'ContainFileCount:(%d),CDirCount:(%d);'
    ,[i,sizeof(pp[i]),pp[i].Fsize,pp[i].Dsize,pp[i].ContainFileCount,pp[i].ContainDirCount]);
  Memo1.Lines.Add(fs);
  Memo1.Lines.Add('------------------------');
  end;
end;

end.
