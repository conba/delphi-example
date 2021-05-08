{******************************************************}
{ ��Ʒ���ƣ�SS5.X                                      }
{ ��Ԫ���������ݼ�������������                         }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2015-7-3                                   }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
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
/// ����sRow����cMaskΪ�ָ���ַ����ĸ���
/// </summary>
function ColCount(sRow: string; cMask: char): Integer;
/// <summary>
/// ȡsRow�� ��cMaskΪ�ָ����� ��lcolno���ַ�
/// </summary>
function GetCol(sRow: string; lColNo: Integer; cMask: char): string;

//*********************************��¼����***********************************//
/// <summary>
/// ���Ƽ�¼����
/// </summary>
/// <param name="ASourceRec">Դ��¼</param>
/// <param name="ADestRec">Ŀ���¼</param>
/// <param name="ASData">Դ���ݼ�</param>
/// <param name="ADData">Ŀ�����ݼ�</param>
/// <param name="SourceFields">Դ�ֶ��б�</param>
/// <param name="DestFields">Ŀ���ֶ��б�</param>
procedure CopyRecData(ASourceRec, ADestRec: Pointer; ASData, ADData: IPMDataset;
  SourceFields, DestFields: TStringList); overload;
/// <summary>
/// �������ݱ�
/// </summary>
/// <param name="ASourceData">Դ���ݱ�</param>
/// <param name="ADestData">Ŀ�����ݱ�</param>
/// <param name="AFields">�ֶ��б�</param>
procedure CopyRecData(ASourceData, ADestData: IPMDataset; AFields:
  TStringList); overload;
/// <summary>
/// ���ƽڵ�����
/// </summary>
/// <param name="ASourceNode">ԴNode</param>
/// <param name="ADestNode">Ŀ��Node</param>
/// <param name="SourceField">Դ�ֶ��б�</param>
/// <param name="DestField">Ŀ���ֶ��б�</param>
procedure CopyNodeData(ASourceNode, ADestNode: IPMNode;
  SourceField: TStringList = nil; DestField: TStringList = nil);
/// <summary>
/// ����ֶ�
/// </summary>
/// <param name="ADataSet">���ݼ�</param>
/// <param name="Fields">�ֶ��б�</param>
/// <param name="FiedTypes">�ֶ�����</param>
procedure AddField(ADataSet: IPMDataset; Fields: array of string;
  FiedTypes: array of TPMFieldType);
/// <summary>
/// �ƶ���¼�б���
/// </summary>
procedure MovePMListByLevel(AList: TList; Index: Integer; ADataSet: TPMDataSet;
  AMoveList: TList; AMoveMode: TMoveMode; bMarkStatus: Boolean = False);
/// <summary>
/// �ƶ���¼�б�
/// </summary>
procedure MoveRecs(ASouRec, ADestRec: Pointer;
  MoveList, RecList, DestList: TList; DestIndex: Integer; AData: IPMDataset;
  MoveMod: TMoveMode; bChangerLevel: Boolean = True);
/// <summary>
/// ��¼����
/// </summary>
procedure PmRecMoveUp(Index, iPrIndex, iNextIndex: Integer; AMoveList: TList;
  ADataSet: TPMDataSet; bMarkStatus: Boolean = False);
/// <summary>
/// ��¼����
/// </summary>
procedure PmRecMoveDown(Index, iNextIndex, iDivideNext: Integer;
  AMoveList: TList; ADataSet: TPMDataSet; bMarkStatus: Boolean = False);
/// <summary>
/// �������ݼ��ֶ�
/// </summary>

/// <summary>
/// �������ݼ��ֶ�
/// </summary>
/// <param name="ASouDataSet">Դ���ݼ�</param>
/// <param name="ADestDataSet">Ŀ�����ݼ�</param>
procedure CopyDataField(ASouDataSet, ADestDataSet: IPMDataset);

/// <summary>
/// ���������ֶ�
/// </summary>
/// <param name="ASouDataSet">Դ���ݼ�</param>
/// <param name="ADestDataSet">Ŀ�����ݼ�</param>
procedure CopyAttributeHash(ASouDataSet, ADestDataSet: IPMDataset);

/// <summary>
/// ͨ���ֶκ��ֶ�ֵ��λ����¼ ��ȡ��¼�� �ֶ�ֵ
/// </summary>
/// <param name="ADataSet">���ݼ�</param>
/// <param name="AppField">ָ���ֶ�</param>
/// <param name="AppValue">ָ���ֶ�ֵ</param>
/// <param name="RField">��ȡ�����ֶ�</param>
/// <returns></returns>
function GetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue, RField:
  string): string;
/// <summary>
/// ͨ���ֶκ��ֶ�ֵ��λ����¼ �����ü�¼�� �ֶ�ֵ
/// </summary>
/// <param name="ADataSet">���ݼ�</param>
/// <param name="AppField">ָ���ֶ�</param>
/// <param name="AppValue">ָ���ֶ�ֵ</param>
/// <param name="RField">���������ֶ�</param>
/// <param name="RValue">���������ֶ�ֵ</param>
procedure SetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue,
  RField: string; RValue: Variant); overload;
type
  /// <summary>
  /// ���÷�ʽ 0=���ҵ��ڵ�ʱ��ֵ 1=��û�ҵ��ڵ�ʱ��ֵ(��ӽڵ�) 3=��Ҫ��ӽڵ�ʱ ��ǰ���(����������)
  /// </summary>
  TSetValueOption = (svoSetValueIfFound, svoSetValueIfNotFound_Insert, svoInsertBefore);
  TSetValueOptions = set of TSetValueOption;
/// <summary>
/// ͨ���ֶκ��ֶ�ֵ��λ����¼ �����ü�¼�� �ֶ�ֵ�����ֶΡ�
/// </summary>
/// <param name="ADataSet: IPMDataset">���ݼ�</param>
/// <param name="AppField: string">ָ���ֶ�</param>
/// <param name="AppValue: string">ָ���ֶ�ֵ</param>
/// <param name="RFieldArray: array of Variant">���������ֶ��б�</param>
/// <param name="RValueArray: array of Variant">��������֪��ֵ�б�</param>
/// <param name="AbInsertIfNotFound: Boolean">û�ҵ�ָ���ֶ��Ƿ�����</param>
/// <param name="AOptions: Boolean">�Ƿ�ǰ��</param>
/// <param name="ApRelatedRec: Integer">������Լ�¼</param>
/// <returns>Pointer: �ҵ����������ļ�¼</returns>
function SetAppointFieldValue(ADataSet: IPMDataset; AppField, AppValue: string;
  RFieldArray, RValueArray: array of Variant; AOptions: TSetValueOptions =
  [svoSetValueIfFound, svoSetValueIfNotFound_Insert]; ApRelatedRec: Pointer =
  nil): Pointer; overload;
/// <summary>
/// �жϼ�¼�Ƿ����
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
/// ͨ���ַ�����ȡ�ֶ�����
/// </summary>
/// <param name="AsValue">�ַ���</param>
/// <returns>�ֶ�����</returns>
function GetPMFieldType(AsValue: string): TPMFieldType;

/// <summary>
/// ��ȡ�ֶ����͵�����(�ַ���)
/// </summary>
/// <param name="AePMFieldType: TPMFieldType">�ֶ�����</param>
/// <returns>string: �ֶ����ַ���</returns>
function GetPMFieldTypeName(AePMFieldType: TPMFieldType): string;

/// <summary>
/// ��������ͼ�в��ҽ�� (���ڷ�װԭ�� ��ͼ �����ٶȴ������ ���ݼ� �����ٶ�)
///  ע��: �Ƚ��ʺϲ��Ҳ��ظ����ֶ� �� xtbm �ظ����ֶν�������Ǵ����
/// </summary>
/// <param name="AsFiled: string">�ֶ���</param>
/// <param name="AsValue: string">�ֶ�ֵ</param>
/// <param name="AView: IPMDataView">��ͼ</param>
/// <returns>IPMNode: �ڵ�</returns>
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
  //����ԭ�����ֶ�
  CopyDataField(tempDataSet, ADataSet);
  //������ֶ�
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
  ������:    ColCount
  ����:      ���
  ����:      2010.05.05
  ����:      sRow: string; cMask: Char
  ����ֵ:    Integer
  ��������:  ����sRow����cMaskΪ�ָ���ַ����ĸ���
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
  ������:    GetCol
  ����:      ���
  ����:      2010.05.05
  ����:      sRow: string; lColNo: integer; cMask: char
  ����ֵ:    string
  ��������:  ȡsRow�� ��cMaskΪ�ָ����� ��lcolno���ַ�
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
  ������:    GetFileText
  ����:      lifeng
  ����:      2010.08.05
  ����:      FileName: string
  ����ֵ:    string
  ��������:  ȡ�ļ�����
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
  ������:    NewGuid
  ����:      lifeng
  ����:      2010.08.05
  ����:      ��
  ����ֵ:    string
  ��������:  ���� GUID
  ------------------------------------------------------------------------------- }

function NewGuid: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;

{ -------------------------------------------------------------------------------
  ������:    AppendFiledata
  ����:      lifeng
  ����:      2010.08.05
  ����:      FileName, Data: string
  ����ֵ:    ��
  ��������:   д�ռ��ļ�
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
  ������:    PmRecMoveUp
  ����:      lifeng
  ����:      2010.08.05
  ����:      Index, iPrIndex, iNextIndex: Integer; AMoveList: TList
  ����ֵ:    ��
  ��������:  ����������ƶ�
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
  ������:    PmRecMoveDown
  ����:      lifeng
  ����:      2010.08.05
  ����:      Index, iPrIndex, iNextIndex: Integer; AMoveList: TList
  ����ֵ:    ��
  ��������:  ����������ƶ�
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

        if mDivideNext > List.Count - 1 then // ������
        begin
          List.Add(List[mIndex]);
          List.Delete(mIndex);
          Dec(mNextIndex);
          if mIndex = mNextIndex then
            Break;
        end
        else
        begin
          List.Insert(mDivideNext, List[mIndex]); // ����
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
        if mDivideNext > InterfaceList.Count - 1 then // ������
        begin
          InterfaceList.Add(InterfaceList[mIndex]);
          InterfaceList.Delete(mIndex);
          Dec(mNextIndex);
          if mIndex = mNextIndex then
            Break;
        end
        else
        begin
          Unkonw := IUnknown(InterfaceList.Items[mIndex]); // ����
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
  ������:    MoveUpByLevel
  ����:      lifeng
  ����:      2010.08.05
  ����:      AList: TList; Index: Integer; ADataSet: IPMDataset ;AMoveList: TList
  ����ֵ:    ��
  ��������:  �ƶ����ݼ�������ͼ�еļ�¼ ������ƶ�  �����ƶ�
  ------------------------------------------------------------------------------- }

procedure MovePMListByLevel(AList: TList; Index: Integer; ADataSet: TPMDataSet;
  AMoveList: TList; AMoveMode: TMoveMode; bMarkStatus: Boolean = False);
var
  Level, iPrIndex, iNextIndex, iDivideNext, iTL, iSource, iDest, i: Integer;
  Rec, OppRec: Pointer;
  procedure FindPrev;
  begin
    iPrIndex := Index - 1;
    while iPrIndex > -1 do // �ҵ���һ�����Լ��ȼ���ͬ�ļ�¼
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
    while NextIndex < AList.Count do // ����һ�����Լ��ȼ���ͬ�ļ�¼
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
  if not ADataSet.GetLevelStatus then // �޲��
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
  ������:    MoveRecs
  ����:      lifeng
  ����:      2010.09.19
  ����:      ASouRec, ADestRec: Pointer; MoveRList, RecList, DestList: TList;
  DestIndex: Intege; AData: IPMDataset; MoveMod: TMoveMode
  ����ֵ:    ��
  ��������:
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
  end; // ���µ���levelֵ
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
  ������:    CopyDataField
  ����:      lifeng
  ����:      2010.08.19
  ����:      ASouDataSet, ADestDataSet: IPMDataset
  ����ֵ:    ��
  ��������:   �������ݼ��� �ֶ�
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
