{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：数据层相关接口定义                         }
{ 单元作者：Wenxh                                      }
{ 创建时间：2010.05.27                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2015-11-27 Wenxh 增加：增加内部保存模式
{******************************************************}

unit uDataManagerIntf;

interface

uses
  Classes, ActiveX, uPMDataIntf;

type
  TDataStateLists = array of TInterfaceList;

  TEndDataStateEvent = procedure(DataStateList: TInterfaceList; ACaption: string) of object;
  //备份文件
  TOnBackupFileEvent = procedure(Sender: TObject; const sSrcFileName: string; sFilePrefix: string = '') of object;

  IPrjDataManager = interface;
  //数据管理
  IDataContext = interface
    ['{00028A09-2099-4776-B02E-0091D20A8FA9}']
    {*****************************表格操作*************************************}
    //加载数据
    function LoadData: Boolean;
    //保存数据
    function SaveData(bInternalMode: Boolean = False): Boolean;
    //清空Datacontext下所有DataSet数据
    function Clear: Boolean;
    //创建DataSet
    function CreateDataSet(const sDataSetName: string): IPMDataset;
    //获取DataSet
    function GetDataSet(const sDataSetName: string): IPMDataSet;
    //获取DataSet索引
    function GetDataSetByIndex(const sDataSetName: string): IPMDataset;
    //删除DataSet
    procedure DeleteDataSet(const sDataSetName: string);
    //开始记录DataSet操作状态
    procedure BeginDataState;
    //关闭记录DataSet操作状态并返回操作状态列表
    procedure EndDataState(DataStateList: TInterfaceList);

    function GetCurrStorage: IStorage;
    function CopyTo(ADstDataContext: IDataContext): Boolean;

    {*****************************数据流操作***********************************}
    //加载流数据
    function LoadStream(aStream: TMemoryStream; const DataName: string): Boolean;
    //保存流数据
    procedure SaveStream(aStream: TMemoryStream; const DataName: string;
      bInternalMode: Boolean = False);
    //删除流数据
    procedure DeleteStream(const DataName: string);
    {*****************************属性操作***********************************}
    //获取资源列表
    function GetDataContextResList(AResList: TStringList): Boolean;
    //获取Datacontext标识
    function GetDataContextToken: string;
    //设置 数据集加载结构后 处理事件
    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
    //DataContext标识
    property DataToken: string read GetDataContextToken;
  end;

  //项目管理
  IPrjDataManager = interface
    ['{0237174F-2299-4280-9563-3722DE30E0FE}']
    //加载文件数据
    function LoadPrj(const FileName: string; bDecompress: Boolean = False): Boolean;
    //保存文件数据
    function SavePrj(const FileName: string = ''; bCompress: Boolean = False;
        bShowProgress: Boolean = False; AOwnerHandle: Cardinal = 0;
        bInternalMode: Boolean = False; bBackUp: Boolean = True): Boolean;
    function SavePrjToStream(AStream: TStream): Boolean;
    /// <summary>
    /// 设置工程文件名：为了解决工程保存至临时文件后，FileName 被更改到临时文件名了
    ///                 需通过此方法回设成工程文件,否则，工程有可能会保存至临时文件了
    /// </summary>
    /// <param name="AValue">文件名</param>
    procedure SetFileName(const AValue: string);
    //获取文件名
    function GetFileName: string;
    //创建DataContext
    function CreateDataContext(const sDataName: string): IDataContext;
    //获取DataContext
    function GetDataContext(const sDataName: string): IDataContext;
    //删除一个DataContext
    procedure DeleteContext(const sDataName: string);
    //开始记录DataSet操作状态
    procedure BeginDataState;
    //关闭记录DataSet操作状态(返回撤消列表自己处理)
    procedure EndDataState(DataStateList: TInterfaceList); overload;
    //关闭记录DataSet操作状态(调用事件抛出列表,统一处理)
    procedure EndDataState(ACaption: string = ''); overload;
    //数据处理回滚操作(调用数据操作列表进行撤消操作)
    procedure RollBack;
    function IsBeginDataState: Boolean;
    function GetEndDataState: TEndDataStateEvent;
    procedure SetEndDataState(Value: TEndDataStateEvent);
    procedure SetOnBackupFileEvent(Value: TOnBackupFileEvent);
    // 外部调用 慎用
    function Commit: Boolean;
    //关闭记录DataSet操作状态(抛出事件)
    property OnEndDataState: TEndDataStateEvent read GetEndDataState
      write SetEndDataState;
    property OnBackupFile: TOnBackupFileEvent write SetOnBackupFileEvent;
  end;

  IDataMgrService = interface
    ['{733CB94A-1FFC-4945-85FD-33C6BA408730}'{cst_SysService_DataMgr}]
    function NewPrjDataManager: IPrjDataManager;
    function NewDataSet: IPMDataset;
  end;

implementation

end.

