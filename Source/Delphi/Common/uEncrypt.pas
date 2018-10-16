unit uEncrypt;

interface

uses
  SysUtils;

function EncryptStr(Src, Key: string): string;
function UncryptStr(Src, Key: string): string;

implementation

function EncryptStr(Src, Key: string): string;
//���ַ�������(Src:Դ Key:�ܳ�)
var KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  Range: Integer;
begin
  if Trim(Src) = '' then
  begin
    Result := '';
    Exit;
  end;

  KeyLen := Length(Key);
  if KeyLen = 0 then key := 'delphi';
  KeyPos := 0;
  Range := 256;
  Randomize;
  offset := Random(Range);
  dest := format('%1.2x', [offset]);
  for SrcPos := 1 to Length(Src) do
  begin
    SrcAsc := (Ord(Src[SrcPos]) + offset) mod 255;
    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    dest := dest + format('%1.2x', [SrcAsc]);
    offset := SrcAsc;
  end;
  Result := Dest;
end;

function UncryptStr(Src, Key: string): string;
//���ַ�������(Src:Դ Key:�ܳ�)
var KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
begin
  if Trim(Src) = '' then
  begin
    Result := '';
    Exit;
  end;

  KeyLen := Length(Key);
  if KeyLen = 0 then key := 'delphi';
  KeyPos := 0;
  offset := StrToInt('$' + copy(src, 1, 2));
  SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$' + copy(src, SrcPos, 2));
    if KeyPos < KeyLen
      then KeyPos := KeyPos + 1
    else KeyPos := 1;
    TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= offset then
      TmpSrcAsc := 255 + TmpSrcAsc - offset
    else
      TmpSrcAsc := TmpSrcAsc - offset;
    dest := dest + chr(TmpSrcAsc);
    offset := srcAsc;
    SrcPos := SrcPos + 2;
  until SrcPos >= Length(Src);
  Result := Dest;
end;

end.
