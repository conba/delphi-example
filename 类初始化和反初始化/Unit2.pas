{*Delphi2010新发现-类的构造和析构函数功能Delphi2010中Windows7新的taskbar功能的使用 →
再探Delphi2010 Class的构造和析构顺序.
发表于2012 年 9 月 12 日由admin
转自我的旧博客
发了上一篇博客.盒子上有朋友认为Class的构造和析构延迟加载.是在Unit的初始化后调用的Class的构造.在Unit的反初始化前调用的Class的析构函数.

为了证明一下我又做了个试验  *}

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

