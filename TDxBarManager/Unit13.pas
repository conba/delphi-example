unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxbar, cxClasses, StdCtrls, uTChineseMan, uTEnglish;

type
  TForm13 = class(TForm)
    btn1: TButton;
    dxBarManager1: TdxBarManager;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses
  uIMan;
{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
var
  ABar:TdxBar;
  ABarItem:TdxBarItem;
  ABarSubItem:TdxBarSubItem;
  ABarItemLink:TdxBarItemLink;
  ABarButton:TdxBarButton;
begin
   Self.dxBarManager1.Style:=bmsOffice11;     //设置样式    bmsFlat|bmsOffice11|bmsStandard|bmsUseLookAndFeel|bmsXP|bmsEnhanced
   Self.dxBarManager1.BeginUpdate;            //开启 dxBarManager 更新
   //添加工具栏
   ABar := Self.dxBarManager1.Bars.Add;       //通过dxBarManager添加一个 bar (可以是工具栏或菜单栏：通过属性设置)

   ABar.AllowClose:=False;                    //相关属性设置
   ABar.AllowCustomizing:=False;              //
   ABar.AllowQuickCustomizing:=False;         //
   ABar.AllowReset := False;                  //
   ABar.DockingStyle:=dsTop;                  //重要:停靠方式 ，不设置，将会浮动在窗口之外，这里一般在顶部停靠
   ABar.OneOnRow:=True;                       //排列在一排上，不换行

   ABar.IsMainMenu:=True;                     //是否是主菜单    false 为工具栏

   ABar.Caption := '文件';                    //设置工具栏名称
   ABar.Visible:=True;                        //设置工具栏可见
   //添加工具栏下菜单
   ABarSubItem :=  Self.dxBarManager1.AddSubItem;
   ABarSubItem.Caption:='帮助';
   ABarSubItem.Visible := ivAlways;
   ABarItemLink:=ABar.ItemLinks.Insert(0);
   ABarItemLink.Item :=  ABarSubItem;

   ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='关于';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(0);
   ABarItemLink.Item := ABarButton;

   ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='关闭';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(ABarSubItem.ItemLinks.VisibleItemCount);
   ABarItemLink.Item := ABarButton;

    ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='关闭1';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(ABarSubItem.ItemLinks.VisibleItemCount);
   ABarItemLink.Item := ABarButton;

    ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='关闭2';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(ABarSubItem.ItemLinks.VisibleItemCount);
   ABarItemLink.Item := ABarButton;

   Self.dxBarManager1.EndUpdate;
end;

procedure TForm13.btn2Click(Sender: TObject);
var
  Man1, Man2: IMan;
  i: Integer;
begin
  Man1 := TChinese.Create;
  i := Man1.IncA;
  Man2 := Man1;
  i := Man2.IncA;
  i := Man1.IncA;
end;

end.
