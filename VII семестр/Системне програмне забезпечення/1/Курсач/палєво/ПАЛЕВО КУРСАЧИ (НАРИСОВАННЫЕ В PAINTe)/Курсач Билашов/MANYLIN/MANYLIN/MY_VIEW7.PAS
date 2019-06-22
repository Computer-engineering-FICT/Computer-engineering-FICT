unit my_view7;
interface
uses graph,allnode7,add_man7,as_work7,alltext7;
const
  max_win=2;
var
  type_way:boolean;
  full_mem:type_mem;
function win_name(i:integer):string;
procedure view;
procedure main_view1;
procedure main_view;
procedure get_upper_string;
procedure view_node(var i:integer;insert,needshadow:boolean);
procedure view_line(var i:integer;needshadow:boolean);
procedure view_line0(g:integer;var i:integer;needshadow:boolean);
procedure set_size_all_nodes;
procedure work_all;
procedure tables(t,x,y:integer);
procedure table_other_win;
procedure table_win;
procedure table_patology;
procedure grafics;
procedure my_harkar2;
procedure file_of_lines;
function is_one_no_use(nn:integer):boolean;
procedure file_of_summa(flag:boolean);

implementation
var i,j,jj,dt,n,dy,dx,real_size,x1,x2,x,y:integer;
    last_time,last_size,summa,my_col:integer;
    ccc,ggg:integer;
    fl:boolean;
    f:text;
function win_name(i:integer):string;
 begin
   case i of
     0:win_name:=note(win_dag);
     1:win_name:=note(win_time);
     2:win_name:=note(win_3d);
     else win_name:=note(win_any);
   end;
 end;
{procedure get_my_line(x,y,x2,y2:integer);
 begin
 end;}
procedure view_line0(g:integer;var i:integer;needshadow:boolean);
var x,y,x2,y2:integer;
    var r,dx,ddx,ddy,dy:integer;
begin
  with array_of_lines[i] do if level_of_line=who_see then
  begin
    with array_of_nodes[first_node] do case g of
      1:begin x:=place_x(x_position);y:=place_y(y_position);end;
      2:at_celindr(first_node,x,y);
    end;
    with array_of_nodes[second_node] do case g of
      1:begin x2:=place_x(x_position);y2:=place_y(y_position);end;
      2:at_celindr(second_node,x2,y2);
    end;
    dx:=x2-x;dy:=y2-y;r:=round(sqrt(sqr(dx/10)+sqr(dy/10)));
    if r=0 then r:=1;
    ddx:=round(dx/5);ddy:=round(dy/5);
    dx:=round(dx/r/2);dy:=round(dy/r/2);

    if not needshadow then
    begin if ColSee then setcolor(12) else setcolor(aink);
          moveto(x,y);setlinestyle(0,7,type_of_line);
    end else
    begin moveto(x+dshdw,y+dshdw);setcolor(aShadowInk);
          setlinestyle(UserBitLn, $5555,type_of_line);
    end;
    linerel(x2-x,y2-y);
    moverel(-ddx,-ddy);linerel(+dy-dx   ,-dx-dy);
    linerel(-dy-dy   ,+dx+dx);linerel(+dx+dy   ,+dy-dx);
    if view_work_line then my_line_view(x+ddx*2,y+ddy*2,work_at_line,needshadow)
                      else my_line_view(x+ddx*2,y+ddy*2,line_number,needshadow);
  end;
end;
procedure view_node0(var i:integer;insert,needshadow:boolean);
var x,y:integer;
begin
  settextjustify(1,1);
  with array_of_nodes[i] do if level_of_node=who_see then
  begin
    x:=place_x(x_position);y:=place_y(y_position);
    my_ball(x,y,work_at_node,insert,needshadow);
{    if insert then
       begin setcolor(6);setfillstyle(1,6);end else
       begin setcolor(6); setfillstyle(1,14);end;
    fillellipse(x,y,16,16);
    if insert then setcolor(afon) else setcolor(aink);
    outtextxy(x,y,st(work_at_node));}
    if not needshadow then setcolor(aink);
    if view_number_of_processors then my_processor(x,y,processor,needshadow);
    if view_time then my_time(x+10,y+16,node_time,time_end,needshadow);
    if view_nodes_number then my_number(x-20,y-10,user_number,needshadow);
  end;
end;
procedure view0;
var i:integer;
begin
  {teni}if view_shadow then begin
  setfillstyle(aShadowFill,aShadowInk);setcolor(aShadowInk);
  for i:=1 to last_line do view_line0(1,i,true);
  setcolor(afon);
  for i:=1 to last_node do view_node0(i,false,true);end;
  {images}
  settextjustify(1,1);
  for i:=1 to last_line do view_line0(1,i,false);
  setfillstyle(1,afon);setlinestyle(0,1,1);
  for i:=1 to last_node do view_node0(i,false,false);
  if marked_node<>0 then view_node0(marked_node,true,false);
end;
procedure set_size_all_nodes3;
var i:integer;
begin
  all_time:=get_max_time_work;
  col_proc:=get_max_number_of_processor;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    up_size   :=round(node_time   *(160/all_time))+30;
    proc_size :=round(130+500/(col_proc+1)*processor)-up_size;
  end;
end;
procedure set_size_all_nodes1;
var i:integer;
    mm:real;
begin
  max_time:=get_max_time_work;
  mm:=160/max_time;
  all_proc:=get_max_number_of_processor;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    proc_size :=round(10+560/(all_proc+1)*processor);
    up_size   :=round(node_time           *mm)+20;
    midle_size:=round((work_at_node+node_time)*mm)+20;
{    midle_size:=round(work_at_node        *mm)+up_size;}
    down_size :=round(time_end            *mm)+20;
{    down_size :=round((time_end-node_time)*mm)+up_size;}
  end;
end;
function at(var x:integer):integer;
  begin
    at:=place_y(round(x*(160/max_time))+20);
  end;
procedure view_line1(i:integer;needshadow:boolean);
var x,y,yy,yy2,x2,y2,dx,dy,r,ddx,ddy:integer;
begin
  with array_of_lines[i] do if level_of_line=who_see then
{   if array_of_nodes[second_node].processor<>
      array_of_nodes[first_node].processor then}
  begin
    with array_of_nodes[first_node] do
    begin x:=place_x(proc_size);
          y:=place_y(up_size);   yy:=place_y(midle_size);
    end;
    with array_of_nodes[second_node] do
    begin x2:=place_x(proc_size);
          y2:=place_y(up_size);   yy2:=place_y(down_size);
    end;
    if my_patology=shina then
    begin
      setlinestyle(0,7,1); if not needshadow then newset(7,0,1,2,14,afon);
      dx:=at(line_time);dy:=at(time_end);
      Sbar3d(x,dx,x2,dy,0,false,needshadow); moveto(x2,dy);
      if not needshadow then setcolor(aink);
      if x>x2 then lineto(x2-5,round((dx+dy)/2))
              else lineto(x2+5,round((dx+dy)/2));
      lineto(x2,dx);
    end;
    dx:=x2-x;
    if not needshadow then
    begin if ColSee then setcolor(12) else setcolor(aink);
          setlinestyle(0,7,type_of_line);
    end else setlinestyle(0,$11,1);
    dy:=y2-yy;r:=round(sqrt(sqr(dx/10)+sqr(dy/10)));
    if r=0 then r:=1;
    ddx:=round(dx/5);ddy:=round(dy/5);
    dx:=round(dx/r/2);dy:=round(dy/r/2);
    if needshadow then moveto(x+dshdw,yy+dshdw) else moveto(x,yy);
    linerel(x2-x,y2-yy);
    moverel(-ddx,-ddy);linerel(+dy-dx   ,-dx-dy);
    linerel(-dy-dy   ,+dx+dx);linerel(+dx+dy   ,+dy-dx);
     if array_of_nodes[second_node].processor<>
      array_of_nodes[first_node].processor then
{                  outtextxy(x+ddx*2,yy+ddy*2,st(work_at_line));end}
    if view_work_line then my_line_view(x+ddx*2,yy+ddy*2,work_at_line,needshadow)
                      else my_line_view(x+ddx*2,yy+ddy*2,line_number,needshadow);
  end;
end;
procedure view_node1(var i:integer;b,needshadow:boolean);
var
  x,y,yy,yyy:integer;
begin
  settextjustify(0,2);
  with array_of_nodes[i] do if level_of_node=who_see then
  begin
    if b then setcolor(7) else setcolor(aink);
    setlinestyle(0,7,1);
    x:=place_x(proc_size);  y:=place_y(up_size);

    yy:=place_y(midle_size); yyy:=place_y(down_size);
    {if b then setfillstyle(11,6) else setfillstyle(10,afon);}
    if b then setfillstyle(9,6) else setfillstyle(9,aink);
    if yyy<>yy then bar3d(x-10,y,x+10,yyy,5,false);
    {рабочая часть вершины}
    {if b then setfillstyle(5,6) else setfillstyle(9,aink); то-что было}
    if b then setfillstyle(1,6) else setfillstyle(8,7);
    bar3d(x-10,y,x+10,yy,5,false);

    yyy:=round((y+yy)/2); {setcolor(aink);
    {if view_status then case status of
       no_use :outtextxy(x+20,yyy,'No_use');
       use    :outtextxy(x+20,yyy,'use');
       at_way :outtextxy(x+20,yyy,'at_way');
       correct:outtextxy(x+20,yyy,'correct');
       end else}
    settextjustify(1,1);
    if view_time then my_time(x+20,yyy,work_at_node,time_end-node_time-work_at_node,needshadow);
{    outtextxy(x+20,yyy,st(work_at_node)+'+'+
    st(time_end-node_time-work_at_node))
    {else outtextxy(x+20,yyy,st(i)+' / '+st(number))};

    if view_nodes_number then my_number(x-20,y+10,user_number,needshadow);
  end;
end;
procedure time_in_system1(i:integer);
var x,y,yy:integer;
begin
  with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    x:=place_x(proc_size);
    if (x>5) and (x<640) then
    begin
    y:=place_y(up_size);yy:=place_y(down_size);setlinestyle(2,2,1);
    setcolor(7);
    moveto(20,yy);lineto(x,yy);
    moveto(620,y);lineto(x,y);
    setcolor(aink);
    outtextxy(20,yy,st(time_end));
    outtextxy(625,y,st(node_time));
    end;
  end;
end;
procedure view1;
var i,x:integer;
begin
  if (all_proc<>0)and(max_time<>0)then
  begin
    for i:=1 to last_node do time_in_system1(i);
    {teni}
    if view_shadow then
    begin setfillstyle(aShadowFill,aShadowInk);setcolor(aShadowInk);
          for i:=1 to last_line do view_line1(i,true);
          setcolor(afon);
          for i:=1 to last_node do view_node1(i,false,true);
    end;
    {after tini}
    for i:=1 to last_line do view_line1(i,false);
    setlinestyle(0,7,1);
    for i:=1 to last_node do view_node1(i,false,false);
    settextjustify(1,1);
    for i:=1 to all_proc do
    begin
      x:=place_x(round(10+560/(all_proc+1)*i));
      newset(10,0,1,1,10,afon);
      fillellipse(x,30,10,5);setcolor(aink);outtextxy(x,29,st(i));;
    end;
  end;
  if marked_node<>0 then view_node1(marked_node,true,false);
end;
procedure view_line(var i:integer;needshadow:boolean);
begin
  case my_win of
    graf_nodes:view_line0(1,i,needshadow);
    time      :view_line1(i,needshadow);
  end;
end;
procedure view_node(var i:integer;insert,needshadow:boolean);
begin
  if i<>0 then case my_win of
    graf_nodes:view_node0(i,insert,needshadow);
    time      :view_node1(i,insert,needshadow);
    three_dim :if insert then view;
  end;
end;
procedure vus(i:integer;fl:boolean);
const
  up_str:array[1..6]of text_num=(us_file,us_window,us_edit,us_F8_processors,
   us_F9_algoritm,us_quit);
  x_str:array[1..6] of integer=(190,260,330,430,530,600);
var j,a:integer;
begin
  j:=x_str[i];a:=length(note(up_str[i]))*3+5;
  settextjustify(1,1);
  if fl then newset(7,0,1,1,afon,afon) else newset(1,0,1,1,1,0);
  bar(j-a,3,j+a,15);
  if fl then setcolor(aink) else setcolor(afon);
  outtextxy(j,7,note(up_str[i]));
end;
procedure view_upper_string;
var i:integer;
begin
  settextjustify(1,1);
  newset(afon,afon,1,1,1,0);
  bar3d(0,1,639,17,2,true);
  for i:=1 to 6 do vus(i,false);
end;
procedure tables(t,x,y:integer);
const
  max_t=5;t_num:array[1..max_t+1] of integer=(1,10,16,24,33,35);
var
  i,j:integer;  f:boolean; ss:string;
  procedure view_t_str(j:integer;c:boolean);
  var i,a,y1:integer;
      name_of_lin:string;
  begin
    i:=t_num[t]+j-1;
    if (i>23)and(i<32) then name_of_lin:=st(i-23)+'-'+alg_name[ord(my_text),use_algoritm[i-23]]
                       else name_of_lin:=tbl_str_names(i);
    if c then newset(afon,0,1,1,1,afon) else newset(afon,afon,1,1,7,7);
    y1:=y+j*15-9;
    bar(x+5,y1+2,x+295,y1+16);
    outtextxy(x+15,y1,name_of_lin);
  end;
begin
  setusercharsize(3,2,3,2);
  i:=t_num[t+1]-t_num[t];settextjustify(0,2);
  newset(0,0,1,1,7,7);
  bar3d(x,y,x+300,y+(i+1)*15,4,true);
  for j:=1 to i do view_t_str(j,false);
  j:=1;
  repeat
    view_t_str(j,true);pause;view_t_str(j,false);
    case s of
      up   :if j<2 then j:=i else dec(j);
      down :if j<i then inc(j) else j:=1;
      left :j:=1;
      right:j:=i;
    end;
  until (s=enter)or(s=esc);
  if s=enter then begin
    j:=j+t_num[t]-1;
    case j of
      1,6,7,30:functional_key:=true;
      else functional_key:=false;
    end;
    case j of
     1:begin s:=F3;end;
     2:begin save(true);s:='v';end;
     3:begin save(false);s:='v';end;
     4:begin marked_node:=0;last_node:=0;
      last_line:=0;who_see:=1;
      view;info('все стерли');s:=' ';end;
     5:begin delete_who_see;view;info('стерли текущий слой');s:=' ';end;
     6:s:=F5;
     7:s:=F6;
     8:begin if ColSee then ColSee:=false else ColSee:=true;view;s:='■';end;
     9:begin if my_text=english then my_text:=other
                else my_text:=pred(my_text);
                InitNewLanguage(my_text);
                view;info(note(_l_));s:='■';
       end;
     10:s:='e';
     11:s:='w';
     12:s:='a';
     13:s:='k';
     14:s:='b';
     15:s:='j';
     16:begin all_at_one    ;work_all;s:='v';end;
     17:begin all_at_another;work_all;s:='v';end;
     18,19: if marked_node<>0 then
       with array_of_nodes[marked_node] do
      begin
      case j of
      19:if processor>0 then dec(processor);
      18:inc(processor);
      end;
      work_all;view;
     end;
     20:begin s:='C';end;
     21:s:='r';
     22:begin
         f:=small_klaster;ss:=last_info;
         work_all;view;
         if f then info('Set NEW Klaster. '+last_info)
              else info(ss);
        end;
     23:begin all_at_large_to_one_proc;work_all;view;end;
     24..31:s:=chr(j-24+ord('1'));
     32:s:=F4;
     33:s:='1';
     34:s:='2';
     else s:='v';
    end;
   end else if s=esc then s:='v';
   setusercharsize(1,1,1,1);
end;
procedure get_upper_string;
var i:integer;
begin
  i:=1;{strela;}settextjustify(0,2);
  repeat
    vus(i,true);pause;vus(i,false);
    case s of
      left :if i>1 then dec(i) else i:=6;
      right:if i<6 then inc(i) else i:=1;
    end;
  until (s=enter)or(s=esc);
  vus(i,true);
  if s= enter then case i of
    1:tables(1,50,30);
    2:tables(2,150,30);
    3:s:='b';
    4:tables(3,250,30);
    5:tables(4,300,30);
    6:s:=esc;
    else begin s:=F1;functional_key:=true;end;
  end else s:=' ';
  vus(i,false);
end;
procedure view;
begin
  MScreen.NewScreen;
  setusercharsize(1,1,1,1);clr;
  case my_win of
    graf_nodes:view0;
    time      :view1;
    three_dim :main_view;
  end;
  view_upper_string;setcolor(14);settextjustify(1,1);
  outtextxy(85,8,name_patology(ord(my_patology))+'...'+win_name(ord(my_win)));
  setcolor(aink);outtextxy(40,getmaxy-20,st(get_max_time_work));
  MScreen.GotoNewScreen;
end;
procedure set_size_all_nodes;
begin
  case my_win of
    time      : set_size_all_nodes1;
    three_dim : set_size_all_nodes3;
  end;
end;
procedure work_all;
begin
  work;set_size_all_nodes;
end;
procedure celindr;
  var i,x,y:integer;
  begin
    clr;setfillstyle(1,9);
      col_proc:=get_max_number_of_processor;
      for i:=1 to last_line do view_line0(2,i,false);
      setlinestyle(0,0,1);
      for i:=1 to col_proc do
      begin
           at_celindr(i,x,y);newset(0,0,1,1,14,afon);
           fillellipse(x,y,10,10);
           setcolor(aink);outtextxy(x,y,st(i));
      end;
    pause;
end;
procedure table_win;
var i:integer;
procedure view_name(i:integer;insert:boolean);
begin
  if insert then setcolor(aink) else setcolor(5);
  outtextxy(400,60+i*15,win_name(i));
end;
begin
  setfillstyle(1,3);bar3d(250,30,550,110,5,true);
  settextjustify(1,1);
  setcolor(afon);outtextxy(400,40,note(tbl_win_of_visualized));
  for i:=0 to max_win do view_name(i,false);
  i:=ord(my_win);
  repeat
    view_name(i,true);pause;view_name(i,false);
    case s of
      up   :if i>0 then dec(i);
      down :if i<max_win then inc(i);
      enter:begin
            my_win:=all_win(i);
            work_all;
            end;
    end;
  until (s=enter)or(s=esc);
  if s=enter then clear_coord;
  s:='№';
end;
procedure table_other_win;
const
  max_other_win=2;
  other_name:array[0..3,1..max_other_win]of string[30]=
     (('Upper view','3D image'),
      ('Вид сверху','Трехмерное изображение'),
      ('p_Вид сверху','p_Трехмерное изображение'),
      ('Вид сверху','Трехмерное изображение'));
var i:integer;
procedure view_name(i:integer;insert:boolean);
begin
  if insert then setcolor(aink) else setcolor(5);
  outtextxy(200,50+i*10,other_name[ord(my_text),i]);
end;
begin
  setfillstyle(1,2);bar3d(50,30,350,110,5,true);
  settextjustify(1,1);
  setcolor(afon);outtextxy(200,40,note(So_windows));
  for i:=1 to max_other_win do view_name(i,false);
  i:=1;
  repeat
    view_name(i,true);pause;view_name(i,false);
    case s of
      up   :if i>1 then dec(i);
      down :if i<max_other_win then inc(i);
    end;
  until (s=enter)or(s=esc);
  if s=enter then case i of
                  1:celindr;
                  2:grafics;
                  end;
  s:='№';
end;
procedure table_patology;
var i,j:integer;
procedure view_name(i:integer;insert:boolean);
begin
  if insert then setcolor(14) else setcolor(4);
  outtextxy(200,mmyy(50+i*10),name_patology(i));
end;
begin
  setcolor(7);setfillstyle(1,7);bar3d(50,mmyy(30),450,mmyy(110),5,true);
  settextjustify(1,1);
  setcolor(afon);outtextxy(200,mmyy(40),note(Modeling_system));
  for i:=0 to max_patology do view_name(i,false);
  i:=ord(my_patology);image_patology(i);
  repeat
    view_name(i,true);pause;view_name(i,false);j:=i;
    case s of
      up   :if i>0 then dec(i);
      down :if i<max_patology then inc(i);
      enter:begin
            full_mem:=use_line;
            my_patology:=all_patology(i);
            if my_patology=memory then full_mem:=no_use_line;
            for i:=1 to last_line do
              with array_of_lines[i] do
              if level_of_line=who_see then mem:=full_mem;
            correct_number_of_processor;
            refresh_processors;
            work_all;
            end;
    end;
    if j<>i then image_patology(i);
  until (s=enter)or(s=esc);
  s:='№';
end;
procedure init;
begin
  col_proc:=get_max_number_of_processor;
  if col_proc=0 then col_proc:=1;
  all_time:=get_max_time_work;
end;
procedure set_time_all_proc(dt:integer);
var a,b,j,mm:integer;
begin
  for j:=0 to col_proc+1 do with array_of_proc[j] do
   buzy_time:=0;
  if use_buzy<>1 then for j:=1 to last_line do
  with array_of_lines[j] do if level_of_line=who_see then
   if (line_time<=dt)and(time_end>dt) then
   with array_of_nodes[first_node] do
   begin
    if type_of_line=1 then mm:=2 else mm:=3;
    if array_of_nodes[second_node].processor>processor then
  for a:=processor to array_of_nodes[second_node].processor do
      array_of_proc[a].buzy_time:=mm else
  for a:=array_of_nodes[second_node].processor to processor do
      array_of_proc[a].buzy_time:=mm;
   end;
   if use_buzy<>2 then for j:=1 to last_node do
   with array_of_nodes[j] do if level_of_node=who_see then
   if (node_time<=dt)and(time_end>dt) then
   if marked_node=j then array_of_proc[processor].buzy_time:=5
                    else array_of_proc[processor].buzy_time:=4;
end;
procedure memore_time;
var j:integer;
begin
  for j:=1 to all_proc do with array_of_proc[j] do
    last_time:=buzy_time;
  last_dt:=dt;
end;
procedure main_view;
var j:integer;
begin
  init;n:=round(300/col_proc);
{  if all_time=0 then all_time:=1;}
  for j:=1 to col_proc do
    array_of_proc[j].our_node:=mmyy(round(30*buzy(j)/all_time));
  dt:=0;
  set_time_all_proc(dt);
  repeat
    memore_time;
    next_dt(dt);set_time_all_proc(dt);
    setcolor(7);
    for j:=1 to col_proc do my_bar(dt,j);
    setcolor(aink);
    outtextxy(620-round(150/all_time*dt),mmyy(60+round(300/all_time*dt)),st(dt)+'t');
  until (dt>=all_time);
end;
procedure main_view1;
var j:integer;
begin
   clr;
  table_line;
  outtextxy(151,mmyy(150),note(Processors_balansing));
  outtextxy(480,mmyy(30),note(Time_statistics));
  init;n:=round(300/col_proc);
  setfillstyle(1,11);setcolor(2);
  bar3d(15,mmyy(180),320,mmyy(380),5,true);
  summa:=0;
  for j:=1 to col_proc do
  begin
    array_of_proc[j].buzy_time:=buzy(j);
    dx:=round(array_of_proc[j].buzy_time/all_time*100);
    x:=15+j*n;
    newset(afon,afon,1,9,3,afon);bar3d(x-n,mmyy(380-dx),x,mmyy(380),0,false);
    setcolor(1);line(x-n,mmyy(380-dx),x,mmyy(380-dx));
    if j=1 then line(15,mmyy(380),15,mmyy(380-dx))
           else line(x-n,mmyy(380-dx),x-n,mmyy(y));
    y:=190-dx;
    setcolor(aink);
    inc(summa,dx);
    outtextxy(x-round(n/2),mmyy(200),st(dx)+'%');
    outtextxy(x-round(n/2),mmyy(360),st(j));
  end;
  outtextxy(155,mmyy(280),st(round(summa/col_proc))+'%');
  setcolor(1);line(x,mmyy(y),x,mmyy(380));

  last_time:=0;last_size:=0;n:=round(200/col_proc);
  my_col:=round(col_proc*1.5);
  setfillstyle(1,afon);setcolor(5);
  bar3d(330,mmyy(60),630,mmyy(380),5,true);
  for j:=0 to col_proc do
   begin
     setcolor(4);x:=round(330+n*j);
     if j<>0 then line(x,mmyy(60),x,mmyy(380));
     setcolor(aink);
     outtextxy(x,mmyy(370),st(round(100/col_proc*j))+'%');
   end;
  dt:=0;
  size_time_at(dt,x1,x2);real_size:=x1+x2;
  if x1>my_col then x1:=my_col;
  if x1+x2>my_col then x2:=my_col-x1;
  x1:=x1*n+331;x2:=x2*n+x1;
  dy:=mmyy(60);dx:=330;
  repeat
    next_dt(dt);
    y:=mmyy(round(60+320/all_time*dt));
    newset(7,0,1,1,3,0);  if x1<>0 then bar3d(331,dy,x1,y+1,0,false);
    newset(7,0,1,9,11,afon);if x2>x1 then bar3d(x1,dy,x2,y+1,0,false);
    setcolor(1);line(x2,dy,x2,y);line(dx,dy,x2,dy);
    setcolor(aink);
    if real_size>col_proc then
      outtextxy(340,round((y+dy)/2),
      st(round(100/col_proc*real_size))+'%');
    if y-last_time>8 then if last_size<>real_size then
    begin
      outtextxy(620,round((y+dy)/2),st(dt));
      last_time:=y;last_size:=real_size;
    end;
    dx:=x2;
    size_time_at(dt,x1,x2);real_size:=x1+x2;
    if x1>my_col then x1:=my_col ;
    if x1+x2>my_col then x2:=my_col -x1;
    x1:=x1*n+331;x2:=x2*n+x1;
    dy:=y;
  until (dt>=all_time);
  setcolor(1);line(330,mmyy(380),dx,y);
end;
procedure grafics;
  procedure my_view(c:integer);
   begin setcolor(c);outtextxy(30,mmyy(use_buzy*20),'>');end;
begin
  jj:=1;
  repeat
    if jj=1 then main_view1 else begin clr;main_view;end;
  repeat
  fl:=true;
  my_view(0);pause;my_view(7);
  case s of
    up:if use_buzy>1 then dec(use_buzy) else use_buzy:=3;
    down:if use_buzy<3 then inc(use_buzy) else use_buzy:=1;
    esc:s:=enter;
    '1': begin all_at_one;
         for i:=1 to last_node do with array_of_nodes[i] do
          if level_of_node=who_see then status:=no_use;
         work;
         end;
    '2': begin all_at_another;
         for i:=1 to last_node do with array_of_nodes[i] do
         if level_of_node=who_see then status:=no_use;
         work;
        end;
    'v':clr;
{    '9':if ccc>0 then dec(ccc) else ccc:=7;
    '0':if ccc<15 then inc(ccc) else ccc:=1;
    '+':if ggg<12 then inc(ggg) else ggg:=1;
    '-':if ggg>1 then dec(ggg) else ggg:=12;}
    'n':if jj=1 then begin clr;jj:=2;end else jj:=1;
    else if s<>enter then fl:=false;
    end;
    until fl;
    until s=enter;
end;
procedure file_of_summa(flag:boolean);
  var i,t0,tmin:integer;
  procedure set_line_no_use(i,kol:integer);
  begin
    if kol>=0 then kol:=-100;
    array_of_lines[i].line_number:=kol;
  end;
  procedure init_lines;
  var i:integer;
  begin
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then line_number:=work_at_line;
  end;
  function can_use_line(i:integer):boolean;
  begin
    can_use_line:=true;
    with array_of_lines[i] do
    if not long_line(i) then can_use_line:=false else
    if line_number<0 then can_use_line:=false;
  end;
  function equal_processors(i,j:integer):boolean;
  var p1,p2,p3,p4:integer;
  begin
    equal_processors:=false;
    p1:=array_of_nodes[array_of_lines[i].first_node].processor;
    p2:=array_of_nodes[array_of_lines[i].second_node].processor;
    p3:=array_of_nodes[array_of_lines[j].first_node].processor;
    p4:=array_of_nodes[array_of_lines[j].second_node].processor;
    if ((p1=p3)and(p2=p4))or((p1=p4)and(p2=p3)) then equal_processors:=true;
  end;
  procedure set_lines_number;
  var i,j,sum:integer;
  begin
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
          if can_use_line(i) then line_number:=0;
    for i:=1 to last_line do
      with array_of_lines[i] do if level_of_line=who_see then
      if can_use_line(i) then if line_number=0 then
    begin
      sum:=work_at_line;
      for j:=i+1 to last_line do with array_of_lines[j] do
      if level_of_line=who_see then if can_use_line(j) then
        if equal_processors(i,j) then inc(sum,work_at_line);
      line_number:=sum;
      for j:=i+1 to last_line do with array_of_lines[j] do
      if level_of_line=who_see then if can_use_line(j) then
        if equal_processors(i,j) then line_number:=sum;
    end;
  end;
  function get_high_line:integer;
  var i,high:integer;
  begin
    high:=0;
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
    if can_use_line(i) then if high=0 then high:=i else
    if array_of_lines[high].line_number<=line_number then high:=i;
    get_high_line:=high;
  end;
begin
  if flaG THEN
  begin
    view_work_line:=false;
    assign(f,'file_2.txt');rewrite(f);
    writeln(f,'   Пошаговое изменение веса обнуляемой связи.');
    writeln(f,' (файл формируется в MANYLINES при нажатии F10)');
    writeln(f,'                   ---===*===---');
  end;
  sort_graf;
  all_at_another;
  init_lines;set_lines_number;
  if flaG THEN
  begin
    writeln(f,'Первоначальные веса пересылок:');
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then write(f,line_number:4);
    writeln(f);
    writeln(f,'Пошаговое изменение:');
  end;
  work;t0:=get_max_time_work;
  tmin:=get_high_line;
  while tmin<>0 do with array_of_lines[tmin] do if level_of_line=who_see then
                   with array_of_nodes[first_node] do
  begin
    save_proc;
    set_processor(processor,array_of_nodes[second_node].processor);
    work;
    max_time:=get_max_time_work;
    if max_time>t0 then begin load_proc;set_line_no_use(tmin,t0-max_time);end else
    begin
      t0:=get_max_time_work;set_lines_number;
    end;
    if flaG THEN
    begin
      for i:=1 to last_line do if long_line(i) then
      with array_of_lines[i] do
      if level_of_line=who_see then write(f,line_number:4)
        else write(f,'--':4);
      writeln(f);
      correct_number_of_processor;
      marked_node:=first_node;
      work_all;view;info(st(tmin));pause;
    end;
    tmin:=get_high_line;
  end;
  if flaG THEN close(f);
end;
procedure my_harkar2;
var i,t0,t1,l2,last_proc:integer;
begin
  tmin:=0;
  t0:=get_max_time_work;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  begin
    line_number:=used_line;
    type_of_line:=small;
    with array_of_nodes[second_node] do
    if processor<>array_of_nodes[first_node].processor then
    begin
      save_proc;
set_processor(processor,array_of_nodes[first_node].processor);
      work;
      load_proc;
      line_number:=get_max_time_work-t0;
    end;
    if tmin=0 then tmin:=i else
    begin
      l2:=array_of_lines[tmin].line_number;
      if line_number<l2 then tmin:=i else
      if line_number=l2 then
      if work_at_line>
         array_of_lines[tmin].work_at_line then tmin:=i;
    end;
  end;
  if tmin<>0 then array_of_lines[tmin].type_of_line:=large;
end;
function is_one_no_use(nn:integer):boolean;
var i:integer;
begin
  is_one_no_use:=false;
  if nn<>6 then
  begin
    for i:=1 to last_node do with array_of_nodes[i] do
     if level_of_node=who_see then
      if status<>use then is_one_no_use:=true;
    if nn=5 then if tmin=0 then is_one_no_use:=false else
      if tmin>0 then with array_of_lines[tmin] do
        if line_number>0 then is_one_no_use:=false;
  end else if tmin>0 then is_one_no_use:=true;
end;
procedure file_of_lines;
var i,tact,kol_nodes,kol_lines:integer;
begin
  assign(f,'file_1.txt');rewrite(f);
  writeln(f,'Пошаговая работа модифицированного алгоритма Шаркара.');
  writeln(f,'Информация  по  каждой  ссылке  на  каждом  шаге.');
  writeln(f,' (файл формируется в MANYLINES при нажатии F10)');
  writeln(f,'                   ---===*===---');
  work_all;writeln(f,'Исходный граф: ',get_max_time_work,' tact');
  writeln(f,'Вершина/процессор.');
  kol_nodes:=0;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    inc(kol_nodes);number:=kol_nodes;
    writeln(f,kol_nodes:3,':  ',work_at_node:4,processor:5);
  end;
  writeln(f,'');
  kol_lines:=0;
  writeln(f,'Дуга/ночало/конец.');
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  begin
    inc(kol_lines);
    write  (f,kol_lines:3,':  ',work_at_line:4);
    write  (f,array_of_nodes[first_node].number:5);
    writeln(f,array_of_nodes[second_node].number:3);
  end;
  writeln(f);
  writeln(f,'Выполнение по каждой пересылке:');
  all_at_another;
  tmin:=-1;
   for i:=1 to last_node do with array_of_nodes[i] do
   if level_of_node=who_see then status:=no_use;
  {init_by(5);}
  work_all;
  tact:=0;
  write(f,'Дуга ');
  for i:=1 to kol_lines do write(f,i:3);writeln(f,' Minimization...');
  writeln(f);
  while is_one_no_use(5) do
  begin
    my_harkar2;
    inc(tact);
    write(f,tact:3,': ');
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
    if line_number=used_line then write(f,'  -')else write(f,line_number:3);
    writeln(f,'   Line-->',Tmin);
    go2;
    work_all;
  end;
  writeln(f);
  write(f,'Дуга ');
  for i:=1 to kol_lines do if long_line(i) then write(f,'   ') else write(f,'@@@');
  writeln(f);
  work_all;writeln(f,'Полученный граф: ',get_max_time_work,' tact');
  writeln(f,'Вершина/процессор.');
  kol_nodes:=0;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    inc(kol_nodes);
    writeln(f,kol_nodes:3,':  ',work_at_node:4,processor:5);
  end;
  close(f);
end;
begin
  my_win:=graf_nodes;
end.