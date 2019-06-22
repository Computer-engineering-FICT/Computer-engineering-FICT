unit GrafUnit;
//==============================================================================
interface
uses
  ElementUnit,  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Menus, Buttons, ErrorUnit,
  ToolWin, ComCtrls, Grids;
type
 TArr5ArrInt = array[1..5] of array of Integer;
 TArrInt = array of Integer;
 TArrArrInt = array of TArrInt;
 TArr3ArrInt = array[1..3] of array of Integer;
 TArrSVVElement = array of TSVVElement;
//==============================================================================
 TGraf = class
  points:TArrSVVElement;
  links:TArr3ArrInt;
  mLinks:TArr5ArrInt;
  pointsCol:Integer;
  linksCol,mLinksCol:Integer;
  numberOfErrP:Byte;
  way:TArrInt;
  offs:Integer;
  cycleOffs:Integer;
  new:array of Boolean;
  _way:TArrInt;
  fll:boolean;
  ways:TArrArrInt;
  cycles:TArrArrInt;
  constructor Create(a,b:Integer);
  procedure AddPoints(PP:TArrSVVElement);
  function  GetPoint(i:Integer):TSVVElement;
  procedure AddLink(src,dst:Integer);
  procedure ModifyLinksMatrix;
  function isBeginEndThere:Integer;
  function isPointsOK:Integer;
  function getNumErr:Integer;
  function isLinkBegEnd:Integer;
  function getWay:TArrInt;
  function get_Way:TArrInt;
  procedure testIter(src,dst,offset,endN:Integer);
  function testLinkedEnd:Integer;
  function testLinkedBegin:Integer;
  function getWays:TArrArrInt;
  function getCycles:TArrArrInt;
  function testCyclesOnCorrect:Integer;
  function getWaysBetween(src,dst:Integer):TArrArrInt;
  function isIfOk:byte;
  function isIfNO:byte;
 end;
implementation
//==============================================================================
procedure TGraf.testIter(src,dst,offset,endN:Integer);
var
 i,j,k,l:Integer;
 isThere,isThereEnd:boolean;
 tarr:TArrInt;
begin
 if src<>dst then
  begin
   new[src]:=false;
   for i:=2 to 3 do
    begin
     if (mLinks[i,src]<>0)and(new[mLinks[i,src]]) then
      begin
       SetLength(_way,length(_way)+1);
       _way[length(_way)-1]:=mLinks[i,src];
       testIter(mLinks[i,src],dst,offset,endN)
      end
     else
      begin
       if (mLinks[i,src]<>0) then
        begin
         isThere:=false;
         isThereEnd:=false;
         for j:=0 to length(_way)-1 do if mLinks[i,src]=_way[j] then
                                                                isThere:=true;
         for j:=0 to length(_way)-1 do if _way[j]=endN then isThereEnd:=true;
         if isThere then
          begin
           inc(cycleOffs);
           SetLength(cycles,cycleOffs);
           tarr:=_way;
           SetLength(tarr,length(_way)+1);
           tarr[length(_way)]:=mLinks[i,src];
           j:=0;
           k:=0;
           while tarr[j]<>mLinks[i,src] do inc(j);
           for l:=j to length(tarr)-1 do
            begin
             inc(k);
             SetLength(cycles[cycleOffs-1],k);
             cycles[cycleOffs-1,k-1]:=tarr[l]
            end
          end
        end
      end
    end;
   new[src]:=true
  end
 else
  begin
   SetLength(_way,length(_way)+1);
   _way[length(_way)-1]:=dst;
   inc(offs);
   fll:=true;
   SetLength(ways,offs);
   ways[offs-1]:=_way;
   SetLength(_way,length(_way)-1)
  end;
 if offset<>0 then SetLength(_way,length(_way)-1)
end;
//==============================================================================
constructor TGraf.Create(a,b:Integer);
var
 i:Integer;
begin
 pointsCol:=a;
 linksCol:=b;
 SetLength(points,pointsCol+1);
 for i:=1 to 2 do SetLength(links[i],linksCol+1)
end;
//==============================================================================
procedure TGraf.AddPoints(PP:TArrSVVElement);
begin
 points:=PP;
 pointsCol:=length(points)-2
end;
//==============================================================================
function  TGraf.GetPoint(i:Integer):TSVVElement;
begin
 Result:=points[i]
end;
//==============================================================================
procedure TGraf.AddLink(src,dst:Integer);
var
 i:Integer;
begin
 inc(linksCol);
 for i:=1 to 2 do SetLength(links[i],linksCol+1);
 links[1,linksCol]:=src;
 links[2,linksCol]:=dst
end;
//==============================================================================
procedure TGraf.ModifyLinksMatrix;
var
 i,j:Integer;
begin
 for i:=1 to 5 do  SetLength(mLinks[i],0);
 for i:=1 to 5 do SetLength(mLinks[i],pointsCol+1);
 for i:=1 to pointsCol do
  begin
   mLinks[1,i]:=i;
   for j:=1 to length(links[1])-1 do
    if links[1,j]=i then
     if mLinks[2,i]=0 then
      begin
       mLinks[2,i]:=links[2,j];
       mLinks[4,i]:=links[3,j]
      end
     else
      begin
       mLinks[3,i]:=links[2,j];
       mLinks[5,i]:=links[3,j]
      end
  end
end;
//==============================================================================
function TGraf.isBeginEndThere:Integer;
var
 flBegin,flEnd:Boolean;
 i:Integer;
begin
 flBegin:=false;
 flEnd:=false;
 for i:=1 to pointsCol do
  begin
   if points[i] is TBeginPoint then flBegin:=true;
   if points[i] is TEndPoint then flEnd:=true
  end;
 if flBegin and flEnd then i:=0
  else
   if flBegin then i:=2
    else i:=1;
 result:=i
end;
//==============================================================================
function TGraf.isPointsOK:Integer;
var
 i,j,res:Integer;
 str,st:string;
 fl,fl2:Boolean;
begin
 // 0 - all OK
 // 1 - IFPoint begun with wrong value(not X or x)
 // 2 - IFPoint have x or X in first, but contains not a nubmer
 // 3 - OperPoint begun not wiht y or Y
 // 4 - OperPoint have a constructions like YY yY Yy yy
 // 5 - OperPoint contains wrong symbols
 // 6 - OperPoint not close
 numberOfErrP:=0;
 fl2:=false;
 res:=0;
 for i:=1 to pointsCol do
  begin
   numberOfErrP:=i;
   str:=points[i].getValue;
   if points[i] is TIfPoint then
    begin
     if (str[1]<>'x')and(str[1]<>'X') then
      begin
       res:=1;
       break
      end;
     setLength(st,length(str)-1);
     for j:=2 to length(str) do st[j-1]:=str[j];
     try
      StrToInt(st);
     except on E:EConvertError do
      begin
       res:=2;
       break
      end
    end
  end;
 if points[i] is TOperPoint then
  begin
   if (str[1]<>'y')and(str[1]<>'Y') then
    begin
     res:=3;
     break
    end
   else
    begin
     for j:=1 to length(str) do
      begin
       fl:=false;
       case str[j] of
        '0':fl:=true;
        '1':fl:=true;
        '2':fl:=true;
        '3':fl:=true;
        '4':fl:=true;
        '5':fl:=true;
        '6':fl:=true;
        '7':fl:=true;
        '8':fl:=true;
        '9':fl:=true;
        'y':fl:=true;
        'Y':fl:=true
       end;
       if ((str[j]='Y')or(str[j]='y'))and((str[j-1]='Y')or(str[j-1]='y')) then
        begin
         res:=4;
         break
        end;
       if not fl then
        begin
         res:=5;
         fl2:=true;
         break
        end
      end
    end;
   if (str[length(str)]='Y')or(str[length(str)]='y')then
    begin
     res:=6;
     break
    end;
   if fl2 then
    begin
     numberOfErrP:=i;
     break
    end
  end
 end;
 result:=res
end;
//==============================================================================
function TGraf.getNumErr:Integer;
begin
 result:=numberOfErrP
end;
//==============================================================================
function TGraf.isLinkBegEnd:Integer;
var
 i,begPos,endPos:Integer;
begin
 begPos:=0;
 endPos:=0;
 SetLength(new,pointsCol+1);
 for i:=1 to pointsCol do
  begin
   if points[i] is TBeginPoint then begPos:=points[i].PointNum;
   if points[i] is TEndPoint then endPos:=points[i].PointNum
  end;
 for i:=0 to PointsCol do new[i]:=true;
 offs:=0;
 cycleOffs:=0;
 SetLength(_way,1);
 SetLength(ways,0);
 SetLength(cycles,0);
 _way[0]:=begPos;
 testIter(begPos,endPos,1,endPos);
 setLength(way,length(_way));
 for i:=0 to length(_way)-1 do way[i]:=_way[length(_way)-1-i];
 if fll then result:=0 else result:=1
end;
//==============================================================================
function TGraf.getWay:TArrInt;
begin
 result:=way
end;
//==============================================================================
function TGraf.get_Way:TArrInt;
begin
 result:=_way
end;
//==============================================================================
function TGraf.testLinkedEnd:Integer;
var
 i,j,endPos,res:Integer;
begin
 endPos:=0;
 SetLength(new,pointsCol+1);
 for i:=1 to pointsCol do
  if points[i] is TEndPoint then
   begin
    endPos:=points[i].PointNum;
    break
   end;
 for j:=1 to PointsCol do
  begin
   for i:=0 to PointsCol do new[i]:=true;
   fll:=false;
   offs:=0;
   cycleOffs:=0;
   SetLength(_way,0);
   SetLength(cycles,0);
   testIter(j,endPos,0,endPos);
   if not fll then break
  end;
 if not fll then res:=j else res:=0;
 result:=res
end;
//==============================================================================
function TGraf.testLinkedBegin:Integer;
var
 i,j,begPos,res:Integer;
begin
 begPos:=0;
 SetLength(new,pointsCol+1);
 for i:=1 to pointsCol do
  if points[i] is TBeginPoint then
   begin
    begPos:=points[i].PointNum;
    break
   end;
 for j:=1 to PointsCol do
  begin
   for i:=0 to PointsCol do new[i]:=true;
   fll:=false;
   offs:=0;
   cycleOffs:=0;
   SetLength(cycles,0);
   testIter(begPos,j,0,0);
   if not fll then break
  end;
 if not fll then res:=j else res:=0;
 result:=res
end;
//==============================================================================
function TGraf.getWays:TArrArrInt;
var
 endPos,begPos,i:Integer;
begin
 endPos:=0;
 begPos:=0;
 for i:=1 to pointsCol do
  begin
   if points[i] is TBeginPoint then begPos:=points[i].PointNum;
   if points[i] is TEndPoint then endPos:=points[i].PointNum
  end;
 for i:=0 to PointsCol do new[i]:=true;
 offs:=0;
 cycleOffs:=0;
 SetLength(_way,1);
 SetLength(ways,0);
 SetLength(cycles,0);
 _way[0]:=begPos;
 testIter(begPos,endPos,1,endPos);
 result:=ways
end;
//==============================================================================
function TGraf.getCycles:TArrArrInt;
begin
 result:=cycles
end;
//==============================================================================
function TGraf.testCyclesOnCorrect:Integer;
var
 i,j,res:Integer;
 fl:Boolean;
begin
 res:=0;
 for i:=0 to length(cycles)-1 do
  begin
   fl:=false;
   for j:=1 to length(cycles[i])-1 do
    if points[cycles[i,j]] is TOperPoint then fl:=true;
   if not fl then
    begin
     res:=i+1;
     break
    end
  end;
 result:=res
end;
//==============================================================================
function TGraf.getWaysBetween(src,dst:Integer):TArrArrInt;
var
 endPos,i:Integer;
begin
 endPos:=0;
 SetLength(new,pointsCol+1);
 for i:=1 to pointsCol do
  if points[i] is TEndPoint then
   begin
    endPos:=points[i].PointNum;
    break
   end;
 for i:=0 to PointsCol do new[i]:=true;
 offs:=0;
 cycleOffs:=0;
 SetLength(_way,1);
 SetLength(ways,0);
 SetLength(cycles,0);
 _way[0]:=src;
 testIter(src,dst,1,endPos);
 result:=ways
end;
//==============================================================================
function TGraf.isIfOk:byte;
var
 i,res:Integer;
begin
 res:=0;
 for i:=1 to length(points)-1 do
  if points[i] is TIfPoint then
   if (mLinks[2,i]=0)or(mLinks[3,i]=0) then
    begin
     res:=i;
     break
    end;
 result:=res
end;
//==============================================================================
function TGraf.isIfNO:byte;
var
 i,res:Integer;
begin
 res:=0;
 for i:=1 to length(points)-1 do
  if points[i] is TIfPoint then
   if mLinks[2,i]=mLinks[3,i] then
    begin
     res:=i;
     break
    end;
 result:=res
end;
//==============================================================================
end.
