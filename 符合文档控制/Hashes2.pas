unit Hashes2;

{** Hash Library

    Original Author:     Ciaran McCreesh <keesh@users.sf.net>
    Copyright:           Copyright (c) 2002 Ciaran McCreesh
    Date:                20020621
    Purpose:             A collection of hash components for Delphi. These are
                         similar to arrays, but the index is a string. A hashing
                         algorithm is used to provide extremely fast searching.

    Generic Moan:        This would be a lot easier if Delphi had template
                         classes. If anyone at Borland / Inprise / whatever
                         you're calling yourselves this week reads this, let me
                         know how much I have to bribe you.

    Changelog:
      v2.6 (20020621)
        * Framework for dynamic bucket sizes. No actual resizing yet.
        * Changed TStringHash, TIntegerHash and TObjectHash slightly, and fixed
          potential bugs in them.
        * General performance improvements
        * Changed how iterators work. In particular, multiple iterators are now
          possible. Thanks to Daniel Trinter for code and Emanuel for
          suggestions.
        + Previous method (goes with Next)
        + AllowCompact property

      v2.5 (20020606)
        * Empty hash keys explicitly forbidden. Thanks to Marco Vink for the
          notice.
        + Clear method

      v2.4 (20020603)
        * Fixed Compact bug. Thanks to Daniel Trinter for the notice. Basically
          I was assuming something about the size of one of the internal arrays
          which wasn't always true.

      v2.3 (20020601)
        + ItemCount property
        + Compact method
        * Hash auto-compacts itself if overly inefficient
        * ItemIndexes are now recycled

      v2.2 (20020529)
        * Fixed iterator bug. Not all items were called under some
          circumstances. Thanks to Tom Walker for the notice.

      v2.1 (20020528, internal release only)
        + TObjectHash

      v2.0 (20020526)
        * Complete rewrite
        + THash
        + TStringHash
        + TIntegerHash

    License:

      This library is Copyright (c) 2002 Ciaran McCreesh.

      Permission is granted to anyone to use this software for any purpose on
      any computer system, and to redistribute it freely, subject to the
      following restrictions:

      1. This software is distributed in the hope that it will be useful,
         but WITHOUT ANY WARRANTY; without even the implied warranty of
         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

      2. The origin of this software must not be misrepresented.

      3. Altered versions must be plainly marked as such, and must not be
         misrepresented as being the original software.

    Documentation:
      Please see:
        * http://www.opensourcepan.co.uk/libraries/hashes/
        * http://www.undu.com/articles/020604.html

    Other notes:
      This unit provides three hashes, TIntegerHash, TStringHash and
      TObjectHash. If you want a more precise kind (eg TComponentHash), it's
      easiest to descend from THash and copy the TObjectHash code. Note that
      TObjectHash is slightly different from TIntegerHash and TStringHash
      because it has to free items -- it cannot just overwrite them.

    Internal data representation:
      Each hash object has an array (potentially dynamically sized, but this
      isn't used yet) of 'buckets' (dynamic arrays). Each bucket is mapped
      to a series of hash values (we take the high order bits of the value
      calculated), so that every possible hash value refers to exactly one
      bucket. This reduces the amount of searching that has to be done to
      find an item, so it's much faster than linear or B-Tree storage.

      Each bucket contains a series of integers. These are indexes into an
      items array, which for type reasons is maintained by the descendant
      classes. These are recycled when the hash detects that it is becoming
      inefficient.
}

interface

uses SysUtils;
//Messages, MultiMon, Classes, Graphics,  ;

const
  {** This constant controls the initial size of the hash. }
  c_HashInitialItemShift = 7;

  {** How inefficient do we have to be before we automatically Compact? }
  c_HashCompactR = 2; { This many spaces per item. }
  c_HashCompactM = 100; { Never for less than this number of spaces. }

type
  {** General exception classes. }
  EHashError = class(Exception);
  EHashErrorClass = class of EHashError;

  {** Exception for when an item is not found. }
  EHashFindError = class(EHashError);

  {** Exception for invalid Next op. }
  EHashIterateError = class(EHashError);

  {** Exception for invalid keys. }
  EHashInvalidKeyError = class(EHashError);

  {** Record, should really be private but OP won't let us... }
  THashRecord = record
    Hash: Cardinal;
    ItemIndex: integer;
    Key: string;
  end;

  {** Iterator Record. This should also be private. This makes me almost like
      the way Java does things. Almost. Maybe. }
  THashIterator = record
    ck, cx: integer;
  end;

  {** Base Hash class. Don't use this directly. }
  THash = class
  protected
    {** The keys. }
    f_Keys: array of array of THashRecord;

    {** Current bucket shift. }
    f_CurrentItemShift: integer;

    {** These are calculated from f_CurrentItemShift. }
    f_CurrentItemCount: integer;
    f_CurrentItemMask: integer;
    f_CurrentItemMaxIdx: integer;

    {** Spare items. }
    f_SpareItems: array of integer;

    {** Whether Next is allowed. }
    f_NextAllowed: boolean;

    {** Current key. }
    f_CurrentKey: string;

    {** Can we compact? }
    f_AllowCompact: boolean;

    {** Our current iterator. }
    f_CurrentIterator: THashIterator;

    {** Update the masks. }
    procedure FUpdateMasks;

    {** Update the buckets. }
    procedure FUpdateBuckets;

    {** Find a key's location. }
    function FFindKey(const Key: string; var k, x: integer): boolean;

    {** Add a new key, or change an existing one. Don't call this directly. }
    procedure FSetOrAddKey(const Key: string; ItemIndex: integer);

    {** Abstract method, delete value with a given index. Override this. }
    procedure FDeleteIndex(i: integer); virtual; abstract;

    {** Get the number of items. }
    function FGetItemCount: integer;

    {** Allocate an item index. }
    function FAllocItemIndex: integer;

    {** Abstract method, move an item with index OldIndex to NewIndex.
        Override this. }
    procedure FMoveIndex(oldIndex, newIndex: integer); virtual; abstract;

    {** Abstract method, trim the indexes down to count items. Override
        this. }
    procedure FTrimIndexes(count: integer); virtual; abstract;

    {** Abstract method, clear all items. Override this. }
    procedure FClearItems; virtual; abstract;

    {** Tell us where to start our compact count from. Override this. }
    function FIndexMax: integer; virtual; abstract;

    {** Compact, but only if we're inefficient. }
    procedure FAutoCompact;

  public
    {** Our own constructor. }
    constructor Create; reintroduce; virtual;

    {** Does a key exist? }
    function Exists(const Key: string): boolean;

    {** Rename a key. }
    procedure Rename(const Key, NewName: string);

    {** Delete a key. }
    procedure Delete(const Key: string);

    {** Reset iterator. }
    procedure Restart;

    {** Next key. }
    function Next: boolean;

    {** Previous key. }
    function Previous: boolean;

    {** Current key. }
    function CurrentKey: string;

    {** The number of items. }
    property ItemCount: integer read FGetItemCount;

    {** Compact the hash. }
    procedure Compact;

    {** Clear the hash. }
    procedure Clear;

    {** Allow compacting? }
    property AllowCompact: boolean read f_AllowCompact write f_AllowCompact;

    {** Current iterator. }
    property CurrentIterator: THashIterator read f_CurrentIterator write
      f_CurrentIterator;

    {** Create a new iterator. }
    function NewIterator: THashIterator;

  end;

  {** Hash of strings. }
  TStringHash = class(THash)
  protected
    {** The index items. }
    f_Items: array of string;

    {** Override FDeleteIndex abstract method. }
    procedure FDeleteIndex(i: integer); override;

    {** Get an item or raise an exception. }
    function FGetItem(const Key: string): string;

    {** Set or add an item. }
    procedure FSetItem(const Key, Value: string);

    {** Move an index. }
    procedure FMoveIndex(oldIndex, newIndex: integer); override;

    {** Trim. }
    procedure FTrimIndexes(count: integer); override;

    {** Clear all items. }
    procedure FClearItems; override;

    {** Where to start our compact count from. }
    function FIndexMax: integer; override;

  public
    {** Items property. }
    property Items[const Key: string]: string read FGetItem
    write FSetItem; default;
  end;

  {** Hash of integers. }
  TIntegerHash = class(THash)
  protected
    {** The index items. }
    f_Items: array of integer;

    {** Override FDeleteIndex abstract method. }
    procedure FDeleteIndex(i: integer); override;

    {** Get an item or raise an exception. }
    function FGetItem(const Key: string): integer;

    {** Set or add an item. }
    procedure FSetItem(const Key: string; Value: integer);

    {** Move an index. }
    procedure FMoveIndex(oldIndex, newIndex: integer); override;

    {** Trim. }
    procedure FTrimIndexes(count: integer); override;

    {** Clear all items. }
    procedure FClearItems; override;

    {** Where to start our compact count from. }
    function FIndexMax: integer; override;

  public
    {** Items property. }
    property Items[const Key: string]: integer read FGetItem
    write FSetItem; default;
  end;

  {** Hash of objects. }
  TObjectHash = class(THash)
  private
    FOwns: Boolean;
    procedure SetOwns(const Value: Boolean);
  protected
    {** The index items. }
    f_Items: array of TObject;

    {** Override FDeleteIndex abstract method. }
    procedure FDeleteIndex(i: integer); override;

    {** Get an item or raise an exception. }
    function FGetItem(const Key: string): TObject;

    {** Set or add an item. }
    procedure FSetItem(const Key: string; Value: TObject);

    {** Move an index. }
    procedure FMoveIndex(oldIndex, newIndex: integer); override;

    {** Trim. }
    procedure FTrimIndexes(count: integer); override;

    {** Clear all items. }
    procedure FClearItems; override;

    {** Where to start our compact count from. }
    function FIndexMax: integer; override;

  public
    {** Ownered the object property. }
    property OwnsObjects: Boolean read FOwns write SetOwns;

    {** Items property. }
    property Items[const Key: string]: TObject read FGetItem
    write FSetItem; default;

    {** Destructor must destroy all items. }
    destructor Destroy; override;

  end;

  {** Hash of Variants. }
  TVariantHash = class(THash)
  protected
    {** The index items. }
    f_Items: array of Variant;

    {** Override FDeleteIndex abstract method. }
    procedure FDeleteIndex(i: integer); override;

    {** Get an item or raise an exception. }
    function FGetItem(const Key: string): Variant;

    {** Set or add an item. }
    procedure FSetItem(const Key: string; const Value: Variant);

    {** Move an index. }
    procedure FMoveIndex(oldIndex, newIndex: integer); override;

    {** Trim. }
    procedure FTrimIndexes(count: integer); override;

    {** Clear all items. }
    procedure FClearItems; override;

    {** Where to start our compact count from. }
    function FIndexMax: integer; override;

  public
    {** Items property. }
    property Items[const Key: string]: Variant read FGetItem
    write FSetItem; default;
  end;

  {** Hash of strings. }
  TDoubleHash = class(THash)
  protected
    {** The index items. }
    f_Items: array of Double;

    {** Override FDeleteIndex abstract method. }
    procedure FDeleteIndex(i: integer); override;

    {** Get an item or raise an exception. }
    function FGetItem(const Key: string): Double;

    {** Set or add an item. }
    procedure FSetItem(const Key: string; Value: Double);

    {** Move an index. }
    procedure FMoveIndex(oldIndex, newIndex: integer); override;

    {** Trim. }

    {** Clear all items. }
    procedure FClearItems; override;

    {** Where to start our compact count from. }
    function FIndexMax: integer; override;

  public
    {** Items property. }
    function GetValueRef(AKey: string): Pointer;
    property Items[const Key: string]: Double read FGetItem
    write FSetItem; default;
    procedure FTrimIndexes(count: integer); override;

  end;

  {** Hash of strings. }
  TCardinalHash = class(THash)
  protected
    {** The index items. }
    f_Items: array of Cardinal;

    {** Override FDeleteIndex abstract method. }
    procedure FDeleteIndex(i: integer); override;

    {** Get an item or raise an exception. }
    function FGetItem(const Key: string): Cardinal;

    {** Set or add an item. }
    procedure FSetItem(const Key: string; Value: Cardinal);

    {** Move an index. }
    procedure FMoveIndex(oldIndex, newIndex: integer); override;

    {** Trim. }
    procedure FTrimIndexes(count: integer); override;

    {** Clear all items. }
    procedure FClearItems; override;

    {** Where to start our compact count from. }
    function FIndexMax: integer; override;

  public
    {** Items property. }
    property Items[const Key: string]: Cardinal read FGetItem
    write FSetItem; default;
  end;
//function CalHashTime: TCalTime;
//procedure beginCal;
//var
//  bBeginCal: Boolean = False;
//  _CalHashTime: TCalTime;
implementation

  {** A basic hash function. This is pretty fast, and fairly good general
      purpose, but you may want to swap in a specialised version. }

//procedure beginCal;
//begin
//  bBeginCal := True;
//end;
//
//function CalHashTime: TCalTime;
//begin
//  if _CalHashTime = nil then
//    _CalHashTime := TCalTime.Create('hash');
//end;

function HashThis(const s: string): cardinal;
var
  h, g, i: cardinal;
begin
  if (s = '') then
    raise EHashInvalidKeyError.Create('Key cannot be an empty string');
  h := $12345670;
  for i := 1 to Length(s) do begin
    h := (h shl 4) + ord(s[i]);
    g := h and $F0000000;
    if (g > 0) then
      h := h or (g shr 24) or g;
  end;
  result := h;
end;

{ THash }

constructor THash.Create;
begin
  inherited Create;
  f_CurrentIterator.ck := -1;
  f_CurrentIterator.cx := 0;
  f_CurrentItemShift := c_HashInitialItemShift;
  FUpdateMasks;
  FUpdateBuckets;
  f_AllowCompact := true;
end;

procedure THash.Delete(const Key: string);
var
  k, x, i: integer;
begin
  { Hash has been modified, so disallow Next. }
  f_NextAllowed := false;
  if (FFindKey(Key, k, x)) then begin
    { Delete the Index entry. }
    i := f_Keys[k][x].ItemIndex;
    FDeleteIndex(i);
    { Add the index to the Spares list. }
    SetLength(f_SpareItems, Length(f_SpareItems) + 1);
    f_SpareItems[High(f_SpareItems)] := i;
    { Overwrite key with the last in the list. }
    f_Keys[k][x] := f_Keys[k][High(f_Keys[k])];
    { Delete the last in the list. }
    SetLength(f_Keys[k], Length(f_Keys[k]) - 1);
  end else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);

  FAutoCompact;
end;

function THash.Exists(const Key: string): boolean;
var
  dummy1, dummy2: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  Result := False;
  if Key = '' then Exit;
  result := FFindKey(Key, dummy1, dummy2);
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

procedure THash.FSetOrAddKey(const Key: string; ItemIndex: integer);
var
  k, x, i: integer;
begin
  { Exists already? }
  if (FFindKey(Key, k, x)) then begin
    { Yep. Delete the old stuff and set the new value. }
    i := f_Keys[k][x].ItemIndex;
    FDeleteIndex(i);
    f_Keys[k][x].ItemIndex := ItemIndex;
    { Add the index to the spares list. }
    SetLength(f_SpareItems, Length(f_SpareItems) + 1);
    f_SpareItems[High(f_SpareItems)] := i;
  end else begin
    { No, create a new one. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := ItemIndex;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
  end;
end;

function THash.FFindKey(const Key: string; var k, x: integer): boolean;
var
  i: integer;
  h: cardinal;
begin
  { Which bucket? }
  h := HashThis(Key);
  k := h and f_CurrentItemMask;
  result := false;
  { Look for it. }
  for i := 0 to High(f_Keys[k]) do
    if (f_Keys[k][i].Hash = h) or true then
      if (f_Keys[k][i].Key = Key) then begin
        { Found it! }
        result := true;
        x := i;
        break;
      end;
end;

procedure THash.Rename(const Key, NewName: string);
var
  k, x, i: integer;
begin
  { Hash has been modified, so disallow Next. }
  f_NextAllowed := false;
  if (FFindKey(Key, k, x)) then begin
    { Remember the ItemIndex. }
    i := f_Keys[k][x].ItemIndex;
    { Overwrite key with the last in the list. }
    f_Keys[k][x] := f_Keys[k][High(f_Keys[k])];
    { Delete the last in the list. }
    SetLength(f_Keys[k], Length(f_Keys[k]) - 1);
    { Create the new item. }
    FSetOrAddKey(NewName, i);
  end else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);

  FAutoCompact;
end;

function THash.CurrentKey: string;
begin
  if (not (f_NextAllowed)) then
    raise EHashIterateError.Create('Cannot find CurrentKey as the hash has '
      + 'been modified since Restart was called')
  else if (f_CurrentKey = '') then
    raise EHashIterateError.Create('Cannot find CurrentKey as Next has not yet '
      + 'been called after Restart')
  else
    result := f_CurrentKey;
end;

function THash.Next: boolean;
begin
  if (not (f_NextAllowed)) then
    raise EHashIterateError.Create('Cannot get Next as the hash has '
      + 'been modified since Restart was called');
  result := false;
  if (f_CurrentIterator.ck = -1) then begin
    f_CurrentIterator.ck := 0;
    f_CurrentIterator.cx := 0;
  end;
  while ((not result) and (f_CurrentIterator.ck <= f_CurrentItemMaxIdx)) do begin
    if (f_CurrentIterator.cx < Length(f_Keys[f_CurrentIterator.ck])) then begin
      result := true;
      f_CurrentKey := f_Keys[f_CurrentIterator.ck][f_CurrentIterator.cx].Key;
      inc(f_CurrentIterator.cx);
    end else begin
      inc(f_CurrentIterator.ck);
      f_CurrentIterator.cx := 0;
    end;
  end;
end;

procedure THash.Restart;
begin
  f_CurrentIterator.ck := -1;
  f_CurrentIterator.cx := 0;
  f_NextAllowed := true;
end;

function THash.FGetItemCount: integer;
var
  i: integer;
begin
  { Calculate our item count. }
  result := 0;
  for i := 0 to f_CurrentItemMaxIdx do
    inc(result, Length(f_Keys[i]));
end;

function THash.FAllocItemIndex: integer;
begin
  if (Length(f_SpareItems) > 0) then begin
    { Use the top SpareItem. }
    result := f_SpareItems[High(f_SpareItems)];
    SetLength(f_SpareItems, Length(f_SpareItems) - 1);
  end else begin
    result := FIndexMax + 1;
  end;
end;

procedure THash.Compact;
var
  aSpaces: array of boolean;
  aMapping: array of integer;
  i, j: integer;
begin
  { Find out where the gaps are. We could do this by sorting, but that's at
    least O(n log n), and sometimes O(n^2), so we'll go for the O(n) method,
    even though it involves multiple passes. Note that this is a lot faster
    than it looks. Disabling this saves about 3% in my benchmarks, but uses a
    lot more memory. }
  if (AllowCompact) then begin
    SetLength(aSpaces, FIndexMax + 1);
    SetLength(aMapping, FIndexMax + 1);
    for i := 0 to High(aSpaces) do
      aSpaces[i] := false;
    for i := 0 to High(aMapping) do
      aMapping[i] := i;
    for i := 0 to High(f_SpareItems) do
      aSpaces[f_SpareItems[i]] := true;

    { Starting at the low indexes, fill empty ones from the high indexes. }
    i := 0;
    j := FIndexMax;
    while (i < j) do begin
      if (aSpaces[i]) then begin
        while ((i < j) and (aSpaces[j])) do
          dec(j);
        if (i < j) then begin
          aSpaces[i] := false;
          aSpaces[j] := true;
          FMoveIndex(j, i);
          aMapping[j] := i
        end;
      end else
        inc(i);
    end;

    j := FIndexMax;
    while (aSpaces[j]) do
      dec(j);

    { Trim the items array down to size. }
    FTrimIndexes(j + 1);

    { Clear the spaces. }
    SetLength(f_SpareItems, 0);

    { Update our buckets. }
    for i := 0 to f_CurrentItemMaxIdx do
      for j := 0 to High(f_Keys[i]) do
        f_Keys[i][j].ItemIndex := aMapping[f_Keys[i][j].ItemIndex];
  end;
end;

procedure THash.FAutoCompact;
begin
  if (AllowCompact) then
    if (Length(f_SpareItems) >= c_HashCompactM) then
      if (FIndexMax * c_HashCompactR > Length(f_SpareItems)) then
        Compact;
end;

procedure THash.Clear;
var
  i: integer;
begin
  FClearItems;
  SetLength(f_SpareItems, 0);
  for i := 0 to f_CurrentItemMaxIdx do
    SetLength(f_Keys[i], 0);
end;

procedure THash.FUpdateMasks;
begin
  f_CurrentItemMask := (1 shl f_CurrentItemShift) - 1;
  f_CurrentItemMaxIdx := (1 shl f_CurrentItemShift) - 1;
  f_CurrentItemCount := (1 shl f_CurrentItemShift);
end;

procedure THash.FUpdateBuckets;
begin
  { This is just a temporary thing. }
  SetLength(f_Keys, f_CurrentItemCount);
end;

function THash.NewIterator: THashIterator;
begin
  result.ck := -1;
  result.cx := 0;
end;

function THash.Previous: boolean;
begin
  if (not (f_NextAllowed)) then
    raise EHashIterateError.Create('Cannot get Next as the hash has '
      + 'been modified since Restart was called');
  result := false;
  if (f_CurrentIterator.ck >= 0) then begin
    while ((not result) and (f_CurrentIterator.ck >= 0)) do begin
      dec(f_CurrentIterator.cx);
      if (f_CurrentIterator.cx >= 0) then begin
        result := true;
        f_CurrentKey := f_Keys[f_CurrentIterator.ck][f_CurrentIterator.cx].Key;
      end else begin
        dec(f_CurrentIterator.ck);
        if (f_CurrentIterator.ck >= 0) then
          f_CurrentIterator.cx := Length(f_Keys[f_CurrentIterator.ck]);
      end;
    end;
  end;
end;

{ TStringHash }

procedure TStringHash.FDeleteIndex(i: integer);
begin
  f_Items[i] := '';
end;

function TStringHash.FGetItem(const Key: string): string;
var
  k, x: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
    result := f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

procedure TStringHash.FMoveIndex(oldIndex, newIndex: integer);
begin
  f_Items[newIndex] := f_Items[oldIndex];
end;

procedure TStringHash.FSetItem(const Key, Value: string);
var
  k, x, i: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
    f_Items[f_Keys[k][x].ItemIndex] := Value
  else begin
    { New index entry, or recycle an old one. }
    i := FAllocItemIndex;
    if (i > High(f_Items)) then
      SetLength(f_Items, i + 1);
    f_Items[i] := Value;
    { Add it to the hash. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := i;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
    { Hash has been modified, so disallow Next. }
    f_NextAllowed := false;
  end;
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

function TStringHash.FIndexMax: integer;
begin
  result := High(f_Items);
end;

procedure TStringHash.FTrimIndexes(count: integer);
begin
  SetLength(f_Items, count);
end;

procedure TStringHash.FClearItems;
begin
  SetLength(f_Items, 0);
end;

{ TIntegerHash }

procedure TIntegerHash.FDeleteIndex(i: integer);
begin
  f_Items[i] := 0;
end;

function TIntegerHash.FGetItem(const Key: string): integer;
var
  k, x: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
    result := f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

procedure TIntegerHash.FMoveIndex(oldIndex, newIndex: integer);
begin
  f_Items[newIndex] := f_Items[oldIndex];
end;

procedure TIntegerHash.FSetItem(const Key: string; Value: integer);
var
  k, x, i: integer;
begin
  if (FFindKey(Key, k, x)) then
    f_Items[f_Keys[k][x].ItemIndex] := Value
  else begin
    { New index entry, or recycle an old one. }
    i := FAllocItemIndex;
    if (i > High(f_Items)) then
      SetLength(f_Items, i + 1);
    f_Items[i] := Value;
    { Add it to the hash. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := i;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
    { Hash has been modified, so disallow Next. }
    f_NextAllowed := false;
  end;
end;

function TIntegerHash.FIndexMax: integer;
begin
  result := High(f_Items);
end;

procedure TIntegerHash.FTrimIndexes(count: integer);
begin
  SetLength(f_Items, count);
end;

procedure TIntegerHash.FClearItems;
begin
  SetLength(f_Items, 0);
end;

{ TObjectHash }

procedure TObjectHash.FDeleteIndex(i: integer);
begin
  if FOwns then f_Items[i].Free;
  f_Items[i] := nil;
end;

function TObjectHash.FGetItem(const Key: string): TObject;
var
  k, x: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
    result := f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

procedure TObjectHash.FMoveIndex(oldIndex, newIndex: integer);
begin
  f_Items[newIndex] := f_Items[oldIndex];
end;

procedure TObjectHash.FSetItem(const Key: string; Value: TObject);
var
  k, x, i: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
  begin
    if FOwns then f_Items[f_Keys[k][x].ItemIndex].Free;
    f_Items[f_Keys[k][x].ItemIndex] := Value;
  end
  else
  begin
    { New index entry, or recycle an old one. }
    i := FAllocItemIndex;
    if (i > High(f_Items)) then
      SetLength(f_Items, i + 1);
    f_Items[i] := Value;
    { Add it to the hash. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := i;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
    { Hash has been modified, so disallow Next. }
    f_NextAllowed := false;
  end;
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

function TObjectHash.FIndexMax: integer;
begin
  result := High(f_Items);
end;

procedure TObjectHash.FTrimIndexes(count: integer);
begin
  SetLength(f_Items, count);
end;

procedure TObjectHash.FClearItems;
var
  i: integer;
begin
  if FOwns then
  begin
    for i := 0 to High(f_Items) do
      if (Assigned(f_Items[i])) then
        if FOwns then f_Items[i].Free;
  end;
  SetLength(f_Items, 0);
end;

destructor TObjectHash.Destroy;
var
  i: integer;
begin
  if FOwns then
  begin
    for i := 0 to High(f_Items) do
      if (Assigned(f_Items[i])) then
        f_Items[i].Free;
  end;
  inherited;
end;

procedure TObjectHash.SetOwns(const Value: Boolean);
begin
  {** set this flag must be has no object in list}
  if ItemCount = 0 then FOwns := Value;
end;

{ TVariantHash }

procedure TVariantHash.FClearItems;
begin
  SetLength(f_Items, 0);
end;

procedure TVariantHash.FDeleteIndex(i: integer);
begin
  VarClear(f_Items[i]);
end;

function TVariantHash.FGetItem(const Key: string): Variant;
var
  k, x: integer;
begin
  if (FFindKey(Key, k, x)) then
    result := f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);
end;

function TVariantHash.FIndexMax: integer;
begin
  result := High(f_Items);
end;

procedure TVariantHash.FMoveIndex(oldIndex, newIndex: integer);
begin
  f_Items[newIndex] := f_Items[oldIndex];
end;

procedure TVariantHash.FSetItem(const Key: string; const Value: Variant);
var
  k, x, i: integer;
begin
  if (FFindKey(Key, k, x)) then
    f_Items[f_Keys[k][x].ItemIndex] := Value
  else begin
    { New index entry, or recycle an old one. }
    i := FAllocItemIndex;
    if (i > High(f_Items)) then
      SetLength(f_Items, i + 1);
    f_Items[i] := Value;
    { Add it to the hash. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := i;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
    { Hash has been modified, so disallow Next. }
    f_NextAllowed := false;
  end;
end;

procedure TVariantHash.FTrimIndexes(count: integer);
begin
  SetLength(f_Items, count);
end;

{ TDoubleHash }

procedure TDoubleHash.FClearItems;
begin
  SetLength(f_Items, 0);

end;

procedure TDoubleHash.FDeleteIndex(i: integer);
begin
  inherited;
  f_Items[i] := 0;
end;

function TDoubleHash.FGetItem(const Key: string): Double;
var
  k, x: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
    result := f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);
//  if bBeginCal then
//    CalHashTime.EndCal;

end;

function TDoubleHash.FIndexMax: integer;
begin
  Result := High(f_Items);
end;

procedure TDoubleHash.FMoveIndex(oldIndex, newIndex: integer);
begin
  f_Items[newIndex] := f_Items[oldIndex];
end;

procedure TDoubleHash.FSetItem(const Key: string; Value: Double);
var
  k, x, i: integer;
begin
//  if bBeginCal then
//    CalHashTime.StarCal;
  if (FFindKey(Key, k, x)) then
    f_Items[f_Keys[k][x].ItemIndex] := Value
  else begin
    { New index entry, or recycle an old one. }
    i := FAllocItemIndex;
    if (i > High(f_Items)) then
      SetLength(f_Items, i + 1);
    f_Items[i] := Value;
    { Add it to the hash. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := i;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
    { Hash has been modified, so disallow Next. }
    f_NextAllowed := false;
  end;
//  if bBeginCal then
//    CalHashTime.EndCal;
end;

procedure TDoubleHash.FTrimIndexes(count: integer);
begin
  SetLength(f_Items, count);

end;

function TDoubleHash.GetValueRef(AKey: string): Pointer;
var
  k, x: integer;
begin
  if (FFindKey(AKey, k, x)) then
    result := @f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [AKey]);
end;

{ TCardinalHash }

procedure TCardinalHash.FClearItems;
begin
  SetLength(f_Items, 0);
end;

procedure TCardinalHash.FDeleteIndex(i: integer);
begin
  inherited;
  f_Items[i] := 0;
end;

function TCardinalHash.FGetItem(const Key: string): Cardinal;
var
  k, x: integer;
begin
  if (FFindKey(Key, k, x)) then
    result := f_Items[f_Keys[k][x].ItemIndex]
  else
    raise EHashFindError.CreateFmt('Key "%s" not found', [Key]);

end;

function TCardinalHash.FIndexMax: integer;
begin
  Result := High(f_Items);
end;

procedure TCardinalHash.FMoveIndex(oldIndex, newIndex: integer);
begin
  f_Items[newIndex] := f_Items[oldIndex];
end;

procedure TCardinalHash.FSetItem(const Key: string; Value: Cardinal);
var
  k, x, i: integer;
begin
  if (FFindKey(Key, k, x)) then
    f_Items[f_Keys[k][x].ItemIndex] := Value
  else begin
    { New index entry, or recycle an old one. }
    i := FAllocItemIndex;
    if (i > High(f_Items)) then
      SetLength(f_Items, i + 1);
    f_Items[i] := Value;
    { Add it to the hash. }
    SetLength(f_Keys[k], Length(f_Keys[k]) + 1);
    f_Keys[k][High(f_Keys[k])].Key := Key;
    f_Keys[k][High(f_Keys[k])].ItemIndex := i;
    f_Keys[k][High(f_Keys[k])].Hash := HashThis(Key);
    { Hash has been modified, so disallow Next. }
    f_NextAllowed := false;
  end;

end;

procedure TCardinalHash.FTrimIndexes(count: integer);
begin
  SetLength(f_Items, count);

end;

end.

