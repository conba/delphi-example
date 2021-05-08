{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：复合文档接口定义                           }
{ 单元作者：Wenxh                                      }
{ 创建时间：2010.05.27                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2015-11-27 Wenxh 增加：增加内部保存模式
{******************************************************}

unit uCompoundDocumentIntf;

interface

uses
  Windows, Classes, SysUtils, ActiveX;

type
{******************************************************}
{ 责任描述：复合文档操作接口                           }
{******************************************************}
  ICompoundDocument = interface
  ['{3983C59A-23C2-47B8-BEFC-48FA6217B062}']
    function GetFileName: WideString;
    function GetRootStorage: IStorage;
    /// <summary>
    ///  打开或创建复合文档操作
    ///  sFileName: 复合文档文件名
    ///  bOpen: 判断是打开还是创建
    /// </summary>
    function CreateDocument(const sFileName: WideString; bOpen: Boolean): Boolean;
    /// <summary>
    ///  结束复合文档操作
    /// </summary>
    procedure CloseDocument;
    /// <summary>
    /// 提交操作
    /// </summary>
    function Commit: Integer;
    /// <summary>
    /// 撤消操作
    /// </summary>
    procedure Revert;
    /// <summary>
    ///  创建存储
    ///  APStorage: 父节点存储
    ///  AStorageName: 新创建的存储名称
    ///  ASubStorage: 创建后返回的存储对象
    /// </summary>
    function CreateStorage(APStorage: IStorage; const AStorageName: WideString;
      var ASubStorage: IStorage): Boolean;
    /// <summary>
    ///  创建流
    ///  APStorage: 父节点存储
    ///  AStorageName: 新创建的流名称
    ///  ASubStorage: 创建后返回的流对象
    ///  bInternalMode: 内部模式(测试模式)
    /// </summary>
    function CreateStream(APStorage: IStorage; const AStreamName: WideString;
      var ASubStream: IStream; bInternalMode: Boolean = False): Boolean;
    /// <summary>
    ///  删除存储
    ///  APStorage: 存储所在的父节点存储
    ///  AStorageName: 将要被删除的存储名称
    /// </summary>
    function DeleteStorage(APStorage: IStorage; const AStorageName: WideString): Boolean;
    /// <summary>
    ///  删除流
    ///  APStorage: 流所在的父节点存储
    ///  AStreamName: 将要被删除的流名称
    /// </summary>
    function DeleteStream(APStorage: IStorage; const AStreamName: WideString): Boolean;
    /// <summary>
    /// 通过AStorageName获取指定的存储对象
    ///  APStorage: 存储所在的父节点存储
    ///  AStorageName: 获取的存储名称
    ///  ASubStorage: 返回的存储对象
    /// </summary>
    function GetStorage(APStorage: IStorage; const AStorageName: WideString;
      var ASubStorage: IStorage): Boolean;
    /// <summary>
    /// 通过AStreamName获取指定的Stream(流对象)
    ///  APStorage: 流所在的父节点存储
    ///  AStreamName: 获取的流名称
    ///  ASubStream: 返回的流对象
    /// </summary>
    function GetStream(APStorage: IStorage; const AStreamName: WideString;
      var ASubStream: IStream): Boolean;
    /// <summary>
    /// 判断指定的存储是否存在
    ///  APStorage: 存储所在的父节点存储
    ///  AStorageName: 存储名称
    /// </summary>
    function StorageIsExist(APStorage: IStorage; const AStorageName: WideString): Boolean;
    /// <summary>
    /// 判断指定的流是否存在
    ///  APStorage: 流所在的父节点存储
    ///  AStreamName: 流名称
    /// </summary>
    function StreamIsExist(APStorage: IStorage; const AStreamName: WideString): Boolean;
    /// <summary>
    /// 保存数据到流
    ///  APStorage: 流所在的父节点存储
    ///  AStreamName: 流名称
    ///  AMemoryStream: 保存的数据
    ///  bInternalMode: 内部模式(测试模式)
    /// </summary>
    function SaveToStream(APStorage: IStorage; const AStreamName: WideString;
      AMemoryStream: TStream; bInternalMode: Boolean = False): Boolean;
    /// <summary>
    /// 获取数据
    ///  APStorage: 流所在的父节点存储
    ///  AStreamName: 流名称
    ///  AMemoryStream: 保存的数据
    /// </summary>
    function LoadFromStream(APStorage: IStorage; const AStreamName: WideString;
      AMemoryStream: TMemoryStream): Boolean;
    //返回存储中的资源列表
    function GetResList(APStorage: IStorage; AResList: TStringList): Boolean;
    {property}
    property m_FileName: WideString read GetFileName;
    property m_RootStorage: IStorage read GetRootStorage ;
  end;

implementation

end.

