unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TSampleObject = class(TPersistent)
  private
    FMyProperty: Integer;
    procedure LoadCompProperty(Reader: TReader);
    procedure StoreCompProperty(writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
  public
    property MyProperty: Integer read FMyProperty write FMyProperty;
  end;

  TForm13 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

{ TSampleObject }

procedure TSampleObject.DefineProperties(Filer: TFiler);
  function DoWrite: Boolean;
  begin
    if Filer.Ancestor <> nil then
    begin
      if TSampleObject(Filer.Ancestor).MyProperty = nil then
        Result := MyProperty <> nil
      else if (MyProperty = nil) or
        (TSampleObject(Filer.Ancestor).MyProperty <> MyProperty) then
        result := true
      else {祖先类中无同名属性}
        Result := false;
    end
    else  {调用父类方法以保存相关属性}
      Result := MyProperty <> nil;
  end;
begin
  inherited;
  Filer.DefineProperty('MyProperty', LoadCompProperty, StoreCompProperty, DoWrite);
end;

procedure TSampleObject.LoadCompProperty(Reader: TReader);
begin
  if Reader.ReadBoolean then
    MyProperty := Reader.ReadComponent(nil);
end;

procedure TSampleObject.StoreCompProperty(writer: TWriter);
begin

end;

end.
