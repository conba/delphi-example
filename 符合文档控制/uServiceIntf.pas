{******************************************************}
{ ��Ʒ���ƣ�PMSS5.0                                    }
{ ��Ԫ����������ӿ�                                   }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2012.06.08                                 }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
{******************************************************}
unit uServiceIntf;

interface

type
  TYsInterfacedObject = class(TInterfacedObject)
  public
    constructor Create; virtual;
  end;
  TYsInterfacedObjectClass = class of TYsInterfacedObject;

  //�����ļ�����
  ISSService = interface
  ['{F7B07D3C-D5C2-4065-BDE1-E407712416B6}']
    procedure RegisterService(const ServiceName: string; Service: IInterface); overload;
    procedure RegisterService(const ServiceName: TGUID; Service: IInterface); overload;
    procedure RegisterService(const ServiceName: string; ServiceClass: TYsInterfacedObjectClass); overload;
    function ServiceExists(const ServiceName: string): Boolean; overload;
    function ServiceExists(const ServiceName: TGUID): Boolean; overload;
    function GetService(const ServiceName: string): IInterface; overload;
    function GetService(const ServiceName: TGUID): IInterface; overload;
    procedure UnInit;
  end;

implementation

{ TYsInterfacedObject }

constructor TYsInterfacedObject.Create;
begin
  inherited Create;
end;

end.

