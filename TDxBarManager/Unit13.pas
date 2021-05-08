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
   Self.dxBarManager1.Style:=bmsOffice11;     //������ʽ    bmsFlat|bmsOffice11|bmsStandard|bmsUseLookAndFeel|bmsXP|bmsEnhanced
   Self.dxBarManager1.BeginUpdate;            //���� dxBarManager ����
   //��ӹ�����
   ABar := Self.dxBarManager1.Bars.Add;       //ͨ��dxBarManager���һ�� bar (�����ǹ�������˵�����ͨ����������)

   ABar.AllowClose:=False;                    //�����������
   ABar.AllowCustomizing:=False;              //
   ABar.AllowQuickCustomizing:=False;         //
   ABar.AllowReset := False;                  //
   ABar.DockingStyle:=dsTop;                  //��Ҫ:ͣ����ʽ �������ã����ḡ���ڴ���֮�⣬����һ���ڶ���ͣ��
   ABar.OneOnRow:=True;                       //������һ���ϣ�������

   ABar.IsMainMenu:=True;                     //�Ƿ������˵�    false Ϊ������

   ABar.Caption := '�ļ�';                    //���ù���������
   ABar.Visible:=True;                        //���ù������ɼ�
   //��ӹ������²˵�
   ABarSubItem :=  Self.dxBarManager1.AddSubItem;
   ABarSubItem.Caption:='����';
   ABarSubItem.Visible := ivAlways;
   ABarItemLink:=ABar.ItemLinks.Insert(0);
   ABarItemLink.Item :=  ABarSubItem;

   ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='����';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(0);
   ABarItemLink.Item := ABarButton;

   ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='�ر�';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(ABarSubItem.ItemLinks.VisibleItemCount);
   ABarItemLink.Item := ABarButton;

    ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='�ر�1';
   ABarButton.Visible := ivAlways;
   ABarItemLink:= ABarSubItem.ItemLinks.Insert(ABarSubItem.ItemLinks.VisibleItemCount);
   ABarItemLink.Item := ABarButton;

    ABarButton := Self.dxBarManager1.AddButton;
   ABarButton.Caption:='�ر�2';
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
