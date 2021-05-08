unit uIUserMaint;

interface
uses
  Classes, udmUser;
type
  TIUserMaint = class(TObject)
  public
    function GetDepList: TStrings; virtual; abstract;
    function GetUserList(StrName: string): OleVariant; virtual; abstract;
    procedure UpdateUserData(UserData: OleVariant; out ErrCount: integer);
                virtual; abstract;
    constructor create; virtual; abstract;
  end;

  TIUserMainClass = class of TIUserMaint;

  TUserMaint = class(TIUserMaint)
  private
    UserDM: TUserDM;
  public
    function GetDeplist: TStrings; override;
    function GetUserList(strName: string):OleVariant; override;
    procedure UpdateUserData(UserData: OleVariant; out ErrCount: Integer);
                override;
    constructor create; override;
    destructor Destroy; override;
  end;
implementation

{ TUserMaint }

constructor TUserMaint.create;
begin

end;

destructor TUserMaint.Destroy;
begin

  inherited;
end;

function TUserMaint.GetDeplist: TStrings;
begin

end;

function TUserMaint.GetUserList(strName: string): OleVariant;
begin

end;

procedure TUserMaint.UpdateUserData(UserData: OleVariant;
  out ErrCount: Integer);
begin

end;

end.
