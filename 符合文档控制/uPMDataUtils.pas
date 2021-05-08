{******************************************************}
{ 产品名称：SS5.X                                      }
{ 单元描述：数据集操作公共方法                         }
{ 单元作者：Wenxh                                      }
{ 创建时间：2015-7-3                                   }
{ 备    注：                                           }
{ 修改记录：                                           }
{******************************************************}
unit uPMDataUtils;

interface

uses
  SysUtils, Classes, Forms, uPMDataIntf, uPMDataConst, uPMData;

const
  B64: array [0 .. 63] of char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + { 26 }
    'abcdefghijklmnopqrstuvwxyz' + { 52 }
    '0123456789' + { 62 }
    '+/'; { 64 }
  LfB64: array [0 .. 63] of char = '01mnGHIJopXbRq5MNOBCDEh69' + { 62 }
    'aTUcKL78Pdef234klwxyz' + { 26 }
    'AijrstFQVguvWSYZ' + { 52 }
    '+/'; { 64 }


function Lf_StrToBase64(s: string): string;
function Lf_Base64ToStr(s: string): string;
procedure AppendFiledata(FileName, Data: string);
function NewGuid: string;
function GetFileText(FileName: string): string;
/// <summary>
/// 计算sRow中以cMask为分割的字符串的个数
/// </summary>
function ColCount(sRow: string; cMask: char): Integer;
/// <summary>
/// 取sRow中 以cMask为分隔符的 第lcolno个字符
/// </summary>
function GetCol(sRow: string; lColNo: Integer; cMask: char): string;

//*********************************记录操作***********************************//
/// <summary>
/// 复制记录数据
/// </summary>
/// <param name="ASourceRec">源记录</param>
/// <param name="ADestRec">目标记录</param>
/// <param name="ASData">源数据集</param>
/// <param name="ADData">目标数据集</param>
/// <param name="SourceFields">源字段列表</param>
/// <param name="DestFields">目标字段列表</param>
procedure CopyRecData(ASourceRec, ADestRec: Pointer; ASData, ADData: IPMDataset;
  SourceFields, DestFields: TStringList); overload;
/// <summary>
/// 复制数据表
/// </summary>
/// <param name="ASourceData">源数据表</param>
/// <param name="ADestData">目标数据表</param>
/// <param name="AFields">字段列表</param>
procedure CopyRecData(ASourceData, ADestData: IPMDataset; AFields:
  TStringList); overload;
/// <summary>
/// 复制节点数据
/// </summary>
/// <param name="ASourceNode">源Node</param>
/// <param name="ADestNode">目标Node</param>
/// <param name="SourceField">源字段列表</param>
/// <param name="DestField">目标字段列表</param>
procedure CopyNodeData(ASourceNode, ADestNode: IPMNode;
  SourceField: TStringList = nil; DestField: TStringList = nil);
/// <summary>
/// 添加字段
/// </summary>
/// <param name="ADataSet">数据集</param>
/// <param name="Fields">字段列表</param>
/// <param name="FiedTypes">字段类型</param>
procedure AddField(ADataSet: IPMDataset; Fields: array of string;
  FiedTypes: array of TPMFieldType);
/// <summary>
/// 移动记录列表层次
/// </summary>
procedure MovePMListByLevel(AList: TList; Index: Integer; ADataSet: TPMDataSet;
  AMoveList: TList; AMoveMode: TMoveMode; bMarkStatus: Boolean = False);
/// <summary>
/// 移动记录列表
/// </summary>
procedure MoveRecs(ASouRec, ADestRec: Pointer;
  MoveList, RecList, DestList: TList; DestIndex: Integer; AData: IPMDataset;
  MoveMod: TMoveMode; bChangerLevel: Boolean = True);
/// <summary>
/// 记录上移
/// </summary>
procedure PmRecMoveUp(Index, iPrIndex, iNextIndex: Integer; AMoveList: TList;
  ADataSet: TPMDataSet; bMarkStatus: Boolean = False);
/// <summary>
/// 记录下移
/// </summary>
procedure PmRecMoveDown(Index, iNextIndex, iDivideNext: Integer;
  AMoveList: TList; ADataSet: TPMDataSet; bMarkStatus: Boolean = False);
/// <summary>
/// 复制数据集字段
/// </summary>

/// <summary>
/// 复制数据集字段
/// </summary>
/// <param name="ASouDataSet">源数据集</param>
/// <param name="ADestDataSet">目标数据集</param>
procedure CopyDataField(ASouDataSet, ADestDataSet: IPMDataset);

/// <summary>
/// 复制属性字段
/// </summary>
/// <param name="ASouDataSet">源数据集</param>
/// <param name="ADestDataSet">目标数据集</param>
procedure CopyAttributeHash(ASouDataSet, ADestDataSet: IPMDataset);

/// <summary>
/// 通过字段和字段值定位到记录 再取记录的 字段值
/// </summary>
/// <param name="ADataSet">数据集</param>
/// <param name="AppField">指定字段</param>
/// <param name="AppValue">指定字段值</param>
/// <param name="RField">获取数据字段</param>
/// <returns></returns>
function GetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue, RField:
  string): string;
/// <summary>
/// 通过字段和字段值定位到记录 再设置记录的 字段值
/// </summary>
/// <param name="ADataSet">数据集</param>
/// <param name="AppField">指定字段</param>
/// <param name="AppValue">指定字段值</param>
/// <param name="RField">设置数据字段</param>
/// <param name="RValue">设置数据字段值</param>
procedure SetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue,
  RField: string; RValue: Variant); overload;
type
  /// <summary>
  /// 设置方式 0=在找到节点时赋值 1=在没找到节点时赋值(添加节点) 3=需要添加节点时 向前添加(否则向后添加)
  /// </summary>
  TSetValueOption = (svoSetValueIfFound, svoSetValueIfNotFound_Insert, svoInsertBefore);
  TSetValueOptions = set of TSetValueOption;
/// <summary>
/// 通过字段和字段值定位到记录 再设置记录的 字段值【多字段】
/// </summary>
/// <param name="ADataSet: IPMDataset">数据集</param>
/// <param name="AppField: string">指定字段</param>
/// <param name="AppValue: string">指定字段值</param>
/// <param name="RFieldArray: array of Variant">设置数据字段列表</param>
/// <param name="RValueArray: array of Variant">设置数据知道值列表</param>
/// <param name="AbInsertIfNotFound: Boolean">没找到指定字段是否新增</param>
/// <param name="AOptions: Boolean">是否前插</param>
/// <param name="ApRelatedRec: Integer">插入相对记录</param>
/// <returns>Pointer: 找到或者新增的记录</returns>
function SetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue: string;
  RFieldArray, RValueArray: array of Variant; AOptions: TSetValueOptions =
  [svoSetValueIfFound, svoSetValueIfNotFound_Insert]; ApRelatedRec: Pointer =
  nil): Pointer; overload;
/// <summary>
/// 判断记录是否存在
/// </summary>
/// <param name="SourceNode"></param>
/// <param name="PMNode"></param>
/// <param name="Value"></param>
/// <param name="AFieldName"></param>
/// <param name="bCheckSelf"></param>
/// <returns></returns>
function IsExistsRec(SourceNode, PMNode: IPMNode; Value: string; AFieldName: string;
  bCheckSelf: Boolean = True): Boolean;

/// <summary>
/// 通过字符串获取字段类型
/// </summary>
/// <param name="AsValue">字符串</param>
/// <returns>字段类型</returns>
function GetPMFieldType(AsValue: string): TPMFieldType;

/// <summary>
/// 获取字段类型的名称(字符串)
/// </summary>
/// <param name="AePMFieldType: TPMFieldType">字段类型</param>
/// <returns>string: 字段名字符串</returns>
function GetPMFieldTypeName(AePMFieldType: TPMFieldType): string;

/// <summary>
/// 快速在视图中查找结点 (由于封装原因 视图 查找速度大大慢于 数据集 查找速度)
///  注意: 比较适合查找不重复的字段 如 xtbm 重复的字段结果可能是错误的
/// </summary>
/// <param name="AsFiled: string">字段名</param>
/// <param name="AsValue: string">字段值</param>
/// <param name="AView: IPMDataView">视图</param>
/// <returns>IPMNode: 节点</returns>
function FastFindPmNodeByView(AsFiled, AsValue: string; AView: IPMDataView):
  IPMNode;

implementation

uses
  TypInfo;

function IsExistsRec(SourceNode, PMNode: IPMNode; Value: string; AFieldName: string;
  bCheckSelf: Boolean = True): Boolean;
var
  i: Integer;
  Node: IPMNode;
begin
  Result := False;
  if Value = '' then Exit;

  if SourceNode.GetValue(AFieldName, '') = Value then
  begin
    Result := True;
    Exit;
  end;

  for i := 0 to SourceNode.Count - 1 do
  begin
    Node := SourceNode.ChildNodes[i];
    if Node.GetValue(AFieldName, '') = Value then
    begin
      if bCheckSelf then
        if Node.GetRec = PMNode.GetRec then Continue;
      Result := True;
      Exit;
    end;
  end;
end;

function GetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue, RField:
  string): string;
var
  Rec: Pointer;
begin
  Result := '';
  if ADataSet = nil then Exit;
  Rec := ADataSet.FindRec(AppField, AppValue, True);
  if Rec = nil then Exit;
  Result := ADataSet.GetFieldValue(RField, '', Rec);
end;

procedure SetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue,
  RField: string; RValue: Variant);
var
  Rec: Pointer;
begin
  if ADataSet = nil then
    Exit;
  Rec := ADataSet.FindRec(AppField, AppValue, True);
  if Rec = nil then
  begin
    Rec := ADataSet.InsertAfter(nil);
    ADataSet.SetFieldValue(AppField, AppValue, Rec);
  end;
  ADataSet.SetFieldValue(RField, RValue, Rec);
end;

procedure AddField(ADataSet: IPMDataset; Fields: array of string;
  FiedTypes: array of TPMFieldType);
var
  tempDataSet: IPMDataset;
  i: Integer;
  Field: string;
  ftype: TPMFieldType;
begin
  tempDataSet := ADataSet.Clone;
  ADataSet.Clear;
  //复制原来的字段
  CopyDataField(tempDataSet, ADataSet);
  //添加新字段
  for i := Low(Fields) to High(Fields) do
  begin
    Field := Fields[i];
    ftype := FiedTypes[i];
    if not ADataSet.CheckFieldExit(Field) then
      ADataSet.AddField(Field, ftype);
  end;
  ADataSet.CloneData(tempDataSet, False);
end;

{ -------------------------------------------------------------------------------
  过程名:    ColCount
  作者:      李锋
  日期:      2010.05.05
  参数:      sRow: string; cMask: Char
  返回值:    Integer
  功能描述:  计算sRow中以cMask为分割的字符串的个数
  ------------------------------------------------------------------------------- }

function ColCount(sRow: string; cMask: char): Integer;
var
  i: Integer;
begin
  Result := 0;
  if (sRow <> '') and (sRow[length(sRow)] <> cMask) then
    sRow := sRow + cMask;
  for i := 1 to length(sRow) do
    if sRow[i] = cMask then
      Inc(Result);
end;

{ -------------------------------------------------------------------------------
  过程名:    GetCol
  作者:      李锋
  日期:      2010.05.05
  参数:      sRow: string; lColNo: integer; cMask: char
  返回值:    string
  功能描述:  取sRow中 以cMask为分隔符的 第lcolno个字符
  ------------------------------------------------------------------------------- }

function GetCol(sRow: string; lColNo: Integer; cMask: char): string;
var
  Index: Integer;
  Position: Integer;
begin
  if lColNo >= 0 then
    Result := cMask + sRow
  else
  begin
    Result := '';
    Exit;
  end;
  for Index := 0 to lColNo do
  begin
    Position := pos(cMask, Result);
    if Position > 0 then
      Result := copy(Result, Position + 1, length(Result))
    else
      Result := '';
  end;
  Position := pos(cMask, Result);
  if Position > 0 then
    Result := copy(Result, 0, Position - 1);
end;

{ -------------------------------------------------------------------------------
  过程名:    GetFileText
  作者:      lifeng
  日期:      2010.08.05
  参数:      FileName: string
  返回值:    string
  功能描述:  取文件内容
  ------------------------------------------------------------------------------- }

function GetFileText(FileName: string): string;
var
  ts: TStringList;
begin
  Result := '';
  if not FileExists(FileName) then
    Exit;
  ts := TStringList.Create;
  try
    ts.LoadFromFile(FileName);
    Result := ts.Text;
  finally
    ts.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    NewGuid
  作者:      lifeng
  日期:      2010.08.05
  参数:      无
  返回值:    string
  功能描述:  生成 GUID
  ------------------------------------------------------------------------------- }

function NewGuid: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;

{ -------------------------------------------------------------------------------
  过程名:    AppendFiledata
  作者:      lifeng
  日期:      2010.08.05
  参数:      FileName, Data: string
  返回值:    无
  功能描述:   写日记文件
  ------------------------------------------------------------------------------- }

procedure AppendFiledata(FileName, Data: string);
var
  TF: TextFile;
  StrDire: string;
begin
  try
    FileName := ExtractFilePath(Application.ExeName) + FileName;
    Data := FormatDateTime('yy-MM-DD HH:MM:SS', Now()) + '  ' + Data + #13;
    StrDire := ExtractFilePath(FileName);
    if StrDire <> '' then
      ForceDirectories(StrDire);

    AssignFile(tf,FileName);
    if FileExists(FileName) then
      append(tf)
    else
      rewrite(tf);

    writeln(tf, Data);
    closefile(tf);
  except
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    PmRecMoveUp
  作者:      lifeng
  日期:      2010.08.05
  参数:      Index, iPrIndex, iNextIndex: Integer; AMoveList: TList
  返回值:    无
  功能描述:  按层次向上移动
  ------------------------------------------------------------------------------- }

procedure PmRecMoveUp(Index, iPrIndex, iNextIndex: Integer; AMoveList: TList;
  ADataSet: TPMDataSet; bMarkStatus: Boolean = False);
var
  i, mIndex, mPrIndex, mNextIndex: Integer;
  List: TList;
  InterfaceList: TInterfaceList;
  Unkonw: IUnknown;
  P, Rec, OppRec: Pointer;
begin
  for i := 0 to AMoveList.Count - 1 do
  begin
    mIndex := Index;
    mPrIndex := iPrIndex;
    mNextIndex := iNextIndex;

    if TObject(AMoveList[i]).ClassName = 'TList' then
    begin
      List := TList(AMoveList[i]);
      while True do
      begin
        if (bMarkStatus) and (List = ADataSet.RecList) then
        begin
          Rec := List[mIndex];
          if mIndex = 0 then
            OppRec := nil
          else
            OppRec := List[mIndex - 1];
          ADataSet.DataStateManger.Notify(Rec, OppRec, '', '', cMove, 0);
        end;

        P := List[mIndex];
        List.Delete(mIndex);
        List.Insert(mPrIndex, P);
        Inc(mPrIndex);
        Inc(mIndex);
        if mIndex = mNextIndex then
          Break;
      end;
    end
    else if TObject(AMoveList[i]).ClassName = 'TInterfaceList' then
    begin
      InterfaceList := TInterfaceList(AMoveList[i]);
      while True do
      begin
        Unkonw := IUnknown(InterfaceList.Items[mIndex]);
        InterfaceList.Delete(mIndex);
        InterfaceList.Insert(mPrIndex, Unkonw);
        Inc(mPrIndex);
        Inc(mIndex);
        if mIndex = mNextIndex then
          Break;
      end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    PmRecMoveDown
  作者:      lifeng
  日期:      2010.08.05
  参数:      Index, iPrIndex, iNextIndex: Integer; AMoveList: TList
  返回值:    无
  功能描述:  按层次向下移动
  ------------------------------------------------------------------------------- }

procedure PmRecMoveDown(Index, iNextIndex, iDivideNext: Integer;
  AMoveList: TList; ADataSet: TPMDataSet; bMarkStatus: Boolean = False);
var
  i, mIndex, mNextIndex, mDivideNext: Integer;
  List: TList;
  InterfaceList: TInterfaceList;
  Unkonw: IUnknown;
  Rec, OppRec: Pointer;
begin
  for i := 0 to AMoveList.Count - 1 do
  begin
    mIndex := Index;
    mNextIndex := iNextIndex;
    mDivideNext := iDivideNext;

    if TObject(AMoveList[i]).ClassName = 'TList' then
    begin
      List := TList(AMoveList[i]);
      while True do
      begin
        if (bMarkStatus) and (List = ADataSet.RecList) then
        begin
          Rec := List[mIndex];
          if mIndex = 0 then
            OppRec := nil
          else
            OppRec := List[mIndex - 1];
          ADataSet.DataStateManger.Notify(Rec, OppRec, '', '', cMove, 0);
        end;

        if mDivideNext > List.Count - 1 then // 向最后加
        begin
          List.Add(List[mIndex]);
          List.Delete(mIndex);
          Dec(mNextIndex);
          if mIndex = mNextIndex then
            Break;
        end
        else
        begin
          List.Insert(mDivideNext, List[mIndex]); // 插入
          List.Delete(mIndex);
          Dec(mNextIndex);
          if mNextIndex = mIndex then
            Break;
        end;
      end;
    end;

    if TObject(AMoveList[i]).ClassName = 'TInterfaceList' then
    begin
      InterfaceList := TInterfaceList(AMoveList[i]);
      while True do
      begin
        if mDivideNext > InterfaceList.Count - 1 then // 向最后加
        begin
          InterfaceList.Add(InterfaceList[mIndex]);
          InterfaceList.Delete(mIndex);
          Dec(mNextIndex);
          if mIndex = mNextIndex then
            Break;
        end
        else
        begin
          Unkonw := IUnknown(InterfaceList.Items[mIndex]); // 插入
          InterfaceList.Insert(mDivideNext, Unkonw);
          InterfaceList.Delete(mIndex);
          Dec(mNextIndex);
          if mNextIndex = mIndex then
            Break;
        end;
      end;
    end;
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    MoveUpByLevel
  作者:      lifeng
  日期:      2010.08.05
  参数:      AList: TList; Index: Integer; ADataSet: IPMDataset ;AMoveList: TList
  返回值:    无
  功能描述:  移动数据集或者视图中的记录 按层次移动  上下移动
  ------------------------------------------------------------------------------- }

procedure MovePMListByLevel(AList: TList; Index: Integer; ADataSet: TPMDataSet;
  AMoveList: TList; AMoveMode: TMoveMode; bMarkStatus: Boolean = False);
var
  Level, iPrIndex, iNextIndex, iDivideNext, iTL, iSource, iDest, i: Integer;
  Rec, OppRec: Pointer;
  procedure FindPrev;
  begin
    iPrIndex := Index - 1;
    while iPrIndex > -1 do // 找到上一个与自己等级相同的记录
    begin
      iTL := ADataSet.GetFieldValueAsInt(RecordLevel, 0, AList[iPrIndex]);
      if Level > iTL then
      begin
        iPrIndex := -1;
        Break;
      end;
      if iTL = Level then
        Break;
      Dec(iPrIndex);
    end;
  end;

  function FindNext(BeginIndex: Integer; var NextIndex: Integer): Boolean;
  begin
    Result := True;
    NextIndex := BeginIndex + 1;
    while NextIndex < AList.Count do // 找下一个与自己等级相同的记录
    begin
      iTL := ADataSet.GetFieldValueAsInt(RecordLevel, 0, AList[NextIndex]);
      if Level > iTL then
      begin
        Result := False;
        Break;
      end;
      if iTL = Level then
        Break;
      Inc(NextIndex);
    end;
  end;

begin
  iDest := 0;
  iSource := 0;
  if (AList = nil) or (ADataSet = nil) or (AMoveList = nil) then
    Exit;
  if not ADataSet.GetLevelStatus then // 无层次
  begin
    case AMoveMode of
      mmUp:
        begin
          iSource := Index;
          iDest := Index - 1;
        end;
      mmDown:
        begin
          iSource := Index;
          iDest := Index + 1;
        end;
    end;
    if (iDest < 0) or (iDest = AList.Count) then
      Exit;
    for i := 0 to AMoveList.Count - 1 do
    begin
      if TObject(AMoveList[i]) is TList then
      begin
        if (bMarkStatus) and (TObject(AMoveList[i]) = ADataSet.RecList) then
        begin
          Rec := TList(AMoveList[i])[iSource];
          if iSource = 0 then
            OppRec := nil
          else
            OppRec := TList(AMoveList[i])[iSource - 1];
          ADataSet.DataStateManger.Notify(Rec, OppRec, '', '', cMove, 0);
        end;
        TList(AMoveList[i]).Exchange(iSource, iDest);
      end;
      if TObject(AMoveList[i]) is TInterfaceList then
        TInterfaceList(AMoveList[i]).Exchange(iSource, iDest);
    end;
  end
  else
  begin
    Level := ADataSet.GetFieldValueAsInt(RecordLevel, 0, AList[Index]);
    case AMoveMode of
      mmUp:
        begin
          if Index = 0 then
            Exit;
          FindPrev;
          if iPrIndex < 0 then
            Exit;
          FindNext(Index, iNextIndex);
          PmRecMoveUp(Index, iPrIndex, iNextIndex, AMoveList, ADataSet,
            bMarkStatus);
        end;
      mmDown:
        begin
          if Index = AList.Count - 1 then
            Exit;
          if not FindNext(Index, iNextIndex) then
            Exit;
          if iNextIndex < 0 then
            Exit;
          if iNextIndex = AList.Count then
            Exit;
          FindNext(iNextIndex, iDivideNext);
          PmRecMoveDown(Index, iNextIndex, iDivideNext, AMoveList, ADataSet,
            bMarkStatus);
        end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    MoveRecs
  作者:      lifeng
  日期:      2010.09.19
  参数:      ASouRec, ADestRec: Pointer; MoveRList, RecList, DestList: TList;
  DestIndex: Intege; AData: IPMDataset; MoveMod: TMoveMode
  返回值:    无
  功能描述:
  ------------------------------------------------------------------------------- }

procedure MoveRecs(ASouRec, ADestRec: Pointer;
  MoveList, RecList, DestList: TList; DestIndex: Integer; AData: IPMDataset;
  MoveMod: TMoveMode; bChangerLevel: Boolean = True);
var
  sLevel, dLevel, DifferLevel, i, L: Integer;
  lsList, DeList: TList;
  lsIntList, deIntList: TInterfaceList;
begin
  if AData.Level then
  begin
    sLevel := AData.GetFieldValueAsInt(RecordLevel, 0, ASouRec);
    dLevel := AData.GetFieldValueAsInt(RecordLevel, 0, ADestRec);
  end
  else
  begin
    sLevel := 0;
    dLevel := 0;
  end;
  DifferLevel := 0;
  case MoveMod of
    mmNothing:
      begin
        if sLevel = dLevel then
          DifferLevel := 0
        else
          DifferLevel := sLevel - dLevel;
      end;
    mmChild:
      begin
        if sLevel = dLevel then
          DifferLevel := -1
        else
          DifferLevel := sLevel - dLevel - 1;
      end;
  end; // 重新调整level值
  if bChangerLevel then
    if DifferLevel <> 0 then
      for i := 0 to RecList.Count - 1 do
        AData.SetFieldValue(RecordLevel, AData.GetFieldValueAsInt(RecordLevel,
          0, RecList[i]) - DifferLevel, RecList[i]);
  for i := 0 to MoveList.Count - 1 do
  begin
    if TObject(MoveList[i]) is TList then
    begin
      lsList := TList(MoveList[i]);
      DeList := TList(DestList[i]);
      if DestIndex = DeList.Count - 1 then
      begin
        for L := 0 to lsList.Count - 1 do
          DeList.Add(lsList[L]);
      end
      else
        for L := lsList.Count - 1 downto 0 do
          DeList.Insert(DestIndex + 1, lsList[L]);
    end;

    if TObject(MoveList[i]) is TInterfaceList then
    begin
      lsIntList := TInterfaceList(MoveList[i]);
      deIntList := TInterfaceList(DestList[i]);
      if DestIndex = deIntList.Count - 1 then
      begin
        for L := 0 to lsIntList.Count - 1 do
          deIntList.Add(lsIntList[L]);
      end
      else
        for L := lsIntList.Count - 1 downto 0 do
          deIntList.Insert(DestIndex + 1, lsIntList[L]);
    end;
  end;

end;

{ -------------------------------------------------------------------------------
  过程名:    CopyDataField
  作者:      lifeng
  日期:      2010.08.19
  参数:      ASouDataSet, ADestDataSet: IPMDataset
  返回值:    无
  功能描述:   复制数据集的 字段
  ------------------------------------------------------------------------------- }

procedure CopyDataField(ASouDataSet, ADestDataSet: IPMDataset);
var
  i: Integer;
  Field: string;
  ftype: TPMFieldType;
  Fields: TStringList;
begin
  if (ASouDataSet = nil) or (ADestDataSet = nil) then
    Exit;
  Fields := ASouDataSet.GetFieldList;
  for i := 0 to Fields.Count - 1 do
  begin
    Field := Fields.Strings[i];
    ftype := ASouDataSet.GetFieldTypeByName(Field);
    if not ADestDataSet.CheckFieldExit(Field) then
      ADestDataSet.AddField(Field, ftype);
  end;
  if not ADestDataSet.CheckFieldExit(StateField) then
    ADestDataSet.AddField(StateField, fInt);
end;


procedure CopyAttributeHash(ASouDataSet, ADestDataSet: IPMDataset);
var
  Stream: TMemoryStream;
begin
  if (ASouDataSet = nil) or (ADestDataSet = nil) then
    Exit;
  Stream := TMemoryStream.Create;
  try
    ASouDataSet.SaveAttributeToStream(Stream);
    ADestDataSet.LoadAttribute(Stream);
  finally
    Stream.Free;
  end;
end;

function Lf_StrToBase64(s: string): string;
var
  c1, c2: byte;
  Shift: byte;
  i: Integer;
  sTemp: string;
begin
  sTemp := '';
  c2 := 0;
  Shift := 2;
  for i := 1 to length(s) do
  begin
    c1 := ord(s[i]);
    sTemp := sTemp + LfB64[c2 or c1 shr Shift];
    c2 := (c1 shl (6 - Shift)) and 63;
    Shift := (Shift + 2) and 7;
    if Shift = 0 then
    begin
      Shift := 2;
      sTemp := sTemp + LfB64[c2];
      c2 := 0;
    end;
  end;
  if (Shift > 2) then
  begin
    sTemp := sTemp + LfB64[c2] + '=';
    if Shift = 4 then
      sTemp := sTemp + '=';
  end;
  Result := sTemp;
end;

function Lf_Base64ToStr(s: string): string;
var
  c1, c2: byte;
  Shift: byte;
  i: Integer;

  sTemp: string;
begin
  sTemp := '';
  Shift := 0;
  c1 := 0;
  for i := 1 to length(s) do
  begin
    if s[i] = '=' then
      c2 := 0
    else
      c2 := pos(s[i], LfB64) - 1;
    if Shift > 0 then
      sTemp := sTemp + chr((c1 shl Shift) or (c2 shr (6 - Shift)));
    Shift := (Shift + 2) and 7;
    c1 := c2;
  end;
  Result := sTemp;
end;

procedure CopyRecData(ASourceRec, ADestRec: Pointer; ASData, ADData: IPMDataset;
  SourceFields, DestFields: TStringList);
var
  i: Integer;
  SourceValue: string;
begin
  if (ASourceRec = nil) or (ADestRec = nil) then Exit;
  for i := 0 to SourceFields.Count - 1 do
  begin
    try
      SourceValue := ASData.GetFieldValueAsString(SourceFields.Strings[i], '', ASourceRec);
      if ADData.CheckFieldExit(SourceFields.Strings[i]) then
        ADData.SetFieldValue(SourceFields.Strings[i], SourceValue, ADestRec);
    except
      on e: Exception do
        AppendFiledata(cst_logname, 'CopyRecData1:' + e.Message);
    end;
  end;
end;

procedure CopyRecData(ASourceData, ADestData: IPMDataset; AFields: TStringList);
var
  i, j: Integer;
  SourceValue: string;
  Rec, sRec: Pointer;
begin
  for i := 0 to ASourceData.GetRecordCount - 1 do
  begin
    sRec := ASourceData.GetCurrentRec(i);
    Rec := ADestData.InsertAfter(nil);
    for J := 0 to AFields.Count - 1 do
    begin
      try
        SourceValue := ASourceData.GetFieldValueAsString(AFields.Strings[j],
          '', sRec);
        ADestData.SetFieldValue(AFields.Strings[j], SourceValue, Rec);
      except
        on e: Exception do
          AppendFiledata(cst_logname, 'CopyRecData2:' + e.Message);
      end;
    end;
  end;
end;

procedure CopyNodeData(ASourceNode, ADestNode: IPMNode;
  SourceField: TStringList = nil; DestField: TStringList = nil);
var
  i: Integer;
  SourceValue: string;
  SoFs: TStringList;
begin
  SoFs := SourceField;
  if (ASourceNode = nil) or (ADestNode = nil) then Exit;
  if SourceField = nil then
    SoFs := ASourceNode.GetView.GetFieldList;
  for i := 0 to SoFs.Count - 1 do
  begin
    SourceValue := ASourceNode.GetValue(SoFs.Strings[i], '');
    if ADestNode.GetView.CheckFieldExist(SoFs.Strings[i]) then
      ADestNode.SetValue(SourceValue, SoFs.Strings[i]);
  end;
end;

function GetPMFieldType(AsValue: string): TPMFieldType;
var
  eType: TPMFieldType;
  sType: string;
begin
  Result := fStr;
  if SameStr(AsValue, EmptyStr) then
    Exit;
  for eType := Low(TPMFieldType) to High(TPMFieldType) do
  begin
    sType := GetPMFieldTypeName(eType);
    if SameStr(sType, AsValue) then
      Exit(eType);
  end;
end;

function GetPMFieldTypeName(AePMFieldType: TPMFieldType): string;
begin
  Result := GetEnumName(Typeinfo(TPMFieldType), Ord(AePMFieldType));
end;

function FastFindPmNodeByView(AsFiled, AsValue: string; AView: IPMDataView):
  IPMNode;
var
  pRec: Pointer;
begin
  Result := nil;
  if (AView = nil) or SameStr(AsFiled, EmptyStr) then
    Exit;
  pRec := AView.GetDataSet.FindRec(AsFiled, AsValue);
  if Assigned(pRec) then
    Result := AView.GetPmNodeByRec(pRec);
end;

function SetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue: string;
  RFieldArray, RValueArray: array of Variant; AOptions: TSetValueOptions =
  [svoSetValueIfFound, svoSetValueIfNotFound_Insert]; ApRelatedRec: Pointer =
  nil): Pointer;
var
  I: Integer;
  Rec: Pointer;
  RField: string;
  RValue: Variant;
begin
  Result := nil;
  if ADataSet = nil then
    Exit;
  // find or add
  Rec := ADataSet.FindRec(AppField, AppValue, True);
  if Assigned(Rec) then
  begin
    if not (svoSetValueIfFound in AOptions) then
      Exit;
  end
  else // not found
  begin
    if not (svoSetValueIfNotFound_Insert in AOptions) then
      Exit;
    if Assigned(ApRelatedRec) then
      Rec := ApRelatedRec
    else if svoInsertBefore in AOptions then
    begin
      if ADataSet.GetRecordCount > 0 then
        Rec := ADataSet.GetCurrentRec(0);
    end;
    if svoInsertBefore in AOptions then
      Rec := ADataSet.InsertBefore(Rec)
    else
      Rec := ADataSet.InsertAfter(Rec);
    ADataSet.SetFieldValue(AppField, AppValue, Rec);
  end;
  // set
  for I := Low(RFieldArray) to High(RFieldArray) do
  begin
    RField := RFieldArray[I];
    RValue := RValueArray[I];
    ADataSet.SetFieldValue(RField, RValue, Rec);
  end;
  Result := Rec;
end;

end.
