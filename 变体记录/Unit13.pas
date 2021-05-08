unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  WdFileType = (Files, Dirs);  // ������Ϣ

  TWdFileInfo = record
    FName: string[10];   // �ļ���
    case typeid: wdFileType of    // �������ļ��л����ļ�����
      Files: (FSize: Integer);    // �ļ���С
      Dirs: (DSize: Integer;      // �ļ��д�С
      ContainFileCount: Integer;  // �����ļ��ĸ���
      ContainDirCount: Integer);  // �����ļ��еĸ���
  end;

  TForm13 = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    pp : array[0..1] of TWdFileInfo;//һ�������¼����
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
  //��ʼ����Ϊ��¼��ֵ
  with pp[0] do
  begin
    Fname := 'PP0';
    typeid := Files;
    //fsize��dsizeʵ���õ���ͬһ��洢�ռ䣬
    //������������ֵ�ˣ��洢�ռ��м�¼����Ȼ�Ǻ���
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
  Memo1.Lines.Add('�����¼��Ϣ��ʾ');
  for i := 0 to 1 do
  begin
  fs := Format('PP%d�Ĵ�С��(%d)'+#13+'Fsize:(%d),Dsize:(%d)'+#13+'ContainFileCount:(%d),CDirCount:(%d);'
    ,[i,sizeof(pp[i]),pp[i].Fsize,pp[i].Dsize,pp[i].ContainFileCount,pp[i].ContainDirCount]);
  Memo1.Lines.Add(fs);
  Memo1.Lines.Add('------------------------');
  end;
end;

end.
