////////////////////////////////////////////////////////////////////////////////
//
//
//  FileName    :   IntfEditor.pas
//  Creator     :   Shen Min
//  Date        :   2002-4-13
//  Comment     :   Interface of Editor
//
//
////////////////////////////////////////////////////////////////////////////////

unit IntfEditor;

interface

uses Graphics, Classes, Dialogs;

type
    TssnWordCountRec = record
        AnsiChar : Integer;
        MultiChar : Integer;
        NumChar : Integer;
        Other : Integer;
    end;

{个人认为这里作者不适用接口的原因是因为使用接口的话实现接口的类需要实现接口中所有
 的方法，而使用抽象类就不需要，然后就可以只选择比较重要的功能来实现，从而减少代码量}
    IssnEditor = class
    public
        function GetFileName() : String; virtual; abstract;
        function GetSaved() : Boolean; virtual; abstract;
        function Save() : Boolean; virtual; abstract;
        function SaveAs() : Boolean; virtual; abstract;
        function GetSelectText() : String; virtual; abstract;
        procedure SetFont(Font : TFont); virtual; abstract;
        procedure Undo(); virtual; abstract;// 撤销
        function CanUndo() : Boolean; virtual; abstract; // 工作区是否允许撤销操作
        procedure Redo(); virtual; abstract;
        function CanRedo() : Boolean; virtual; abstract;
        procedure Cut(); virtual; abstract;
        function CanCut() : Boolean; virtual; abstract;
        procedure Copy(); virtual; abstract;
        function CanCopy() : Boolean; virtual; abstract;
        procedure Paste(); virtual; abstract;
        function CanPaste() : Boolean; virtual; abstract;
        procedure DeleteSelection(); virtual; abstract;
        function CanDeleteSelection() : Boolean; virtual; abstract;
        procedure DeleteLine(); virtual; abstract;
        procedure SelectAll(); virtual; abstract;
        function FindNext(Text : String; Option : TFindOptions) : Boolean; virtual; abstract;
        function Replace(FindText, ReplaceText : String; Option : TFindOptions) : Integer; virtual; abstract;
        function GetWordCount() : TssnWordCountRec; virtual; abstract;
        function GetWordWrap() : Boolean; virtual; abstract;
        procedure SetWordWrap(WordWrap : Boolean); virtual; abstract; // 设置自动换行
    end;

implementation

end.
