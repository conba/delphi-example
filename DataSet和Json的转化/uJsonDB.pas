unit uJSONDB;

interface

uses
  SysUtils, Classes, Variants, DB, DBClient, SuperObject, Dialogs;

type
  TJSONDB = class
  private
    class function getJsonFieldNames(res: ISuperObject): TStringList;
    class function getJsonFieldValues(res: ISuperObject): TStringList;
  public
    class procedure JsonToClientDataSet(jsonArr: TSuperArray; dstCDS: TClientDataSet);
//class procedure JsonToClientDataSetF(jsonArr: TSuperArray; dstCDS: TClientDataSet;fs:String);
    class function ClientDataSetToJSON(srcCDS: TClientDataSet): UTF8String;
  end;
//type
// TArrayDim = Array of ShortString;

implementation

function GetToken(var astring: string; const fmt: array of char): string;
var
  i, j: integer;
  Found: Boolean;
begin
  Found := false;
  result := '';
  astring := TrimLeft(astring);

  if length(astring) = 0 then
    exit;

  i := 1;
  while i <= length(astring) do
  begin
    Found := false;
    if astring[i] <= #128 then
    begin
      for j := Low(fmt) to High(fmt) do
      begin
        if (astring[i] <> fmt[j]) then
          continue;
        Found := true;
        break;
      end;
      if not Found then
        i := i + 1;
    end
    else
      i := i + 2;

    if Found then
      break;
  end;

  if Found then
  begin
    result := copy(astring, 1, i - 1);
    delete(astring, 1, i);
  end
  else
  begin
    result := astring;
    astring := '';
  end;
end;

function GetFieldParams(PropName, Source: string): string;
var
  S1, S2: string;
  TmpParam: string;
  AChar: string;
  aValue, aPropName, aSource: string;
begin
  Result := '';
  if Source = '' then
    Exit;
  aSource := Source;
  while aSource <> '' do
  begin
    aValue := GetToken(aSource, [',']);
    aPropName := GetToken(aValue, [':']);
    if CompareText(PropName, aPropName) <> 0 then
      continue;
    Result := aValue;
    break;
  end;
end;
//從json取得欄位名稱

class function TJSONDB.getJsonFieldNames(res: ISuperObject): TStringList;
var
  i: Integer;
  fieldList: TStringList;
  fieldNames: string;
begin
  try
    fieldList := TStringList.Create;
    fieldNames := res.AsObject.getNames.AsString;

    fieldNames := StringReplace(fieldNames, '[', '', [rfReplaceAll, rfIgnoreCase]);
    fieldNames := StringReplace(fieldNames, ']', '', [rfReplaceAll, rfIgnoreCase]);
    fieldNames := StringReplace(fieldNames, '"', '', [rfReplaceAll, rfIgnoreCase]);

    fieldList.Delimiter := ',';
    fieldList.DelimitedText := fieldNames;
    Result := fieldList;
  finally
//fieldList.Free;
  end;
end;

//從json取得欄位值
class function TJSONDB.getJsonFieldValues(res: ISuperObject): TStringList;
var
  i: Integer;
  fieldList: TStringList;
  fieldValues: string;
begin
  try
    fieldList := TStringList.Create;
    fieldValues := res.AsObject.getValues.AsString;
    fieldValues := StringReplace(fieldValues, '[', '', [rfReplaceAll, rfIgnoreCase]);
    fieldValues := StringReplace(fieldValues, ']', '', [rfReplaceAll, rfIgnoreCase]);
    fieldValues := StringReplace(fieldValues, '"', '', [rfReplaceAll, rfIgnoreCase]);

    fieldList.Delimiter := ',';
    fieldList.DelimitedText := fieldValues;
    Result := fieldList;
  finally
//fieldList.Free;
  end;
end;
//json轉CDS

class procedure TJSONDB.JsonToClientDataSet(jsonArr: TSuperArray; dstCDS: TClientDataSet);
var
  fieldList: TStringList;
  valuesList: TStringList;
  jsonSrc: string;
  i, j: Integer;
  jo: ISuperObject;
  jts: TSuperTableString;
  ja: TSuperArray;
  iter: TSuperObjectIter;
  ss, s1: string;
  dps: TSupertype;
  ft: TFieldType;
  len: integer;
// XJSon :TlkJSONobject;
begin

  fieldList := getJsonFieldNames(SO[jsonArr[0].AsJson(False, False)]);
  if (dstCDS.FieldCount = 0) then
  begin
    jo := so(jsonArr[0].AsString);
// iter:=jo.AsObject.GetEnumerator;
// xjson:= TlkJSON.ParseText(jsonArr[0]);
    for i := 0 to fieldList.Count - 1 do
    begin

      if ObjectFindFirst(jo, iter) then
      begin
        repeat
          dps := iter.Ite.Current.Value.DataType;
          ss := iter.Ite.Current.Name;
          if trim(ss) = trim(fieldList[i]) then
            break;
        until not ObjectFindNext(iter);
      end;
      ObjectFindClose(iter);
      ft := ftString;
      case dps of
        stNull:
          ft := ftString;
        stBoolean:
          ft := ftString;
        stDouble:
          ft := ftFloat;
        stCurrency:
          ft := ftFloat;
        stInt:
          ft := ftFloat;
        stString:
          ft := ftString;
      end;
      if (ft = ftFloat) then
      begin
        dstCDS.FieldDefs.Add(fieldList[i], ft);
// s1:=s1+fieldList[i]+',';
      end;
      if (ft = ftString) then
      begin
        len := 100; //默认字段长度为100
        s1 := copy(fieldList[i], 1, 3); //判断是否属于需要特殊设置长度的字段
        if s1 = 'AAA' then //根据设置的特殊字段名称AAA开始的字段，_开始后面的数字为字段长度
        begin
          len := pos('_', fieldList[i]);
          len := strtointdef(copy(fieldList[i], len + 1, length(fieldList[i]) - len), 100); //获取特殊字段的长度设置
        end;
        dstCDS.FieldDefs.Add(fieldList[i], ft, len, false); // ftVarBytes ftString
      end;
    end;
    dstCDS.CreateDataSet;
    dstCDS.Close;
    dstCDS.Open;
  end;
  try
    dstCDS.DisableControls;
    for i := 0 to jsonArr.Length - 1 do
    begin

      jts := jsonArr[i].AsObject;
      ja := jts.GetValues.AsArray;


// jsonSrc:= SO[jsonArr[i].AsJson(False,False)].AsString;
// jsonSrc := StringReplace(jsonSrc, '[', '', [rfReplaceAll, rfIgnoreCase]);
// jsonSrc := StringReplace(jsonSrc, ']', '', [rfReplaceAll, rfIgnoreCase]);
// jsonSrc := StringReplace(jsonSrc, '"', '', [rfReplaceAll, rfIgnoreCase]);
// jsonSrc := StringReplace(jsonSrc, '{', '', [rfReplaceAll, rfIgnoreCase]);
// jsonSrc := StringReplace(jsonSrc, '}', '', [rfReplaceAll, rfIgnoreCase]);

      dstCDS.Append;
      for j := 0 to fieldList.Count - 1 do
      begin
{ss:= GetFieldParams(fieldList[j], jsonSrc);

}
        ss := ja[j].AsString;
        if trim(ss) = 'null' then
          ss := '';
        dstCDS.FieldByName(fieldList[j]).AsString := ss;
      end;
      dstCDS.Post;
    end;

  finally
    dstCDS.EnableControls;
  end;
end;

//ClientDataSet轉JSON
class function TJSONDB.ClientDataSetToJSON(srcCDS: TClientDataSet): UTF8String;
var
  i, j: Integer;
  keyValue: string;
  jsonList: TStringList;
  jsonResult: string;
begin
  if not srcCDS.Active then
    srcCDS.Open;

  try
    jsonList := TStringList.Create;
    srcCDS.DisableControls;
    srcCDS.First;
    while not srcCDS.Eof do
    begin
      keyValue := '';
      for i := 0 to srcCDS.FieldDefs.Count - 1 do
      begin
        keyValue := keyValue + Format('"%s":"%s",', [srcCDS.Fields[i].FieldName, srcCDS.Fields[i].AsString]);

      end;
      jsonList.Add(Format('{%s}', [Copy(keyValue, 0, Length(keyValue) - 1)]));
      srcCDS.Next;
    end;
    for i := 0 to jsonList.Count - 1 do
    begin
      jsonResult := jsonResult + jsonList[i] + ',';
    end;
    Result := Utf8Encode(Format('[%s]', [Copy(jsonResult, 0, Length(jsonResult) - 1)]));
  finally
    srcCDS.EnableControls;
    jsonList.Free;
  end;
end;

end.

