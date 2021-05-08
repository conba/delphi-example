unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMyMethod = function(A: array of Char; var B: TObject): Integer of object;
  TMyEnum = (EnumA, EnumB, EnumC);

  TForm1 = class(TForm)
    lst1: TListBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{LongString��WideString �� Variant û�� RTTI ��Ϣ��
ShortString ֻ�� MaxLength ��Ϣ��
����������ֻ�� FloatType: TFloatType ��Ϣ��
 TFloatType = (ftSingle, ftDouble, ftExtended, ftComp, ftCurr);
Int64 ֻ�����ֵ����Сֵ��Ϣ(Ҳ�� 64 λ������ʾ)��
Interface �Ͷ�̬���鲻̫��Ϥ���Ͳ���������}


var
  Form1: TForm1;

implementation
uses
  TypInfo;

{$R *.dfm}

//��һ���� RTTI ����ӵĲ��֣�Ŭ���ѱ��γ�͸����������ݶ��Ƿǳ��򵥵ġ�
//������һ����ȡ������Ե����ӣ�
// ��ȡ�����Ե�RTTI
procedure GetClassProperties(AClass: TClass; AStrings: TStrings);
var
 PropCount, I: SmallInt;
 PropList: PPropList;
 PropStr: string;
begin
 PropCount := GetTypeData(AClass.ClassInfo).PropCount;
 GetPropList(AClass.ClassInfo, PropList);
 for I := 0 to PropCount - 1 do
 begin
   case PropList^[I]^.PropType^.Kind of
    tkClass     : PropStr := '[Class] ';
    tkMethod    : PropStr := '[Method]';
    tkSet       : PropStr := '[Set]   ';
    tkEnumeration: PropStr := '[Enum]  ';
   else
    PropStr := '[Field] ';
   end;
   PropStr := PropStr + PropList[I]^.Name;
   PropStr := PropStr + ': ' + PropList[I]^.PropType^.Name;
   AStrings.Add(PropStr);
 end;
 FreeMem(PropList);
end;

// ��ȡ������RTTI
procedure GetMethodTypeInfo(ATypeInfo: PTypeInfo; AStrings: TStrings);
type
  PParamData = ^TParamData;

  TParamData = record      // �������������ݽṹ
    Flags: TParamFlags;    // �������ݹ���
    ParamName: ShortString; // ����������
    TypeName: ShortString;  // ��������������
  end;

  function GetParamFlagsName(AParamFlags: TParamFlags): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := Integer(pfVar) to Integer(pfOut) do
    begin
      if I = Integer(pfAddress) then
        Continue;
      if TParamFlag(I) in AParamFlags then
        Result := Result + ' ' + GetEnumName(TypeInfo(TParamFlag), I);
    end;
  end;

var
  MethodTypeData: PTypeData;
  ParamData: PParamData;
  TypeStr: PShortString;
  I: Integer;
begin
  MethodTypeData := GetTypeData(ATypeInfo);
  AStrings.Add('---------------------------------');
  AStrings.Add('Method Name: ' + ATypeInfo^.Name);
  AStrings.Add('Method Kind: ' + GetEnumName(TypeInfo(TMethodKind), Integer(MethodTypeData^.MethodKind)));
  AStrings.Add('Params Count: ' + IntToStr(MethodTypeData^.ParamCount));
  AStrings.Add('Params List:');
  ParamData := PParamData(@MethodTypeData^.ParamList);
  for I := 1 to MethodTypeData^.ParamCount do
  begin
    TypeStr := Pointer(Integer(@ParamData^.ParamName) + Length(ParamData^.ParamName) + 1);
    AStrings.Add(Format('  [%s] %s: %s', [GetParamFlagsName(ParamData^.Flags), ParamData^.ParamName, TypeStr^]));
    ParamData := PParamData(Integer(ParamData) + SizeOf(TParamFlags) + Length(ParamData^.ParamName) + Length(TypeStr^) + 2);
  end;
  if MethodTypeData^.MethodKind = mkFunction then
    AStrings.Add('Result Value: ' + PShortString(ParamData)^);
end;

// ��ȡ�������ͺͼ������͵�RTTI
procedure GetOrdTypeInfo(ATypeInfo: PTypeInfo; AStrings: TStrings);
var
  OrdTypeData: PTypeData;
  I: Integer;
begin
  OrdTypeData := GetTypeData(ATypeInfo);
  AStrings.Add('------------------------------------');
  AStrings.Add('Type Name: ' + ATypeInfo^.Name);
  AStrings.Add('Type Kind: ' + GetEnumName(TypeInfo(TTypeKind), Integer(ATypeInfo^.Kind)));
  AStrings.Add('Data Type: ' + GetEnumName(TypeInfo(TOrdType), Integer(OrdTypeData^.OrdType)));
  if ATypeInfo^.Kind <> tkSet then
  begin
    AStrings.Add('Min Value: ' + IntToStr(OrdTypeData^.MinValue));
    AStrings.Add('Max Value: ' + IntToStr(OrdTypeData^.MaxValue));
  end;
  if ATypeInfo^.Kind = tkSet then
    GetOrdTypeInfo(OrdTypeData^.CompType^, AStrings);
  if ATypeInfo^.Kind = tkEnumeration then
    for I := OrdTypeData^.MinValue to OrdTypeData^.MaxValue do
      AStrings.Add(Format('  Value %d: %s', [I, GetEnumName(ATypeInfo, I)]));
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  GetClassProperties(TForm, lst1.Items);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  GetMethodTypeInfo(TypeInfo(TMyMethod), lst1.Items);
  GetMethodTypeInfo(TypeInfo(TMouseEvent), lst1.Items);
  GetMethodTypeInfo(TypeInfo(TKeyPressEvent), lst1.Items);
  GetMethodTypeInfo(TypeInfo(TMouseWheelEvent), lst1.Items);
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  GetOrdTypeInfo(TypeInfo(Char), lst1.Items);
  GetOrdTypeInfo(TypeInfo(Integer), lst1.Items);
  GetOrdTypeInfo(TypeInfo(TFormBorderStyle), lst1.Items);
  GetOrdTypeInfo(TypeInfo(TBorderIcons), lst1.Items);
  GetOrdTypeInfo(TypeInfo(TMyEnum), lst1.Items);
end;

end.
