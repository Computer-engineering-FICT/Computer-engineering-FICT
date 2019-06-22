unit MyTables;
//==============================================================================
interface
uses
 GrafUnit, ElementUnit, Windows, Messages, SysUtils, IdGlobal, Math;
type
 tRazm = array[1..3] of array of string;
 tPereh = array of array of string;
 tRezPereh = array of array of string;
//==============================================================================
 TTables = class
 private
  graf:TGraf;
  kind:byte;
  razmetka:tRazm;
  mera:byte;
  pereh:tPereh;
  ygreks:array of string;
  xs:array of string;
  triggerType:byte;
  procedure miliRazm;
  procedure muraRazm;
  procedure miliPereh;
  procedure muraPereh;
  procedure getYgreks;
  procedure getXs;
  procedure trigger;
  procedure trigRS;
  procedure trigJK;
  procedure trigD;
  procedure trigT;
 public
  rezPereh:tRezPereh;
  constructor Create;
  procedure putGraf(value:TGraf);
  procedure delGraf;
  procedure setKind(val:byte);
  function  getPerehTable(trgType:byte):tRezPereh;
  function  getKind:Byte;
  function  razmGraf:tRazm;
  function  getFCol:Integer;
  function  getXCol:Integer;
 end;
implementation
//==============================================================================
constructor TTables.Create;
begin
 inherited Create
end;
//==============================================================================
procedure TTables.putGraf(value:TGraf);
begin
 graf:=value
end;
//==============================================================================
procedure TTables.delGraf;
begin
 graf.Destroy
end;
//==============================================================================
procedure TTables.setKind(val:Byte);
begin
 kind:=val
end;
//==============================================================================
function TTables.getKind:Byte;
begin
 result:=kind
end;
//==============================================================================
function TTables.razmGraf:tRazm;
begin
 if kind=0 then miliRazm else muraRazm;
 result:=razmetka
end;
//==============================================================================
procedure TTables.muraRazm;
var
 i:Integer;
 str:String;
 col:Byte;
 ost:Real;
begin
 col:=0;
 SetLength(razmetka[1],1);
 SetLength(razmetka[2],1);
 SetLength(razmetka[3],1);
 for i:=1 to Length(graf.points)-1 do
  if graf.points[i] is TBeginPoint then
   begin
    razmetka[1,col]:=graf.points[i].FLabel.Caption;
    razmetka[2,col]:=' a0';
    razmetka[3,col]:=IntToBin(0);
    break
   end;
 inc(col);
 for i:=1 to Length(graf.points)-1 do
  if graf.points[i] is TOperPoint then
   begin
    SetLength(razmetka[1],col+1);
    SetLength(razmetka[2],col+1);
    SetLength(razmetka[3],col+1);
    razmetka[1,col]:=graf.points[i].FLabel.Caption;
    razmetka[2,col]:=' a'+IntToStr(col);
    razmetka[3,col]:=IntToBin(col);
    inc(col)
   end;
 for i:=1 to Length(graf.points)-1 do
  if graf.points[i] is TEndPoint then
   begin
    SetLength(razmetka[1],col+1);
    SetLength(razmetka[2],col+1);
    SetLength(razmetka[3],col+1);
    razmetka[1,col]:=graf.points[i].FLabel.Caption;
    razmetka[2,col]:=' a0';
    razmetka[3,col]:=IntToBin(0);
    break
   end;
 ost:=Frac(log2(length(razmetka[1])-1));
 mera:=Trunc(log2(length(razmetka[1])-1));
 if ost <> 0 then inc(mera);
 for i:=0 to length(razmetka[1])-1 do
  begin
   str:=razmetka[3,i];
   razmetka[3,i]:=copy(str,length(str)-mera+1,mera)
  end
end;
//==============================================================================
procedure TTables.miliRazm;
var
 i,j,numBeg,afterBeg:Integer;
 str:String;
 col:Byte;
 ost:Real;
 fl:Boolean;
begin
 col:=0;
 SetLength(razmetka[1],0);
 SetLength(razmetka[2],0);
 SetLength(razmetka[3],0);
 SetLength(razmetka[1],1);
 SetLength(razmetka[2],1);
 SetLength(razmetka[3],1);
 for i:=1 to Length(graf.points)-1 do
  if graf.points[i] is TBeginPoint then
   begin
    numBeg:=StrToInt(graf.points[i].FLabel.Caption);
    break
   end;
 for i:=1 to length(graf.mLinks[1])-1 do
  if graf.mLinks[1,i] = numBeg then
   begin
    afterBeg:=graf.mLinks[2,i];
    break
   end;
 razmetka[1,col]:=IntToStr(afterBeg);
 razmetka[2,col]:=' a0';
 razmetka[3,col]:=IntToBin(0);
 inc(col);
 for j:=1 to length(graf.mLinks[1])-1 do
  begin
   if graf.points[j] is TOperPoint then
    if not(graf.points[graf.mLinks[2,j]] is TEndPoint) then
     begin
      fl:=false;
      for i:=0 to length(razmetka[1])-1 do
       if razmetka[1,i] = graf.points[graf.mLinks[2,j]].FLabel.Caption then
        fl:=true;
      if not fl then
       begin
        SetLength(razmetka[1],col+1);
        SetLength(razmetka[2],col+1);
        SetLength(razmetka[3],col+1);
        razmetka[1,col]:=graf.points[graf.mLinks[2,j]].FLabel.Caption;
        razmetka[2,col]:=' a'+IntToStr(col);
        razmetka[3,col]:=IntToBin(col);
        inc(col)
       end
     end
  end;
 for i:=1 to Length(graf.points)-1 do
  if graf.points[i] is TEndPoint then
   begin
    numBeg:=StrToInt(graf.points[i].FLabel.Caption);
    break
   end;
 SetLength(razmetka[1],col+1);
 SetLength(razmetka[2],col+1);
 SetLength(razmetka[3],col+1);
 razmetka[1,col]:=IntToStr(numBeg);
 razmetka[2,col]:=' a0';
 razmetka[3,col]:=IntToBin(0);
 ost:=Frac(log2(length(razmetka[1])-1));
 mera:=Trunc(log2(length(razmetka[1])-1));
 if ost <> 0 then inc(mera);
 for i:=0 to length(razmetka[1])-1 do
  begin
   str:=razmetka[3,i];
   razmetka[3,i]:=copy(str,length(str)-mera+1,mera)
  end
end;
//==============================================================================
function TTables.getPerehTable(trgType:byte):tRezPereh;
begin
 triggerType:=trgType;
 if kind=0 then miliPereh else muraPereh;
 result:=rezPereh
end;
//==============================================================================
procedure TTables.miliPereh;
var
 perehCol,i,j,k,l,m,n,pos,pos1,pos2:Integer;
 tRes:TArrArrInt;
 fl:Boolean;
 str,el:String;
begin
 miliRazm;
 getYgreks;
 getXs;
 perehCol:=0;
 SetLength(pereh,0);
 for i:=0 to length(razmetka[1])-1 do
  for j:=0 to length(razmetka[1])-1 do
   if razmetka[1,i]<>razmetka[1,j] then
    begin
     SetLength(tRes,0);
     tRes:=Graf.getWaysBetween(StrToInt(razmetka[1,i]),StrToInt(razmetka[1,j]));
     for k:=0 to length(tRes)-1 do
      begin
       fl:=false;
       for l:=0 to length(tRes[k])-1 do
        for m:=0 to length(razmetka[1])-1 do
         if (tRes[k,l]=StrToInt(razmetka[1,m]))and(m<>i)and(m<>j) then fl:=true;
       if not fl then
        begin
         inc(perehCol);
         SetLength(pereh,perehCol);
         SetLength(pereh[perehCol-1],length(tRes[k])-1);
         for m:=0 to length(tRes[k])-2 do
          pereh[perehCol-1,m]:=IntToStr(tRes[k,m])
        end
      end
    end
   else
    begin
     m:=graf.isLinkBegEnd;
     for m:=0 to length(graf.cycles)-1 do
      if razmetka[1,i] = IntToStr(graf.cycles[m,1]) then
       begin
        fl:=false;
        for l:=0 to length(graf.cycles)-1 do
         for n:=0 to length(razmetka[1])-1 do
          if (graf.cycles[m,l]=StrToInt(razmetka[1,n]))and(n<>i) then fl:=true;
        if not fl then
         begin
          inc(perehCol);
          SetLength(pereh,perehCol);
          SetLength(pereh[perehCol-1],3);
          pereh[perehCol-1,0]:=IntToStr(graf.cycles[m,1]);
          pereh[perehCol-1,1]:=IntToStr(graf.cycles[m,0]);
          pereh[perehCol-1,2]:=IntToStr(graf.cycles[m,1]);
         end
       end
    end;
 SetLength(rezPereh,0);
 SetLength(rezPereh,perehCol+1);
 k:=1;
 for i:=0 to perehCol do SetLength(rezPereh[i],4+length(ygreks)+length(xs));
 for i:=0 to length(rezPereh)-1 do
  for j:=4+length(xs) to length(rezPereh[i])-1 do rezPereh[i,j]:='0';
 rezPereh[0,0]:='ÈÑ';
 rezPereh[0,1]:='ÊÎÄ';
 rezPereh[0,2]:='ÑÏ';
 rezPereh[0,3]:='ÊÎÄ';
 for i:=0 to length(xs)-1 do rezPereh[0,4+i]:=xs[i];
 for i:=0 to length(ygreks)-1 do rezPereh[0,4+length(xs)+i]:=ygreks[i];
 for i:=0 to perehCol-1 do
  begin
   for j:=0 to length(razmetka[1])-1 do
    begin
     if razmetka[1,j] = pereh[i,0] then
      begin
       rezPereh[k,0]:=razmetka[2,j];
       rezPereh[k,1]:=razmetka[3,j]
      end;
     if razmetka[1,j] = pereh[i,length(pereh[i])-1] then
      begin
       rezPereh[k,2]:=razmetka[2,j];
       rezPereh[k,3]:=razmetka[3,j]
      end
    end;
   l:=1;
   pos:=1;
   for n:=0 to length(pereh[i])-2 do
    if graf.points[StrToInt(pereh[i,n])] is TIfPoint then
     begin
      for m:=0 to length(xs)-1 do
       if graf.points[StrToInt(pereh[i,n])].FEdit.Text = xs[m]then
        begin
         pos:=m;
         break
        end;
      if graf.mLinks[2,StrToInt(pereh[i,n])]=StrToInt(pereh[i,n+1]) then
       rezPereh[k,pos+4]:=IntToStr(graf.mLinks[4,StrToInt(pereh[i,n])]);
      if graf.mLinks[3,StrToInt(pereh[i,n])]=StrToInt(pereh[i,n+1]) then
       rezPereh[k,pos+4]:=IntToStr(graf.mLinks[5,StrToInt(pereh[i,n])]);
     end;
   if graf.points[StrToInt(pereh[i,length(pereh[i])-2])] is TOperPoint then
    begin
     pos1:=1;
     str:='';
     str:=graf.points[StrToInt(pereh[i,length(pereh[i])-2])].FEdit.Text;
     SetLength(el,0);
     while pos1 < length(str)+1 do
      begin
       pos2:=1;
       SetLength(el,0);
       repeat
        SetLength(el,length(el)+1);
        el[pos2]:=str[pos1];
        inc(pos1);
        inc(pos2)
       until (str[pos1]='y')or(str[pos1]='Y')or(pos1 > length(str));
        pos:=1;
        for n:=0 to length(ygreks)-1 do if ygreks[n] = el then pos:=n;
        rezPereh[k,4+length(xs)+pos]:='1';
        SetLength(el,0)
      end
    end;
   inc(k)
  end;
 trigger
end;
//==============================================================================
procedure TTables.muraPereh;
var
 perehCol,i,j,k,l,m,n,pos,pos1,pos2:Integer;
 tRes:TArrArrInt;
 fl:Boolean;
 str,el:String;
begin
 muraRazm;
 getYgreks;
 getXs;
 i:=graf.isLinkBegEnd;
 perehCol:=0;
 SetLength(pereh,0);
 for i:=0 to length(razmetka[1])-1 do
  for j:=0 to length(razmetka[1])-1 do
   if razmetka[1,i]<>razmetka[1,j] then
    begin
     SetLength(tRes,0);
     tRes:=Graf.getWaysBetween(StrToInt(razmetka[1,i]),StrToInt(razmetka[1,j]));
     for k:=0 to length(tRes)-1 do
      begin
       fl:=false;
       for l:=0 to length(tRes[k])-1 do
        for m:=0 to length(razmetka[1])-1 do
         if (tRes[k,l]=StrToInt(razmetka[1,m]))and(m<>i)and(m<>j) then fl:=true;
       if not fl then
        begin
         inc(perehCol);
         SetLength(pereh,perehCol);
         SetLength(pereh[perehCol-1],length(tRes[k])-1);
         for m:=0 to length(tRes[k])-2 do
          pereh[perehCol-1,m]:=IntToStr(tRes[k,m])
        end
      end
    end
   else
    for m:=0 to length(graf.cycles)-1 do
     if razmetka[1,i] = IntToStr(graf.cycles[m,0]) then
      begin
       fl:=false;
       for l:=1 to length(graf.cycles)-2 do
        for n:=0 to length(razmetka[1])-1 do
         if (graf.cycles[m,l]=StrToInt(razmetka[1,n])) then fl:=true;
       if not fl then
        begin
         inc(perehCol);
         SetLength(pereh,perehCol);
         SetLength(pereh[perehCol-1],length(graf.cycles[m]));
         for n:=0 to length(graf.cycles[m])-1 do
          pereh[perehCol-1,n]:=IntToStr(graf.cycles[m,n])
        end
      end;
 SetLength(rezPereh,0);
 SetLength(rezPereh,perehCol+1);
 k:=1;
 for i:=0 to perehCol do SetLength(rezPereh[i],4+length(ygreks)+length(xs));
 for i:=0 to length(rezPereh)-1 do
  for j:=4+length(xs) to length(rezPereh[i])-1 do rezPereh[i,j]:='0';
 rezPereh[0,0]:='ÈÑ';
 rezPereh[0,1]:='ÊÎÄ';
 rezPereh[0,2]:='ÑÏ';
 rezPereh[0,3]:='ÊÎÄ';
 for i:=0 to length(xs)-1 do rezPereh[0,4+i]:=xs[i];
 for i:=0 to length(ygreks)-1 do rezPereh[0,4+length(xs)+i]:=ygreks[i];
 for i:=0 to perehCol-1 do
  begin
   for j:=0 to length(razmetka[1])-1 do
    begin
     if razmetka[1,j] = pereh[i,0] then
      begin
       rezPereh[k,0]:=razmetka[2,j];
       rezPereh[k,1]:=razmetka[3,j]
      end;
     if razmetka[1,j] = pereh[i,length(pereh[i])-1] then
      begin
       rezPereh[k,2]:=razmetka[2,j];
       rezPereh[k,3]:=razmetka[3,j]
      end
    end;
   l:=1;
   pos:=1;
   if length(pereh[i]) <> 2 then
    begin
     for n:=1 to length(pereh[i])-2 do
      begin
       for m:=0 to length(xs)-1 do
        if graf.points[StrToInt(pereh[i,n])].FEdit.Text = xs[m]then
         begin
          pos:=m;
          break
         end;
       if graf.mLinks[2,StrToInt(pereh[i,n])]=StrToInt(pereh[i,n+1]) then
        rezPereh[k,pos+4]:=IntToStr(graf.mLinks[4,StrToInt(pereh[i,n])]);
       if graf.mLinks[3,StrToInt(pereh[i,n])]=StrToInt(pereh[i,n+1]) then
        rezPereh[k,pos+4]:=IntToStr(graf.mLinks[5,StrToInt(pereh[i,n])])
      end
    end;
   if not(graf.points[StrToInt(pereh[i,length(pereh[i])-1])] is TEndPoint) then
    begin
     pos1:=1;
     str:='';
     str:=graf.points[StrToInt(pereh[i,length(pereh[i])-1])].FEdit.Text;
     SetLength(el,0);
     while pos1 < length(str)+1 do
      begin
       pos2:=1;
       SetLength(el,0);
       repeat
        SetLength(el,length(el)+1);
        el[pos2]:=str[pos1];
        inc(pos1);
        inc(pos2)
       until (str[pos1]='y')or(str[pos1]='Y')or(pos1 > length(str));
       pos:=1;
       for n:=0 to length(ygreks)-1 do if ygreks[n] = el then pos:=n;
       rezPereh[k,4+length(xs)+pos]:='1';
       SetLength(el,0)
      end
    end;
   inc(k)
  end;
 trigger
end;
//==============================================================================
procedure TTables.getYgreks;
var
 i,j:Integer;
 col,el1,el2:Integer;
 pos1,pos2:Integer;
 str,el:string;
 fl:boolean;
begin
 col:=0;
 SetLength(ygreks,0);
 for i:=1 to length(graf.points)-1 do
  if graf.points[i] is TOperPoint then
   begin
    pos1:=1;
    str:='';
    str:=graf.points[i].FEdit.Text;
    SetLength(el,0);
    while pos1 < length(str)+1 do
     begin
      pos2:=1;
      SetLength(el,0);
      repeat
       SetLength(el,length(el)+1);
       el[pos2]:=str[pos1];
       inc(pos1);
       inc(pos2)
      until (str[pos1]='y')or(str[pos1]='Y')or(pos1 > length(str));
      fl:=false;
      for j:=0 to length(ygreks)-1 do if ygreks[j] = el then fl:=true;
      if not fl then
       begin
        inc(col);
        SetLength(ygreks,col);
        ygreks[col-1]:=el
       end;
      SetLength(el,0)
     end
   end;
 el:='';
 str:='';
 el1:=0;
 for i:=0 to length(ygreks)-1 do
  begin
   if length(ygreks[i])>2 then el1:=StrToInt(ygreks[i][2]+ygreks[i][3])
   else el1:=StrToInt(ygreks[i][2]);
   pos1:=i;
   for j:=i+1 to length(ygreks)-1 do
    begin
     if length(ygreks[j])>2 then el2:=StrToInt(ygreks[j][2]+ygreks[j][3])
     else el2:=StrToInt(ygreks[j][2]);
     if el2 < el1 then
      begin
       el1:=el2;
       pos1:=j
      end
    end;
   if pos1<>i then
    begin
     str:=ygreks[pos1];
     ygreks[pos1]:=ygreks[i];
     ygreks[i]:=str
    end
  end
end;
//==============================================================================
procedure TTables.getXs;
var
 i,j:Integer;
 col,el1,el2:Integer;
 pos1,pos2:Integer;
 str,el:string;
 fl:boolean;
begin
 col:=0;
 SetLength(xs,0);
 for i:=1 to length(graf.points)-1 do
  if graf.points[i] is TIfPoint then
   begin
    pos1:=1;
    str:='';
    str:=graf.points[i].FEdit.Text;
    SetLength(el,0);
    while pos1 < length(str)+1 do
     begin
      pos2:=1;
      SetLength(el,0);
      repeat
       SetLength(el,length(el)+1);
       el[pos2]:=str[pos1];
       inc(pos1);
       inc(pos2)
      until (str[pos1]='x')or(str[pos1]='X')or(pos1 > length(str));
      fl:=false;
      for j:=0 to length(xs)-1 do if xs[j] = el then fl:=true;
      if not fl then
       begin
        inc(col);
        SetLength(xs,col);
        xs[col-1]:=el
       end;
      SetLength(el,0)
     end
   end;
 el:='';
 str:='';
 el1:=0;
 for i:=0 to length(xs)-1 do
  begin
   if length(xs[i])>2 then el1:=StrToInt(xs[i][2]+xs[i][3])
   else el1:=StrToInt(xs[i][2]);
   pos1:=i;
   for j:=i+1 to length(xs)-1 do
    begin
     if length(xs[j])>2 then el2:=StrToInt(xs[j][2]+xs[j][3])
     else el2:=StrToInt(xs[j][2]);
     if el2 < el1 then
      begin
       el1:=el2;
       pos1:=j
      end
    end;
   if pos1<>i then
    begin
     str:=xs[pos1];
     xs[pos1]:=xs[i];
     xs[i]:=str
    end
  end
end;
//==============================================================================
procedure TTables.trigRS;
var
 stPos,i,j,k,si1,si2:integer;
 str1,str2:string;
begin
 stPos:=length(rezPereh[0]);
 for i:=0 to length(rezPereh)-1 do
  SetLength(rezPereh[i],stPos+mera*2);
 for i:=1 to length(rezPereh)-1 do
  begin
   str1:=rezPereh[i,1];
   str2:=rezPereh[i,3];
   for j:=1 to length(str1) do
    begin
     si1:=StrToInt(str1[j]);
     si2:=StrToInt(str2[j]);
     rezPereh[0,stPos+2*(j-1)]:='R'+IntToStr(j);
     rezPereh[0,stPos+2*(j-1)+1]:='S'+IntToStr(j);
     if (si1=0)and(si2=0) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='-';
       rezPereh[i,stPos+2*(j-1)+1]:='0'
      end;
     if (si1=0)and(si2=1) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='0';
       rezPereh[i,stPos+2*(j-1)+1]:='1'
      end;
     if (si1=1)and(si2=0) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='1';
       rezPereh[i,stPos+2*(j-1)+1]:='0'
      end;
     if (si1=1)and(si2=1) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='0';
       rezPereh[i,stPos+2*(j-1)+1]:='-'
      end;
    end
  end
end;
//==============================================================================
procedure TTables.trigJK;
var
 stPos,i,j,k,si1,si2:integer;
 str1,str2:string;
begin
 stPos:=length(rezPereh[0]);
 for i:=0 to length(rezPereh)-1 do
  SetLength(rezPereh[i],stPos+mera*2);
 for i:=1 to length(rezPereh)-1 do
  begin
   str1:=rezPereh[i,1];
   str2:=rezPereh[i,3];
   for j:=1 to length(str1) do
    begin
     si1:=StrToInt(str1[j]);
     si2:=StrToInt(str2[j]);
     rezPereh[0,stPos+2*(j-1)]:='K'+IntToStr(j);
     rezPereh[0,stPos+2*(j-1)+1]:='J'+IntToStr(j);
     if (si1=0)and(si2=0) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='-';
       rezPereh[i,stPos+2*(j-1)+1]:='0'
      end;
     if (si1=0)and(si2=1) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='-';
       rezPereh[i,stPos+2*(j-1)+1]:='1'
      end;
     if (si1=1)and(si2=0) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='1';
       rezPereh[i,stPos+2*(j-1)+1]:='-'
      end;
     if (si1=1)and(si2=1) then
      begin
       rezPereh[i,stPos+2*(j-1)]:='0';
       rezPereh[i,stPos+2*(j-1)+1]:='-'
      end;
    end
  end
end;
//==============================================================================
procedure TTables.trigD;
var
 stPos,i,j,k,si1,si2:integer;
 str1,str2:string;
begin
 stPos:=length(rezPereh[0]);
 for i:=0 to length(rezPereh)-1 do
  SetLength(rezPereh[i],stPos+mera);
 for i:=1 to length(rezPereh)-1 do
  begin
   str1:=rezPereh[i,1];
   str2:=rezPereh[i,3];
   for j:=1 to length(str1) do
    begin
     si1:=StrToInt(str1[j]);
     si2:=StrToInt(str2[j]);
     rezPereh[0,stPos+j-1]:='D'+IntToStr(j);
     if (si1=0)and(si2=0) then rezPereh[i,stPos+j-1]:='0';
     if (si1=0)and(si2=1) then rezPereh[i,stPos+j-1]:='1';
     if (si1=1)and(si2=0) then rezPereh[i,stPos+j-1]:='0';
     if (si1=1)and(si2=1) then rezPereh[i,stPos+j-1]:='1'
    end
  end
end;
//==============================================================================
procedure TTables.trigT;
var
 stPos,i,j,k,si1,si2:integer;
 str1,str2:string;
begin
 stPos:=length(rezPereh[0]);
 for i:=0 to length(rezPereh)-1 do
  SetLength(rezPereh[i],stPos+mera);
 for i:=1 to length(rezPereh)-1 do
  begin
   str1:=rezPereh[i,1];
   str2:=rezPereh[i,3];
   for j:=1 to length(str1) do
    begin
     si1:=StrToInt(str1[j]);
     si2:=StrToInt(str2[j]);
     rezPereh[0,stPos+j-1]:='T'+IntToStr(j);
     if (si1=0)and(si2=0) then rezPereh[i,stPos+j-1]:='0';
     if (si1=0)and(si2=1) then rezPereh[i,stPos+j-1]:='1';
     if (si1=1)and(si2=0) then rezPereh[i,stPos+j-1]:='1';
     if (si1=1)and(si2=1) then rezPereh[i,stPos+j-1]:='0'
    end
  end
end;
//==============================================================================
procedure TTables.trigger;
begin
 case triggerType of
  0:trigRS;
  1:trigJK;
  2:trigD;
  3:trigT
 end
end;
//==============================================================================
function TTables.getFCol:Integer;
begin
 result:=length(ygreks)
end;
//==============================================================================
function TTables.getXCol:Integer;
begin
 result:=length(xs)
end;
//==============================================================================
end.
