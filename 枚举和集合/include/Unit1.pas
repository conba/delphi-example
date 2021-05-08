unit Unit1;

interface

uses
  // The System unit does not need to be defined
  SysUtils,
  Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm} // Include form definitions

procedure TForm1.FormCreate(Sender: TObject);
var
  evenNumbers : Set of 0..10;
  i : Integer;
begin
  // Make sure that evenNumbers only contains even numbers
  evenNumbers := [];
  for i := 0 to 10 do
    if (i mod 2) = 0
    then include(evenNumbers, i);

  for i := 0 to 10 do
    if (i mod 2) = 0 then
     Include(evenNumbers, i);

  // Now display the set contents
  for i := 0 to 10 do
    if i in evenNumbers
    then ShowMessage(IntToStr(i)+' is even');

  for i := 0 to 8 do
    if (i mod 2) = 0 then
     Exclude(evenNumbers, i);

  for i := 0 to 8 do
    if (i mod 2) = 0 then
     Exclude(evenNumbers, i);

  for i := 0 to 10 do
    if i in evenNumbers
    then ShowMessage(IntToStr(i)+' is even');
end;

end.
