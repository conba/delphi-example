unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DesignHookUtils,  StdCtrls, Spin, ExtCtrls, Buttons;
  //Vcl.Buttons, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls,

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpinButton1: TSpinButton;
    Button1: TButton;
    Button2: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  EndDesign(Self);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  BeginDesign(Self, panel1);
end;

end.
