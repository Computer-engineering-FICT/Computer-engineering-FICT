unit CountUnit;

interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 StdCtrls, ExtCtrls;
type
 TLLsType = array of array of shortInt;
function getYAPF(matr:TLLsType):TLLsType;

implementation
uses MainUnit;
function getYAPF(matr:TLLsType):TLLsType;
var
 i,j,count,ti,tj,pCount,min:Integer;
 tmp:TLLsType;
begin
 setLength(tmp,1);
 ti:=0;
 tj:=0;
 pCount:=0;
 while pCount <> length(matr) do
  begin
   for j:=0 to length(matr)-1 do
    begin
     count:=0;
     for i:=0 to length(matr)-1 do if(matr[i,j]<>0)then inc(count);
     if(count = 0)then
      begin
       setLength(tmp[ti],length(tmp[ti])+1);
       inc(pCount);
       tmp[ti,tj]:=j;
       inc(tj)
      end
    end;
   for i:=0 to length(tmp[ti])-1 do
    for j:=0 to length(matr)-1 do matr[tmp[ti,i],j]:=0;
   for j:=0 to length(tmp[ti])-1 do
    for i:=0 to length(matr)-1 do matr[i,tmp[ti,j]]:=-1;
   setLength(tmp,length(tmp)+1);
   inc(ti);
   tj:=0
  end;
{ for i:=0 to length(tmp)-1 do
  begin
   min:=StrToInt(gr.pps[tmp[i,0]].FEdit.Text);
   for j:=0 to length(tmp[i])-1 do
    if StrToInt(gr.pps[tmp[i,j]].FEdit.Text) < min then
     begin
      min:=StrToInt(gr.pps[tmp[i,j]].FEdit.Text);
      tj:=

     end;
   end;}





 result:=tmp
end;

begin
end.
