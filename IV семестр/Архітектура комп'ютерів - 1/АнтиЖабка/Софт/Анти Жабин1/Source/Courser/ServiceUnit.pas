unit ServiceUnit;

interface

uses SysUtils;

const
B1_MINUS_A1=0;
A1_MUL_B1=1;
A1_DIV_B1=2;

type infou=record
      a,b:string;
      pa,pb:string
end;

var res:array [0..2] of record
        bin:string;
       real:real;
    end;

function ExtendBin(st:string;NumBits:byte):string;
function ToBin(Num:cardinal):string;
function ToBinFrac(Num:word):string;
function InBackCode(fullst:string):string;
function InAdditCode(fullst:string):string;

procedure SetOutputFile(filename:string);
procedure ClearOutputFile;
procedure WriteOut(st:string);
//Нормальные расчеты
procedure Calc_2_1_a_whole(a:word);
procedure Calc_2_1_b_whole(a:word);
procedure Calc_2_1_c_whole(a:word);
procedure Calc_2_1_a_fraction(b:word);
procedure Calc_2_1_b_fraction(b:word);
procedure Calc_2_1_c_fraction(b:word);
procedure Calc_2_2(a,b:word);
procedure Calc_2_3_precache(a,b:word);
procedure Calc_2_3_a_1(a,b:word);
procedure Calc_2_3_a_2(a,b:word);
procedure Calc_2_3_b(a,b:word);
procedure Calc_2_5(a,b:word);
procedure Calc_2_6(a,b:word);
procedure Calc_2_7_a(a,b:word);
procedure Calc_2_7_b(a,b:word);
procedure Calc_2_8(a,b:word);
procedure Calc_2_9(a:word);
procedure Calc_2_10(a,b:word;pora,porb:shortint;adda,addb:string;var rg:infou);
procedure Calc_2_12(a,b:word);
procedure Calc_2_13_1_a(a,b:word);
procedure Calc_2_13_1_b(a,b:word);
procedure Calc_2_13_2_a(a,b:word);
procedure Calc_2_13_2_b(a,b:word);
//Расчеты заочников
procedure Zaoch_1(a,b:word);
procedure Zaoch_2(a,b:word);
procedure Zaoch_3(a,b:word);
procedure Zaoch_4(a,b:word);
procedure Zaoch_5_2(a,b:word);
procedure Zaoch_6(a,b:word);
procedure Zaoch_8;
procedure Zaoch_9(a,b:word);

implementation

type ResultingArray=array[1..240,1..250] of char;

var outputfile:string='c:\default.txt';

function GetBit(what:cardinal;numbit:byte):byte;
var i:byte;
    multi:cardinal;
begin
multi:=1;
for i:=1 to numbit-1 do multi:=multi*2;
if (what and multi)>0 then getbit:=1
else getbit:=0
end;

procedure SetBit(var what:word;numbit:byte;newval:byte); overload;
var i:byte;
    multi:word;
begin
multi:=1;
for i:=1 to numbit-1 do multi:=multi*2;
if newval=1 then what:=what or multi
else what:=what and (not(multi))
end;

procedure SetBit(var what:cardinal;numbit:byte;newval:byte); overload;
var i:byte;
    multi:cardinal;
begin
multi:=1;
for i:=1 to numbit-1 do multi:=multi*2;
if newval=1 then what:=what or multi
else what:=what and (not(multi))
end;

function MakeZeroResulting:ResultingArray;
var i,j:byte;
begin
for i:=1 to 240 do
 for j:=1 to 250 do
   result[i,j]:=' '
end;

procedure OutputResulting(res:ResultingArray);
var x,y:byte;
    st:string;
    y1,y2:byte;
    x1,x2:byte;
begin
y1:=0;
y2:=0;
for y:=1 to 250 do
 for x:=1 to 240 do begin
   if res[x,y]<>' ' then begin
      if y1=0 then y1:=y;
      y2:=y
   end
end;
for y:=y1 to y2 do begin
   st:='';
   x1:=0;
   x2:=0;
   for x:=1 to 240 do begin
      if res[x,y]<>' ' then begin
         if x1=0 then x1:=x;
         x2:=x
      end
   end;
   for x:=x2 downto 1 do insert(res[x,y],st,1);
   writeout(st)
end
end;

function IntToChar(Num:integer):char;
var st:string;
begin
st:=inttostr(num);
result:=st[1]
end;

function BinToRealFrac(fullst:string):real;
var multireal:real;
    i:byte;
begin
multireal:=0.5;
result:=0;
for i:=3 to length(fullst) do begin
   if fullst[i]='1' then result:=result+multireal;
   multireal:=multireal/2
end;
if fullst[1]='1' then result:=-result
end;

function RealToBinFrac(a:real):string;
var multireal:real;
    i:byte;
begin
result:='0,';
if a<0 then result[1]:='1';
a:=abs(a);
multireal:=0.5;
for i:=1 to 10 do begin
   if a>=multireal then begin
      a:=a - multireal;
      result:=result+'1'
   end
   else result:=result+'0';
   multireal:=multireal/2
end;
if length(result)<12 then
 for i:=length(result)+1 to 12 do
  result:=result+'0'
end;

function ToD2(num:word):string;
var mus:byte;
begin
mus:=num mod 10;
mus:=mus+3;
result:=extendbin(tobin(mus),4);
result:=' '+result;
num:=num div 10;
mus:=num mod 10;
mus:=mus+3;
result:=extendbin(tobin(mus),4)+result;
result:=' '+result;
num:=num div 10;
mus:=num mod 10;
mus:=mus+3;
result:=extendbin(tobin(mus),4)+result
end;

function ToD1(num:word):string;
var mus:byte;
begin
mus:=num mod 10;
mus:=mus;
result:=extendbin(tobin(mus),4);
result:=' '+result;
num:=num div 10;
mus:=num mod 10;
mus:=mus;
result:=extendbin(tobin(mus),4)+result;
result:=' '+result;
num:=num div 10;
mus:=num mod 10;
mus:=mus;
result:=extendbin(tobin(mus),4)+result
end;


function ToBin(Num:cardinal):string;
var
current:cardinal;
begin
result:='';
current:=1;
repeat
   if (num and current)>0 then insert('1',result,1)
   else insert('0',result,1);
   current:=current*2
until current>num
end;

function FromBin(Bin:string):word;
var multi:word;
    i:byte;
begin
result:=0;
multi:=1;
for i:=length(bin) downto 1 do begin
   result:=result+strtoint(bin[i])*multi;
   multi:=multi*2
end
end;

function FromOct(Num:word):word;
var multi:word;
begin
multi:=1;
result:=0;
while num>0 do begin
   result:=result+(num mod 10)*multi;
   multi:=multi*8;
   num:=num div 10
end
end;


function ToOct(Num:cardinal):cardinal;
var multi:cardinal;
begin
multi:=1;
result:=0;
while num>0 do begin
   result:=result+(num mod 8)*multi;
   multi:=multi*10;
   num:=num div 8
end
end;

function ToBinFrac;
var multireal:real;
    numreal:real;
    i:byte;
    st:string;
    current:word;
    multi:word;
    stadd:string;
begin
numreal:=num/1000;
multireal:=0.5;
multi:=1024;
current:=0;
stadd:='';
for i:=1 to 11 do begin
   if numreal>=multireal then begin
      numreal:=numreal - multireal;
      current:=current+multi
   end
   else if current=0 then stadd:=stadd+'0';
   multi:=multi div 2;
   multireal:=multireal/2
end;
current:=current+1;
current:=current shr 1;
st:=stadd+tobin(current);
if length(st)<10 then
 for i:=length(st)+1 to 10 do
  st:=st+'0';
result:=st
end;

function FromBinFrac(fullst:string):integer;
var i:byte;
    multi:word;
begin
multi:=1;
result:=0;
for i:=length(fullst) downto 3 do begin
   if fullst[i]='1' then result:=result+multi;
   multi:=multi*2
end;
if fullst[1]='1' then result:=-result
end;

function ComposeNumber(anybin:string):cardinal;
var cbit:byte;
    i:word;
begin
cbit:=1;
result:=0;
for i:=length(anybin) downto 1 do begin
   if (anybin[i]='1')or(anybin[i]='0') then begin
      if anybin[i]='1' then setbit(result,cbit,1);
      inc(cbit)
   end
end
end;

function FormNumber(anyfracst:string):cardinal;
var i:byte;
    index:byte;
begin
result:=0;
index:=2;
for i:=1 to length(anyfracst) do
 if (anyfracst[i]<>'0')and(anyfracst[i]<>'1') then index:=i;
for i:=length(anyfracst) downto index+1 do
 if anyfracst[i]='1' then setbit(result,length(anyfracst)-i+1,1);
for i:=1 to index-1 do
 if anyfracst[i]='1' then setbit(result,length(anyfracst)-i,1)
end;

function FormString(Num:cardinal):string;
var multi:cardinal;
    i:byte;
begin
multi:=1;
i:=1;
result:='';
while multi<=num do begin
   if getbit(num,i)=1 then result:='1'+result
   else result:='0'+result;
   multi:=multi*2;
   i:=i+1
end
end;

function ExtendBin;
var i:integer;
begin
result:=st;
for i:=1 to NumBits-length(st) do insert('0',result,1)
end;

function InBackCode(fullst:string):string;
var i:byte;
begin
result:=fullst;
if fullst[1]='1' then
 for i:=3 to length(fullst) do
  if fullst[i]='1' then result[i]:='0'
  else result[i]:='1'
end;

function InD2BackCode(fulld2:string):string;
var i:word;
begin
result:=fulld2;
if fulld2[1]<>'0' then begin
   for i:=3 to length(result) do begin
      if result[i]='0' then result[i]:='1'
      else if result[i]='1' then result[i]:='0'
   end;
end
end;

function InD1BackCode(fulld2:string;num:word):string;
var i:word;
    mus:byte;

    t1,t2,t3 : word;
begin
result:=fulld2;
if fulld2[1]<>'0' then
begin
mus:=num mod 10;
t1:=mus+6;
num:=num div 10;
mus:=num mod 10;
t2:=mus+6;
num:=num div 10;
mus:=num mod 10;
t3:=mus+6;
Fulld2:='1,'+ExtendBin(ToBin(t3),4)+' '+ExtendBin(ToBin(t2),4)+' '+ExtendBin(ToBin(t1),4);
result:=fulld2;
   for i:=3 to length(result) do
   begin
      if result[i]='0' then result[i]:='1'
      else if result[i]='1' then result[i]:='0'
   end;
end
end;

Procedure GetTetrades(Num : word; var t1,t2,t3 : word);
var    mus:byte;
begin
mus:=num mod 10;
t3:=mus;
num:=num div 10;
mus:=num mod 10;
t2:=mus;
num:=num div 10;
mus:=num mod 10;
t1:=mus;
end;


function InD1AdditCode(fulld2:string;num:word):string;
var i:word;
    mus:byte;

    t1,t2,t3 : word;
begin
result:=fulld2;
if fulld2[1]<>'0' then
begin
mus:=num mod 10;
t1:=mus+7;
num:=num div 10;
mus:=num mod 10;
t2:=mus+6;
num:=num div 10;
mus:=num mod 10;
t3:=mus+6;
Fulld2:='1,'+ExtendBin(ToBin(t3),4)+' '+ExtendBin(ToBin(t2),4)+' '+ExtendBin(ToBin(t1),4);
result:=fulld2;
   for i:=3 to length(result) do
   begin
      if result[i]='0' then result[i]:='1'
      else if result[i]='1' then result[i]:='0'
   end;
end
end;


function InAdditCode(fullst:string):string;
var i:byte;
    current:cardinal;
    multi:cardinal;
begin
if fullst[1]='0' then result:=fullst
else begin
   result:=fullst;
   for i:=3 to length(fullst) do
    if fullst[i]='1' then result[i]:='0'
    else result[i]:='1';
   multi:=1;
   current:=0;
   for i:=length(result) downto 3 do begin
      if result[i]='1' then current:=current+multi;
      multi:=multi*2
   end;
   current:=current+1;
   multi:=multi div 2;
   for i:=3 to length(result) do begin
      if current>=multi then begin
         result[i]:='1';
         current:=current-multi
      end
      else result[i]:='0';
      multi:=multi div 2
   end
end
end;

function FromBackCode(fullst:string):string;
var i:byte;
begin
result:=fullst;
if fullst[1]='1' then
 for i:=3 to length(fullst) do
  if fullst[i]='1' then result[i]:='0'
  else result[i]:='1'
end;

function FromAdditCode(fullst:string):string;
var i:byte;
    s:word;
begin
result:=fullst;
if fullst[1]='1' then begin
   s:=0;
   for i:=1 to 10 do
    if fullst[13-i]='1' then setbit(s,i,1);
   s:=s-1;
   for i:=1 to 10 do
    if getbit(s,i)=1 then result[13-i]:='0'
    else result[13-i]:='1'
end
end;

function FromD2BackCode(anyst:string):string;
var i:word;
begin
if anyst[1]='1' then
 for i:=3 to length(anyst) do begin
   if anyst[i]='0' then anyst[i]:='1'
   else begin
      if anyst[i]='1' then anyst[i]:='0'
   end;
end;
result:=anyst
end;

procedure ClearOutputFile;
var ft:text;
begin
assignfile(ft,outputfile);
rewrite(ft);
closefile(ft)
end;

procedure SetOutputFile;
begin
outputfile:=filename
end;

procedure WriteOut;
var ft:text;
begin
assignfile(ft,outputfile);
if not fileexists(outputfile) then rewrite(ft)
else append(ft);
writeln(ft,st);
closefile(ft)
end;

procedure Core1(a:word);
var
toinvert:array [1..15] of byte;
resulting:ResultingArray;
current:word;
x,y:word;
st:string;
i:byte;
dived:word;
index:word;
begin
writeout('Непосредственный перевод в двоичную систему');
resulting:=MakeZeroResulting;
current:=a;
x:=1;
y:=1;
index:=1;
//Begin calculating
st:=inttostr(current);
for i:=1 to length(st) do resulting[x+i-1,y]:=st[i];
resulting[x,y+1]:='-';
dived:=(current div 2)*2;
st:=inttostr(dived);
for i:=1 to length(st) do resulting[x+i-1,y+2]:=st[i];
for i:=1 to length(st) do resulting[x+i-1,y+3]:='_';
resulting[x+length(st)-1,y+4]:=inttochar(current-dived);
toinvert[index]:=current-dived;
inc(index);
current:=dived div 2;
x:=x+length(st)+1;
while current>1 do begin
   for i:=1 to 3 do resulting[x,y+i-1]:='|';
   resulting[x+1,y]:='2';
   y:=y+2;
   x:=x+1;
   st:=inttostr(current);
   for i:=1 to length(st) do resulting[x+i-1,y-1]:='_';
   for i:=1 to length(st) do resulting[x+i-1,y]:=st[i];
   resulting[x,y+1]:='-';
   dived:=(current div 2)*2;
   st:=inttostr(dived);
   for i:=1 to length(st) do resulting[x+i-1,y+2]:=st[i];
   for i:=1 to length(st) do resulting[x+i-1,y+3]:='_';
   resulting[x+length(st)-1,y+4]:=inttochar(current-dived);
   toinvert[index]:=current-dived;
   inc(index);
   current:=dived div 2;
   x:=x+length(st)+1
end;
for i:=1 to 3 do resulting[x,y+i-1]:='|';
resulting[x+1,y]:='2';
resulting[x+1,y+1]:='_';
resulting[x+1,y+2]:='1';
toinvert[index]:=1;
OutputResulting(resulting);
writeout('');
st:='';
for i:=1 to index do insert(inttostr(toinvert[i]),st,1);
writeout(inttostr(a)+'->10 = '+st+'->2');
writeout('');
end;

procedure Core2(a:word);
var
toinvert:array [1..15] of byte;
resulting:ResultingArray;
current:word;
x,y:word;
st:string;
i:byte;
dived:word;
index:word;
st2,st3:string;
begin
writeout('Перевод в двоичную через восьмеричную систему');
resulting:=MakeZeroResulting;
current:=a;
x:=1;
y:=1;
index:=1;
//Begin calculating
st:=inttostr(current);
for i:=1 to length(st) do resulting[x+i-1,y]:=st[i];
resulting[x,y+1]:='-';
dived:=(current div 8)*8;
st:=inttostr(dived);
for i:=1 to length(st) do resulting[x+i-1,y+2]:=st[i];
for i:=1 to length(st) do resulting[x+i-1,y+3]:='_';
resulting[x+length(st)-1,y+4]:=inttochar(current-dived);
toinvert[index]:=current-dived;
inc(index);
current:=dived div 8;
x:=x+length(st)+1;
while current>7 do begin
   for i:=1 to 3 do resulting[x,y+i-1]:='|';
   resulting[x+1,y]:='8';
   y:=y+2;
   x:=x+1;
   st:=inttostr(current);
   for i:=1 to length(st) do resulting[x+i-1,y-1]:='_';
   for i:=1 to length(st) do resulting[x+i-1,y]:=st[i];
   resulting[x,y+1]:='-';
   dived:=(current div 8)*8;
   st:=inttostr(dived);
   for i:=1 to length(st) do resulting[x+i-1,y+2]:=st[i];
   for i:=1 to length(st) do resulting[x+i-1,y+3]:='_';
   resulting[x+length(st)-1,y+4]:=inttochar(current-dived);
   toinvert[index]:=current-dived;
   inc(index);
   current:=dived div 8;
   x:=x+length(st)+1
end;
for i:=1 to 3 do resulting[x,y+i-1]:='|';
resulting[x+1,y]:='8';
resulting[x+1,y+1]:='_';
resulting[x+1,y+2]:=inttochar(current);
toinvert[index]:=current;
OutputResulting(resulting);
writeout('');
st:='';
for i:=1 to index do insert(inttostr(toinvert[i]),st,1);
st2:='(';
for i:=1 to index do
 st2:=st2+extendbin(tobin(toinvert[index-i+1]),3)+'-';
st2[length(st2)]:=')';
st3:='';
for i:=1 to index do
 if i=1 then st3:=st3+tobin(toinvert[index-i+1])
 else st3:=st3+extendbin(tobin(toinvert[index-i+1]),3);
writeout(inttostr(a)+'->10 = '+st+'->8 = '+st2+'2->8 = '+st3+'->2');
writeout('');
end;

procedure Core3(b:word);
var
current:word;
x,y:word;
index:byte;
bits:array [1..11] of byte;
resulting:ResultingArray;
i:byte;
perenos:byte;
st:string;
multi:word;
begin
writeout('Непосредственный перевод в двоичную систему');
writeout('');
resulting:=MakeZeroResulting;
current:=b;
x:=2;
y:=1;
for index:=0 to 10 do begin
   perenos:=current div 1000;
   if index<>0 then bits[index]:=perenos;
   resulting[x+1,y]:=inttochar(perenos);
   resulting[x+2,y]:='|';
   current:=current mod 1000;
   st:=extendbin(inttostr(current),3);
   for i:=1 to length(st) do resulting[x+2+i,y]:=st[i];
   resulting[x,y+1]:='x';
   resulting[x+2,y+1]:='|';
   resulting[x+5,y+1]:='2';
   resulting[x,y+2]:='_';
   resulting[x+1,y+2]:='_';
   resulting[x+3,y+2]:='_';
   resulting[x+4,y+2]:='_';
   resulting[x+5,y+2]:='_';
   resulting[x+2,y+2]:='|';
   y:=y+3;
   current:=current*2
end;
perenos:=current div 1000;
bits[11]:=perenos;
resulting[x+1,y]:=inttochar(perenos);
resulting[x+2,y]:='|';
current:=current mod 1000;
st:=extendbin(inttostr(current),3);
for i:=1 to length(st) do resulting[x+2+i,y]:=st[i];
OutputResulting(resulting);
writeout('');
st:='0,'+inttostr(b)+'->10 = 0,';
for i:=1 to 11 do st:=st+inttochar(bits[i]);
st:=st+'->2';
writeout(st);
writeout('Округление:');
st:='0,';
for i:=1 to 10 do st:=st+inttochar(bits[i]);
st:=st+' '+inttochar(bits[11]);
writeout(st);
writeout('             1 окр.');
writeout('______________');
multi:=1;
current:=0;
for i:=11 downto 1 do begin
   current:=current+multi*bits[i];
   multi:=multi*2
end;
current:=current+1;
for i:=11 downto 1 do begin
   bits[i]:=current and 1;
   current:=current shr 1
end;
st:='0,';
for i:=1 to 10 do st:=st+inttochar(bits[i]);
st:=st+' '+inttochar(bits[11]);
writeout(st);
st:='0,'+inttostr(b)+'->10 = 0,';
for i:=1 to 10 do st:=st+inttochar(bits[i]);
st:=st+'->2';
writeout(st);
writeout('')
end;

procedure Core4(b:word);
var
current:word;
x,y:word;
resulting:ResultingArray;
i:byte;
st,st2,st3:string;
index:byte;
multi:word;
octs,bits:array [1..12] of byte;
perenos:byte;
begin
writeout('Перевод через восьмеричную систему');
writeout('');
resulting:=MakeZeroResulting;
current:=b;
x:=2;
y:=1;
for index:=0 to 3 do begin
   perenos:=current div 1000;
   if index<>0 then octs[index]:=perenos;
   resulting[x+1,y]:=inttochar(perenos);
   resulting[x+2,y]:='|';
   current:=current mod 1000;
   st:=extendbin(inttostr(current),3);
   for i:=1 to length(st) do resulting[x+2+i,y]:=st[i];
   resulting[x,y+1]:='x';
   resulting[x+2,y+1]:='|';
   resulting[x+5,y+1]:='8';
   resulting[x,y+2]:='_';
   resulting[x+1,y+2]:='_';
   resulting[x+3,y+2]:='_';
   resulting[x+4,y+2]:='_';
   resulting[x+5,y+2]:='_';
   resulting[x+2,y+2]:='|';
   y:=y+3;
   current:=current*8
end;
perenos:=current div 1000;
octs[4]:=perenos;
resulting[x+1,y]:=inttochar(perenos);
resulting[x+2,y]:='|';
current:=current mod 1000;
st:=extendbin(inttostr(current),3);
for i:=1 to length(st) do resulting[x+2+i,y]:=st[i];
OutputResulting(resulting);
writeout('');
st:='0,'+inttostr(b)+'->10 = 0,';
for i:=1 to 4 do st:=st+inttochar(octs[i]);
st:=st+'->8 = (0,';
st2:='';
st3:='';
for i:=1 to 4 do begin
   st2:=st2+extendbin(tobin(octs[i]),3)+'-';
   st3:=st3+extendbin(tobin(octs[i]),3)
end;
for i:=1 to 12 do bits[i]:=strtoint(st3[i]);
st2[length(st2)]:=')';
st2:=st2+'2->8 = 0,';
st:=st+st2+st3;
writeout(st);
writeout('Округление:');
st:='0,';
for i:=1 to 10 do st:=st+inttochar(bits[i]);
st:=st+' '+inttochar(bits[11])+inttochar(bits[12]);
writeout(st);
writeout('             1  окр.');
writeout('_______________');
multi:=1;
current:=0;
for i:=12 downto 1 do begin
   current:=current+multi*bits[i];
   multi:=multi*2
end;
current:=current+2;
for i:=12 downto 1 do begin
   bits[i]:=current and 1;
   current:=current shr 1
end;
st:='0,';
for i:=1 to 10 do st:=st+inttochar(bits[i]);
st:=st+' '+inttochar(bits[11])+inttochar(bits[12]);
writeout(st);
st:='0,'+inttostr(b)+'->10 = 0,';
for i:=1 to 10 do st:=st+inttochar(bits[i]);
st:=st+'->2';
writeout(st);
writeout('')
end;

procedure Core5(a,b:word;zaochniki:boolean);
var st:string;
    ast,bst:string;
begin
if not zaochniki then begin
   st:=extendbin(tobin(a),10);
   writeout('        |[a]->2|   0'+st);
   writeout('|a''| = _________ = ___________ = 0,'+st);
   writeout('          2^10         2^10')
end
else st:=tobinfrac(a);
ast:='0,'+st;
bst:='0,'+tobinfrac(b);
writeout('');
writeout('a1 = +'+ast);
writeout('a2 = -'+ast);
writeout('b1 = +'+bst);
writeout('b2 = -'+bst);
writeout('')
end;

procedure Core6(a,b:word;zaochniki:boolean);
var ast,bst:string;
begin
if not zaochniki then ast:='0,'+extendbin(tobin(a),10)
else ast:='0,'+tobinfrac(a);
bst:='0,'+tobinfrac(b);
writeout('');
writeout('      a1');
writeout('+ '+ast+'  a1');
writeout('  '+ast+'  [a1]пк');
writeout('  '+ast+'  [a1]ок');
writeout('  '+ast+'  [a1]дк');
if zaochniki then writeout(' '+ast[1]+ast+'  [a1]мк');
writeout('');
writeout('      a2');
writeout('- '+ast+'  a2');
ast[1]:='1';
writeout('  '+ast+'  [a2]пк');
writeout('  '+inbackcode(ast)+'  [a2]ок');
writeout('  '+inadditcode(ast)+'  [a2]дк');
if zaochniki then writeout(' '+ast[1]+ast+'  [a1]мк');
writeout('');
writeout('      b1');
writeout('+ '+bst+'  b1');
writeout('  '+bst+'  [b1]пк');
writeout('  '+bst+'  [b1]ок');
writeout('  '+bst+'  [b1]дк');
if zaochniki then writeout(' '+bst[1]+bst+'  [b1]мк');
writeout('');
writeout('      b2');
writeout('- '+bst+'  b2');
bst[1]:='1';
writeout('  '+bst+'  [b2]пк');
writeout('  '+inbackcode(bst)+'  [b2]ок');
writeout('  '+inadditcode(bst)+'  [b2]дк');
if zaochniki then writeout(' '+bst[1]+bst+'  [b1]мк');
writeout('')
end;

procedure Core7(asto,bsto:string);
var ast,bst:string;

function AddInBackCode(afrac,bfrac:string;showa,showb,showS:string):string;
var ast2,bst2:string;
    a,b,s,v:word;
    i:word;
    st:string;
    stfin:string;
begin
result:='';
ast2:=afrac;
bst2:=bfrac;
ast2[2]:='|';
bst2[2]:='|';
afrac:=inbackcode(afrac);
bfrac:=inbackcode(bfrac);
a:=0;
for i:=length(afrac) downto 3 do
 if afrac[i]='1' then setbit(a,length(afrac)-i+1,1);
if afrac[1]='1' then begin
   setbit(a,length(afrac)-1,1);
   setbit(a,length(afrac),1)
end;
b:=0;
for i:=length(bfrac) downto 3 do
 if bfrac[i]='1' then setbit(b,length(bfrac)-i+1,1);
if bfrac[1]='1' then begin
   setbit(b,length(bfrac)-1,1);
   setbit(b,length(bfrac),1)
end;
if afrac[1]='1' then insert('1',afrac,1)
else insert('0',afrac,1);
if bfrac[1]='1' then insert('1',bfrac,1)
else insert('0',bfrac,1);
writeout('Рг"a"    '+ast2+'  ['+showa+']пк');
writeout('Рг"b"    '+bst2+'  ['+showb+']пк');
writeout('СМ      00|0000000000  У "0"');
writeout('       +'+afrac+'  ['+showa+']*ок');
afrac[3]:='|';
writeout('CM      '+afrac+'  ['+showa+']*ок');
writeout('       +'+bfrac+'  ['+showb+']*ок');
s:=a+b;
st:='  |';
for i:=10 downto 1 do
 if getbit(s,i)=1 then st:=st+'1'
 else st:=st+'0';
st[1]:=inttochar(getbit(s,12));
st[2]:=inttochar(getbit(s,11));
if ((getbit(s,12)=1)and(getbit(s,11)=0))or((getbit(s,12)=0)and(getbit(s,11)=1)) then begin
   writeout('CM      '+st+'  ['+showS+']*ок');
   writeout('         ПЕРЕПОЛНЕНИЕ')
end
else begin
   if getbit(s,13)=1 then begin
      writeout('CM      '+st);
      writeout('                   +1 ЦП');
      v:=0;
      for i:=length(st) downto 4 do
       if st[i]='1' then setbit(v,length(st)-i+1,1);
      v:=v+1;
      for i:=1 to 10 do
       if getbit(v,i)=1 then st[length(st)-i+1]:='1'
      else st[length(st)-i+1]:='0';
      writeout('CM      '+st+'  ['+showS+']*ок');
   end
   else writeout('CM      '+st+'  ['+showS+']*ок');
   delete(st,1,1);
   stfin:=frombackcode(st);
   writeout('ОП       '+stfin+'  ['+showS+']пк');
   stfin[2]:=',';
   result:=stfin;
end
end;

begin
writeout('а)хранение чисел в ПК');
writeout('1) операции в ОК');
//+
writeout('');
writeout('Операция сложения');
//s1=a1+b2
ast:=asto;
bst:=bsto;
writeout('');
writeout('            S1=a1+b1');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b1]пк');
AddInBackCode(ast,bst,'a1','b1','S1');
writeout('');
//s2=a1+b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
writeout('');
writeout('            S2=a1+b2');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b2]пк');
AddInBackCode(ast,bst,'a1','b2','S2');
writeout('');
//s3=a2+b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
writeout('');
writeout('            S3=a2+b1');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b1]пк');
res[B1_MINUS_A1].bin:=AddInBackCode(ast,bst,'a2','b1','S3');
writeout('');
//s4=a2+b2
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
writeout('');
writeout('            S4=a2+b2');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b2]пк');
AddInBackCode(ast,bst,'a2','b2','S4');
writeout('');
//-
writeout('');
writeout('Операция вычитания');
//Д1=a1-b1
ast:=asto;
bst:=bsto;
writeout('');
writeout('            Д1=a1-b1');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b1]пк');
bst[1]:='1';
AddInBackCode(ast,bst,'a1','-b1','Д1');
writeout('');
//Д2=a1-b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
writeout('');
writeout('            Д2=a1-b2');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b2]пк');
bst[1]:='0';
AddInBackCode(ast,bst,'a1','-b2','Д2');
writeout('');
//Д3=a2-b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
writeout('');
writeout('            Д3=a2-b1');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b1]пк');
bst[1]:='1';
AddInBackCode(ast,bst,'a2','-b1','Д3');
writeout('');
//Д4=a2-b2
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
writeout('');
writeout('            Д4=a2-b2');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b2]пк');
bst[1]:='0';
AddInBackCode(ast,bst,'a2','-b2','Д4');
writeout('');
end;

procedure Core8(asto,bsto:string);
var ast,bst:string;

procedure AddInAdditCode(afrac,bfrac:string;showa,showb,showS:string);
var a,b,s,v:word;
    i:word;
    st:string;
    ast,bst:string;
    wasoverflow:boolean;

function OverFlow(fullst:string;showSfull:string):boolean;
begin
if ((fullst[1]='1')and(fullst[2]='0'))or((fullst[1]='0')and(fullst[2]='1')) then begin
   writeout('CM      '+fullst+'  '+showSfull);
   writeout('         ПЕРЕПОЛНЕНИЕ');
   wasoverflow:=true;
   overflow:=true
end
else overflow:=false
end;

begin
wasoverflow:=false;
ast:=afrac;
bst:=bfrac;
afrac:=inbackcode(afrac);
bfrac:=inbackcode(bfrac);
if afrac[1]='1' then insert('1',afrac,1)
else insert('0',afrac,1);
if bfrac[1]='1' then insert('1',bfrac,1)
else insert('0',bfrac,1);
ast[2]:='|';
bst[2]:='|';
writeout('Рг"a"    '+ast+'  ['+showa+']пк');
writeout('Рг"b"    '+bst+'  ['+showb+']пк');
writeout('СМ      00|0000000000  У "0"');
if afrac[1]='1' then begin
   writeout('       +'+afrac+'  ['+showa+']*ок');
   afrac[3]:='|';
   writeout('CM      '+afrac+'  ['+showa+']*ок');
   writeout('       +            1 ДК');
   v:=0;
   for i:=length(afrac) downto 4 do
    if afrac[i]='1' then setbit(v,length(afrac)-i+1,1);
   v:=v+1;
   for i:=1 to 10 do
    if getbit(v,i)=1 then afrac[length(afrac)-i+1]:='1'
    else afrac[length(afrac)-i+1]:='0';
   writeout('СМ      '+afrac+'  ['+showa+']*дк')
end
else begin
   writeout('       +'+afrac+'  ['+showa+']*дк');
   afrac[3]:='|';
   writeout('CM      '+afrac+'  ['+showa+']*дк')
end;
a:=0;
for i:=length(afrac) downto 4 do
 if afrac[i]='1' then setbit(a,length(afrac)-i+1,1);
if afrac[1]='1' then begin
   setbit(a,length(afrac)-2,1);
   setbit(a,length(afrac)-1,1)
end;
b:=0;
for i:=length(bfrac) downto 4 do
 if bfrac[i]='1' then setbit(b,length(bfrac)-i+1,1);
if bfrac[1]='1' then begin
   setbit(b,length(bfrac)-2,1);
   setbit(b,length(bfrac)-1,1)
end;
if bfrac[1]='1' then begin
   writeout('       +'+bfrac+'  ['+showb+']*ок');
   s:=a+b;
   st:='  |';
   for i:=10 downto 1 do
    if getbit(s,i)=1 then st:=st+'1'
    else st:=st+'0';
   st[1]:=inttochar(getbit(s,12));
   st[2]:=inttochar(getbit(s,11));
   if not OverFlow(st,'['+showa+']*дк+['+showb+']*ок') then begin
      writeout('CM      '+st+'  ['+showa+']*дк+['+showb+']*ок');
      writeout('       +            1 ДК');
      s:=s+1
   end
end
else begin
   writeout('       +'+bfrac+'  ['+showb+']*дк');
   s:=a+b
end;
st:='  |';
for i:=10 downto 1 do
 if getbit(s,i)=1 then st:=st+'1'
else st:=st+'0';
st[1]:=inttochar(getbit(s,12));
st[2]:=inttochar(getbit(s,11));
if (not wasoverflow)and(not OverFlow(st,'['+showS+']*дк')) then begin
   if st[1]='1' then begin
      writeout('CM      '+st);
      writeout('       +11,1111111111  [-1*2^-n]*дк');
      s:=s+8191;
      st:='  |';
      for i:=10 downto 1 do
       if getbit(s,i)=1 then st:=st+'1'
      else st:=st+'0';
      st[1]:=inttochar(getbit(s,12));
      st[2]:=inttochar(getbit(s,11));
      writeout('CM      '+st+'  ['+showS+']*ок');
      delete(st,1,1);
      st:=frombackcode(st)
   end
   else begin
      writeout('CM      '+st+'  ['+showS+']*дк');
      delete(st,1,1)
   end;
   writeout('ОП       '+st+'  ['+showS+']пк')
end
end;

begin
writeout('2) операции в ДК');
//+
writeout('');
writeout('Операция сложения');
//S1=a1+b1
ast:=asto;
bst:=bsto;
writeout('');
writeout('            S1=a1+b1');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b1]пк');
AddInAdditCode(ast,bst,'a1','b1','S1');
writeout('');
//S2=a1+b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
writeout('');
writeout('            S2=a1+b2');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b2]пк');
AddInAdditCode(ast,bst,'a1','b2','S2');
writeout('');
//S3=a2+b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
writeout('');
writeout('            S3=a2+b1');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b1]пк');
AddInAdditCode(ast,bst,'a2','b1','S3');
writeout('');
//S4=a2+b2
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
writeout('');
writeout('            S4=a2+b2');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b2]пк');
AddInAdditCode(ast,bst,'a2','b2','S4');
writeout('');
writeout('Операция вычитания');
//Д1=a1-b1
ast:=asto;
bst:=bsto;
writeout('');
writeout('            Д1=a1-b1');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b1]пк');
bst[1]:='1';
AddInAdditCode(ast,bst,'a1','-b1','Д1');
writeout('');
//Д2=a1-b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
writeout('');
writeout('            Д2=a1-b2');
writeout('ОП    /  '+ast+'  [a1]пк');
writeout('      \  '+bst+'  [b2]пк');
bst[1]:='0';
AddInAdditCode(ast,bst,'a1','-b2','Д2');
writeout('');
//Д3=a2-b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
writeout('');
writeout('            Д3=a2-b1');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b1]пк');
bst[1]:='1';
AddInAdditCode(ast,bst,'a2','-b1','Д3');
writeout('');
//Д1=a1-b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
writeout('');
writeout('            Д4=a2-b2');
writeout('ОП    /  '+ast+'  [a2]пк');
writeout('      \  '+bst+'  [b2]пк');
bst[1]:='0';
AddInAdditCode(ast,bst,'a2','-b2','Д4');
writeout('')
end;

procedure Core9(asto,bsto:string);
var ast,bst:string;
    st:string;

procedure AddInAdditCode(afrac,bfrac:string;showa,showb,showS:string);
var a,b,s:word;
    i:byte;
begin
afrac[2]:='|';
bfrac[2]:='|';
writeout('');
writeout('            '+showS+'='+showa+'+'+showb);
writeout('ОП    /  '+afrac+'  ['+showa+']дк');
writeout('      \  '+bfrac+'  ['+showb+']дк');
writeout('Рг"a"    '+afrac+'  ['+showa+']дк');
writeout('Рг"b"    '+bfrac+'  ['+showb+']дк');
writeout('СМ      00|0000000000  У "0"');
if afrac[1]='1' then insert('1',afrac,1)
else insert('0',afrac,1);
if bfrac[1]='1' then insert('1',bfrac,1)
else insert('0',bfrac,1);
afrac[3]:=',';
bfrac[3]:=',';
writeout('       +'+afrac+'  ['+showa+']*дк');
afrac[3]:='|';
writeout('CM      '+afrac+'  ['+showa+']*дк');
writeout('       +'+bfrac+'  ['+showb+']*дк');
a:=0;
for i:=length(afrac) downto 4 do
 if afrac[i]='1' then setbit(a,length(afrac)-i+1,1);
if afrac[1]='1' then begin
   setbit(a,length(afrac)-2,1);
   setbit(a,length(afrac)-1,1)
end;
b:=0;
for i:=length(bfrac) downto 4 do
 if bfrac[i]='1' then setbit(b,length(bfrac)-i+1,1);
if bfrac[1]='1' then begin
   setbit(b,length(bfrac)-2,1);
   setbit(b,length(bfrac)-1,1)
end;
s:=a+b;
st:='  |';
for i:=10 downto 1 do
 if getbit(s,i)=1 then st:=st+'1'
else st:=st+'0';
st[1]:=inttochar(getbit(s,12));
st[2]:=inttochar(getbit(s,11));
if (getbit(s,12)<>getbit(s,11))or(s=3072)or(s=7168) then begin
   writeout('CM      '+st+'  ['+showS+']*дк');
   writeout('         ПЕРЕПОЛНЕНИЕ')
end
else begin
   writeout('CM      '+st+'  ['+showS+']*дк');
   delete(st,1,1);
   writeout('ОП       '+st+'  ['+showS+']дк')
end
end;

procedure SubtractInAdditCode(afrac,bfrac:string;showa,showb,showS:string);
var a,b,s:word;
    i:byte;
begin
afrac[2]:='|';
bfrac[2]:='|';
writeout('');
writeout('            '+showS+'='+showa+'-'+showb);
writeout('ОП    /  '+afrac+'  ['+showa+']дк');
writeout('      \  '+bfrac+'  ['+showb+']дк');
writeout('Рг"a"    '+afrac+'  ['+showa+']дк');
writeout('Рг"b"    '+bfrac+'  ['+showb+']дк');
writeout('СМ      00|0000000000  У "0"');
if afrac[1]='1' then insert('1',afrac,1)
else insert('0',afrac,1);
if bfrac[1]='1' then insert('1',bfrac,1)
else insert('0',bfrac,1);
afrac[3]:=',';
bfrac[3]:=',';
writeout('       +'+afrac+'  ['+showa+']*дк');
afrac[3]:='|';
writeout('CM      '+afrac+'  ['+showa+']*дк');
for i:=4 to 13 do
 if bfrac[i]='1' then bfrac[i]:='0'
 else bfrac[i]:='1';
for i:=1 to 2 do
 if bfrac[i]='1' then bfrac[i]:='0'
 else bfrac[i]:='1';
if bfrac[1]='1' then writeout('       +'+bfrac+'  ['+showb+']*ок')
else writeout('       +'+bfrac+'  [-'+showb+']*ок-1*2^-n');
a:=formnumber(afrac);
b:=formnumber(bfrac);
s:=a+b;
st:='  |';
for i:=10 downto 1 do
 if getbit(s,i)=1 then st:=st+'1'
else st:=st+'0';
st[1]:=inttochar(getbit(s,12));
st[2]:=inttochar(getbit(s,11));
if (getbit(s,12)<>getbit(s,11))or(s=3072)or(s=7168) then begin
   if bfrac[1]='1' then writeout('CM      '+st+'  ['+showa+']*дк+['+showb+']*ок')
   else writeout('CM      '+st+'  ['+showa+']*дк+[-'+showb+']*ок-1*2^-n');
   writeout('         ПЕРЕПОЛНЕНИЕ')
end
else begin
   if bfrac[1]='1' then writeout('CM      '+st+'  ['+showa+']*дк+['+showb+']*ок')
   else writeout('CM      '+st+'  ['+showa+']*дк+[-'+showb+']*ок-1*2^-n');
   writeout('       +            1 ДК');
   s:=formnumber(st);
   s:=s+1;
   st:='  |';
   for i:=10 downto 1 do
    if getbit(s,i)=1 then st:=st+'1'
   else st:=st+'0';
   st[1]:=inttochar(getbit(s,12));
   st[2]:=inttochar(getbit(s,11));
   if (getbit(s,12)<>getbit(s,11))or(s=3072)or(s=7168) then begin
      writeout('CM      '+st+'  ['+showS+']*дк');
      writeout('         ПЕРЕПОЛНЕНИЕ')
   end
   else begin
      writeout('CM      '+st+'  ['+showS+']*дк');
      delete(st,1,1);
      writeout('ОП       '+st+'  ['+showS+']дк')
   end
end
end;

begin
writeout('б) хранение чисел в ОП и операции в ДК');
//+
writeout('');
writeout('Операция сложения');
//s1=a1+b1
ast:=asto;
bst:=bsto;
ast:=inadditcode(ast);
bst:=inadditcode(bst);
AddInAdditCode(ast,bst,'a1','b1','S1');
writeout('');
//s2=a1+b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
AddInAdditCode(ast,bst,'a1','b2','S2');
writeout('');
//s3=a2+b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
AddInAdditCode(ast,bst,'a2','b1','S3');
writeout('');
//s4=a2+b2
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
AddInAdditCode(ast,bst,'a2','b2','S4');
writeout('');
writeout('Операция вычитания');
//Д1=a1-b1
ast:=asto;
bst:=bsto;
ast:=inadditcode(ast);
bst:=inadditcode(bst);
SubtractInAdditCode(ast,bst,'a1','b1','Д1');
writeout('');
//Д2=a1-b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
SubtractInAdditCode(ast,bst,'a1','b2','Д2');
writeout('');
//Д3=a2-b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
SubtractInAdditCode(ast,bst,'a2','b1','Д3');
writeout('');
//Д4=a2-b2
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
SubtractInAdditCode(ast,bst,'a2','b2','Д4');
writeout('')
end;

procedure Core10(asto,bsto:string);
var ast,bst:string;

function MultiplyInAddit(afrac,bfrac:string;showa,showb,showS:string):string;
const o='                                       ';
var st,st2:string;
    amin,bc,aplus:cardinal;
    i:word;
    s:cardinal;
    n:word;
    st3,st4,st5,st6,st7:string;
    stadd:string;
    found:boolean;
begin
stadd:='';
delete(bfrac,2,1);
bc:=0;
for i:=1 to length(bfrac) do
 if bfrac[i]='1' then setbit(bc,length(bfrac)-i+3,1);
writeout('');
writeout(showS+' = '+showa+'*'+showb);
writeout('');
st:=afrac;
insert(st[1],st,1);
aplus:=formnumber(st);
aplus:=aplus shl 10;
st:=fromadditcode(afrac);
if st[1]='1' then st[1]:='0'
else st[1]:='1';
st:=inadditcode(st);
writeout(o+'|__|__________|');
st2:=copy(st,3,10);
insert(st[1],st,1);
amin:=formnumber(st);
amin:=amin shl 10;
writeout(o+'|'+st[1]+st[1]+'|'+st2+'|            -> [-'+showa+']д');
st2:=copy(afrac,3,10);
writeout('          Рг "b"                       | '+afrac[1]+'|'+st2+'|            Рг"a" ->[+'+showa+']д');
writeout('       |___________|__|                |__|__________|__________|');
st:=formstring(bc);
st2:=copy(st,length(st)-1,2);
delete(st,length(st)-1,2);
for i:=1 to 11-length(st) do st:='0'+st;
writeout(' ['+showb+']д |'+st+'|'+st2+'|                |00|0000000000|0000000000| СМ У "0"');
writeout('       |           |  |                |__|__________|__________|');
s:=0;
n:=1;
repeat
   s:=s shr 1;
   setbit(s,22,getbit(s,21));
   st:=extendbin(formstring(s),22);
   st2:=copy(st,1,2);
   st3:=copy(st,3,10);
   st4:=copy(st,13,10);
   writeout('       |           |  | сдв. "b","S"   |'+st2+'|'+st3+'|'+st4+'|');
   bc:=bc shr 1;
   setbit(bc,13,getbit(bc,12));
   st:=extendbin(formstring(bc),13);
   st5:=copy(st,1,11);
   delete(st,1,11);
   st6:=st;
   if st6='00' then
    st7:='+0';
   if st6='01' then begin
      st7:='+a';
      s:=s+aplus
   end;
   if st6='10' then begin
      st7:='-a';
      s:=s+amin
   end;
   if st6='11' then
    st7:='+0';
   setbit(s,23,0);
   st:=extendbin(formstring(s),22);
   st2:=copy(st,1,2);
   st3:=copy(st,3,10);
   st4:=copy(st,13,10);
   if n=11 then stadd:= ' S = ['+ShowS+']д';
   writeout('       |'+st5+'|'+st6+'| ->"'+st7+'"         |'+st2+'|'+st3+'|'+st4+'|'+stadd);
   if n<11 then writeout('       |           |  |                |__|__________|__________|')
   else writeout('       |___________|__|                |__|__________|__________|');
   inc(n)
until n=12;
bc:=0;
found:=false;
for i:=1 to 9 do
 if getbit(s,i)=1 then found:=true;
if found then begin
   writeout('                                                    +|1 окр.    |');
   setbit(bc,10,1);
   s:=s+bc;
   st:=extendbin(formstring(s),22);
   st2:=copy(st,1,2);
   st3:=copy(st,3,10);
   st4:=copy(st,13,10);
   writeout('                                        '+st2+'|'+st3+'|'+st4+'|')
end
else begin
   writeout('                                        не прибавляем 1 окр.     ');
   st:=extendbin(formstring(s),22);
   st2:=copy(st,1,2);
   st3:=copy(st,3,10);
   st4:=copy(st,13,10)
end;
writeout(' ['+showS+']д = '+st2[1]+','+st3);
result:=st2[1]+','+st3;
writeout('');
writeout('');
writeout('')
end;

begin
ast:=asto;
bst:=bsto;
writeout('[a]пк = '+ast);
writeout('[b]пк = '+bst);
writeout('[a1]д = +a = '+ast);
ast[1]:='1';
writeout('[a2]д = -a = '+inadditcode(ast));
writeout('[b1]д = +b = '+bst);
bst[1]:='1';
writeout('[b2]д = -b = '+inadditcode(bst));
writeout('');
writeout('');
//P2=a1*b1
ast:=asto;
bst:=bsto;
res[A1_MUL_B1].bin:=MultiplyInAddit(ast,bst,'a1','b1','P2');
//P3=a1*b2
ast:=asto;
bst:=bsto;
bst[1]:='1';
bst:=inadditcode(bst);
MultiplyInAddit(ast,bst,'a1','b2','P3');
//P4=a2*b1
ast:=asto;
bst:=bsto;
ast[1]:='1';
ast:=inadditcode(ast);
MultiplyInAddit(ast,bst,'a2','b1','P4');
//P5=a2*b2
ast:=asto;
bst:=bsto;
ast[1]:='1';
bst[1]:='1';
ast:=inadditcode(ast);
bst:=inadditcode(bst);
MultiplyInAddit(ast,bst,'a2','b2','P5')
end;

procedure Core11(asto,bsto:string);
var ast,bst:string;

function Divide(afrac,bfrac:string;showa,showb,showS:string):string;
var st,st2,st3,divided:string;
    bmin,bplus:cardinal;
    i,j:byte;
    s:cardinal;
begin
for i:=1 to 12-length(afrac) do
 afrac:=afrac+'0';
for i:=1 to 12-length(bfrac) do
 bfrac:=bfrac+'0';
writeout('');
st:=bfrac;
st[1]:='1';
st:=inadditcode(st);
delete(st,2,1);
bmin:=frombin(st);
setbit(bmin,12,1);
st:=bfrac;
st:=copy(st,3,10);
bplus:=frombin(st);
afrac:=afrac[1]+afrac;
bfrac:=bfrac[1]+bfrac;
s:=formnumber(afrac);
divided:='';
for j:=1 to 12 do begin
   if getbit(s,12)=1 then begin
      st2:=' +[b]      ';
      st3:=extendbin(tobin(bplus),12);
      insert('|',st3,3);
      st2:=st2+st3+'                   | |';
      writeout(st2);
      s:=s+bplus;
      writeout('           __|__________                   | |');
      setbit(s,13,0);
      st3:=extendbin(tobin(s),12);
      insert('|',st3,3);
      st2:='           '+st3+'                   | |';
      writeout(st2)
   end;
   if j<>1 then s:=s shl 1;
   setbit(s,13,0);
   st:=extendbin(tobin(s),12);
   insert('|',st,3);
   st3:='';
   for i:=1 to 12-length(divided) do
    st3:=st3+' ';
   if j=1 then st:=' '+showa+'        '+st+' СМ    '+st3+divided+'| |';
   if j<>1 then st:='           '+st+' СМ<-  '+st3+divided+'| |Рг '+showS+'<-';
   writeout(st);
   st2:=' +[-[b]д]  ';
   st3:=tobin(bmin);
   insert('|',st3,3);
   st2:=st2+st3+'                   | |';
   s:=s+bmin;
   writeout(st2);
   writeout('           __|__________                   | |');
   setbit(s,13,0);
   st:=extendbin(tobin(s),12);
   insert('|',st,3);
   st3:='';
   for i:=1 to 12-length(divided) do
    st3:=st3+' ';
   if getbit(s,12)=0 then st2:='1';
   if getbit(s,12)=1 then st2:='0';
   st:='           '+st+' CM    '+st3+divided+'|'+st2+'|';
   divided:=divided+st2;
   writeout(st);
   if j<>12 then writeout('             |                             | |')
end;
s:=frombin(divided);
insert(',',divided,2);
writeout('');
writeout(' '+divided);
writeout('            +1 окр.');
writeout('   ___________');
s:=s+1;
st:=extendbin(tobin(s),12);
insert(',',st,2);
writeout(' '+st);
st:=copy(st,1,12);
writeout('');
writeout(showS+' = '+st);
writeout('');
divide:=st
end;

begin
ast:=asto;
bst:=bsto;
writeout(' [a]пк = '+ast);
writeout(' [b]пк = '+bst);
bst[1]:='1';
writeout('-[b]дк = '+inadditcode(bst));
writeout('');
ast:=asto;
bst:=bsto;
res[A1_DIV_B1].bin:=divide(ast,bst,'a1','b1','C1')
end;

function Core12(asto,bsto:string):string;
var ast,bst:string;

function Divide(afrac,bfrac:string;showa,showb,showS:string):string;
var st,st2,st3,divided:string;
    bmin,bplus:cardinal;
    i,j:byte;
    s:cardinal;
begin
for i:=1 to 12-length(afrac) do
 afrac:=afrac+'0';
for i:=1 to 12-length(bfrac) do
 bfrac:=bfrac+'0';
writeout('');
st:=bfrac;
st[1]:='1';
st:=inadditcode(st);
delete(st,2,1);
bmin:=frombin(st);
setbit(bmin,12,1);
st:=bfrac;
st:=copy(st,3,10);
bplus:=frombin(st);
afrac:=afrac[1]+afrac;
bfrac:=bfrac[1]+bfrac;
s:=formnumber(afrac);
divided:='';
for j:=1 to 12 do begin
   st:=extendbin(tobin(s),12);
   insert('|',st,3);
   st3:='';
   for i:=1 to 12-length(divided) do
    st3:=st3+' ';
   if j=1 then st:=' '+showa+'        '+st+' СМ    '+st3+divided+'| |';
   if j<>1 then st:='           '+st+' СМ<-  '+st3+divided+'| |Рг '+showS+'<-';
   writeout(st);
   if getbit(s,12)=0 then begin
      st2:=' +[-[b]д]  ';
      st3:=tobin(bmin);
      insert('|',st3,3);
      st2:=st2+st3+'                   | |';
      s:=s+bmin
   end
   else begin
      st2:=' +[b]      ';
      st3:=extendbin(tobin(bplus),12);
      insert('|',st3,3);
      st2:=st2+st3+'                   | |';
      s:=s+bplus
   end;
   writeout(st2);
   writeout('           __|__________                   | |');
   setbit(s,13,0);
   st:=extendbin(tobin(s),12);
   insert('|',st,3);
   st3:='';
   for i:=1 to 12-length(divided) do
    st3:=st3+' ';
   if getbit(s,12)=0 then st2:='1';
   if getbit(s,12)=1 then st2:='0';
   st:='           '+st+' CM    '+st3+divided+'|'+st2+'|';
   divided:=divided+st2;
   writeout(st);
   if j<>12 then writeout('             |                             | |');
   s:=s shl 1;
   setbit(s,13,0)
end;
s:=frombin(divided);
insert(',',divided,2);
writeout('');
writeout(' '+divided);
writeout('            +1 окр.');
writeout('   ___________');
s:=s+1;
st:=extendbin(tobin(s),12);
insert(',',st,2);
writeout(' '+st);
st:=copy(st,1,12);
writeout('');
writeout(showS+' = '+st);
writeout('');
divide:=st
end;

begin
ast:=asto;
bst:=bsto;
writeout(' [a]пк = '+ast);
writeout(' [b]пк = '+bst);
bst[1]:='1';
writeout('-[b]дк = '+inadditcode(bst));
writeout('');
//C1=a1/b1
ast:=asto;
bst:=bsto;
result:=divide(ast,bst,'a1','b1','C1');
end;

function Core13(frace:string):real;
var pfrac:string;
    ast:string;
    s:integer;
    st,st2,st3:string;
    i:byte;
    decval:word;
    j:byte;
    mus1,mus2:cardinal;
begin
//Bin frac
writeout('а)непосредственный перевод '+frace+'->2');
writeout('');
frace[2]:='|';
s:=frombin(copy(frace,3,10));
writeout('  |        '+frace);
st3:='';
for j:=1 to 4 do begin
   writeout('  |      x  |      1010');
   if j=1 then st2:='  |        _|__________'
   else st2:='  |     ____|__________';
   writeout(st2);
   mus1:=s shl 1;
   mus2:=s shl 3;
   st2:=extendbin(tobin(mus1),11);
   insert('|',st2,2);
   writeout('  |        '+st2);
   st2:=extendbin(tobin(mus2),13);
   insert('|',st2,4);
   writeout('  |     +'+st2);
   writeout('  |     ____|__________');
   s:=mus1+mus2;
   st:=extendbin(tobin(s),13);
   if length(st)=13 then begin
      insert('|',st,4);
      st2:=copy(st,1,3);
      st3:=st3+inttostr(frombin(st2));
      st2:=' '+inttostr(frombin(st2))+'|<-    '+st
   end
   else begin
      insert('|',st,5);
      st2:=copy(st,1,4);
      st3:=st3+inttostr(frombin(st2));
      st2:=' '+inttostr(frombin(st2))+'|<-   '+st
   end;
   writeout(st2);
   mus1:=s;
   setbit(mus1,11,0);
   setbit(mus1,12,0);
   setbit(mus1,13,0);
   setbit(mus1,14,0);
   s:=mus1
end;
writeout('');
frace[2]:=',';
writeout(frace+'->2 = 0,'+st3);
writeout('                 +     5');
s:=strtoint(st3);
s:=s+5;
st3:=extendbin(inttostr(s),5);;
insert(',',st3,2);
writeout('                  ______');
writeout('                  '+st3);
delete(st3,6,1);
writeout('Итого: '+st3);
writeout('');
//Oct frac
writeout('б)перевод через восьмеричную систему');
st:=frace;
delete(st,1,2);
if length(st) mod 3 <> 0 then
 for i:=1 to 3-(length(st) mod 3) do
  st:=st+'0';
for i:=1 to length(st) div 3 do
 insert('-',st,i*3+i);
st2:='';
for i:=1 to length(st) div 4 do begin
   st3:=copy(st,(i-1)*4+1,3);
   st2:=st2+inttostr(tooct(frombin(st3)))
end;
ast:=st2;
st:=frace+'->2 = (0,'+st+')2->8 = 0,'+st2;
writeout(st);
writeout('');
decval:=fromoct(strtoint(st2));
writeout('  |       0|'+st2);
pfrac:='';
for j:=1 to 4 do begin
   writeout('  |      x |12');
   writeout('  |      __|____');
   st:=extendbin(inttostr(tooct(2*decval)),5);
   insert('|',st,2);
   writeout('  |       '+st);
   st:=inttostr(tooct(decval));
   st:=st+'0';
   st:=extendbin(st,5);
   insert('|',st,2);
   writeout('  |      +'+st);
   writeout('  |      __|____');
   decval:=decval*10;
   st:=inttostr(tooct(decval));
   if length(st)<5 then
    for i:=1 to 5-length(st) do
     st:='0'+st;
   if length(st)>5 then begin
      st2:=copy(st,1,2);
      st3:=copy(st,3,length(st)-2)
   end;
   if length(st)=5 then begin
      st2:=copy(st,1,1);
      st3:=copy(st,2,length(st)-1)
   end;
   st:=inttostr(fromoct(strtoint(st2)));
   pfrac:=pfrac+st;
   st:=' '+st+'|<-    ';
   if length(st2)=1 then st:=st+' ';
   st:=st+st2+'|'+st3;
   writeout(st);
   decval:=fromoct(strtoint(st3))
end;
writeout('');
s:=strtoint(pfrac);
writeout('0,'+ast+'->8 = 0,'+pfrac+'->10');
writeout('                +5');
writeout('            ______');
s:=s+5;
st2:=extendbin(inttostr(s),4);
if length(st2)>length(pfrac) then insert(',',st2,2)
else st2:='0,'+st2;
writeout('            '+st2);
st2:=copy(st2,1,5);
writeout('');
writeout('Итого: '+st2);
writeout('');
st2[2]:='.';
result:=strtofloat(st2);
end;

procedure Calc_2_1_a_whole;
begin
writeout('ЧИСЛА С ФИКСИРОВАННОЙ ЗАПЯТОЙ');
writeout('');
writeout('2.1 a) целое [a]->10 = '+inttostr(a));
Core1(a);
end;

procedure Calc_2_1_b_whole;
begin
writeout('2.1 б) целое [a]->10 = '+inttostr(a));
Core2(a);
end;

procedure Calc_2_1_c_whole;
var tetra:array [1..3] of byte;
    popravka:array [1..2] of boolean;
    x,y:word;
    st:string;
    i:byte;
    resulting:ResultingArray;
    current:word;
    sdviged:array[1..10] of byte;
    index:byte;
    perenos,perenos2:byte;
    firstline:boolean;

procedure ShowTetrads(tetrads:array of byte;x1,y1:word);
var i:byte;
    st:string;
begin
st:='';
for i:=1 to 3 do
   st:=st+extendbin(tobin(tetra[i]),4)+' ';
for i:=1 to length(st)-1 do resulting[x1+9+i,y1]:=st[i]
end;

begin
writeout('2.1 в) целое [a]->10 = '+inttostr(a));
writeout('Перевод в двоичную из кода 8421 с помощью сдвига и сложения');
current:=a;
firstline:=true;
tetra[1]:=current div 100;
current:=current-tetra[1]*100;
tetra[2]:=current div 10;
current:=current-tetra[2]*10;
tetra[3]:=current;
popravka[1]:=false;
popravka[2]:=false;
resulting:=MakeZeroResulting;
writeout('');
st:=inttostr(a)+'->10 = (';
for i:=1 to 3 do
 st:=st+extendbin(tobin(tetra[i]),4)+';';
st[length(st)]:=')';
st:=st+'2->10';
writeout(st);
writeout('');
x:=1;
y:=1;
index:=11;
st:='';
for i:=1 to 14 do resulting[x+9+i,y]:='_';
resulting[x+9,y]:='|';
resulting[x+24,y]:='|';
y:=y+1;
for i:=1 to 3 do resulting[x-1+i,y]:=inttochar(tetra[i]);
resulting[x+9,y]:='|';
resulting[x+24,y]:='|';
showtetrads(tetra,x,y);
while (tetra[1]+tetra[2]+tetra[3]>0) do begin
   if popravka[1] or popravka[2] then begin
      firstline:=true;
      resulting[x+3,y]:='+';
      resulting[x+4,y]:='П';
      resulting[x+9,y]:='|';
      resulting[x+24,y]:='|';
      resulting[x+9,y+1]:='|';
      resulting[x+24,y+1]:='|';
      for i:=1 to 14 do resulting[x+9+i,y+1]:='_';
      if popravka[1] then begin
         resulting[x+15,y]:='1';
         resulting[x+16,y]:='1';
         resulting[x+17,y]:='0';
         resulting[x+18,y]:='1';
         tetra[2]:=tetra[2]+13;
         tetra[2]:=tetra[2] and 15
      end;
      if popravka[2] then begin
         resulting[x+20,y]:='1';
         resulting[x+21,y]:='1';
         resulting[x+22,y]:='0';
         resulting[x+23,y]:='1';
         tetra[3]:=tetra[3]+13;
         tetra[3]:=tetra[3] and 15
      end;
      popravka[1]:=false;
      popravka[2]:=false;
      y:=y+2
   end
   else begin
      if firstline then begin
         st:='';
         for i:=1 to 3 do begin
            st:=st+inttochar(tetra[i])
         end;
         st:=inttostr(strtoint(st));
         for i:=1 to length(st) do resulting[x+i-1,y]:=st[i];
         showtetrads(tetra,x,y);
         resulting[x+9,y]:='|';
         resulting[x+24,y]:='|';
         for i:=index to 10 do resulting[x+25+i-index,y]:=inttochar(sdviged[i]);         
         y:=y+1
      end
      else begin
         resulting[x+9,y]:='|';
         resulting[x+24,y]:='|';
         resulting[x+4,y]:='с';
         resulting[x+5,y]:='д';
         resulting[x+6,y]:='в';
         resulting[x+7,y]:='.';
         perenos:=tetra[1] mod 2;
         tetra[1]:=tetra[1] shr 1;
         if perenos=1 then popravka[1]:=true;
         perenos2:=tetra[2] mod 2;
         tetra[2]:=tetra[2] shr 1;
         if perenos2=1 then popravka[2]:=true;
         perenos:=perenos*8;
         tetra[2]:=tetra[2] or perenos;
           dec(index);
         sdviged[index]:=tetra[3] mod 2;
         tetra[3]:=tetra[3] shr 1;
         perenos2:=perenos2*8;
         tetra[3]:=tetra[3] or perenos2;
         showtetrads(tetra,x,y);
         if (not popravka[1])and(not popravka[2]) then begin
            st:='';
            for i:=1 to 3 do begin
               st:=st+inttochar(tetra[i])
            end;
            st:=inttostr(strtoint(st));
            for i:=1 to length(st) do resulting[x+i-1,y]:=st[i]
         end;
         for i:=index to 10 do resulting[x+25+i-index,y]:=inttochar(sdviged[i]);
         y:=y+1
      end;
      firstline:=false
   end
end;
OutputResulting(resulting);
writeout('');
st:='';
for i:=index to 10 do
 st:=st+inttochar(sdviged[i]);
st:='[a]->2 = '+st;
writeout(st);
writeout('')
end;

procedure Calc_2_1_a_fraction;
begin
writeout('2.1 a) дробное [b]->10 = 0,'+inttostr(b));
Core3(b);
end;

procedure Calc_2_1_b_fraction;
begin
writeout('2.1 б) дробное [b]->10 = 0,'+inttostr(b));
Core4(b);
end;

procedure Calc_2_1_c_fraction;
var
current:word;
x,y:word;
resulting:ResultingArray;
i:byte;
tetra:array [1..3] of byte;
bits:array [1..11] of byte;
index:byte;
popravka:array [1..3] of boolean;
firstline:boolean;
st:string;
perenos:byte;
totalpopravka:word;
multi:word;
moreover:byte;

procedure ShowTetrads(tetrads:array of byte;x1,y1:word);
var i:byte;
    st:string;
begin
st:='';
for i:=1 to 3 do
   st:=st+extendbin(tobin(tetra[i]),4)+' ';
for i:=1 to length(st)-1 do if st[i]<>' ' then
 resulting[x1+15+i,y1]:=st[i]
end;

begin
writeout('2.1 в) дробное [b]->10 = 0,'+inttostr(b));
writeout('Перевод в двоичную систему из кода 8421 с помощью сдвига и сложения');
writeout('');
resulting:=MakeZeroResulting;
current:=b;
tetra[1]:=current div 100;
current:=current - (current div 100)*100;
tetra[2]:=current div 10;
tetra[3]:=current mod 10;
firstline:=true;
x:=2;
y:=1;
index:=0;
for i:=1 to 3 do popravka[i]:=false;
writeout('                |____|____|____|');
while (index<11)or popravka[1] or popravka[2] or popravka[3] or firstline do begin
   if (not popravka[1])and(not popravka[2])and(not popravka[3]) then begin
      resulting[x+15,y]:='|';
      resulting[x+20,y]:='|';
      resulting[x+25,y]:='|';
      resulting[x+30,y]:='|';
      if firstline then begin
         st:='0,';
         for i:=1 to index do
          st:=st+inttochar(bits[i]);
         for i:=1 to length(st) do
          resulting[x+15-i,y]:=st[length(st)-i+1];
         showtetrads(tetra,x,y);
         firstline:=false
      end
      else begin
         perenos:=0;
         resulting[x+31,y]:='с';
         resulting[x+32,y]:='д';
         resulting[x+33,y]:='в';
         resulting[x+34,y]:='.';
         for i:=3 downto 1 do begin
            tetra[i]:=tetra[i] shl 1;
            tetra[i]:=tetra[i]+perenos;
            if tetra[i]>15 then perenos:=1
            else perenos:=0;
            tetra[i]:=tetra[i] and 15
         end;
         inc(index);
         bits[index]:=perenos;
         st:='0,';
         for i:=1 to index do
          st:=st+inttochar(bits[i]);
         for i:=1 to length(st) do
          resulting[x+15-i,y]:=st[length(st)-i+1];
         showtetrads(tetra,x,y);
         for i:=1 to 3 do begin
            if tetra[i]>9 then popravka[i]:=true;
            if (i>1)and(tetra[i-1] mod 2=1) then popravka[i]:=true
         end;
         if bits[index]=1 then popravka[1]:=true
      end;
      if not(popravka[1] or popravka[2] or popravka[3]) then begin
         st:='0,';
         for i:=1 to 3 do
          st:=st+inttochar(tetra[i]);
         for i:=1 to length(st) do
          resulting[x+37+i,y]:=st[i];
      end;
      y:=y+1      
   end
   else begin
      resulting[x+15,y]:='|';
      resulting[x+20,y]:='|';
      resulting[x+25,y]:='|';
      resulting[x+30,y]:='|';
      resulting[x+31,y]:='+';
      resulting[x+32,y]:='П';
      current:=tetra[1]*256;
      current:=current+tetra[2]*16;
      current:=current+tetra[3];
      multi:=1;
      totalpopravka:=0;
      for i:=3 downto 1 do begin
         if popravka[i] then totalpopravka:=totalpopravka+6*multi;
         multi:=multi*16
      end;
      current:=totalpopravka+current;
      if current>4095 then bits[index]:=1;
      current:=current and (not 4096);
      tetra[1]:=current div 256;
      current:=current - (current div 256)*256;
      tetra[2]:=current div 16;
      tetra[3]:=current mod 16;
      for i:=1 to 3 do
       if popravka[i] then begin
       resulting[x+(i-1)*5+16,y]:='0';
       resulting[x+(i-1)*5+17,y]:='1';
       resulting[x+(i-1)*5+18,y]:='1';
       resulting[x+(i-1)*5+19,y]:='0'
      end;
      popravka[1]:=false;
      popravka[2]:=false;
      popravka[3]:=false;
      y:=y+1;
      for i:=1 to index+2 do
       resulting[x+15-i,y]:='_';
      st:='|____|____|____|';
      for i:=1 to length(st) do
       resulting[x+14+i,y]:=st[i];
      y:=y+1;
      firstline:=true
   end
end;
resulting[x+15,y]:='|';
resulting[x+20,y]:='|';
resulting[x+25,y]:='|';
resulting[x+30,y]:='|';
resulting[x+13,y]:='+';
resulting[x+14,y]:='1';
resulting[x+16,y]:='о';
resulting[x+17,y]:='к';
resulting[x+18,y]:='р';
resulting[x+19,y]:='.';
y:=y+1;
for i:=1 to 13 do resulting[x+i+1,y]:='_';
for i:=1 to 4 do resulting[x+15+i,y]:='_';
for i:=1 to 4 do resulting[x+20+i,y]:='_';
for i:=1 to 4 do resulting[x+25+i,y]:='_';
resulting[x+15,y]:='|';
resulting[x+20,y]:='|';
resulting[x+25,y]:='|';
resulting[x+30,y]:='|';
y:=y+1;
multi:=1;
current:=0;
for i:=index downto 1 do begin
   current:=current+bits[i]*multi;
   multi:=multi*2
end;
current:=current+1;
moreover:=0;
if current>4095 then moreover:=1;
current:=current and (not 4096);
for i:=11 downto 1 do begin
   bits[i]:=current mod 2;
   current:=current shr 1
end;
resulting[x+15,y]:='|';
resulting[x+20,y]:='|';
resulting[x+25,y]:='|';
resulting[x+30,y]:='|';
st:=inttostr(moreover)+',';
for i:=1 to index do
 st:=st+inttochar(bits[i]);
for i:=1 to length(st) do
 resulting[x+15-i,y]:=st[length(st)-i+1];
OutputResulting(resulting);
st:='[b]->2 = ';
st:=st+inttostr(moreover)+',';
for i:=1 to 10 do
 st:=st+inttochar(bits[i]);
writeout('');
writeout(st);
writeout('')
end;

procedure Calc_2_2;
begin
writeout('2.2) Запись двоичных дробей');
writeout('');
Core5(a,b,false);
end;

procedure Calc_2_3_precache(a,b:word);
begin
writeout('2.3) Произвести операции над числами');
writeout('Запись чисел в ПК, ОК, ДК:');
Core6(a,b,false);
end;

procedure Calc_2_3_a_1;
var ast,bst:string;
begin
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
Core7(ast,bst);
end;

procedure Calc_2_3_a_2;
var ast,bst:string;
begin
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
Core8(ast,bst);
end;

procedure Calc_2_3_b;
var ast,bst:string;
begin
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
Core9(ast,bst);
end;

procedure Calc_2_5;
var pfrac:string;
    ast,bst:string;
    a1,b1,s:integer;
    st,st2,st3,st4:string;
    i:byte;
    whole,frace:string;
    decval:word;

procedure TranslateToDec(binst:string);
var s,big,small:word;
    addst:string;
    st,st2,st3:string;
    i:byte;
begin
addst:='';
writeout('  '+binst+'|1010');
for i:=1 to length(binst) do st2:=st2+' ';
writeout(' -'+st2+'|____');
st:=tobin(frombin(binst) div 10);
st2:='';
for i:=1 to length(binst)-4 do st2:=st2+' ';
if frombin(copy(binst,1,4))>=10 then writeout('  1010'+st2+'|'+st)
else begin
   delete(st2,1,1);
   writeout('   1010'+st2+'|'+st)
end;
st2:='';
for i:=1 to length(binst) do st2:=st2+'_';
writeout('  '+st2+'|');
big:=frombin(binst);
small:=10;
while small<=big do
 small:=small shl 1;
small:=small shr 1;
s:=big-small;
while s>=10 do begin
   st:=tobin(s);
   if frombin(copy(st,1,4))>=10 then begin
      st2:='';
      for i:=1 to length(binst)-length(st) do
       st2:=st2+' ';
      st3:='';
      for i:=1 to length(binst)-length(st2)-4 do
       st3:=st3+' ';
      for i:=5 to length(st) do st[i]:=' ';
      writeout('  '+st2+st+'|');
      writeout(' '+st2+'-    '+st3+'|');
      writeout('  '+st2+'1010'+st3+'|')
   end
   else begin
      st2:='';
      for i:=1 to length(binst)-length(st) do
       st2:=st2+' ';
      st3:='';
      for i:=1 to length(binst)-length(st2)-5 do
       st3:=st3+' ';
      for i:=6 to length(st) do st[i]:=' ';
      writeout('  '+st2+st+'|');
      writeout(' '+st2+'-     '+st3+'|');
      writeout('  '+st2+' '+'1010'+st3+'|')
   end;
   st2:='';
   for i:=1 to length(binst) do st2:=st2+'_';
   writeout('  '+st2+'|');
   small:=10;
   while small<=s do
    small:=small shl 1;
   small:=small shr 1;
   s:=s-small
end;
st:=extendbin(tobin(s),1);
st2:='';
for i:=1 to length(binst)-length(st) do st2:=st2+' ';
writeout('  '+st2+st+'|');
writeout('');
writeout(st+'->2 = '+inttostr(s)+'->10')
end;

procedure OctTranslate(val:word);
var st,st2,st3:string;
    binst:string;
    mus,s,big,small:word;
    i:byte;
begin
binst:=inttostr(tooct(val));
writeout('  '+binst+'|12');
for i:=1 to length(binst) do st2:=st2+' ';
writeout(' -'+st2+'|__');
st:=inttostr(tooct((val div 10)));
mus:=fromoct(strtoint(copy(binst,1,2)));
st2:='';
for i:=1 to length(binst)-2 do
 st2:=st2+' ';
if mus>=10 then writeout('  '+inttostr(tooct((mus div 10)*10))+st2+'|'+st)
else begin
   delete(st2,1,1);
   mus:=fromoct(strtoint(copy(binst,1,3)));
   if (mus div 10)*10>=64 then writeout('  '+inttostr(tooct((mus div 10)*10))+st2+'|'+st)
   else writeout('  '+inttostr(tooct((mus div 10)*10))+st2+'|'+st)
end;
st2:='';
for i:=1 to length(binst) do st2:=st2+'_';
writeout('  '+st2+'|');
big:=val;
small:=0;
while small<=mus do
 small:=small+10;
small:=small-10;
st:=inttostr(tooct(val));
st2:=inttostr(tooct(small));
for i:=1 to length(st)-length(st2) do
 small:=small*8;
s:=big-small;
while s>=10 do begin
   st:=inttostr(tooct(s));
   mus:=fromoct(strtoint(copy(st,1,2)));
   if mus>=10 then begin
      st2:='';
      for i:=1 to length(binst)-length(st) do
       st2:=st2+' ';
      st3:='';
      for i:=1 to length(binst)-length(st2)-2 do
       st3:=st3+' ';
      for i:=3 to length(st) do st[i]:=' ';
      writeout('  '+st2+st+'|');
      writeout(' '+st2+'-  '+st3+'|');
      writeout('  '+st2+inttostr(tooct((mus div 10)*10))+st3+'|')
   end
   else begin
      st2:='';
      for i:=1 to length(binst)-length(st) do
       st2:=st2+' ';
      st3:='';
      for i:=1 to length(binst)-length(st2)-3 do
       st3:=st3+' ';
      for i:=4 to length(st) do st[i]:=' ';
      writeout('  '+st2+st+'|');
      writeout(' '+st2+'-   '+st3+'|');
      mus:=fromoct(strtoint(copy(st,1,3)));
      if (mus div 10)*10>=64 then writeout(' '+st2+' '+inttostr(tooct((mus div 10)*10))+st3+'|')
      else writeout('  '+st2+' '+inttostr(tooct((mus div 10)*10))+st3+'|');
      mus:=fromoct(strtoint(copy(st,1,3)))
   end;
   st2:='';
   for i:=1 to length(binst) do st2:=st2+'_';
   writeout('  '+st2+'|');
   small:=0;
   while small<=mus do
    small:=small+10;
   small:=small-10;
   st:=inttostr(tooct(s));
   st2:=inttostr(tooct(small));
   s:=s-small
end;
st:=inttostr(tooct(s));
st2:='';
for i:=1 to length(binst)-length(st) do st2:=st2+' ';
writeout('  '+st2+st+'|');
writeout('');
writeout(st+'->8 = '+inttostr(fromoct(s))+'->10')
end;

begin
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
a1:=frombin(copy(ast,3,10));
b1:=frombin(copy(bst,3,10));
s:=a1*b1;
writeout('2.5) Перевести двоичное число p1=p*2^10=a1*b1*2^10');
writeout('в десятичное');
writeout('a1 = '+ast);
writeout('b1 = '+bst);
st:='';
for i:=1 to 20 do insert(inttochar(getbit(s,i)),st,1);
st:='0,'+st;
writeout('p = '+ast+'*'+bst+' = '+st);
pfrac:='                    ';
for i:=3 to 22 do pfrac[i-2]:=st[i];
insert(',',pfrac,11);
writeout('p1 = '+pfrac);
whole:='';
for i:=1 to 10 do
 if pfrac[i]='1' then whole:=whole+'1'
 else if whole<>'' then whole:=whole+'0';
frace:='0,';
for i:=12 to 21 do
 if pfrac[i]='1' then frace:=frace+'1'
 else frace:=frace+'0';
writeout('Целая часть '+whole);
writeout('Дробная часть '+frace);
writeout('');
//Bin whole
writeout('Перевод целой части');
writeout('а)непосредственный перевод '+whole+'->2');
decval:=frombin(whole);
while decval>=10 do begin
   st:=tobin(decval);
   writeout('Переводим '+st);
   writeout('');
   translatetodec(st);
   decval:=decval div 10
end;
writeout(tobin(decval)+'->2 = '+inttostr(decval)+'->10');
writeout('');
decval:=frombin(whole);
writeout('Итого: '+whole+'->2 = '+inttostr(decval)+'->10');
writeout('');
//Oct whole
writeout('б)перевод через восьмеричную систему');
st:=whole;
if length(whole) mod 3 <> 0 then st:=extendbin(whole,((length(whole) div 3)+1)*3);
st4:=st;
for i:=1 to (length(st) div 3)-1 do
 insert('-',st,i*3+i);
st2:='';
for i:=1 to length(st4) div 3 do begin
  st3:=copy(st4,(i-1)*3+1,3);
  st2:=st2+inttostr(tooct(frombin(st3)))
end;
writeout(whole+'->2 = ('+st+')2->8 = '+st2+'->8');
decval:=frombin(whole);
while decval>=10 do begin
   st:=inttostr(tooct(decval));
   writeout('Переводим '+st);
   writeout('');
   octtranslate(decval);
   decval:=decval div 10
end;
writeout(inttostr(tooct(decval))+'->8 = '+inttostr(decval)+'->10');
writeout('');
decval:=frombin(whole);
whole:=inttostr(tooct(decval));
writeout('Итого: '+whole+'->8 = '+inttostr(decval)+'->10');
writeout('');
writeout('Перевод дробной части');
Core13(frace);
end;

procedure Calc_2_6;
var ast,bst:string;
begin
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
writeout('2.6) Операции машинного умножения в ДК');
Core10(ast,bst);
end;

procedure Calc_2_7_a;
var ast,bst:string;
begin
writeout('2.7) а) Деление чисел с восстановлением остатков');
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
Core11(ast,bst)
end;

procedure Calc_2_7_b;
var ast,bst:string;
    sign:string;
    st:string;

function Divide(afrac,bfrac:string;showa,showb,showS:string):string;
var st,st2,st3,divided:string;
    bmin,bplus:cardinal;
    i,j:byte;
    s:cardinal;
begin
for i:=1 to 12-length(afrac) do
 afrac:=afrac+'0';
for i:=1 to 12-length(bfrac) do
 bfrac:=bfrac+'0';
writeout('');
st:=bfrac;
st[1]:='1';
st:=inadditcode(st);
delete(st,2,1);
bmin:=frombin(st);
setbit(bmin,12,1);
st:=bfrac;
st:=copy(st,3,10);
bplus:=frombin(st);
afrac:=afrac[1]+afrac;
bfrac:=bfrac[1]+bfrac;
s:=formnumber(afrac);
divided:='';
for j:=1 to 12 do begin
   st:=extendbin(tobin(s),12);
   insert('|',st,3);
   st3:='';
   for i:=1 to 12-length(divided) do
    st3:=st3+' ';
   if j=1 then st:=' '+showa+'        '+st+' СМ    '+st3+divided+'| |';
   if j<>1 then st:='           '+st+' СМ<-  '+st3+divided+'| |Рг '+showS+'<-';
   writeout(st);
   if getbit(s,12)=0 then begin
      st2:=' +[-[b]д]  ';
      st3:=tobin(bmin);
      insert('|',st3,3);
      st2:=st2+st3+'                   | |';
      s:=s+bmin
   end
   else begin
      st2:=' +[b]      ';
      st3:=extendbin(tobin(bplus),12);
      insert('|',st3,3);
      st2:=st2+st3+'                   | |';
      s:=s+bplus
   end;
   writeout(st2);
   writeout('           __|__________                   | |');
   setbit(s,13,0);
   st:=extendbin(tobin(s),12);
   insert('|',st,3);
   st3:='';
   for i:=1 to 12-length(divided) do
    st3:=st3+' ';
   if getbit(s,12)=0 then st2:='1';
   if getbit(s,12)=1 then st2:='0';
   st:='           '+st+' CM    '+st3+divided+'|'+st2+'|';
   divided:=divided+st2;
   writeout(st);
   if j<>12 then writeout('             |                             | |');
   s:=s shl 1;
   setbit(s,13,0)
end;
s:=frombin(divided);
insert(',',divided,2);
writeout('');
writeout(' '+divided);
writeout('            +1 окр.');
writeout('   ___________');
s:=s+1;
st:=extendbin(tobin(s),12);
insert(',',st,2);
writeout(' '+st);
st:=copy(st,1,12);
writeout('');
writeout(showS+' = '+st);
writeout('');
divide:=st
end;

begin
writeout('2.7) б) Деление чисел без восстановления остатков');
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
//C1=a1/b1
st:=Core12(ast,bst);
if ((ast[1]='0')and(bst[1]='0'))or((ast[1]='1')and(bst[1]='1')) then
   sign:='0'
else
   sign:='1';
st[1]:=sign[1];
writeout('2.7) в) Операции над знаками');
writeout('');
writeout('C1 = a1/b1 = '+ast+'/'+bst);
writeout('Знак частного: '+ast[1]+' xor '+bst[1]+' = '+sign);
writeout('C1 = '+st);
writeout('');
//C2=a1/b2
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
bst[1]:='1';
if ((ast[1]='0')and(bst[1]='0'))or((ast[1]='1')and(bst[1]='1')) then
   sign:='0'
else
   sign:='1';
st[1]:=sign[1];
writeout('C2 = a1/b2 = '+ast+'/'+bst);
writeout('Знак частного: '+ast[1]+' xor '+bst[1]+' = '+sign);
writeout('C2 = '+st);
writeout('');
//C3=a2/b1
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
ast[1]:='1';
if ((ast[1]='0')and(bst[1]='0'))or((ast[1]='1')and(bst[1]='1')) then
   sign:='0'
else
   sign:='1';
st[1]:=sign[1];
writeout('C3 = a2/b1 = '+ast+'/'+bst);
writeout('Знак частного: '+ast[1]+' xor '+bst[1]+' = '+sign);
writeout('C3 = '+st);
writeout('');
//C4=a2/b2
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
ast[1]:='1';
bst[1]:='1';
if ((ast[1]='0')and(bst[1]='0'))or((ast[1]='1')and(bst[1]='1')) then
   sign:='0'
else
   sign:='1';
st[1]:=sign[1];
writeout('C4 = a2/b2 = '+ast+'/'+bst);
writeout('Знак частного: '+ast[1]+' xor '+bst[1]+' = '+sign);
writeout('C4 = '+st);
writeout('')
end;

procedure Calc_2_8;
var ast,bst:string;

function FormString(Num:cardinal):string;
var multi:cardinal;
    i:byte;
begin
multi:=1;
i:=1;
result:='';
while multi<=num do begin
   if getbit(num,i)=1 then result:='1'+result
   else result:='0'+result;
   multi:=multi*2;
   i:=i+1
end
end;

procedure DivideInAddit(afrac,bfrac:string;showa,showb,showS:string);
var global:string;
    c:cardinal;
    st:string;
    bplus,bmin:cardinal;
    takt:byte;
    st2:string;
    st3:string;
    i:integer;
    stadd:string;
    r:cardinal;
begin
afrac:=inadditcode(afrac);
bfrac:=inadditcode(bfrac);
writeout(ShowS+' = '+showa+'/'+showb);
writeout('');
global:='';
c:=0;
st:=bfrac;
insert(st[1],st,1);
bplus:=formnumber(st);
st:=bfrac;
if st[1]='1' then st:=inadditcode(st);
if st[1]='1' then st[1]:='0'
else st[1]:='1';
insert(st[1],st,1);
if st[1]='1' then st:=inadditcode(st);
bmin:=formnumber(st);
takt:=1;
writeout('        Рг С');
writeout('   |____________|            |__|__________|');
r:=formnumber(afrac);
repeat
   if takt=1 then begin
      st2:=copy(afrac,3,10);
      writeout('   |            |            |'+afrac[1]+afrac[1]+'|'+st2+'|  CM->r0 = ['+showa+']д')
   end
   else begin
      st:=extendbin(formstring(r),12);
      insert('|',st,3);
      st:='|'+st+'|  r'+inttostr(takt-1);
      writeout('   |            |            '+st)
   end;
   st3:='';
   for i:=12-length(global) downto 1 do
    st3:=st3+' ';
   st:='   |'+st3+global+'| сдв.   "';
   r:=r shl 1;
   setbit(r,13,0);
   st3:=inttochar(getbit(r,12))+inttochar(getbit(r,11));
   if bfrac[1]='0' then begin
      if st3='00' then stadd:='-';
      if st3='01' then stadd:='-';
      if st3='10' then stadd:='+';
      if st3='11' then stadd:='+'
   end
   else begin
      if st3='00' then stadd:='+';
      if st3='01' then stadd:='+';
      if st3='10' then stadd:='-';
      if st3='11' then stadd:='-'
   end;
   st2:=extendbin(formstring(r),12);
   insert('|',st2,3);
   st:=st+stadd+'" |'+st2+'|'+'  2r'+inttostr(takt-1);
   writeout(st);
   c:=c shl 1;
   if stadd='+' then begin
      r:=r+bplus;
      setbit(c,1,0);
      global:=global+'0';
      st3:='';
      for i:=12-length(global) downto 1 do
       st3:=st3+' ';
      if length(global)<=12 then st:='   |'+st3+global+'|            |'
      else st:='  '+global[1]+'|'+copy(global,2,12)+'|            |';
      st2:=extendbin(formstring(bplus),12);
      insert('|',st2,3);
      st2:=st2+'|  +['+showb+']д';
      st:=st+st2
   end
   else begin
      r:=r+bmin;
      setbit(c,1,1);
      global:=global+'1';
      st3:='';
      for i:=12-length(global) downto 1 do
       st3:=st3+' ';
      if length(global)<=12 then st:='   |'+st3+global+'|            |'
      else st:='  '+global[1]+'|'+copy(global,2,12)+'|            |';
      st2:=extendbin(formstring(bmin),12);
      insert('|',st2,3);
      st2:=st2+'|  [-['+showb+']д]д';
      st:=st+st2
   end;
   setbit(r,13,0);
   writeout(st);
   if takt=12 then writeout('   |____________|            |__|__________|')
   else writeout('   |            |            |__|__________|');
   inc(takt)
until takt=13;
writeout('');
insert(',',global,2);
st:=showS+''' = '+global;
writeout(st);
st2:='';
for i:=1 to length(showS) do
 st2:=st2+' ';
st:=st2+'  + 1 попр.';
writeout(st);
writeout(st2+'  _______________');
if global[1]='1' then global[1]:='0'
else global[1]:='1';
writeout(st2+'    '+global);
writeout(st2+'              + 1 окр.');
c:=formnumber(global[1]+global);
c:=c+1;
setbit(c,13,0);
st:=extendbin(formstring(c),12);
insert(',',st,2);
st:=st2+'    '+st+'         ['+shows+']д = '+copy(st,1,12);
writeout(st);
writeout('')
end;

begin
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
writeout('2.8) Операции машинного деления в ДК');
writeout('[a]пк = '+ast);
writeout('[b]пк = '+bst);
writeout('[a1]д = +a = '+ast);
ast[1]:='1';
writeout('[a2]д = -a = '+inadditcode(ast));
writeout('[b1]д = +b = '+bst);
bst[1]:='1';
writeout('[b2]д = -b = '+inadditcode(bst));
writeout('');
writeout('');
//С1=a1*b1
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
DivideInAddit(ast,bst,'a1','b1','C1');
//С2=a1*b2
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
bst[1]:='1';
DivideInAddit(ast,bst,'a1','b2','C2');
//С3=a2*b1
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
ast[1]:='1';
DivideInAddit(ast,bst,'a2','b1','C3');
//С4=a2*b2
ast:='0,'+extendbin(tobin(a),10);
bst:='0,'+tobinfrac(b);
ast[1]:='1';
bst[1]:='1';
DivideInAddit(ast,bst,'a2','b2','C4')
end;

procedure Calc_2_9;
var ast,astaddit,st,stsign:string;
    acurr,lastresult,modifier,wasmodifier:cardinal;
    i,j:byte;
    signwas:byte;
begin
writeout('2.9) Операция извлечения квадратного корня');
writeout('');
ast:='0,'+extendbin(tobin(a),10);
astaddit:=ast;
astaddit[1]:='1';
astaddit:=inadditcode(astaddit);
writeout(' [a1]пк = '+ast);
writeout('[-a1]дк = '+astaddit);
astaddit:='1'+astaddit;
astaddit[3]:='|';
writeout('');
writeout('');
writeout('                |__|__________|');
writeout('                |'+astaddit+'|  CM-> d0=[-a1]д');
acurr:=composenumber(astaddit);
acurr:=acurr shl 17; //29-12=17; 30th bit will be additional for overfulling, 31-st not used
lastresult:=0;
signwas:=1;
//
for i:=1 to 11 do begin
   if signwas=1 then begin
      stsign:='+';
      modifier:=lastresult*4+1;
      wasmodifier:=modifier;
      modifier:=modifier shl (26-i);
      acurr:=acurr+modifier;
      setbit(acurr,30,0)
   end
   else begin
      stsign:='-';
      modifier:=lastresult*4+3;
      wasmodifier:=modifier;
      modifier:=modifier shl (26-i);
      if acurr<modifier then setbit(acurr,30,1);
      acurr:=acurr-modifier
   end;
   //writing fi-1
   st:=extendbin(tobin(wasmodifier),i+1);
   if i<=9 then begin
      for j:=1 to 9-i do st:=st+' ';
      st:=st+'|'
   end
   else insert('|',st,11);
   st:=stsign+'|00|'+st+'  f'+inttostr(i-1)+'''';
   if i<>1 then writeout('    |          '+st)
   else writeout('        Ргf    '+st);
   if i<>1 then writeout('    |           |__|__________|')
   else writeout('    |___________|__|__________|');
   //writing di
   st:='';
   for j:=29 downto 1 do
    st:=st+inttostr(getbit(acurr,j));
   if i>=10 then begin
      delete(st,4+i,26-i);
      insert('|',st,13)
   end
   else begin
      delete(st,13,17);
      st:=st+'|'
   end;
   insert('|',st,3);
   st:='    |           |'+st;
   st:=st+'  d'+inttostr(i);
   writeout(st);
   signwas:=getbit(acurr,28);
   //writing 2di
   st:='';
   acurr:=acurr shl 1;
   lastresult:=lastresult shl 1;
   lastresult:=lastresult+getbit(acurr,30);
   setbit(acurr,30,0);
   for j:=29 downto 1 do
    st:=st+inttostr(getbit(acurr,j));
   if i>=10 then begin
      delete(st,4+i,26-i);
      insert('|',st,13)
   end
   else begin
      delete(st,13,17);
      st:=st+'|'
   end;
   insert('|',st,3);
   st:='|'+st;
   st:=extendbin(tobin(lastresult),i)+st;
   for j:=11-i downto 1 do st:=' '+st;
   st:='    |'+st;
   st:=st+'  2*d'+inttostr(i);
   writeout(st)
end;
writeout('    |___________|__|__________|');
//
writeout('');
writeout('');
st:=extendbin(tobin(lastresult),11);
st:='0,'+st;
st:='    f='+st;
writeout(st);
writeout('                 +1');
writeout('      _____________');
lastresult:=lastresult+1;
st:=extendbin(tobin(lastresult),11);
st:='0,'+st;
writeout('      '+st);
writeout('');
delete(st,length(st),1);
writeout(' fокр='+st);
writeout('')
end;

procedure Calc_2_10;
var ast,bst:string;
    aporst,bporst:string;
    aporznak,bporznak:string;
begin
writeout('ЧИСЛА С ПЛАВАЮЩЕЙ ЗАПЯТОЙ');
writeout('');
writeout('2.10) Формирование чисел A и B');
writeout('');
writeout('a = '+inttostr(a));
writeout('Дополнительные разряды а: '+adda);
ast:=tobin(a);
writeout('a->2 = '+ast);
ast:=extendbin(ast,10);
writeout('Cдвиг на 10 разрядов: [a]->2 = 0,'+ast);
delete(ast,1,1);
ast:=ast+'0';
writeout('Сдвиг влево:                   0,'+ast);
delete(ast,length(ast),1);
writeout('Отбрасывание нуля:             0,'+ast);
ast:=ast+adda;
writeout('Дописываем мантиссу:  |a пл| = 0,'+ast);
rg.a:='0.'+ast;
writeout('');
writeout('b->10 = 0,'+inttostr(b));
writeout('Дополнительные разряды b: '+addb);
bst:=tobinfrac(b);
writeout('[b]->2 = '+bst);
bst:=bst+addb;
writeout('Дописываем мантиссу:   |b пл| = 0,'+bst);
rg.b:='0.'+bst;
writeout('');
ast:='0,'+ast;
bst:='0,'+bst;
if pora>=0 then aporznak:='+'
else aporznak:='-';
if porb>=0 then bporznak:='+'
else bporznak:='-';
pora:=abs(pora);
porb:=abs(porb);
aporst:=extendbin(tobin(pora),4);
bporst:=extendbin(tobin(porb),4);
writeout('П"A" = '+aporznak+inttostr(abs(pora))+'->10 = '+aporznak+aporst+'->2');
writeout('П"B" = '+bporznak+inttostr(abs(porb))+'->10 = '+bporznak+bporst+'->2');
writeout('');
writeout('A1 = 2^'+aporznak+inttostr(pora)+'. (+'+ast+')');
writeout('A2 = 2^'+aporznak+inttostr(pora)+'. (-'+ast+')');
writeout('B1 = 2^'+bporznak+inttostr(porb)+'. (+'+bst+')');
writeout('B2 = 2^'+bporznak+inttostr(porb)+'. (-'+bst+')');
if aporznak='-' then aporznak:='1'
else aporznak:='0';
if bporznak='-' then bporznak:='1'
else bporznak:='0';
writeout('');
delete(ast,1,2);
delete(bst,1,2);
aporst:=aporznak+'.'+aporst;
rg.pa:=aporst;
bporst:=bporznak+'.'+bporst;
rg.pb:=bporst;
writeout('При хранении чисел в прямом коде они будут иметь вид:');
writeout('A1 = '+aporst+'.0.'+ast);
writeout('A2 = '+aporst+'.1.'+ast);
writeout('B1 = '+bporst+'.0.'+bst);
writeout('B2 = '+bporst+'.1.'+bst);
writeout('');
writeout('При хранении чисел в дополнительном коде они будут иметь вид:');
writeout('A1 = '+inadditcode(aporst)+'.'+inadditcode('0.'+ast));
writeout('A2 = '+inadditcode(aporst)+'.'+inadditcode('1.'+ast));
writeout('B1 = '+inadditcode(bporst)+'.'+inadditcode('0.'+bst));
writeout('B2 = '+inadditcode(bporst)+'.'+inadditcode('1.'+bst));
writeout('')
end;

procedure Calc_2_12;
var ast,bst,st:string;
    s:word;

function GetT(num:word;numtet:byte):string;
var t1,t2,t3,t:byte;
begin
t1:=num mod 10;
num:=num div 10;
t2:=num mod 10;
num:=num div 10;
t3:=num mod 10;
t:=0;
case numtet of
   1:t:=t1;
   2:t:=t2;
   3:t:=t3
end;
result:=extendbin(tobin(t),4)
end;

begin
writeout('');
writeout('ОПЕРАЦИИ С ДЕСЯТИЧНЫМИ ЧИСЛАМИ');
writeout('');
writeout('2.12)Представление дробей');
writeout('Запись десятичных дробей');
ast:=inttostr(a);
bst:=inttostr(b);
writeout('|A10| = [a10]*10^-3 = 0,'+ast);
writeout('|B10| = [b10]*10^-3 = 0,'+bst);
writeout('');
writeout('A101 = + |A10| = 0,'+ast);
writeout('A102 = - |A10| = -0,'+ast);
writeout('B101 = + |B10| = 0,'+bst);
writeout('B102 = - |B10| = -0,'+bst);
writeout('');
writeout('A101');
writeout('ПК 0,'+ast);
writeout('ОК 0,'+ast);
writeout('ДК 0,'+ast);
writeout('');
writeout('A102');
writeout('ПК 1,'+ast);
writeout('ОК 1,'+inttostr(999-a));
writeout('ДК 1,'+inttostr(999-a+1));
writeout('');
writeout('B101');
writeout('ПК 0,'+bst);
writeout('ОК 0,'+bst);
writeout('ДК 0,'+bst);
writeout('');
writeout('B102');
writeout('ПК 1,'+bst);
writeout('ОК 1,'+inttostr(999-b));
writeout('ДК 1,'+inttostr(999-b+1));
writeout('');
writeout('Запись дробей в коде 8421');
writeout('A101');
writeout('ПК 0,'+gett(a,3)+' '+gett(a,2)+' '+gett(a,1));
writeout('ОК 0,'+gett(a,3)+' '+gett(a,2)+' '+gett(a,1));
writeout('ДК 0,'+gett(a,3)+' '+gett(a,2)+' '+gett(a,1));
writeout('A102');
writeout('ПК 1,'+gett(a,3)+' '+gett(a,2)+' '+gett(a,1));
st:=gett(a,3)+' '+gett(a,2)+' '+gett(a,1);
s:=composenumber(st);
s:=not s;
setbit(s,16,0);
setbit(s,15,0);
setbit(s,14,0);
setbit(s,13,0);
st:=extendbin(tobin(s),12);
insert(' ',st,5);
insert(' ',st,10);
writeout('ОК 1,'+st);
s:=s+1;
st:=extendbin(tobin(s),12);
insert(' ',st,5);
insert(' ',st,10);
writeout('ДК 1,'+st);
writeout('');
writeout('B101');
writeout('ПК 0,'+gett(b,3)+' '+gett(b,2)+' '+gett(b,1));
writeout('ОК 0,'+gett(b,3)+' '+gett(b,2)+' '+gett(b,1));
writeout('ДК 0,'+gett(b,3)+' '+gett(b,2)+' '+gett(b,1));
writeout('B102');
writeout('ПК 1,'+gett(b,3)+' '+gett(b,2)+' '+gett(b,1));
st:=gett(b,3)+' '+gett(b,2)+' '+gett(b,1);
s:=composenumber(st);
s:=not s;
setbit(s,16,0);
setbit(s,15,0);
setbit(s,14,0);
setbit(s,13,0);
st:=extendbin(tobin(s),12);
insert(' ',st,5);
insert(' ',st,10);
writeout('ОК 1,'+st);
s:=s+1;
st:=extendbin(tobin(s),12);
insert(' ',st,5);
insert(' ',st,10);
writeout('ДК 1,'+st);
writeout('');
writeout('Запись дробей в коде 8421+3');
ast:=tod2(a);
writeout('A101');
writeout('ПК 0,'+ast);
writeout('ДК 0,'+ast);
writeout('ОК 0,'+ast);
writeout('A102');
writeout('ПК 1,'+ast);
ast:='1,'+ast;
ast:=ind2backcode(ast);
writeout('ОК '+ast);
s:=composenumber(ast);
s:=s+1;
ast:=extendbin(tobin(s),13);
delete(ast,1,1);
insert(' ',ast,5);
insert(' ',ast,10);
writeout('ДК 1,'+ast);
writeout('');
bst:=tod2(b);
writeout('B101');
writeout('ПК 0,'+bst);
writeout('ДК 0,'+bst);
writeout('ОК 0,'+bst);
writeout('B102');
writeout('ПК 1,'+bst);
bst:='1,'+bst;
bst:=ind2backcode(bst);
writeout('ОК '+bst);
s:=composenumber(bst);
s:=s+1;
bst:=extendbin(tobin(s),13);
delete(bst,1,1);
insert(' ',bst,5);
insert(' ',bst,10);
writeout('ДК 1,'+bst);
writeout('')
end;

procedure Calc_2_13_2_a;
var ast,bst:string;

procedure GetNewTetrads(ath,bth:word;var t1,t2,t3:word);
var a1,a2,a3,b1,b2,b3,perenos:word;
    i:byte;
begin
a1:=0;
for i:=1 to 4 do
 if getbit(ath,i)=1 then setbit(a1,i,1);
a2:=0;
for i:=1 to 4 do
 if getbit(ath,i+4)=1 then setbit(a2,i,1);
a3:=0;
for i:=1 to 4 do
 if getbit(ath,i+8)=1 then setbit(a3,i,1);
b1:=0;
for i:=1 to 4 do
 if getbit(bth,i)=1 then setbit(b1,i,1);
b2:=0;
for i:=1 to 4 do
 if getbit(bth,i+4)=1 then setbit(b2,i,1);
b3:=0;
for i:=1 to 4 do
 if getbit(bth,i+8)=1 then setbit(b3,i,1);
t1:=a1+b1;
perenos:=getbit(t1,5);
t2:=a2+b2+perenos;
perenos:=getbit(t2,5);
t3:=a3+b3+perenos
end;

function FormPopravkas(var t1,t2,t3:word):string;
var stm:string;
begin
stm:='';
if getbit(t3,5)=0 then begin
   t3:=t3+13;
   stm:=stm+'1101'
end
else begin
   t3:=t3+3;
   stm:=stm+'0011'
end;
setbit(t3,5,0);
setbit(t3,6,0);
stm:=stm+' ';
if getbit(t2,5)=0 then begin
   t2:=t2+13;
   stm:=stm+'1101'
end
else begin
   t2:=t2+3;
   stm:=stm+'0011'
end;
setbit(t2,5,0);
setbit(t2,6,0);
stm:=stm+' ';
if getbit(t1,5)=0 then begin
   t1:=t1+13;
   stm:=stm+'1101'
end
else begin
   t1:=t1+3;
   stm:=stm+'0011'
end;
setbit(t1,5,0);
setbit(t1,6,0);
result:=stm
end;

procedure AddInBackIt(afrac,bfrac:string;showa,showb,showS:string;plus:boolean);
var st:string;
    athere,bthere:cardinal;
    s,swap:cardinal;
    t1,t2,t3:word;
    stm:string;
    mus,mus2:word;
begin
writeout('');
if plus then writeout(ShowS+' = '+showa+' + '+showb)
else writeout(ShowS+' = '+showa+' - '+showb);
writeout('        |__|______________|');
st:=afrac;
st[2]:='|';
writeout(' ОП /   | '+st+'| ['+showa+']дпк');
st:=bfrac;
st[2]:='|';
if plus then stm:=''
else stm:='-';
writeout('    \   | '+st+'| ['+showb+']дпк');
writeout('        |__|______________|');
if not plus then begin
   if bfrac[1]='0' then bfrac[1]:='1'
   else bfrac[1]:='0'
end;
st:=afrac;
st[2]:='|';
writeout(' Рг "A" | '+st+'| ['+showa+']дпк');
st:=bfrac;
st[2]:='|';
writeout(' Рг "B" | '+st+'| ['+stm+showb+']дпк');
writeout(' CM     |00|0011 0011 0011| У "0"');
writeout('        |__|______________|');
st:=ind2backcode(afrac);
st:=st[1]+st;
athere:=composenumber(st);
writeout('       + '+st+'  ['+showa+']док');
st[3]:='|';
writeout('        |__|______________|');
mus:=composenumber(st);
mus2:=composenumber('0011 0011 0011');
getnewtetrads(mus,mus2,t1,t2,t3);
stm:=' СМ     |'+st[1]+st[1]+'|'+extendbin(tobin(t3),4)+' '+extendbin(tobin(t2),4)+' '+extendbin(tobin(t1),4)+'|';
writeout(stm);
writeout('        |__|______________|');
writeout('            1101 1101 1101  + Поправка');
writeout('        |__|______________|');
writeout(' CM     |'+st+'| ['+showa+']док');
writeout('        |__|______________|');
st:=ind2backcode(bfrac);
st:=st[1]+st;
bthere:=composenumber(st);
if plus then writeout('       + '+st+'  ['+showb+']док')
else writeout('       + '+st+'  [-'+showb+']док');
s:=athere+bthere;
swap:=s;
setbit(s,15,0);
st:=extendbin(tobin(s),14);
insert('|',st,3);
insert(' ',st,8);
insert(' ',st,13);
writeout('        |__|______________|');
writeout(' CM     |'+st+'|');
writeout('        |__|______________|');
//ЦП
if getbit(swap,15)=1 then begin
   bthere:=bthere+1;
   writeout('                        +1 ЦП');
   writeout('        |__|______________|');
   s:=s+1;
   setbit(s,15,0);
   st:=extendbin(tobin(s),14);
   insert('|',st,3);
   insert(' ',st,8);
   insert(' ',st,13);
   writeout(' CM     |'+st+'|');
   writeout('        |__|______________|')
end;
//Поправка b
if st[1]=st[2] then begin
   getnewtetrads(athere,bthere,t1,t2,t3);
   stm:=formpopravkas(t1,t2,t3);
   writeout('            '+stm+'  + Поправка');
   writeout('        |__|______________|');
   st:=st[1]+st[2]+'|';
   st:=st+extendbin(tobin(t3),4)+' '+extendbin(tobin(t2),4)+' '+extendbin(tobin(t1),4);
   writeout(' CM     |'+st+'| ['+showS+']док')
end;
//Переполнение или нет
if st[1]<>st[2] then begin
   if st[1]='0' then writeout('    Положительное переполнение')
   else writeout('    Отрицательное переполнение')
end
else begin
   delete(st,1,1);
   st:=fromd2backcode(st);
   st:=' '+st;
   writeout(' ОП     |'+st+'| ['+showS+']дпк');
   writeout('        |__|______________|')
end;
writeout('')
end;

begin
writeout('2.13) Операции сложения и вычитания в коде с избытком 3');
writeout('A = 0,'+inttostr(a));
writeout('B = 0,'+inttostr(b));
ast:='0,'+tod2(a);
writeout('A101 =    '+ast);
ast[1]:='1';
writeout('A102 =    '+ast);
writeout('[A102]о = '+ind2backcode(ast));
bst:='0,'+tod2(b);
writeout('B101 =    '+bst);
bst[1]:='1';
writeout('B102 =    '+bst);
writeout('[B102]о = '+ind2backcode(bst));
writeout('');
writeout('а)Операции в ДОК');
writeout('');
//S1=A101+B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
addinbackit(ast,bst,'A101','B101','S1',true);
//S2=A101+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
bst[1]:='1';
addinbackit(ast,bst,'A101','B102','S2',true);
//S3=A102+B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
addinbackit(ast,bst,'A102','B101','S3',true);
//S4=A102+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
bst[1]:='1';
addinbackit(ast,bst,'A102','B102','S4',true);
//Д1=A101-B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
addinbackit(ast,bst,'A101','B101','Д1',false);
//Д2=A101+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
bst[1]:='1';
addinbackit(ast,bst,'A101','B102','Д2',false);
//Д3=A102+B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
addinbackit(ast,bst,'A102','B101','Д3',false);
//Д4=A102+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
bst[1]:='1';
addinbackit(ast,bst,'A102','B102','Д4',false)
end;

Function InvertDigit(dig : word) : word;
begin
Result:=0;
 case dig of
  0: Result:=15;
  1: Result:=14;
  2: Result:=13;
  3: Result:=12;
  4: Result:=11;
  5: Result:=10;
  6: Result:=9;
  7: Result:=8;
  8: Result:=7;
  9:  Result:=6;
  10: Result:=5;
  11: Result:=4;
  12: Result:=3;
  13: Result:=2;
  14: Result:=1;
  15: Result:=0;
end;
end;

Function GetD1Number(a : integer; IsDK : boolean; var PEREPOLN : boolean): string;
var t1,t2,t3 : word;
    num : word;
begin
Perepoln:=False;
num:=abs(a);
GetTetrades(num,t1,t2,t3);

If a < 0 then
 begin
   t1:=InvertDigit(t1+6);
   t2:=InvertDigit(t2+6);
   t3:=InvertDigit(t3+6);

   If ISDK then
    begin
     t1:=t1+1;
     If t1 > 15 then
        begin
          t1:=t1-15;
          t2:=t2+1;
          if t2 > 15 then
            begin
              t2:=t2-15;
              t3:=t3+1;
              if t3 > 15 then
               begin
                t3:=t3-15;
                Perepoln:=True;
               end;
            end;
        end;
    end;
 end;

Result:=Extendbin(ToBin(t1),4)+' '+Extendbin(ToBin(t2),4)+' '+Extendbin(ToBin(t3),4);
end;

Function GetD1NumberPryamoy(a : integer): string;
var t1,t2,t3 : word;
    num : word;
begin
num:=abs(a);
GetTetrades(num,t1,t2,t3);
Result:=Extendbin(ToBin(t1),4)+' '+Extendbin(ToBin(t2),4)+' '+Extendbin(ToBin(t3),4);
end;

procedure Calc_2_13_1_a;
var ast,bst:string;
    ia,ib : integer;

Function GetSign(a : integer) : string;
begin
 If a < 0 then Result:='1' else Result:='0';
end;

Function FormatD1 (t1,t2,t3 : word) : string;
begin
 If t1 > 15 then t1:=t1-16;
 If t2 > 15 then t2:=t2-16;
 If t3 > 15 then t3:=t3-16;

 Result:=ExtendBin(ToBin(t1),4)+' '+ExtendBin(ToBin(t2),4)+' '+ExtendBin(ToBin(t3),4);
end;

procedure GetTetradesFromNumber(what:cardinal; var t1,t2,t3:word);
begin
t1:=what and $f00;
t1:=t1 shr 8;
t2:=what and $f0;
t2:=t2 shr 4;
t3:=what and $f;
end;

procedure AddInBackIt(a,b : integer; afrac,bfrac:string;showa,showb,showS:string;plus:boolean);
var st:string;
    t1a,t2a,t3a:word;
    t1b,t2b,t3b:word;
    t1r,t2r,t3r:word;
    t1p,t2p,t3p:word;
    t1c,t2c,t3c:word;
    t1m,t2m,t3m:word;
    stm:string;
    Perepoln : boolean;
    rA,rB,rC:Cardinal;

procedure WriteOutSummator(tp:word);
begin
if tp<>0 then writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'|')
else begin
   if (getbit(rC,13)=getBit(rC,14))and(getbit(rC,14)=1) then
    writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']док');
   if (getbit(rC,13)=getBit(rC,14))and(getbit(rC,14)=0) then
    writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']дпк');
   if getbit(rC,13)<>getBit(rC,14) then
    writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'|');
end;
end;

begin
writeout('');
if plus then writeout(ShowS+' = '+showa+' + '+showb)
else writeout(ShowS+' = '+showa+' - '+showb);
writeout('        |__|______________|');
st:=afrac;
st[2]:='|';
writeout(' ОП /   | '+st+'| ['+showa+']дпк');
st:=bfrac;
st[2]:='|';
if plus then stm:=''
else stm:='-';
writeout('    \   | '+st+'| ['+showb+']дпк');
writeout('        |__|______________|');
if not plus then begin
   if bfrac[1]='0' then bfrac[1]:='1'
   else bfrac[1]:='0'
end;

GetTetrades(abs(a),t1a,t2a,t3a);
GetTetrades(abs(b),t1b,t2b,t3b);

st:=afrac;
st[2]:='|';

if not plus then b:=-b;

writeout(' Рг "A" | '+GetSign(a)+'|'+ GetD1NumberPryamoy(a)+'| ['+showa+']дпк');
writeout(' Рг "B" | '+GetSign(b)+'|'+ GetD1NumberPryamoy(b)+'| ['+stm+showb+']дпк');
writeout(' CM     |00|0000 0000 0000| У "0"');
writeout('        |__|______________|');
writeout('       + '+GetSign(a)+GetSign(a)+','+ GetD1Number(a,False,Perepoln)+'| ['+showa+']дoк');
writeout('        |__|______________|');
writeout(' СМ     |'+GetSign(a)+GetSign(a)+'|'+ GetD1Number(a,False,Perepoln)+'| ['+showa+']дoк');
writeout('        |__|______________|');
writeout('       + '+GetSign(b)+GetSign(b)+','+ GetD1Number(b,False,Perepoln)+'| ['+showb+']дoк');

st:=bfrac;
st[2]:='|';


if a < 0 then
begin
t1a:=InvertDigit(t1a+6);
t2a:=InvertDigit(t2a+6);
t3a:=InvertDigit(t3a+6);
end;

if b < 0 then
begin
t1b:=InvertDigit(t1b+6);
t2b:=InvertDigit(t2b+6);
t3b:=InvertDigit(t3b+6);
end;

t1r:=t1a + t1b;
t2r:=t2a + t2b;
t3r:=t3a + t3b;

rA:=t1a*$100+t2a*$10+t3a;
if a<0 then begin
   setbit(rA,13,1);
   setbit(rA,14,1);
end;

rB:=t1b*$100+t2b*$10+t3b;
if b<0 then begin
   setbit(rB,13,1);
   setbit(rB,14,1);
end;

rC:=rA+rB;
GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
t1p:=0;
t2p:=0;
t3p:=0;
if (getbit(t3r,5)=1)or(t3r>9) then t3p:=6;
if (getbit(t2r,5)=1)or(t2r>9) then t2p:=6;
if (getbit(t1r,5)=1)or(t1r>9) then t1p:=6;

writeout('        |__|______________|');
writeoutsummator(t3p);
writeout('        |__|______________|');

if t3p<>0 then begin
   rA:=rC;
   GetTetradesFromNumber(abs(rC),t1m,t2m,t3m);
   if t2m+1>9 then t2p:=6;
   rB:=t3p;
   rC:=rA+rB;
   writeout('                      0110 +Поправка');
   GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
   writeout('        |__|______________|');
   writeoutsummator(t2p);
   writeout('        |__|______________|');
end;

if t2p<>0 then begin
   rA:=rC;
   GetTetradesFromNumber(abs(rC),t1m,t2m,t3m);
   if t1m+1>9 then t1p:=6;
   rB:=t2p*$10;
   rC:=rA+rB;
   writeout('                 0110      +Поправка');
   GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
   writeout('        |__|______________|');
   writeoutsummator(t1p);
   writeout('        |__|______________|');
end;

if t1p<>0 then begin
   rA:=rC;
   rB:=t1p*$100;
   rC:=rA+rB;
   writeout('            0110           +Поправка');
   GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
   writeout('        |__|______________|');
   writeoutsummator(0);
   writeout('        |__|______________|');
end;

GetTetradesFromNumber(rc,t1c,t2c,t3c);
if getbit(rC,13)<>getbit(rC,14) then begin
   if getbit(rc,13)=0 then writeout('   Отрицательное переполнение')
   else writeout('   Положительное переполнение');
   exit
end;
if getbit(rc,13)=1 then begin
   GetTetradesFromNumber(rc,t1c,t2c,t3c);
   t1c:=InvertDigit(t1c+6);
   t2c:=InvertDigit(t2c+6);
   t3c:=InvertDigit(t3c+6);
   writeout('        |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']дпк');
   writeout('        |__|______________|');   
end
else if getbit(rc,15)=1 then begin
   writeout('                        +1 ЦП');
   writeout('        |__|______________|');
   t3c:=t3c+1;
   writeout('        |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']дпк');
   writeout('        |__|______________|');
end;
end;

begin
writeout('2.13) Операции сложения и вычитания в коде 8421');
writeout('A = 0,'+inttostr(a));
writeout('B = 0,'+inttostr(b));
ast:='0,'+tod1(a);
writeout('A101 =    '+ast);
ast[1]:='1';
writeout('A102 =    '+ast);
writeout('[A102]о = '+ind1backcode(ast,a));
bst:='0,'+tod1(b);
writeout('B101 =    '+bst);
bst[1]:='1';
writeout('B102 =    '+bst);
writeout('[B102]о = '+ind1backcode(bst,b));
writeout('');
writeout('а)Операции в ДОК');
writeout('');
//S1=A101+B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ia:=a;
ib:=b;
addinbackit(ia,ib,ast,bst,'A101','B101','S1',true);
//S2=A101+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
bst[1]:='1';
ia:=a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A101','B102','S2',true);
//S3=A102+B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
ia:=-a;
ib:=b;

addinbackit(ia,ib,ast,bst,'A102','B101','S3',true);
//S4=A102+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
bst[1]:='1';
ia:=-a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A102','B102','S4',true);

//Д1=A101-B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ia:=a;
ib:=b;

addinbackit(ia,ib,ast,bst,'A101','B101','Д1',false);
//Д2=A101+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
bst[1]:='1';
ia:=a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A101','B102','Д2',false);
//Д3=A102+B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
ia:=-a;
ib:=b;

addinbackit(ia,ib,ast,bst,'A102','B101','Д3',false);
//Д4=A102+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
bst[1]:='1';
ia:=-a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A102','B102','Д4',false);
writeout('');
writeout('');
end;


procedure Calc_2_13_1_b;
var ast,bst:string;
    ia,ib : integer;

procedure GetTetradesFromNumber(what:cardinal; var t1,t2,t3:word);
begin
t1:=what and $f00;
t1:=t1 shr 8;
t2:=what and $f0;
t2:=t2 shr 4;
t3:=what and $f;
end;

Function GetSign(a : integer) : string;
begin
 If a < 0 then Result:='1' else Result:='0';
end;

Function FormatD1 (t1,t2,t3 : word) : string;
begin
 If t1 > 15 then t1:=t1-16;
 If t2 > 15 then t2:=t2-16;
 If t3 > 15 then t3:=t3-16;

 Result:=ExtendBin(ToBin(t1),4)+' '+ExtendBin(ToBin(t2),4)+' '+ExtendBin(ToBin(t3),4);
end;

procedure AddInBackIt(a,b : integer; afrac,bfrac:string;showa,showb,showS:string;plus:boolean);
var st:string;
    t1a,t2a,t3a:word;
    t1b,t2b,t3b:word;
    t1r,t2r,t3r:word;
    t1p,t2p,t3p:word;
    t1c,t2c,t3c:word;
    t1m,t2m,t3m:word;
    stm:string;
    rA,rB,rC:Cardinal;

procedure WriteOutSummator(tp:word);
begin
if tp<>0 then writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'|')
else begin
   if (getbit(rC,13)=getBit(rC,14))and(getbit(rC,14)=1) then
    writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']ддк');
   if (getbit(rC,13)=getBit(rC,14))and(getbit(rC,14)=0) then
    writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']дпк');
   if getbit(rC,13)<>getBit(rC,14) then
    writeout(' СМ     |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'|');
end;
end;

begin
writeout('');
if plus then writeout(ShowS+' = '+showa+' + '+showb)
else writeout(ShowS+' = '+showa+' - '+showb);
writeout('        |__|______________|');
st:=afrac;
st[2]:='|';
writeout(' ОП /   | '+st+'| ['+showa+']дпк');
st:=bfrac;
st[2]:='|';
if plus then stm:=''
else stm:='-';
writeout('    \   | '+st+'| ['+showb+']дпк');
writeout('        |__|______________|');
if not plus then begin
   if bfrac[1]='0' then bfrac[1]:='1'
   else bfrac[1]:='0'
end;

GetTetrades(abs(a),t1a,t2a,t3a);
GetTetrades(abs(b),t1b,t2b,t3b);

st:=afrac;
st[2]:='|';

if not plus then b:=-b;

if a < 0 then
begin
t3a:=10-t3a;
if t3a=10 then begin
   t3a:=0;
   t2a:=t2a+1;
   if t2a=10 then begin
      t2a:=0;
      t1a:=t1a+1;
   end;
end;
t2a:=InvertDigit(t2a+6);
t1a:=InvertDigit(t1a+6);
end;

if b < 0 then
begin
t3b:=10-t3b;
if t3b=10 then begin
   t3b:=0;
   t2b:=t2b+1;
   if t2b=10 then begin
      t2b:=0;
      t1b:=t1b+1;
   end;
end;
t2b:=InvertDigit(t2b+6);
t1b:=InvertDigit(t1b+6);
end;

writeout(' Рг "A" | '+GetSign(a)+'|'+ GetD1NumberPryamoy(a)+'| ['+showa+']дпк');
writeout(' Рг "B" | '+GetSign(b)+'|'+ GetD1NumberPryamoy(b)+'| ['+stm+showb+']дпк');
writeout(' CM     |00|0000 0000 0000| У "0"');
writeout('        |__|______________|');
writeout('       + '+GetSign(a)+GetSign(a)+','+ FormatD1(t1a,t2a,t3a)+'| ['+showa+']ддк');
writeout('        |__|______________|');
writeout(' СМ     |'+GetSign(a)+GetSign(a)+'|'+ FormatD1(t1a,t2a,t3a)+'| ['+showa+']ддк');
writeout('        |__|______________|');
writeout('       + '+GetSign(b)+GetSign(b)+','+ FormatD1(t1b,t2b,t3b)+'| ['+showb+']ддк');

st:=bfrac;
st[2]:='|';

t1r:=t1a + t1b;
t2r:=t2a + t2b;
t3r:=t3a + t3b;

rA:=t1a*$100+t2a*$10+t3a;
if a<0 then begin
   setbit(rA,13,1);
   setbit(rA,14,1);
end;

rB:=t1b*$100+t2b*$10+t3b;
if b<0 then begin
   setbit(rB,13,1);
   setbit(rB,14,1);
end;

rC:=rA+rB;
GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
t1p:=0;
t2p:=0;
t3p:=0;
if (getbit(t3r,5)=1)or(t3r>9) then t3p:=6;
if (getbit(t2r,5)=1)or(t2r>9) then t2p:=6;
if (getbit(t1r,5)=1)or(t1r>9) then t1p:=6;

writeout('        |__|______________|');
writeoutsummator(t3p);
writeout('        |__|______________|');

if getbit(rC,13)<>getbit(rC,14) then begin
   if getbit(rc,13)=0 then writeout('   Отрицательное переполнение')
   else writeout('   Положительное переполнение');
   exit
end;

if t3p<>0 then begin
   rA:=rC;
   GetTetradesFromNumber(abs(rC),t1m,t2m,t3m);
   if t2m+1>9 then t2p:=6;
   rB:=t3p;
   rC:=rA+rB;
   writeout('                      0110 +Поправка');
   GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
   writeout('        |__|______________|');
   writeoutsummator(t2p);
   writeout('        |__|______________|');
end;

if t2p<>0 then begin
   rA:=rC;
   GetTetradesFromNumber(abs(rC),t1m,t2m,t3m);
   if t1m+1>9 then t1p:=6;
   rB:=t2p*$10;
   rC:=rA+rB;
   writeout('                 0110      +Поправка');
   GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
   writeout('        |__|______________|');
   writeoutsummator(t1p);
   writeout('        |__|______________|');
end;

if t1p<>0 then begin
   rA:=rC;
   rB:=t1p*$100;
   rC:=rA+rB;
   writeout('            0110           +Поправка');
   GetTetradesFromNumber(abs(rC),t1c,t2c,t3c);
   writeout('        |__|______________|');
   writeoutsummator(0);
   writeout('        |__|______________|');
end;

GetTetradesFromNumber(rc,t1c,t2c,t3c);
if getbit(rC,13)<>getbit(rC,14) then begin
   if getbit(rc,13)=0 then writeout('   Отрицательное переполнение')
   else writeout('   Положительное переполнение');
   exit
end;
if getbit(rc,13)=1 then begin
   GetTetradesFromNumber(rc,t1c,t2c,t3c);
   try
      t1c:=9-t1c;
      t2c:=9-t2c;
      t3c:=10-t3c;
   except
      writeout('EXCEPT!');
   end;      
   writeout('        |'+tobin(getbit(rc,14))+tobin(getbit(rc,13))+'|'+FormatD1(t1c,t2c,t3c)+'| ['+ShowS+']дпк');
   writeout('        |__|______________|');
end;
end;

begin
writeout('б) Операции в ДДК');
writeout('');
//S1=A101+B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ia:=a;
ib:=b;
addinbackit(ia,ib,ast,bst,'A101','B101','S1',true);
//S2=A101+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
bst[1]:='1';
ia:=a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A101','B102','S2',true);
//S3=A102+B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
ia:=-a;
ib:=b;

addinbackit(ia,ib,ast,bst,'A102','B101','S3',true);
//S4=A102+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
bst[1]:='1';
ia:=-a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A102','B102','S4',true);

//Д1=A101-B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ia:=a;
ib:=b;

addinbackit(ia,ib,ast,bst,'A101','B101','Д1',false);
//Д2=A101+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
bst[1]:='1';
ia:=a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A101','B102','Д2',false);
//Д3=A102+B101
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
ia:=-a;
ib:=b;

addinbackit(ia,ib,ast,bst,'A102','B101','Д3',false);
//Д4=A102+B102
ast:='0,'+tod1(a);
bst:='0,'+tod1(b);
ast[1]:='1';
bst[1]:='1';
ia:=-a;
ib:=-b;

addinbackit(ia,ib,ast,bst,'A102','B102','Д4',false)
end;




procedure Calc_2_13_2_b;
var ast,bst:string;

procedure GetNewTetrads(ath,bth:word;var t1,t2,t3:word);
var a1,a2,a3,b1,b2,b3,perenos:word;
    i:byte;
begin
a1:=0;
for i:=1 to 4 do
 if getbit(ath,i)=1 then setbit(a1,i,1);
a2:=0;
for i:=1 to 4 do
 if getbit(ath,i+4)=1 then setbit(a2,i,1);
a3:=0;
for i:=1 to 4 do
 if getbit(ath,i+8)=1 then setbit(a3,i,1);
b1:=0;
for i:=1 to 4 do
 if getbit(bth,i)=1 then setbit(b1,i,1);
b2:=0;
for i:=1 to 4 do
 if getbit(bth,i+4)=1 then setbit(b2,i,1);
b3:=0;
for i:=1 to 4 do
 if getbit(bth,i+8)=1 then setbit(b3,i,1);
t1:=a1+b1;
perenos:=getbit(t1,5);
t2:=a2+b2+perenos;
perenos:=getbit(t2,5);
t3:=a3+b3+perenos
end;

function FormPopravkas(var t1,t2,t3:word):string;
var stm:string;
begin
stm:='';
if getbit(t3,5)=0 then begin
   t3:=t3+13;
   stm:=stm+'1101'
end
else begin
   t3:=t3+3;
   stm:=stm+'0011'
end;
setbit(t3,5,0);
setbit(t3,6,0);
stm:=stm+' ';
if getbit(t2,5)=0 then begin
   t2:=t2+13;
   stm:=stm+'1101'
end
else begin
   t2:=t2+3;
   stm:=stm+'0011'
end;
setbit(t2,5,0);
setbit(t2,6,0);
stm:=stm+' ';
if getbit(t1,5)=0 then begin
   t1:=t1+13;
   stm:=stm+'1101'
end
else begin
   t1:=t1+3;
   stm:=stm+'0011'
end;
setbit(t1,5,0);
setbit(t1,6,0);
result:=stm
end;

procedure AddInAdditIt(afrac,bfrac:string;showa,showb,showS:string;plus:boolean);
var st:string;
    athere,bthere:cardinal;
    s:cardinal;
    t1,t2,t3:word;
    stm,stsave:string;
    mus,mus2:word;
begin
writeout('');
if plus then writeout(ShowS+' = '+showa+' + '+showb)
else writeout(ShowS+' = '+showa+' - '+showb);
writeout('        |__|______________|');
st:=afrac;
st[2]:='|';
writeout(' ОП /   | '+st+'| ['+showa+']дпк');
st:=bfrac;
st[2]:='|';
writeout('    \   | '+st+'| ['+showb+']дпк');
writeout('        |__|______________|');
if not plus then begin
   if bfrac[1]='0' then bfrac[1]:='1'
   else bfrac[1]:='0'
end;
st:=afrac;
st[2]:='|';
writeout(' Рг "A" | '+st+'| ['+showa+']дпк');
st:=bfrac;
st[2]:='|';
if plus then stm:=''
else stm:='-';
writeout(' Рг "B" | '+st+'| ['+stm+showb+']дпк');
writeout(' CM     |00|0011 0011 0011| У "0"');
writeout('        |__|______________|');
st:=ind2backcode(afrac);
st:=st[1]+st;
if st[1]='0' then writeout('       + '+st+'  ['+showa+']ддк')
else writeout('       + '+st+'  ['+showa+']док');
st[3]:='|';
stsave:=st;
writeout('        |__|______________|');
athere:=composenumber(st);
mus:=composenumber(st);
mus2:=composenumber('0011 0011 0011');
getnewtetrads(mus,mus2,t1,t2,t3);
st:=st[1]+st[1]+'|'+extendbin(tobin(t3),4)+' '+extendbin(tobin(t2),4)+' '+extendbin(tobin(t1),4);
writeout(' СМ     |'+st+'|');
writeout('        |__|______________|');
//Поправка к A
writeout('            1101 1101 1101  + Поправка');
writeout('        |__|______________|');
writeout(' CM     |'+stsave+'| ['+showa+']ддк');
writeout('        |__|______________|');
st:=stsave;
//+1 для отрицательного A
if afrac[1]='1' then begin
   writeout('                       + 1 ДК');
   stm:=copy(st,length(st)-3,4);
   mus:=frombin(stm);
   mus:=mus+1;
   setbit(mus,5,0);
   stm:=extendbin(tobin(mus),4);
   delete(st,length(st)-3,4);
   insert(stm,st,length(st)+1);
   writeout('        |__|______________|');
   writeout(' CM     |'+st+'|');
   writeout('        |__|______________|');
   athere:=athere+1
end;
//+B
st:=ind2backcode(bfrac);
st:=st[1]+st;
if plus then stm:=''
else stm:='-';
if st[1]='0' then writeout('       + '+st+'  ['+stm+showb+']ддк')
else writeout('       + '+st+'  ['+stm+showb+']док');
bthere:=composenumber(st);
//s=athere+bthere
s:=athere+bthere;
setbit(s,15,0);
st:=extendbin(tobin(s),14);
insert('|',st,3);
insert(' ',st,8);
insert(' ',st,13);
writeout('        |__|______________|');
writeout(' CM     |'+st+'|');
writeout('        |__|______________|');
//Поправка b
if st[1]=st[2] then begin
   getnewtetrads(athere,bthere,t1,t2,t3);
   stm:=formpopravkas(t1,t2,t3);
   writeout('            '+stm+'  + Поправка');
   writeout('        |__|______________|');
   st:=st[1]+st[2]+'|';
   st:=st+extendbin(tobin(t3),4)+' '+extendbin(tobin(t2),4)+' '+extendbin(tobin(t1),4);
   writeout(' CM     |'+st+'| ['+showS+']ддк');
   writeout('        |__|______________|')
end;
//+1 для отрицательного B
if (st[1]=st[2])and(bfrac[1]='1') then begin
   writeout('                        +1 ДК');
   stm:=copy(st,length(st)-3,4);
   mus:=frombin(stm);
   mus:=mus+1;
   stm:=extendbin(tobin(mus),4);
   delete(st,length(st)-3,4);
   insert(stm,st,length(st)+1);
   writeout('        |__|______________|');
   writeout(' СМ     |'+st+'|');
   writeout('        |__|______________|')
end;
//Переполнение или нет
if st[1]<>st[2] then begin
   if st[1]='0' then writeout('    Положительное переполнение')
   else writeout('    Отрицательное переполнение')
end
else begin
   //Перевод отрицательного числа
   if st[1]='1' then begin
      writeout('      +  11,1111 1111 1111   [-2^(-n)]дк');
      s:=composenumber(st);
      s:=s-1;
      writeout('        |__|______________|');
      st:=extendbin(tobin(s),14);
      insert('|',st,3);
      insert(' ',st,8);
      insert(' ',st,13);
      writeout(' CM     |'+st+'| ['+showS+']док')
   end;
   delete(st,1,1);
   st:=fromd2backcode(st);
   st:=' '+st;
   writeout(' ОП     |'+st+'| ['+showS+']дпк');
   writeout('        |__|______________|')
end;
writeout('')
end;

begin
writeout('б)Операции в ДДК');
writeout('');
//S1=A101+B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
addinadditit(ast,bst,'A101','B101','S1',true);
//S2=A101+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
bst[1]:='1';
addinadditit(ast,bst,'A101','B102','S2',true);
//S3=A102+B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
addinadditit(ast,bst,'A102','B101','S3',true);
//S4=A102+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
bst[1]:='1';
addinadditit(ast,bst,'A102','B102','S4',true);
//Д1=A101-B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
addinadditit(ast,bst,'A101','B101','Д1',false);
//Д2=A101+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
bst[1]:='1';
addinadditit(ast,bst,'A101','B102','Д2',false);
//Д3=A102+B101
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
addinadditit(ast,bst,'A102','B101','Д3',false);
//Д4=A102+B102
ast:='0,'+tod2(a);
bst:='0,'+tod2(b);
ast[1]:='1';
bst[1]:='1';
addinadditit(ast,bst,'A102','B102','Д4',false)
end;

function Calc_Zaoch_8_3(ast:string):real;
var i:byte;
    st:string;
    mulnow:real;
    total:real;
begin
writeout('в) использование степенного ряда');
writeout('');
writeout('В соответствии с весом каждого разряда из двоичного числа '+ast);
writeout('получаем десятичное [n]->10:');
st:='';
for i:=1 to 5 do
 st:=st+ast[i+2]+'*(0.5)^'+inttostr(i)+' + ';
writeout('[n]->10= '+st);
st:='';
for i:=6 to 10 do
 st:=st+' + '+ast[i+2]+'*(0.5)^'+inttostr(i);//+' = ';
writeout(st);
mulnow:=0.5;
total:=0;
for i:=1 to 10 do begin
   total:=total+mulnow*strtoint(ast[i+2]);
   mulnow:=mulnow*0.5;
end;
writeout(' = '+floattostrf(total,ffGeneral,17,17));
writeout('');
writeout('');
result:=total;
end;

procedure Zaoch_1;
begin
writeout('1) Перевод целых чисел');
writeout('Переводим [a]->10 = '+inttostr(a));
writeout('');
Core1(a);
Core2(a);
writeout('Переводим [b]->10 = '+inttostr(b));
writeout('');
Core1(b);
Core2(b);
writeout('');
writeout('');
end;

procedure Zaoch_2;
begin
writeout('2) Перевод дробных чисел');
writeout('Дробное [a*0,001]->10 = 0,'+inttostr(a));
writeout('');
Core3(a);
Core4(a);
writeout('Дробное [b*0,001]->10 = 0,'+inttostr(b));
writeout('');
Core3(b);
Core4(b);
writeout('В результате перевода и округления получились числа для записи');
writeout('в ячейку машины с фиксированным числом разрядов n=10.');
writeout('Диапазон представления чисел: от 1.1111111111 до 0.1111111111,');
writeout('то есть от -2+1*2^(-10) до +2-1*2^(-10).');
writeout('Точность представления числа: 1*2^(-11)');
writeout('');
writeout('');
writeout('');
end;

procedure Zaoch_3;
begin
writeout('3) Запись чисел в ПК, ОК, ДК, МК');
Core5(a,b,true);
Core6(a,b,true);
writeout('');
writeout('');
end;

procedure Zaoch_4;
var ast,bst:string;
begin
writeout('4) Операция сложения в различных кодах');
writeout('');
ast:='0,'+tobinfrac(a);
bst:='0,'+tobinfrac(b);
Core7(ast,bst);
Core8(ast,bst);
Core9(ast,bst);
writeout('');
writeout('');
end;

procedure Zaoch_5_2;
var ast,bst:string;
begin
ast:='0,'+tobinfrac(a);
bst:='0,'+tobinfrac(b);
writeout('');
writeout('Умножение в дополнительном коде');
writeout('');
Core10(ast,bst);
end;

procedure Zaoch_6;
var ast,bst:string;
begin
ast:='0,'+tobinfrac(a);
bst:='0,'+tobinfrac(b);
writeout('6) Деление дробей');
writeout('Деление с восстановлением остатков');
Core11(ast,bst);
writeout('Деление без восстановления остатков');
Core12(ast,bst);
writeout('');
writeout('');
end;

procedure Zaoch_8;
begin
writeout('8) Перевод результатов операций');
writeout('');
//+
writeout('Перевод вычитания(сложения) b1-a1 = '+res[B1_MINUS_A1].bin);
writeout('');
Core13(res[B1_MINUS_A1].bin);
res[B1_MINUS_A1].real:=Calc_Zaoch_8_3(res[B1_MINUS_A1].bin);
//*
writeout('Перевод умножения a1*b1 = '+res[A1_MUL_B1].bin);
writeout('');
Core13(res[A1_MUL_B1].bin);
res[A1_MUL_B1].real:=Calc_Zaoch_8_3(res[A1_MUL_B1].bin);
//div
writeout('Перевод деления a1/b1 = '+res[A1_DIV_B1].bin);
writeout('');
Core13(res[A1_DIV_B1].bin);
res[A1_DIV_B1].real:=Calc_Zaoch_8_3(res[A1_DIV_B1].bin);
end;

procedure Zaoch_9;
var ast,bst:string;
    a1,b1,s:real;
begin
writeout('9) Проверка операций при помощи десятичного кода');
writeout('');
a1:=a/1000;
b1:=b/1000;
ast:=floattostrf(a1,ffGeneral,7,5);
bst:=floattostrf(b1,ffGeneral,7,5);
writeout('Операнды:');
writeout('a = '+ast);
writeout('b = '+bst);
writeout('');
writeout('');
writeout('Проверка сложения (вычитания)');
s:=b1-a1;
writeout('b - a = '+floattostrf(s,ffGeneral,7,5));
writeout('Вышло в двоичном: '+floattostrf(res[B1_MINUS_A1].real,ffGeneral,7,5));
writeout('');
writeout('Проверка умножения');
s:=a1*b1;
writeout('a*b = '+floattostrf(s,ffGeneral,7,5));
writeout('Вышло в двоичном: '+floattostrf(res[A1_MUL_B1].real,ffGeneral,7,5));
writeout('');
writeout('Проверка деления');
s:=a1/b1;
writeout('a/b = '+floattostrf(s,ffGeneral,7,5));
writeout('Вышло в двоичном: '+floattostrf(res[A1_DIV_B1].real,ffGeneral,7,5));
writeout('');
writeout('Ошибка обусловлена двумя причинами: конечностью разрядов в разрядной сетке,');
writeout('из-за чего теряются младшие разряды, и погрешностью при переходе из десятичной');
writeout('системы в двоичную.');
writeout('');
end;

initialization
res[B1_MINUS_A1].bin:='0.0000000000';
res[A1_MUL_B1].bin:='0.0000000000';
res[A1_DIV_B1].bin:='0.0000000000';

end.
