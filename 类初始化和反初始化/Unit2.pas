{*Delphi2010�·���-��Ĺ����������������Delphi2010��Windows7�µ�taskbar���ܵ�ʹ�� ��
��̽Delphi2010 Class�Ĺ��������˳��.
������2012 �� 9 �� 12 ����admin
ת���ҵľɲ���
������һƪ����.��������������ΪClass�Ĺ���������ӳټ���.����Unit�ĳ�ʼ������õ�Class�Ĺ���.��Unit�ķ���ʼ��ǰ���õ�Class����������.

Ϊ��֤��һ���������˸�����  *}

unit Unit2;

interface

type
  TClassTest = class
    class constructor create();
    class destructor destory();
  end;

implementation

uses
  Windows;

{ TClassTest }

class constructor TClassTest.create;
begin
  OutputDebugString('lass constructor');
end;

class destructor TClassTest.destory;
begin
  OutputDebugString('class destructor');
end;

initialization
  OutputDebugString('Unit initialization');

finalization
  OutputDebugString('Unit finalization');

end.

