{
内存加载DLL
wr960204
}
unit PELoader;

interface
uses
  Windows;


function LoadPE(Buf: Pointer; Len: Integer): Cardinal;
procedure FreePE(Handle: Cardinal);
function GetProcAddress(Module: Cardinal; ProcessName: PChar): Pointer;

implementation

const
  IMAGE_ORDINAL_FLAG = DWORD($80000000);

function GetProcAddress(Module: Cardinal; ProcessName: PChar): Pointer;
  function strcmp(p1, p2: PChar): boolean;
  begin
    Result := False;
    while (p1^ = p2^) do
    begin
      if (P1^ = #0) or (P2^ = #0) then
      begin
        Result := True;
        Exit;
      end;

      Inc(P1);
      Inc(P2);
    end;

  end;
var
  ExportName        : pChar;
  Address           : Cardinal;
  J                 : Cardinal;
  ImageDosHeader    : PImageDosHeader;
  ImageNTHeaders    : PImageNTHeaders;
  ImageExportDirectory: PImageExportDirectory;
begin
  ImageDosHeader := Pointer(Module);
  ImageNTHeaders := Pointer(Module + ImageDosHeader._lfanew);
  ImageExportDirectory := Pointer(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + Module);
  J := 0;
  Address := 0;
  repeat
    ExportName := Pointer(Cardinal(Pointer(Cardinal(ImageExportDirectory.AddressOfNames) + Module + J * 4)^) + Module);
    if strcmp(ExportName, ProcessName) then
      Address := Cardinal(Pointer(Word(Pointer(J shl 1 + Cardinal(
        ImageExportDirectory.AddressOfNameOrdinals) + Module)^) and
        $0000FFFF shl 2 + Cardinal(ImageExportDirectory.AddressOfFunctions)
        + Module)^) + Module;
    Inc(J);
  until (Address <> 0) or (J = ImageExportDirectory.NumberOfNames);
  Result := Pointer(Address);
end;



type
  TImageSectionHeaders = array[0..0] of TImageSectionHeader;
  PImageSectionHeaders = ^TImageSectionHeaders;



  TIIDUnion = record
    case Integer of
      0: (Characteristics: DWORD);
      1: (OriginalFirstThunk: DWORD);
  end;

  PIMAGE_IMPORT_DESCRIPTOR = ^IMAGE_IMPORT_DESCRIPTOR;
  _IMAGE_IMPORT_DESCRIPTOR = record
    Union: TIIDUnion;
    TimeDateStamp: DWORD;
    ForwarderChain: DWORD;
    Name: DWORD;
    FirstThunk: DWORD;
  end;

  IMAGE_IMPORT_DESCRIPTOR = _IMAGE_IMPORT_DESCRIPTOR;
  TImageImportDecriptor = IMAGE_IMPORT_DESCRIPTOR;
  PImageImportDecriptor = PIMAGE_IMPORT_DESCRIPTOR;

  PIMAGE_THUNK_DATA32 = ^IMAGE_THUNK_DATA32;
  _IMAGE_THUNK_DATA32 = record
    case Integer of
      0: (ForwarderString: DWORD);
      1: (Function_: DWORD);
      2: (Ordinal: DWORD);
      3: (AddressOfData: DWORD);
  end;
  IMAGE_THUNK_DATA32 = _IMAGE_THUNK_DATA32;
  TImageThunkData32 = IMAGE_THUNK_DATA32;
  PImageThunkData32 = PIMAGE_THUNK_DATA32;
  IMAGE_THUNK_DATA = IMAGE_THUNK_DATA32;
  PIMAGE_THUNK_DATA = PIMAGE_THUNK_DATA32;

  PIMAGE_IMPORT_BY_NAME = ^IMAGE_IMPORT_BY_NAME;
  _IMAGE_IMPORT_BY_NAME = record
    Hint: Word;
    Name: array[0..0] of Byte;
  end;
  IMAGE_IMPORT_BY_NAME = _IMAGE_IMPORT_BY_NAME;
  TImageImportByName = IMAGE_IMPORT_BY_NAME;
  PImageImportByName = PIMAGE_IMPORT_BY_NAME;
{ 计算对齐后的大小 }

function GetAlignedSize(Origin, Alignment: Cardinal): Cardinal;
begin
  result := (Origin + Alignment - 1) div Alignment * Alignment;
end;

{ 计算加载pe并对齐需要占用多少内存，未直接使用OptionalHeader.SizeOfImage作为结果是因为据说有的编译器生成的exe这个值会填0 }

function CalcTotalImageSize(MzH: PImageDosHeader; FileLen: Cardinal; peH: PImageNtHeaders;
  peSecH: PImageSectionHeaders): Cardinal;
var
  i                 : Integer;
begin
  {计算pe头的大小}
  result := GetAlignedSize(PeH.OptionalHeader.SizeOfHeaders, PeH.OptionalHeader.SectionAlignment);

  {计算所有节的大小}
  for i := 0 to peH.FileHeader.NumberOfSections - 1 do
    if peSecH[i].PointerToRawData + peSecH[i].SizeOfRawData > FileLen then // 超出文件范围
    begin
      result := 0;
      exit;
    end
    else if peSecH[i].VirtualAddress <> 0 then //计算对齐后某节的大小
      if peSecH[i].Misc.VirtualSize <> 0 then
        result := GetAlignedSize(peSecH[i].VirtualAddress + peSecH[i].Misc.VirtualSize, PeH.OptionalHeader.SectionAlignment)
      else
        result := GetAlignedSize(peSecH[i].VirtualAddress + peSecH[i].SizeOfRawData, PeH.OptionalHeader.SectionAlignment)
    else if peSecH[i].Misc.VirtualSize < peSecH[i].SizeOfRawData then
      result := result + GetAlignedSize(peSecH[i].SizeOfRawData, peH.OptionalHeader.SectionAlignment)
    else
      result := result + GetAlignedSize(peSecH[i].Misc.VirtualSize, PeH.OptionalHeader.SectionAlignment);

end;

{ 加载pe到内存并对齐所有节 }

function AlignPEToMem(const Buf: Pointer; Len: Integer; var PeH: PImageNtHeaders;
  var PeSecH: PImageSectionHeaders; var Mem: Pointer; var ImageSize: Cardinal): Boolean;
var
  SrcMz             : PImageDosHeader; // DOS头
  SrcPeH            : PImageNtHeaders; // PE头
  SrcPeSecH         : PImageSectionHeaders; // 节表
  i                 : Integer;
  l                 : Cardinal;
  Pt                : Pointer;
begin
  result := false;
  SrcMz := Buf;
  if Len < sizeof(TImageDosHeader) then exit;
  if SrcMz.e_magic <> IMAGE_DOS_SIGNATURE then exit;
  if Len < SrcMz._lfanew + Sizeof(TImageNtHeaders) then exit;
  SrcPeH := pointer(Integer(SrcMz) + SrcMz._lfanew);
  if (SrcPeH.Signature <> IMAGE_NT_SIGNATURE) then exit;
  if (SrcPeH.FileHeader.Characteristics and IMAGE_FILE_DLL = 0) //不是DLL,
    or (SrcPeH.FileHeader.Characteristics and IMAGE_FILE_EXECUTABLE_IMAGE = 0) //不可执行
    or (SrcPeH.FileHeader.SizeOfOptionalHeader <> SizeOf(TImageOptionalHeader)) then exit;
  SrcPeSecH := Pointer(Integer(SrcPeH) + SizeOf(TImageNtHeaders));
  ImageSize := CalcTotalImageSize(SrcMz, Len, SrcPeH, SrcPeSecH);
  if ImageSize = 0 then
    exit;
  Mem := VirtualAlloc(nil, ImageSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE); // 分配一块可以执行,可以读写的内存
  if Mem <> nil then
  begin
    // 计算需要复制的PE头
    l := SrcPeH.OptionalHeader.SizeOfHeaders;
    for i := 0 to SrcPeH.FileHeader.NumberOfSections - 1 do
      if (SrcPeSecH[i].PointerToRawData <> 0) and (SrcPeSecH[i].PointerToRawData < l) then
        l := SrcPeSecH[i].PointerToRawData;
    Move(SrcMz^, Mem^, l);
    PeH := Pointer(Integer(Mem) + PImageDosHeader(Mem)._lfanew);
    PeSecH := Pointer(Integer(PeH) + sizeof(TImageNtHeaders));

    Pt := Pointer(Cardinal(Mem) + GetAlignedSize(PeH.OptionalHeader.SizeOfHeaders, PeH.OptionalHeader.SectionAlignment));
    for i := 0 to PeH.FileHeader.NumberOfSections - 1 do
    begin
      // 定位该节在内存中的位置
      if PeSecH[i].VirtualAddress <> 0 then
        Pt := Pointer(Cardinal(Mem) + PeSecH[i].VirtualAddress);

      if PeSecH[i].SizeOfRawData <> 0 then
      begin
        // 复制数据到内存
        Move(Pointer(Cardinal(SrcMz) + PeSecH[i].PointerToRawData)^, pt^, PeSecH[i].SizeOfRawData);
        if peSecH[i].Misc.VirtualSize < peSecH[i].SizeOfRawData then
          pt := pointer(Cardinal(pt) + GetAlignedSize(PeSecH[i].SizeOfRawData, PeH.OptionalHeader.SectionAlignment))
        else
          pt := pointer(Cardinal(pt) + GetAlignedSize(peSecH[i].Misc.VirtualSize, peH.OptionalHeader.SectionAlignment));
        // pt 定位到下一节开始位置
      end
      else
        pt := pointer(Cardinal(pt) + GetAlignedSize(PeSecH[i].Misc.VirtualSize, PeH.OptionalHeader.SectionAlignment));
    end;
    result := True;
  end;
end;

{ 是否包含可重定向列表 }

function HasRelocationTable(peH: PImageNtHeaders): Boolean;
begin
  result := (peH.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress <> 0)
    and (peH.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size <> 0);
end;

type
  PImageBaseRelocation = ^TImageBaseRelocation;
  TImageBaseRelocation = packed record
    VirtualAddress: cardinal;
    SizeOfBlock: cardinal;
  end;

{ 重定向PE用到的地址 }

procedure DoRelocation(peH: PImageNtHeaders; NewBase: Pointer);
var
  Delta             : Cardinal;
  p                 : PImageBaseRelocation;
  pw                : PWord;
  i                 : Integer;
begin
  Delta := Cardinal(NewBase) - peH.OptionalHeader.ImageBase;
  p := pointer(cardinal(NewBase) + peH.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress);
  while (p.VirtualAddress + p.SizeOfBlock <> 0) do
  begin
    pw := pointer(Integer(p) + Sizeof(TImageBaseRelocation));
    for i := 1 to (p.SizeOfBlock - Sizeof(TImageBaseRelocation)) div sizeof(WORD) do
    begin
      if pw^ and $F000 = $3000 then
        Inc(PCardinal(Cardinal(NewBase) + p.VirtualAddress + (pw^ and $0FFF))^, Delta);
      inc(pw);
    end;
    p := PImageBaseRelocation(pw);
  end;
end;

{填充引入地址表}

function FillImports(peH: PImageNtHeaders; pImageBase: Pointer): BOOL;
type
  TIMAGE_THUNK_DATAs = array[0..0] of IMAGE_THUNK_DATA;
  PIMAGE_THUNK_DATAs = ^TIMAGE_THUNK_DATAs;
var
  Offset            : Cardinal;
  pID               : PIMAGE_IMPORT_DESCRIPTOR;
  pRealIAT, pOriginalIAT: PIMAGE_THUNK_DATAs;
  buf               : array[0..$FF] of char;
  pName             : PChar;
  I                 : Integer;
  hDll              : HMODULE;
  lpFunction        : Pointer;
  pByName           : PIMAGE_IMPORT_BY_NAME;
begin
  Result := True;
  Offset := peH^.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress;
  if Offset = 0 then //无导入表
    Exit;
  pID := PIMAGE_IMPORT_DESCRIPTOR(Cardinal(pImageBase) + Offset);
  while (pID^.Union.Characteristics <> 0) do
  begin
    pRealIAT := PIMAGE_THUNK_DATAs(Cardinal(pImageBase) + pID^.FirstThunk);
    pOriginalIAT := PIMAGE_THUNK_DATAs(Cardinal(pImageBase) + pID^.Union.OriginalFirstThunk);
    //获取DLL名字
    PName := PChar(Cardinal(pImageBase) + pID^.Name);
    FillMemory(@Buf, $FF, 0);
    for i := 0 to $FF do
    begin
      if (pName[i] = #0) then
        break;
      buf[i] := pName[i];
    end;
    //判断是否加载过,没加载过就加载
    hDLL := GetModuleHandle(Buf);
    if hDLL = 0 then
      hDLL := LoadLibrary(Buf);
    I := 0;
    while True do
    begin
      if (pOriginalIAT[i].Function_ = 0) then break;
      lpFunction := nil;
      if (pOriginalIAT[i].Ordinal and IMAGE_ORDINAL_FLAG <> 0) then //按序号
      begin
        lpFunction := Windows.GetProcAddress(hDll, PChar(pOriginalIAT[i].Ordinal and $0000FFFF));
      end
      else //按名字
      begin
        //获取此IAT项所描述的函数名称
        pByName := PIMAGE_IMPORT_BY_NAME
          (DWORD(pImageBase) + DWORD(pOriginalIAT[i].AddressOfData));
        lpFunction := Windows.GetProcAddress(hDll, PChar(@pByName^.Name));
        if (lpFunction <> nil) then //找到了！
          pRealIAT[i].Function_ := DWORD(lpFunction)
        else
        begin
          Result := False;
          Exit;
        end;
      end;
      Inc(I);
    end;
    pID := PIMAGE_IMPORT_DESCRIPTOR(DWORD(pID) + sizeof(IMAGE_IMPORT_DESCRIPTOR));
  end;
end;


function LoadPE(Buf: Pointer; Len: Integer): Cardinal;
var

  peH               : PImageNtHeaders; //PE头
  peSecH            : PImageSectionHeaders;
  peSz              : Cardinal;
  P                 : Pointer;
  DLLMain           : function(hinstDLL: Cardinal; fdwReason, lpvReserved: DWORD): BOOL; stdcall;
begin
  //分配可执行的内存块
  if AlignPEToMem(Buf, Len, peH, peSecH, P, peSz) then
  begin
    if HasRelocationTable(peH) then //如果有重定位表就进行重定位
      DoRelocation(peH, P);
    FillImports(peH, P); //填写导入表
    //获取并执行动态链接库的入口函数
    DLLMain := Pointer(peH^.OptionalHeader.AddressOfEntryPoint + DWORD(P));
    DLLMain(DWORD(P), DLL_PROCESS_ATTACH, 0);
    Result := Cardinal(P);
  end
  else
    Result := 0;
end;

procedure FreePE(Handle: Cardinal);
var
  dosH              : PImageDosHeader;
  peH               : PImageNtHeaders; //PE头
  DLLMain           : function(hinstDLL: Cardinal; fdwReason, lpvReserved: DWORD): BOOL; stdcall;
  P                 : Pointer;
begin
  P := Pointer(Handle);
  dosH := PImageDosHeader(P);
  peH :=  PImageNtHeaders(DWORD(P)+dosH^._lfanew);
  DLLMain := Pointer(peH^.OptionalHeader.AddressOfEntryPoint + DWORD(P));
  DLLMain(DWORD(P), DLL_PROCESS_DETACH, 0); //反初始化DLL
  VirtualFreeEx(GetCurrentProcess(),
    P,
    0,
    MEM_RELEASE);
end;

end.
