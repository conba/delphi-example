unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    lstInfo: TListBox;
    btnTest: TButton;
    edtTest: TEdit;
    chkTest: TCheckBox;
    rbTest: TRadioButton;
    procedure btnTestClick(Sender: TObject);
    procedure chkTestClick(Sender: TObject);
    procedure edtTestClick(Sender: TObject);
    procedure OnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbTestClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btnTestClick(Sender: TObject);
begin

  OnClick(Sender);
end;

procedure TForm13.chkTestClick(Sender: TObject);
begin
  OnClick(Sender);
end;

procedure TForm13.edtTestClick(Sender: TObject);
begin
  OnClick(Sender);
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  lstInfo.Items.Clear;
end;

procedure TForm13.OnClick(Sender: TObject);
var
  Str: String;
  TmpClass: TObject;
begin
//  Str := '';
//  lstInfo.Items.Add(Str);
//  Str := Format('ClassName = %s',[Sender.ClassName]);
//  lstInfo.Items.Add(Str);
//  Str := Format('ClassParent = %s',[Sender.ClassParent.ClassName]);
//  lstInfo.Items.Add(Str);
//  Str := Format('InstanceSize = %d', [Sender.InstanceSize]);
//  lstInfo.Items.Add(Str);
//  lstInfo.Clear;
//  ClassRef := Sender.ClassType;
//  while ClassRef <> nil do
//  begin
//    lstInfo.Items.Add(ClassRef.ClassName);
//    ClassRef := ClassRef.ClassParent;
//  end;
//  while Assigned(ClassRef) do
//  begin
//    lstInfo.Items.Add(ClassRef.ClassName);
//    ClassRef := ClassRef.ClassParent;
//  end;
  TmpClass := Sender;
  while TmpClass.ClassParent <> nil do
  begin
    TmpClass := TmpClass.ClassParent.Create;
  end;


end;

procedure TForm13.rbTestClick(Sender: TObject);
begin
  OnClick(Sender);
end;

end.
