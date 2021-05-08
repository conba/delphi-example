unit ExceptionClass;

interface
uses
  SysUtils, Dialogs;

type
  EFileOpenFailed = class(Exception)
  public
    procedure Warning(); virtual; abstract;
  end;

  EFileNotFount = class(EFileOpenFailed)
  public
    procedure Warning(); override;
  end;

  EFileFormatErr = class(EFileOpenFailed)
  public
    procedure Warning(); override;
  end;


implementation

{ EFileFormatErr }

procedure EFileFormatErr.Warning;
begin
  inherited;

end;

{ EFileNotFount }

procedure EFileNotFount.Warning;
begin

end;

end.
