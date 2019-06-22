unit add_man7;
interface
uses crt,graph;
type
  my_str=string[5];
  text_style=(english,russian,polyk,other);
  TMainScreen = object
                newWIN,currentWIN    :integer;
                ErrorInPrepare:Boolean;
                HideDrawwing  :Boolean;
                procedure PrepareObject(Gd:Integer);
                procedure NewScreen;
                procedure GotoNewScreen;
                end;
const afon=0;aink=15;aShadowFill=9;aShadowInk=7+16; dshdw=5;
      F1                  =#59;
      F2                  =#60;
      F3                  =#61;
      F4                  =#62;
      F5                  =#63;
      F6                  =#64;
      F7                  =#65;
      F8                  =#66;
      F9                  =#67;
      F10                 =#68;F11=#69;F12=#70;
      KeyHome=#71;
      keyEnd=#79;
      Ctr_F10='g';
Alt_1 =#120;Alt_2 =#121;Alt_3 =#122;Alt_4 =#123;Alt_5 =#124;Alt_6 =#125;Alt_7 =#126;
Alt_8=#127;Ctr_left='s';Ctr_right='t';Alt_x='-';
      left                =#75;
      right               =#77;
      up                  =#72;
      down                =#80;
      esc                 =#27;
      enter               =#13;
      backspace           =#8;
      tab                 =#9;
      Pg_up               =#73;
      Pg_down             =#81;
      maxa=8;{™Æ´®Á•·‚¢Æ †´£Æ‡®‚¨Æ¢ §´Ô ·‡†¢≠•≠®Ô}
      all_algorit=20;
  use_algoritm:array[1..maxa] of integer= (10,7,6,5,4,3,2,1);
  alg_name:array[0..3,0..all_algorit] of string[10]=
    (('---','Ääè','Ääè+1kl','Ääè î2','SH äè','SH full',
     'SH,sort <=0','SH,sort <0','1-proc','N-proc',
     'SH+sum','11','12','13','14','15','16','17','18','19','20'),

     ('---','Ääè','Ääè+1kl','Ääè î2','SH äè','SH full',
     'SH,sort <= 0','SH,sort <0','1-proc','N-proc',
     'SH+sum','11','12','13','14','15','16','17','18','19','20'),

     ('---','Ääè','Ääè+1kl','Ääè î2','SH äè','SH full',
     'SH,sort <= 0','SH,sort <0','1-proc','N-proc',
     'SH+sum','11','12','13','14','15','16','17','18','19','20'),

     ('---','Ääè','Ääè+1kl','Ääè î2','SH äè','SH full',
     'SH,sort <= 0','SH,sort <0','1-proc','N-proc',
     'SH+sum','11','12','13','14','15','16','17','18','19','20'));
  used_line=1000;
var
  MScreen:TMainScreen;
  ColSee :boolean;
  my_text:text_style;
  fnt,min_line_work:integer;
  s:char;
  last_info:string;
  functional_key:boolean;
  window_x,window_y:integer;
  strela_x,strela_y:integer;
  mashtab:real;
  {mx,}col_proc,all_time,last_dt,higest_rang:integer;
  view_alg:boolean;
{  view_line_work:boolean;}
  view_inverse,view_number_of_processors,view_time,
  view_work_line,all_join_is_equal,
  ProcWaitSendInfo:boolean;
  max_time,all_proc:integer;
  view_nodes_number,view_shadow:boolean;
procedure STline(x1,y1,x2,y2:integer;needshadow:boolean);
procedure Sbar3d(x1,y1,x2,y2,dd:integer;top,needshadow:boolean);
procedure error_sound(i:integer);
procedure image_patology(i:integer);
procedure info(s1:string);
procedure info2(s1:string);
procedure pause;
function place_x(x:integer):integer;
function place_y(y:integer):integer;
procedure strela;
procedure my_line_view(x,y,n:integer;needshadow:boolean);
procedure NewSet(c1,c2,t1,t2,s1,s2:integer);
procedure my_processor(x,y,n:integer;needshadow:boolean);
procedure my_time(x,y,t1,t2:integer;needshadow:boolean);
procedure ball_shadow(x,y,dx,dy:integer;needshadow:boolean);
procedure my_ball(x,y,n:integer;see,needshadow:boolean);
procedure my_number(x,y,n:integer;needshadow:boolean);
function mmyy(y:integer):integer;
function min(a,b:integer):integer;
function max(a,b:integer):integer;
procedure move_strela;
procedure move_screen;
procedure input(x,y:integer;var ss:string);
function st(x:integer):string;
function stl(x:longint):string;
function strr(r:real):string;
procedure set_center_scren;
procedure clr;
procedure table_line;
procedure view_rnd_node(x,y:integer;pr,num,tm,needshadow:boolean);

implementation
var last_size:integer;
procedure error_sound(i:integer);
 var j:integer;
 begin
   for j:=1 to 10 do begin sound(100+j*20);delay(50);end;
   nosound;
 end;
function mmyy(y:integer):integer;
  begin
    mmyy:=round(getmaxy/400*y);
  end;
procedure move_screen;
begin
  case s of
    'A':dec(window_x,round(150/mashtab));
    'S':inc(window_x,round(150/mashtab));
    'Z':inc(window_y,round(50/mashtab));
    'W':dec(window_y,round(50/mashtab));
  end;
  strela_x:=window_x+round(300/mashtab);
  strela_y:=window_y+round(100/mashtab);
end;
procedure move_strela;
begin
  case s of
      down :inc(strela_y,round(10/mashtab));
      up   :dec(strela_y,round(10/mashtab));
      left :dec(strela_x,round(30/mashtab));
      right:inc(strela_x,round(30/mashtab));
  end;
end;
procedure clr;
begin
  setcolor(afon);setfillstyle(1,afon);bar3d(0,18,getmaxx,getmaxy,0,false);
end;
function min(a,b:integer):integer;
  begin
    if a>b then min:=b else min:=a;
  end;
function max(a,b:integer):integer;
  begin
    if a<b then max:=b else max:=a;
  end;
procedure pause;
 begin
  functional_key:=false;
  while not keypressed do;s:=readkey;
  repeat
    if s=#0 then
    begin
      functional_key:=true;while not keypressed do;
      s:=readkey;
    end;
  until s<>#0;
 end;
procedure info2(s1:string);
var my,mx:integer;
begin
   settextjustify(CenterText,CenterText);
   my:=getmaxy-20;mx:=round(getmaxx/2);
   setusercharsize(last_size,1,last_size,1);
   setcolor(afon);outtextxy(mx,my,last_info);
   last_size:=2;
   setusercharsize(2,1,2,1);
   setcolor(aink);outtextxy(mx,my,s1);
   last_info:=s1;
   setusercharsize(1,1,1,1);
end;
procedure info(s1:string);
var my,mx:integer;
 begin
   settextjustify(CenterText,CenterText);
   my:=getmaxy-20;mx:=round(getmaxx/2);
   setusercharsize(last_size,1,last_size,1);
   setcolor(afon);outtextxy(mx,my,last_info);
   setusercharsize(1,1,1,1);last_size:=1;
   setcolor(aink);outtextxy(mx,my,s1);
   last_info:=s1;
 end;
function st(x:integer):string;
 var ss:string;
 begin str(x,ss);st:=ss;end;
function stl(x:longint):string;
 var ss:string;
 begin str(x,ss);stl:=ss;end;
function strr(r:real):string;
 var ss:string;
 begin str(r:6:2,ss);strr:=ss;end;

function place_x(x:integer):integer;
         begin place_x:=round((x-window_x)*mashtab);end;
function place_y(y:integer):integer;
         begin place_y:=round((y-window_y)*mashtab{*mashtab}/199*getmaxy);end;
procedure strela;
begin
  setcolor(15);
  setwritemode(xorput);setlinestyle(0,1,1);
  moveto(place_x(strela_x),place_y(strela_y));linerel(10,0);
  linerel(-10,5);linerel(0,-5);linerel(18,9);
  setwritemode(0);
end;
procedure input(x,y:integer;var ss:string);
begin
  settextjustify(CenterText,CenterText);
  setcolor(2);
  case my_text of
   english :outtextxy(x,y,'Input name:');
   russian :outtextxy(x,y,'Ç¢•§®‚• ®¨Ô:');
   polyk   :outtextxy(x,y,'Ç¢•§®‚• ®¨Ô:');
   else outtextxy(x,y,'Ç†Ë† ™´˜Á™†:');
  end;
  repeat
    setcolor(aink);outtextxy(x+100,y,ss);
    pause;
    setcolor(afon);outtextxy(x+100,y,ss);
    case s of
      #32..'z':if length(ss)<8 then ss:=ss+s;
      #8      :if length(ss)>1
         then ss:=copy(ss,1,length(ss)-1) else ss:='';
    end;
  until (s=#13)or(s=#27);
  if s=#27 then ss:=#27;
end;
procedure set_center_scren;
begin
  window_x:=round(strela_x-320/mashtab);
  window_y:=round(strela_y-100/mashtab);
end;
procedure view_rnd_node(x,y:integer;pr,num,tm,needshadow:boolean);
var v:integer;
 begin
    v:=random(20)+10;    settextjustify(1,1);
    my_ball(x,y,v,false,needshadow);
    if pr then my_processor(x,y,1,needshadow);

    if num then my_number(x-20,y-10,7,needshadow);
{    begin
       setcolor(7); setfillstyle(1,8); fillellipse(x-20,y-10,8,8);
       setcolor(afon);outtextxy(x-20,y-10,'7');end;}
    if tm then my_time(x+10,y+16,10,v+10,needshadow);
 end;
procedure table_line;
begin
  setcolor(aink);settextjustify(CenterText,CenterText);
  outtextxy(150,mmyy(20),'Only nodes work');
  outtextxy(150,mmyy(40),'Only lines work');
  outtextxy(150,mmyy(60),'Nodes & lines work');
  setcolor(4);
  outtextxy(150,mmyy(80),'Press ENTER,1,2,Up,Down,N');
end;

procedure image_patology(i:integer);
type  mmm=array[1..8] of pointtype;
const map_1:mmm=((x:370;y:50),(x:340;y:60),(x:420;y:55),(x:380;y:70),
                 (x:360;y:80),(x:420;y:80),(x:340;y:90),(x:385;y:90));
var j:integer;
    map:mmm;
    my_map:array[1..20] of pointtype;
begin
  setcolor(7);setfillstyle(1,3);bar3d(320,mmyy(40),440,mmyy(100),3,true);
  case i of
    0: begin
         map:=map_1;for j:=1 to 8 do map[j].y:=mmyy(map[j].y);
         for j:=1 to 20 do my_map[j]:=map[random(8)+1];
         setcolor(afon);drawpoly(20,my_map);
         setcolor(9);setfillstyle(1,9);
         for j:=1 to 8 do with map[j] do fillellipse(x,y,2,3);
       end;
    1: begin
         setfillstyle(1,7);setcolor(afon);for j:=1 to 3 do
         bar3d(310+j*30,mmyy(60),330+j*30,mmyy(70),0,false);
         setlinestyle(0,1,1);setcolor(9);
         for j:=1 to 3 do line(320+j*30,mmyy(70),320+j*30,mmyy(80));
         setlinestyle(0,1,3);setcolor(aink);line(340,mmyy(80),420,mmyy(80));
         setlinestyle(0,1,1);
       end;
    2: begin
         setcolor(aink);for j:=1 to 3 do line(320+j*30,mmyy(80),380,mmyy(60));
         setfillstyle(1,afon);bar3d(340,mmyy(55),420,mmyy(65),0,false);
         setfillstyle(1,7);setcolor(afon);for j:=1 to 3 do
          bar3d(310+j*30,mmyy(75),330+j*30,mmyy(85),0,false);
       end;
  end;
end;
procedure STline(x1,y1,x2,y2:integer;needshadow:boolean);
 var xx,yy:integer;
 begin setfillstyle(1,14);setcolor(7);setlinestyle(0,0,1);
       Sbar3d(x1,y1,x2,y2,0,false,needshadow);
       if x1>x2 then xx:=-5 else xx:=+5;
       yy:=round((y2-y1)/2);moveto(x2,y1);
       if needshadow then
       begin setcolor(7);setlinestyle(1,$11,1);moverel(dshdw,dshdw);
       end else setcolor(aInk);
       linerel(+xx,yy);
       linerel(-xx,yy);
       setlinestyle(1,1,0);
 end;
procedure Sbar3d(x1,y1,x2,y2,dd:integer;top,needshadow:boolean);
begin if needshadow then
      begin setfillstyle(aShadowFill,aShadowInk);
            setcolor({aShadowInk}0);
            inc(x1,dshdw);inc(x2,dshdw);inc(y1,dshdw);inc(y2,dshdw);
      end;
      bar3d(x1,y1,x2,y2,dd,top);
end;
procedure ball_shadow(x,y,dx,dy:integer;needshadow:boolean);
begin if needshadow then
      begin x:=x+5;y:=y+5;
            setfillstyle(aShadowFill,aShadowInk);setcolor(aShadowInk);
      end;
      fillellipse(x,y,dx,dy);
end;

procedure NewSet(c1,c2,t1,t2,s1,s2:integer);
 begin
   if ColSee then
   begin setcolor(c1);setfillstyle(t1,s1);end else
   begin setcolor(c2);setfillstyle(t2,s2);end;
 end;
procedure my_time(x,y,t1,t2:integer;needshadow:boolean);
var sss:string[10];
    l:integer;
 begin
   sss:=st(t1)+'..'+st(t2);l:=length(sss)*3;
   newset(11,0,1,1,11,afon);
   Sbar3d(x-l-1,y-5,x+l+1,y+6,0,false,needshadow);
   if not needshadow then
   begin setcolor(aink);
         outtextxy(x,y,sss);outtextxy(x+1,y,sss);
   end;
 end;
procedure my_ball(x,y,n:integer;see,needshadow:boolean);
 begin
    if see then newset(6,0,1,1,6,7) else newset(6,0,1,1,14,afon);
    ball_shadow(x,y,13,10,needshadow);
    if not needshadow then
    begin
         if see then setcolor(afon) else setcolor(aink);
         outtextxy(x,y,st(n));;outtextxy(x+1,y,st(n))
    end;
 end;
procedure my_number(x,y,n:integer;needshadow:boolean);
var sss:string[5];
 begin
   sss:=st(n);newset(7,afon,1,1,afon,afon);
   Sbar3d(x-8,y-5,x+8,y+6,0,false,needshadow);
   if not needshadow then
    begin setcolor(aink);
          outtextxy(x,y,sss);outtextxy(x+1,y,sss);
    end;
 end;
procedure my_line_view(x,y,n:integer;needshadow:boolean);
var sss:string[10];
    l:integer;
 begin
   sss:=st(n);l:=length(sss)*3+1;
   setlinestyle(0,1,1);settextjustify(1,1);
   newset(7,0,1,1,7,0);
   Sbar3d(x-l,y-5,x+l+1,y+6,0,false,needshadow);
   if not needshadow then
   begin setcolor(afon);
         outtextxy(x,y,sss);outtextxy(x+1,y,sss)
   end;
 end;
procedure my_processor(x,y,n:integer;needshadow:boolean);
var sss:string[5];
 begin
   x:=x+15;y:=y-15;
   sss:=st(n);
   newset(10,0,1,1,10,afon);
   ball_shadow(x,y,10,5,needshadow);
   if not needshadow then
   begin setcolor(aink);
         outtextxy(x,y,sss);outtextxy(x+1,y,sss);
   end;
 end;
procedure TMainScreen.PrepareObject(Gd:Integer);
   begin
        currentWIN    :=0;
        newWIN        :=0;
        ErrorInPrepare:=false;
        HideDrawwing  :=false;
        if (Gd = HercMono) or (Gd = EGA) or (Gd = EGA64) or (Gd = VGA) then
        begin NewScreen;
              GotoNewScreen;
        end else
        begin {No paging supported}
              ErrorInPrepare:=true;
        end;
   end;
procedure TMainScreen.NewScreen;
const a0=0;
      a1=1;
   begin if not ErrorInPrepare then
         begin if not HideDrawwing then
               begin if currentWIN=a1 then newWIN:=a0
                                      else newWIN:=a1;
                     SetActivePage(newWIN);
               end;
               HideDrawwing  :=true;
         end;
   end;
procedure TMainScreen.GotoNewScreen;
   begin if not ErrorInPrepare then
         begin SetVisualPage(newWIN);
               currentWIN:=newWIN;
               HideDrawwing  :=false;
               {outtextxy(20,40,'-> '+st(currentWIN));}
         end;
   end;
begin
  all_join_is_equal:=false;
  min_line_work:=1;
  view_nodes_number:=false;
end.