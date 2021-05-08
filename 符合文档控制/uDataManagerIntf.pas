{******************************************************}
{ ��Ʒ���ƣ�PMSS5.0                                    }
{ ��Ԫ���������ݲ���ؽӿڶ���                         }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2010.05.27                                 }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
// 2015-11-27 Wenxh ���ӣ������ڲ�����ģʽ
{******************************************************}

unit uDataManagerIntf;

interface

uses
  Classes, ActiveX, uPMDataIntf;

type
  TDataStateLists = array of TInterfaceList;

  TEndDataStateEvent = procedure(DataStateList: TInterfaceList; ACaption: string) of object;
  //�����ļ�
  TOnBackupFileEvent = procedure(Sender: TObject; const sSrcFileName: string; sFilePrefix: string = '') of object;

  IPrjDataManager = interface;
  //���ݹ���
  IDataContext = interface
    ['{00028A09-2099-4776-B02E-0091D20A8FA9}']
    {*****************************������*************************************}
    //��������
    function LoadData: Boolean;
    //��������
    function SaveData(bInternalMode: Boolean = False): Boolean;
    //���Datacontext������DataSet����
    function Clear: Boolean;
    //����DataSet
    function CreateDataSet(const sDataSetName: string): IPMDataset;
    //��ȡDataSet
    function GetDataSet(const sDataSetName: string): IPMDataSet;
    //��ȡDataSet����
    function GetDataSetByIndex(const sDataSetName: string): IPMDataset;
    //ɾ��DataSet
    procedure DeleteDataSet(const sDataSetName: string);
    //��ʼ��¼DataSet����״̬
    procedure BeginDataState;
    //�رռ�¼DataSet����״̬�����ز���״̬�б�
    procedure EndDataState(DataStateList: TInterfaceList);

    function GetCurrStorage: IStorage;
    function CopyTo(ADstDataContext: IDataContext): Boolean;

    {*****************************����������***********************************}
    //����������
    function LoadStream(aStream: TMemoryStream; const DataName: string): Boolean;
    //����������
    procedure SaveStream(aStream: TMemoryStream; const DataName: string;
      bInternalMode: Boolean = False);
    //ɾ��������
    procedure DeleteStream(const DataName: string);
    {*****************************���Բ���***********************************}
    //��ȡ��Դ�б�
    function GetDataContextResList(AResList: TStringList): Boolean;
    //��ȡDatacontext��ʶ
    function GetDataContextToken: string;
    //���� ���ݼ����ؽṹ�� �����¼�
    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
    //DataContext��ʶ
    property DataToken: string read GetDataContextToken;
  end;

  //��Ŀ����
  IPrjDataManager = interface
    ['{0237174F-2299-4280-9563-3722DE30E0FE}']
    //�����ļ�����
    function LoadPrj(const FileName: string; bDecompress: Boolean = False): Boolean;
    //�����ļ�����
    function SavePrj(const FileName: string = ''; bCompress: Boolean = False;
        bShowProgress: Boolean = False; AOwnerHandle: Cardinal = 0;
        bInternalMode: Boolean = False; bBackUp: Boolean = True): Boolean;
    function SavePrjToStream(AStream: TStream): Boolean;
    /// <summary>
    /// ���ù����ļ�����Ϊ�˽�����̱�������ʱ�ļ���FileName �����ĵ���ʱ�ļ�����
    ///                 ��ͨ���˷�������ɹ����ļ�,���򣬹����п��ܻᱣ������ʱ�ļ���
    /// </summary>
    /// <param name="AValue">�ļ���</param>
    procedure SetFileName(const AValue: string);
    //��ȡ�ļ���
    function GetFileName: string;
    //����DataContext
    function CreateDataContext(const sDataName: string): IDataContext;
    //��ȡDataContext
    function GetDataContext(const sDataName: string): IDataContext;
    //ɾ��һ��DataContext
    procedure DeleteContext(const sDataName: string);
    //��ʼ��¼DataSet����״̬
    procedure BeginDataState;
    //�رռ�¼DataSet����״̬(���س����б��Լ�����)
    procedure EndDataState(DataStateList: TInterfaceList); overload;
    //�رռ�¼DataSet����״̬(�����¼��׳��б�,ͳһ����)
    procedure EndDataState(ACaption: string = ''); overload;
    //���ݴ���ع�����(�������ݲ����б���г�������)
    procedure RollBack;
    function IsBeginDataState: Boolean;
    function GetEndDataState: TEndDataStateEvent;
    procedure SetEndDataState(Value: TEndDataStateEvent);
    procedure SetOnBackupFileEvent(Value: TOnBackupFileEvent);
    // �ⲿ���� ����
    function Commit: Boolean;
    //�رռ�¼DataSet����״̬(�׳��¼�)
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

