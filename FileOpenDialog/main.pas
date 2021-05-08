unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shlobj, StdCtrls;

type
  TForm1 = class(TForm)
    FileOpenDialog1: TFileOpenDialog;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  ActiveX, ComObj, ShellAPI, CommCtrl;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  BrowseInfo: TBrowseInfo;
  ShellMalloc: IMalloc;
 RootIDList,ItemIDList: PItemIDList;
begin
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
    SHGetSpecialFolderLocation(Application.Handle,CSIDL_FONTS , RootIDList);//起始是字体目录，可改成CSIDL_DESKTOP等其他
  with BrowseInfo do
  begin
    hwndOwner := Application.Handle;
    pidlRoot := RootIDList;//can be nil
    pszDisplayName := '浏览';
    lpszTitle := '浏览';
    ulFlags := BIF_BROWSEFORCOMPUTER;
    lpfn:=nil;
    lparam:=0;
  end;
  ItemIDList := ShBrowseForFolder(BrowseInfo);
  ShellMalloc.Free(RootIDList);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
 BrowseInfo: TBrowseInfo;
 ShellMalloc: IMalloc;
 RootIDList,ItemIDList: PItemIDList;
 SelectBuffer:array [0..Max_Path] of char;//PChar;
 Directory,displayname:string;
begin
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
    SHGetSpecialFolderLocation(Application.Handle,CSIDL_FONTS , RootIDList);//起始是字体目录，可改成CSIDL_DESKTOP等其他
  with BrowseInfo do
  begin
    hwndOwner := Application.Handle;
    pidlRoot := RootIDList;//can be nil
    pszDisplayName := '浏览';
    lpszTitle := '浏览';
    ulFlags := BIF_BROWSEFORCOMPUTER;
    lpfn:=nil;
    lparam:=0;
  end;
  ItemIDList := ShBrowseForFolder(BrowseInfo);
  if ItemIDList <> nil then
  begin
    ShGetPathFromIDList(ItemIDList, SelectBuffer);
    ShellMalloc.Free(ItemIDList);
    Directory := String(SelectBuffer);//选的目录名
    DisplayName:=string(BrowseInfo.pszDisplayName);
  end;
  ShellMalloc.Free(RootIDList);
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  Dic: string;
  FavoriteDic: TFavoriteLinkItems;
  FavoriteLink: TFavoriteLinkItem;
  FileOpenDialog: TFileOpenDialog;
begin
  Dic := 'C:\PerfLogs\';
  FavoriteDic := TFavoriteLinkItems.Create(TFavoriteLinkItem);
  FileOpenDialog := TFileOpenDialog.Create(nil);
  try
    FavoriteLink := FavoriteDic.Add;
    FavoriteLink.Location := Dic;
//    FileOpenDialog.FavoriteLinks := FavoriteDic;
    FileOpenDialog.Execute;
  finally
    FavoriteDic.Free;
  end;
end;

end.
