{******************************************************}
{ ��Ʒ���ƣ�PMSS5.0                                    }
{ ��Ԫ�����������ĵ��ӿڶ���                           }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2010.05.27                                 }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
// 2015-11-27 Wenxh ���ӣ������ڲ�����ģʽ
{******************************************************}

unit uCompoundDocumentIntf;

interface

uses
  Windows, Classes, SysUtils, ActiveX;

type
{******************************************************}
{ ���������������ĵ������ӿ�                           }
{******************************************************}
  ICompoundDocument = interface
  ['{3983C59A-23C2-47B8-BEFC-48FA6217B062}']
    function GetFileName: WideString;
    function GetRootStorage: IStorage;
    /// <summary>
    ///  �򿪻򴴽������ĵ�����
    ///  sFileName: �����ĵ��ļ���
    ///  bOpen: �ж��Ǵ򿪻��Ǵ���
    /// </summary>
    function CreateDocument(const sFileName: WideString; bOpen: Boolean): Boolean;
    /// <summary>
    ///  ���������ĵ�����
    /// </summary>
    procedure CloseDocument;
    /// <summary>
    /// �ύ����
    /// </summary>
    function Commit: Integer;
    /// <summary>
    /// ��������
    /// </summary>
    procedure Revert;
    /// <summary>
    ///  �����洢
    ///  APStorage: ���ڵ�洢
    ///  AStorageName: �´����Ĵ洢����
    ///  ASubStorage: �����󷵻صĴ洢����
    /// </summary>
    function CreateStorage(APStorage: IStorage; const AStorageName: WideString;
      var ASubStorage: IStorage): Boolean;
    /// <summary>
    ///  ������
    ///  APStorage: ���ڵ�洢
    ///  AStorageName: �´�����������
    ///  ASubStorage: �����󷵻ص�������
    ///  bInternalMode: �ڲ�ģʽ(����ģʽ)
    /// </summary>
    function CreateStream(APStorage: IStorage; const AStreamName: WideString;
      var ASubStream: IStream; bInternalMode: Boolean = False): Boolean;
    /// <summary>
    ///  ɾ���洢
    ///  APStorage: �洢���ڵĸ��ڵ�洢
    ///  AStorageName: ��Ҫ��ɾ���Ĵ洢����
    /// </summary>
    function DeleteStorage(APStorage: IStorage; const AStorageName: WideString): Boolean;
    /// <summary>
    ///  ɾ����
    ///  APStorage: �����ڵĸ��ڵ�洢
    ///  AStreamName: ��Ҫ��ɾ����������
    /// </summary>
    function DeleteStream(APStorage: IStorage; const AStreamName: WideString): Boolean;
    /// <summary>
    /// ͨ��AStorageName��ȡָ���Ĵ洢����
    ///  APStorage: �洢���ڵĸ��ڵ�洢
    ///  AStorageName: ��ȡ�Ĵ洢����
    ///  ASubStorage: ���صĴ洢����
    /// </summary>
    function GetStorage(APStorage: IStorage; const AStorageName: WideString;
      var ASubStorage: IStorage): Boolean;
    /// <summary>
    /// ͨ��AStreamName��ȡָ����Stream(������)
    ///  APStorage: �����ڵĸ��ڵ�洢
    ///  AStreamName: ��ȡ��������
    ///  ASubStream: ���ص�������
    /// </summary>
    function GetStream(APStorage: IStorage; const AStreamName: WideString;
      var ASubStream: IStream): Boolean;
    /// <summary>
    /// �ж�ָ���Ĵ洢�Ƿ����
    ///  APStorage: �洢���ڵĸ��ڵ�洢
    ///  AStorageName: �洢����
    /// </summary>
    function StorageIsExist(APStorage: IStorage; const AStorageName: WideString): Boolean;
    /// <summary>
    /// �ж�ָ�������Ƿ����
    ///  APStorage: �����ڵĸ��ڵ�洢
    ///  AStreamName: ������
    /// </summary>
    function StreamIsExist(APStorage: IStorage; const AStreamName: WideString): Boolean;
    /// <summary>
    /// �������ݵ���
    ///  APStorage: �����ڵĸ��ڵ�洢
    ///  AStreamName: ������
    ///  AMemoryStream: ���������
    ///  bInternalMode: �ڲ�ģʽ(����ģʽ)
    /// </summary>
    function SaveToStream(APStorage: IStorage; const AStreamName: WideString;
      AMemoryStream: TStream; bInternalMode: Boolean = False): Boolean;
    /// <summary>
    /// ��ȡ����
    ///  APStorage: �����ڵĸ��ڵ�洢
    ///  AStreamName: ������
    ///  AMemoryStream: ���������
    /// </summary>
    function LoadFromStream(APStorage: IStorage; const AStreamName: WideString;
      AMemoryStream: TMemoryStream): Boolean;
    //���ش洢�е���Դ�б�
    function GetResList(APStorage: IStorage; AResList: TStringList): Boolean;
    {property}
    property m_FileName: WideString read GetFileName;
    property m_RootStorage: IStorage read GetRootStorage ;
  end;

implementation

end.

