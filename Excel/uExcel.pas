//***********************************************************
// Unit:  uExcel.pas
// Author:  wwl
// Create Date: 2020.04.15
// Description 描述
//
// Modify Lists 更新日志
//***********************************************************


unit uExcel;

interface

uses
  Generics.Collections, uDataManagerIntf, uPMDataIntf, uDataMgrService,
  uPMDataConst, uImportConst, ADODB, ufrmProgress, SysUtils, Classes, StrUtils,
  uSysUtils, uConfigIntf, uConfigMgrService, uImportMgrIntf, Forms;

type
  /// <summary>
  /// 处理Excel数据导定额库中
  /// </summary>
  TExcelDeal = class
  private
    FPrj, FClkPrj: IPrjDataManager;
    FDeContext, FSingleZyContext, FClContext: IDataContext;
    FDeDetailDataset, FDeMasterDataset, FClMasterDataset: IPMDataset;
    FDekFileName, FExcelFileName, FCLkFileName, FZyGuid: string;
    FDeBm_DeIdList: TDictionary<string, string>;
 protected
   function GetClkMaxXh: Integer;
   procedure DealClkMasterByClBm(sClBm: string; iId: Integer);
  public
    procedure DoImport;
    constructor Create; overload;
    constructor Create(sArray: array of string); overload;
    destructor Destroy; override;
    {*******************************实现接口***********************************}
  end;

implementation

uses
  uUniversalFunc, ComObj, OleServer, Excel2000, Dialogs;

{ TExcelDeal }

constructor TExcelDeal.Create(sArray: array of string);
begin
  FDekFileName := sArray[1];
  FExcelFileName := sArray[0];
  FZyGuid := sArray[2];
  FCLkFileName := sArray[3];
  FPrj := TDataMgrService.NewPrjDataManagerEx;
  FPrj.LoadPrj(FDekFileName);
  FClkPrj := TDataMgrService.NewPrjDataManagerEx;
  FClkPrj.LoadPrj(FCLkFileName);
  FDeContext := FPrj.GetDataContext(cst_DeData);
  FClContext := FClkPrj.GetDataContext(cst_ClData);
  FSingleZyContext := FPrj.GetDataContext(FZyGuid);
  if (not Assigned(FDeContext)) or (not Assigned(FClContext))  then
  begin
    Warn('没有获取到dekdata!');
    exit;
  end;
  if not Assigned(FSingleZyContext) then
  begin
    Warn('没有获取到SingleZyContext!');
    exit;
  end;
  // DeDetailDataset
  FDeDetailDataset := FSingleZyContext.GetDataSet(cst_Detail);
  if not Assigned(FDeDetailDataset) then
      FDeDetailDataset := FSingleZyContext.CreateDataSet(cst_Detail);
  FDeDetailDataset.DeleteAllRec;
  // DeMasterDset
  FDeMasterDataset := FSingleZyContext.GetDataSet(cst_DeMaster);
  if not Assigned(FDeMasterDataset) then
  begin
    Warn('没有获取到DeMasterDataset!');
    exit;
  end;
  FClMasterDataset := FClContext.GetDataSet(cst_ClMaster);
  FDeBm_DeIdList := TDictionary<string, string>.Create;
end;

constructor TExcelDeal.Create;
begin

end;

procedure TExcelDeal.DealClkMasterByClBm(sClBm: string; iId: Integer);
var
  pClBmRec, pRec: Pointer;
begin
  pClBmRec := FClMasterDataset.FindRec(cst_ClMaster_ClBm, sClBm);
  if Assigned(pClBmRec) then
  begin
    with FClMasterDataset do
    begin
      pRec := InsertAfter(nil);
      SetFieldValue(cst_ClMaster_id, iId, pRec);
      SetFieldValue(cst_ClMaster_ClLb, 23, pRec);
      SetFieldValue(cst_ClMaster_MlId,
        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_MlId, '', pClBmRec), pRec);
      SetFieldValue(cst_ClMaster_ClBm,
        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_ClBm, '', pClBmRec) + '~1' , pRec);
      SetFieldValue(cst_ClMaster_ClMc,
        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_ClMc, '', pClBmRec), pRec);
      SetFieldValue(cst_ClMaster_ClDw,
        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_ClDw, '', pClBmRec), pRec);
      SetFieldValue(cst_ClMaster_ClGg,
        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_ClGg, '', pClBmRec), pRec);
      SetFieldValue(cst_ClMaster_shuilv,
        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_shuilv, '', pClBmRec), pRec);
//      SetFieldValue(cst_ClMaster_shuilvback,
//        FClMasterDataset.GetFieldValueAsString(cst_ClMaster_shuilvback, '', pClBmRec), pRec);
      SetFieldValue(cst_ClMaster_ClDej, 0, pRec);
      SetFieldValue(cst_ClMaster_ClScj, 0, pRec);
    end;
  end;
end;

destructor TExcelDeal.Destroy;
begin
  if Assigned(FDeBm_DeIdList) then
    FDeBm_DeIdList.Free;
  inherited;
end;

procedure TExcelDeal.DoImport;
var
  i, j, iRightCuont, iErrorCount, iMaxXh: Integer;
  pRec, pClRec: Pointer;
  sId, sDeBm, sValue, sExcelDeBm, sExcelClBm, sExcelSl: string;
  EApp: Variant;
  dSl: Double;
begin
  // ~1
  iMaxXh := GetClkMaxXh;
  iRightCuont := 0;
  iErrorCount := 0;
  for i := 0 to FDeMasterDataset.GetRecordCount-1 do
  begin
    pRec := FDeMasterDataset.GetCurrentRec(i);
    sId := FDeMasterDataset.GetFieldValueAsString(cst_DeMaster_id, '', pRec);
    sDeBm := FDeMasterDataset.GetFieldValueAsString(cst_DeMaster_DeBianMa, '', pRec);
    if not FDeBm_DeIdList.ContainsKey(sDeBm) then
      FDeBm_DeIdList.Add(sDeBm, sId);
  end;
  try
    EApp := CreateOleObject('Excel.Application');
    EApp.Workbooks.Open(FExcelFileName);
//  EApp.Visible:=true;
    for i := 1 to EApp.worksheets.Count  do
    begin
      EApp.WorkSheets[i].Activate;
      ShowProgress(cst_SumData + IntToStr(EApp.WorkSheets[i].UsedRange.Rows.Count) + ',' + cst_Detail +
      cst_ExportIng, EApp.WorkSheets[i].UsedRange.Rows.Count);
      for j := 1 to EApp.WorkSheets[i].UsedRange.Rows.Count do
      begin
        sExcelDeBm := Trim(EApp.Cells[j, 2].Value);
        sExcelClBm := Trim(EApp.Cells[j, 3].Value);
        dSl := StrTofloatDef(Trim(EApp.Cells[j, 4].Value), 0);
        if (Pos('-', sExcelClBm) > 0) or (not FDeBm_DeIdList.ContainsKey(sExcelDeBm))  then
        begin
          Inc(iErrorCount);
          UpdateProgress;
          Continue;
        end;
        sId := FDeBm_DeIdList.Items[sExcelDeBm];
        if dSl < 0 then
        begin
          sExcelClBm := sExcelClBm + '~1';
          pClRec := FClMasterDataset.FindRec(cst_ClMaster_ClBm, sExcelClBm);
          if not Assigned(pClRec) then
          begin
            iMaxXh := iMaxXh + 1;
            DealClkMasterByClBm(Trim(EApp.Cells[j, 3].Value), iMaxXh);
          end;
        end;
        with FDeDetailDataset do
        begin
          pRec := InsertAfter(nil);
          SetFieldValue(cst_Detail_DeId, sId, pRec);
          SetFieldValue(cst_Detail_ClId, sExcelClBm, pRec);
          SetFieldValue(cst_Detail_XHL, Abs(dSl), pRec);
        end;
        Inc(iRightCuont);
        UpdateProgress;
      end;
      MessageDlg('总数据行数' + inttostr(EApp.WorkSheets[i].UsedRange.Rows.Count) + '正确数据行数' + inttostr(iRightCuont) + '错误数据行数' + inttostr(iErrorCount),
      mtInformation, [mbOK], 0);
      HideProgress;
    end;
    FPrj.SavePrj();
    FClkPrj.SavePrj();
    EApp.WorkBooks.Close;
    EApp.Quit;
  except
    on Exception do raise exception.Create('无法创建Xls文件，请确认是否安装EXCEL')
  end;
end;

function TExcelDeal.GetClkMaxXh: Integer;
var
  i, iXh: Integer;
  pRec: Pointer;
begin
  Result := 0;
  for i := 0 to FClMasterDataset.GetRecordCount-1 do
  begin
    pRec := FClMasterDataset.GetCurrentRec(i);
    iXh := FClMasterDataset.GetFieldValueAsInt(cst_ClMaster_id, 0, pRec);
    if iXh > Result  then
      Result := iXh
  end;
end;

end.
