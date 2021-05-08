unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ComCtrls, Buttons, ExtCtrls, shellAPI;

type
  TFormMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    rg_DataType: TRadioGroup;
    Label19: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label20: TLabel;
    Edit3: TEdit;
    Panel4: TPanel;
    Label21: TLabel;
    Edit4: TEdit;
    Panel5: TPanel;
    Label22: TLabel;
    Edit5: TEdit;
    Panel6: TPanel;
    Label23: TLabel;
    Edit6: TEdit;
    Panel7: TPanel;
    Label24: TLabel;
    Edit7: TEdit;
    Panel8: TPanel;
    Label25: TLabel;
    Edit8: TEdit;
    Panel9: TPanel;
    Label26: TLabel;
    Edit9: TEdit;
    Panel10: TPanel;
    Label4: TLabel;
    Edit11: TEdit;
    Panel11: TPanel;
    Label6: TLabel;
    Edit10: TEdit;
    Label7: TLabel;
    Button2: TButton;
    Button3: TButton;
    Panel12: TPanel;
    Label1: TLabel;
    Edit12: TEdit;
    Button4: TButton;
    Panel13: TPanel;
    rg_type: TRadioGroup;
    edt_in: TEdit;
    edt_out: TEdit;
    btn_Lookup: TButton;
    btn_allChar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btn_LookupClick(Sender: TObject);
    procedure btn_allCharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //***************************
  end;

var
  FormMain: TFormMain;

implementation

uses
  Unit_CRC;

var
  asciiArr: array [0..33] of Ansistring =
    ('0000 0000 000 00 NUL ? 空字符',
     '0000 0001 001 01 SOH ? 标题开始',
     '0000 0010 002 02 STX ? 本文开始',
     '0000 0011 003 03 ETX ? 本文结束',
     '0000 0100 004 04 EOT ? 传输结束',
     '0000 0101 005 05 ENQ ? 请求',
     '0000 0110 006 06 ACK ? 确认回应',
     '0000 0111 007 07 BEL ? 响铃',
     '0000 1000 008 08 BS  ? 退格',
     '0000 1001 009 09 HT  ? 水平定位符号',
     '0000 1010 010 0A LF  ? 换行键',
     '0000 1011 011 0B VT  ? 垂直定位符号',
     '0000 1100 012 0C FF  ? 换页键',
     '0000 1101 013 0D CR  ? 归位键',
     '0000 1110 014 0E SO  ? 取消变换',
     '0000 1111 015 0F SI  ? 启用变换',
     '0001 0000 016 10 DLE ? 跳出数据通讯',
     '0001 0001 017 11 DC1 ? 设备控制一',
     '0001 0010 018 12 DC2 ? 设备控制二',
     '0001 0011 019 13 DC3 ? 设备控制三',
     '0001 0100 020 14 DC4 ? 设备控制四',
     '0001 0101 021 15 NAK ? 确认失败回应',
     '0001 0110 022 16 SYN ? 同步用暂停',
     '0001 0111 023 17 ETB ? 区块传输结束',
     '0001 1000 024 18 CAN ? 取消',
     '0001 1001 025 19 EM  ? 连接介质中断',
     '0001 1010 026 1A SUB ? 替换',
     '0001 1011 027 1B ESC ? 跳出',
     '0001 1100 028 1C FS  ? 文件分割符',
     '0001 1101 029 1D GS  ? 组群分隔符',
     '0001 1110 030 1E RS  ? 记录分隔符',
     '0001 1111 031 1F US  ? 单元分隔符',
     '0111 1111 127 7F DEL ? 删除',
     '0010 0000 032 20     ? 空格');
{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  rg_DataType.Hint := 'ASCII：字符型，示例：abc,./123' + #13 +
                      'Hex：16进制，用空格与逗号间隔，示例：01 02 A1 2B FC';
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  crc: Word;
  crc32: LongWord;
  str: string;
begin
  if Memo1.Text = '' then Exit;
  str := memo1.Text;
  if rg_DataType.ItemIndex  = 1 then
    if FormatHexData(str) then
    begin
      memo1.Text := str;   // 回显
      str := ConvHexToString(str);
    end
    else begin
      Application.MessageBox('16进制输入格式有误！','输入错误', MB_ICONWARNING);
      Exit;
    end;

  crc := Unit_CRC.Calcu_crc_16($0000, str);
  edit1.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_16($FFFF, str);
  edit2.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_sick(str);
  edit3.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_ccitt($0000, str);
  edit4.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_ccitt($FFFF, str);
  edit5.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_ccitt($1D0F, str);
  edit6.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_kermit(str);
  edit7.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_dnp(str);
  edit8.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc32 := Unit_CRC.Calcu_crc_32(str);
  edit9.Text :=  IntToHex(crc32, 8) + '/' + IntToStr(crc32);

  crc := Unit_CRC.OriginalCalcuCRC_16(str);
  edit10.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.OriginalCalcuCRC_CCITT(str);
  edit11.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

  crc := Unit_CRC.Calcu_crc_DB35(str);
  edit12.Text :=  IntToHex(crc, 4) + '/' + IntToStr(crc);

end;


procedure TFormMain.Button2Click(Sender: TObject);
begin
  WinExec('calc.exe',SW_SHOWNORMAL);
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  ShellExecute(Handle,PChar('open'),PChar('http://www.lammertbies.nl/comm/info/crc-calculation.html'),nil,nil,SW_SHOW);
end;

procedure TFormMain.Button4Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TFormMain.btn_LookupClick(Sender: TObject);
var
  str, tmpStr: string;
  len, i, p: integer;
  ch1: word;
begin
  str := edt_in.Text;
  len := Length(str);
  edt_out.Text := '';
  case rg_type.ItemIndex of
    0:
    begin
      if len <> 1 then Exit;
      ch1 := Ord(str[1]);
    end;
    1:
    begin
      if (len < 1) or (len > 2)then Exit;
      for i := 1 to len do
        if not (str[i] in ['0'..'9', 'A'..'F', 'a'..'f']) then Exit;
      ch1 := strToInt('$' + str);
    end;
    2:
    begin
      if (len < 1) or (len > 3)then Exit;
      for i := 1 to len do
        if not (str[i] in ['0'..'9']) then Exit;
      ch1 := strToInt(str);
    end;
  else Exit;
  end;      // case

  edt_out.Text := '' + IntToStr(ch1) + ',' +
                  '' + IntToHex(ch1, 2) + 'H,' +
                  char(ch1);
  for i := 0 to 33 do
  begin
    if StrToInt(midStr(asciiArr[i], 11, 3)) = ch1 then
    begin
      p := Pos('?', asciiArr[i]);
      tmpStr := midStr(asciiArr[i], p + 2,  Length(asciiArr[i]) - p - 1);
      edt_out.Text := edt_out.Text + ',' + midStr(asciiArr[i], 18, 3) + ':' + tmpStr;
      Break;
    end;
  end;
end;

procedure TFormMain.btn_allCharClick(Sender: TObject);
var
  i, j, p: integer;
  chStr: TstringList;
  str, tmpStr: string;
begin
  memo1.Text := '';
  chStr := TstringList.Create;
  try
    for i := 0 to 127 do
    begin
      str := format('%3d', [i]) + '  ' + format('%2x', [i]) + 'H  ' + char(i);
      for j := 0 to 33 do
      begin
        if StrToInt(midStr(asciiArr[j], 11, 3)) = i then
        begin
          p := Pos('?', asciiArr[j]);
          tmpStr := midStr(asciiArr[j], p + 2,  Length(asciiArr[j]) - p - 1);
          str := str + '  ' + midStr(asciiArr[j], 18, 3) + ':' + tmpStr;
          Break;
        end;
      end;
      chStr.Add(str);
    end;
    memo1.Lines := chStr;
  finally
    chStr.Free;
  end;
end;

end.

