unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls;

type
  TForm2 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    alActions: TActionList;
    act1: TAction;
    procedure act1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.act1Execute(Sender: TObject);
begin
//  ShowMessage(Sender.ClassParent.ClassName);
  ShowMessage((Sender as TAction).Name);
//  ShowMessage((Sender as TAction).ActionComponent);
  ShowMessage((Sender as TAction).ActionComponent.Name);
  ShowMessage((Sender as TAction).GetParentComponent.ClassName);
  ShowMessage('btn1 or btn2 click ?');
end;

end.
