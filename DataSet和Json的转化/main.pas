unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, DBClient;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    ADODataSet1: TADODataSet;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  uDBJson, superobject;
{$R *.dfm}
//���ݼ�תJSON�����JSON�ı�
procedure TForm1.btn1Click(Sender: TObject);
var
  json: TTableJSon;
  s: string;
begin
  s := json.JSonFromDataSet(ADODataSet1);
//����TStringStream�����ַ���S������ı����������ʽ.
end;

//JSON������ı���װ�ص����ݼ�
procedure TForm1.btn2Click(Sender: TObject);
var
  json: ISuperObject;
  cdsJSON: TClientDataSet;
begin
  cdsJSON := TClientDataSet.Create(nil);
  try
    json := TSuperObject.ParseFile('json.txt', False);
    TTableJSon.CDSFromJSon(cdsJSON, json);
  finally
    cdsJSON.Free;
    cdsJSON := nil;
  end;
end;

end.
