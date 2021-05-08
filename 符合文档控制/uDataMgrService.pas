{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：数据管理服务                               }
{ 单元作者：Wenxh                                      }
{ 创建时间：2011.05.10                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
{******************************************************}

unit uDataMgrService;

interface

uses
  Windows, Classes, SysUtils, uDataManagerIntf, uPrjDataManager, uPMDataIntf,
  uPmLibDataSet, uServiceIntf;

type
  //数据管理服务
  TDataMgrService = class(TYsInterfacedObject, IDataMgrService)
  private
    {IDataMgrService}
    function NewPrjDataManager: IPrjDataManager;
    function NewDataSet: IPMDataset;
  public
    constructor Create; override;
    destructor Destroy; override;
    class function NewPrjDataManagerEx: IPrjDataManager;
    class function NewDataSetEx: IPMDataset;
  end;

implementation

{ TDataMgrService }

constructor TDataMgrService.Create;
begin

end;

destructor TDataMgrService.Destroy;
begin

  inherited;
end;

function TDataMgrService.NewDataSet: IPMDataset;
begin
  Result := TPmLibDataSet.Create;
end;

function TDataMgrService.NewPrjDataManager: IPrjDataManager;
begin
  Result := TPrjDataManager.Create;
end;

class function TDataMgrService.NewDataSetEx: IPMDataset;
begin
  Result := TPmLibDataSet.Create;
end;

class function TDataMgrService.NewPrjDataManagerEx: IPrjDataManager;
begin
  Result := TPrjDataManager.Create;
end;

end.
