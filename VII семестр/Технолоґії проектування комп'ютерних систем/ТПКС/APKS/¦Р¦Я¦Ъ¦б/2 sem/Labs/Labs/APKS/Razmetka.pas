unit Razmetka;

interface

uses
  GSA,Checking;


var
  Cond : array of TText;
  ExtCond : array[0..MAX_COUNT-1] of TText;
  CondCount : Integer;
  Ready2 : Integer;

procedure RazmetkaMili;
procedure RazmetkaMura;


implementation

uses
  SysUtils;

procedure Ext;
var
  I : Integer;
begin
  for I:= 0 to MAX_COUNT-1 do ExtCond[I]:= '';
  for I:= 0 to PCount-1 do ExtCond[Idxs[I]]:= Cond[I];
end;

procedure RazmetkaMili;
var
  I,J,Con : Integer;
begin
  if Ready1 <> 1 then Exit;
  SetLength(Cond,PCount);
  for I:= 0 to PCount-1 do Cond[I]:= '';
  for I:= 0 to PCount-1 do
  begin
    if (Kinds[I] = ekEnd) then Cond[I]:= 'A1';
    if (Kinds[I] = ekBegin) then
      for J:= 0 to PCount-1 do
        if Matrix1[I,J] then Cond[J]:= 'A1';
  end;
  Con:= 2;
  for I:= 0 to PCount-1 do
   if Kinds[I] = ekOperation then
     for J:= 0 to PCount-1 do
       if Matrix1[I,J] and (Cond[J] = '') then
       begin
         Cond[J]:= 'A'+IntToStr(Con);
         Inc(Con);
       end;
   CondCount:= Con;
   Ext;
   Ready2:= 1;
end;

procedure RazmetkaMura;
var
  I,Con : Integer;
begin
  if Ready1 <> 1 then Exit;
  SetLength(Cond,PCount);
  for I:= 0 to PCount-1 do Cond[I]:= '';
  for I:= 0 to PCount-1 do
    if (Kinds[I] = ekBegin) or (Kinds[I] = ekEnd) then Cond[I]:= 'A1';
  Con:= 2;
  for I:= 0 to PCount-1 do
   if Kinds[I] = ekOperation then
   begin
     Cond[I]:= 'A'+IntToStr(Con);
     Inc(Con);
   end;
   CondCount:= Con;
   Ext;
   Ready2:= 1;
end;

begin
  Ready2:= -1;
end.
