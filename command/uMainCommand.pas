unit uMainCommand;

interface
uses
  uAbstractCommand, Dialogs;

type
  TNewCommand = class(TCommand)
  protected
    procedure Execute; override;
  end;

implementation

{ TNewCommand }

procedure TNewCommand.Execute;
var
  sFileName: string;
begin
  with TOpenDialog.Create(nil) do
  try
    if Execute then
    begin
      sFileName := FileName;
      ShowMessage(sFileName);
    end;
  finally
    Free;
  end;
end;

end.
