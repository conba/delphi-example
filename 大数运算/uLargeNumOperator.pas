unit uLargeNumOperator;

interface
uses
  SysUtils, Classes, Math;

type
  TLargeNumOperator = class
  public
    class function Add(firstValue, SecValue: string): string;
    class function Dec(firstValue, SecValue: string): string;
    class function MUL(sFirstValue, sSecValue: string): string;
    class function Division(firstValue, SecValue: string): string;
  end;

implementation

{ TLargeNumOperator }


{ TLargeNumOperator }

class function TLargeNumOperator.Add(firstValue, SecValue: string): string;
begin

end;

class function TLargeNumOperator.Dec(firstValue, SecValue: string): string;
begin

end;

class function TLargeNumOperator.Division(firstValue, SecValue: string): string;
begin

end;

class function TLargeNumOperator.MUL(sFirstValue, sSecValue: string): string;
var
  iFirLength, iSecLength, I, J, iTemp: Integer;
  iFirArr, iSecArr, iRetArr: array of Integer;
  iCarry: Integer;  // 进位
  idot, iDotfirst, iDotsecond: Integer;  // 小数点的位置
begin
  Result := EmptyStr;
  iFirLength := Length(sFirstValue);
  iSecLength := Length(sSecValue);

  SetLength(iFirArr, iFirLength);
  SetLength(iSecArr, iSecLength);
  SetLength(iRetArr, iFirLength + iSecLength + 1);
  iDotfirst := Pos('.', sFirstValue);
  if iDotfirst <> 0 then
    iDotfirst := iFirLength - iDotfirst;
  iDotsecond := Pos('.', sSecValue);
  if iDotsecond <> 0 then
    iDotsecond := iSecLength - iDotsecond;

  idot := iDotsecond + iDotfirst;
  j := 0;
  for I := Length(sFirstValue) downto 1 do
  begin
    if sFirstValue[i] = '.' then
      continue;
      iFirArr[j] := StrToInt(sFirstValue[i]);
      j := j + 1;
  end;

  j := 0;
  for I := Length(sSecValue) downto 1 do
  begin
    if sSecValue[i] = '.' then
      Continue;
    iSecArr[j] := StrToInt(sSecValue[i]);
    j := j + 1;
  end;

  for I := 0 to iFirLength - 1 do
  begin
    for J := 0 to iSecLength - 1 do
    begin
      iTemp := iFirArr[i] * iSecArr[J];
      iRetArr[i + j] := iRetArr[i + j] + iTemp;
    end;
  end;
  iCarry := 0;
  for I := 0 to iFirLength + iSecLength do
  begin
    iTemp := iRetArr[i] + iCarry;
    iRetArr[i] := iTemp mod 10;
    iCarry := iTemp div 10;
  end;
  iTemp := iFirLength + iSecLength;
  while iTemp > -1 do
  begin
    if iRetArr[iTemp] <> 0 then
      Break
    else
      iTemp := iTemp - 1;
  end;
  if iTemp = -1 then
  begin
    Result := '0';
    Exit;
  end;
  if idot <> 0 then
  begin
    for I := iTemp downto idot - 1 do
      iRetArr[i + 1] := iRetArr[i];
  end;
  for I := iTemp + 1 downto 0 do
  begin
    if i = idot then
    begin
      Result := Result + '.';
      continue;
    end;
    Result := Result + IntToStr(iRetArr[I]);
  end;
end;

end.
