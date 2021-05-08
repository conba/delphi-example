unit Unit14;

interface
uses
  Classes;
type
  TIUserMaint = class(TObject)
  public
    function GetDepList: TStrings; virtual;abstract;
    function GetUserList(strName: string): OleVariant; virtual; abstract;
    procedure UpdateUserData(UserData: OleVariant; out ErrCount: Integer);
                virtual; abstract;
    constructor create; virtual; abstract;
  end;

  TIUserMainClass = class of TIUserMaint;

implementation

end.
