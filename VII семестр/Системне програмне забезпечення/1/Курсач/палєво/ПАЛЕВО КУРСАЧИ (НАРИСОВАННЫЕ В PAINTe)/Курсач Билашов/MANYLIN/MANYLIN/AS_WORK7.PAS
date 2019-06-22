unit as_work7;
interface
uses alltext7,allnode7,add_man7,graph;
procedure FuckLine(xx1,yy1,xx2,yy2,Work_:integer;NeedShadow:boolean);
function name_patology(i:integer):string;
procedure work;
procedure set_new_flag(i:integer);
procedure setings;
procedure all_at_one;
procedure set_ohered;
procedure my_alg;
implementation
var time_hin,number_buzy_proc:integer;
function name_patology(i:integer):string;
 begin
   case i of
    0:name_patology:=note(full_joion_patology);
    1:name_patology:='Шина';
    2:name_patology:='Общая память';
    else name_patology:=note(uncknown_patology);
   end;
 end;
procedure all_at_one;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then processor:=1;
  view_number_of_processors:=true;
end;
function can_start(my_node:integer):boolean;
var f:boolean;
    i:integer;
begin
  can_start:=true;
  f:=true;
  for i:=1 to last_line do if f then
  with array_of_lines[i] do if level_of_line=who_see then
  if second_node=my_node then if time_end=0 then
  begin
    can_start:=false;
    f:=false;
  end;
end;
function get_time_start(my_node:integer):integer;
var i:integer;
    time:integer;
    f:boolean;
begin
  f:=true;
  time:=0;
  for i:=1 to last_line do if f then
  with array_of_lines[i] do if level_of_line=who_see then
  if second_node=my_node then
  if line_time<0 then
  begin
    time:=-1;
    f:=false;
  end else if time_end>time then time:=time_end;
  if f then with array_of_nodes[my_node] do
       if number>time then time:=number;
  get_time_start:=time;
end;
function get_begin_nodes:integer;
var i,current_node:integer;
    time,time_2:integer;
begin
  current_node:=0; time_2:=0;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if node_time<0 then
  begin
    time:=get_time_start(i);
    if time<>-1 then if (time<time_2)or(current_node=0) then
    begin current_node:=i;time_2:=time;end;
  end;
  get_begin_nodes:=current_node;finding_node:=current_node;
  if current_node<>0 then with array_of_nodes[current_node] do
  begin
    node_time:=time_2;time_end:=node_time+work_at_node;
  end;
end;
procedure add_number_times(j:integer);
var i:integer;
    my_processor,my_node_time:integer;
begin
  with array_of_nodes[j] do begin
    my_processor:=processor;
    my_node_time:=time_end;
  end;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  if first_node=j then
  begin
    line_time:=my_node_time;
    if my_processor=array_of_nodes[second_node].processor
    then time_end:=line_time else
    time_end:=line_time+work_at_line;
  end;
  for i:=1 to last_node do if i<>j then
  with array_of_nodes[i] do if level_of_node=who_see then
  if processor=my_processor then if node_time<0 then
  if number<my_node_time then number:=my_node_time;
end;
procedure clear_buzy_time_in_all;
var i:integer;
begin
  for i:=1 to all_proc do with array_of_proc[i] do
    begin buzy_time:=0;our_node:=0;end;
end;
procedure clear_nodes_time;
  var i,j:integer;
  begin
    for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node=who_see then
    begin node_time:=-1;number:=-1;time_end:=0;end;
  end;
procedure clear_lines_time;
  var i,j:integer;
  begin
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
    begin line_time:=-1;time_end:=0;end;
  end;
procedure every_proc_our_node;
var i,j:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if number=-1 then with array_of_proc[processor] do
      if our_node=0 then
    if can_start(i) then
    begin
      our_node:=i;
    end;
end;
procedure work_at_proc2;
var i:integer;
begin
  for i:=1 to all_proc do with array_of_proc[i] do
    if our_node<>0 then with array_of_nodes[our_node] do
    if number=-1 then
  begin
    node_time:=max(get_time_start(our_node),buzy_time);
    number:=0;
    time_end:=node_time+work_at_node;
    inc(number_buzy_proc);
  end else inc(number_buzy_proc);
end;
procedure set_all_line(who:integer);
var p:array[1..max_proc] of boolean;
    prostoy:array[1..max_proc] of integer;
    j,i,num,CurrentStartLineTime,NodeCanSendLinesAt:integer;
begin
  num:=0;{ <---суммарное время пересылок из вершины WHO }
  for i:=1 to all_proc do begin p[i]:=false;prostoy[i]:=0;end;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then if first_node=who then
    begin {пересылки вершины WHO }
      if long_line(i) then
        begin
          j:=array_of_nodes[second_node].processor;
          p[j]:=true; prostoy[j]:=work_at_line;
          if not all_join_is_equal then inc(num,work_at_line) else
             if work_at_line>num then num:=work_at_line
        end;
    end;
  array_of_nodes[who].number:=1;
  with array_of_nodes[who] do if num>0 then
  begin

    if time_end>time_hin then time_hin:=time_end
                         else if ProcWaitSendInfo then time_end:=time_hin;
    CurrentStartLineTime:=max(time_end,time_hin);
    NodeCanSendLinesAt  :=CurrentStartLineTime;
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then if first_node=who then
    begin
      if long_line(i) then
      begin line_time:=CurrentStartLineTime;
            if not all_join_is_equal
                   then inc(CurrentStartLineTime,work_at_line);
            time_end:=line_time+work_at_line {расчет пересылок между процессами}
      end else
      begin line_time:=NodeCanSendLinesAt;
            time_end :=NodeCanSendLinesAt;
      end;
    end;
    inc(time_hin,num);
    if ProcWaitSendInfo then inc(array_of_nodes[who].time_end,num);
    for i:=1 to all_proc do if p[i] then
     {если прерывали работу пересылкой}
      with array_of_proc[i] do if our_node<>0 then
      with array_of_nodes[our_node] do
      if ProcWaitSendInfo then inc(time_end,prostoy[i]);
  end else {если пересылки на одном и том же процессоре}
          for i:=1 to last_line do with array_of_lines[i] do
           if level_of_line=who_see then if first_node=who then
           begin
             line_time:=array_of_nodes[who].time_end;
             array_of_lines[i].time_end:=line_time;
           end;
end;
procedure get_step_work;
var i:integer;
    pr,time:integer;
begin
  pr:=0;time:=0;
  for i:=1 to all_proc do with array_of_proc[i] do
   if our_node<>0 then with array_of_nodes[our_node] do
   if number=0 then
   if pr=0 then begin pr:=i;time:=time_end;end
   else if time_end<time then begin pr:=i;time:=time_end;end;
  if pr=0 then
  begin
  end else
  with array_of_proc[pr] do
  begin
    array_of_nodes[our_node].number:=1;
    i:=our_node;our_node:=0;
    set_all_line(i);
    buzy_time:=array_of_nodes[i].time_end;
  end;
end;
procedure how_many_time2;
var i,j:integer;
    stop:boolean;
    pr,time:integer;
begin
  time_hin:=0;

  clear_buzy_time_in_all;
  clear_nodes_time;
  clear_lines_time;
  number_buzy_proc:=1;
  while number_buzy_proc>0 do
  begin
    number_buzy_proc:=0;
    every_proc_our_node;
    work_at_proc2;
    get_step_work;
  end;
end;
procedure work;
begin
  all_proc:=get_max_number_of_processor;
  case my_patology of
    full_join,memory: begin
                 clear_nodes_time;
                 clear_lines_time;
                 while get_begin_nodes<>0 do
                 add_number_times(finding_node);
               end;
    shina: how_many_time2;
  end;
end;
function get_node_min_number:integer;
var i,j,n:integer;
begin
  j:=0; n:=-1;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if status=no_use then
  if (j=0)or(n>number) then begin n:=number;j:=i;end;
  get_node_min_number:=j;
end;
procedure clear_proc_time;
var i:integer;
begin
  for i:=1 to all_proc do array_of_proc[i].last_time:=0;
end;
procedure clear_proc_buzy_time;
var i:integer;
begin
  for i:=1 to all_proc do with array_of_proc[i] do
   buzy_time:=last_time;
end;
procedure fill_proc_buzy_time(what_node,what_time:integer);
var i:integer;
begin
  with array_of_nodes[what_node] do
  for i:=1 to all_proc do with array_of_proc[i] do
  if processor<>i then
   buzy_time:=max(buzy_time,time_end+what_time);
end;
function get_min_buzy_proc:integer;
var i,j,sub_summa,summa:integer;
begin
  j:=0;summa:=0;
  for i:=1 to all_proc do with array_of_proc[i] do
  begin
    sub_summa:=buzy_time;
    our_node:=sub_summa;
    if (j=0)or (summa>sub_summa) then
     begin j:=i;summa:=sub_summa;end;
  end;
  if j=0 then get_min_buzy_proc:=1 else get_min_buzy_proc:=j;
end;
procedure set_ohered;
var i,j:integer;
    flag:boolean;
  procedure run_node_use;
  var i:integer;
  begin
    for i:=1 to last_node do with array_of_nodes[i] do
     if level_of_node=who_see then
      begin status:=use; number:=0; end;
  end;
  procedure other_node_no_use;
  var i:integer;
  begin
    for i:=1 to last_line do with array_of_lines[i] do
     if level_of_line=who_see then
      begin array_of_nodes[second_node].status:=no_use;
      type_of_line:=large; end;
  end;
  procedure may_be_use;
  var i:integer;
  begin
    for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node=who_see then time_end:=1;
  end;
  procedure who_realy_use;
  var i:integer;
  begin
    for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node=who_see then
    if time_end=1 then status:=use;
  end;
begin
  run_node_use;
  other_node_no_use;
  repeat
    flag:=false;
    may_be_use;
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
    if type_of_line=large then
    with array_of_nodes[first_node] do
    if status=no_use then array_of_nodes[second_node].time_end:=0 else
    begin
      flag:=true;
      type_of_line:=small;
      j:=number+work_at_line+work_at_node;
      with array_of_nodes[second_node] do
        number:=max(number,j);
    end;
    who_realy_use;
  until flag=false;
end;
procedure my_alg;
var i,j:integer;
    s1:string;
begin
  all_proc:=1;
  set_ohered;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then status:=no_use;
  clear_proc_time;
  i:=get_node_min_number;
  if i<>0 then repeat
    with array_of_nodes[i] do if level_of_node=who_see then
    begin
      clear_proc_buzy_time;
      for j:=1 to last_line do with array_of_lines[j] do
      if level_of_line=who_see then
      if second_node=i then
      fill_proc_buzy_time(first_node,work_at_line);
      processor:=get_min_buzy_proc;
      status:=use;
      with array_of_proc[processor] do
      begin
        time_end:=buzy_time+work_at_node;
        last_time:=time_end;
        time_end:=last_time;
      end;
    end;
    i:=get_node_min_number;
  until i=0;
end;
function is_off(b:boolean):my_str;
 begin
   if b then is_off:='  OFF' else is_off:='  ON ';
   if b then setcolor(12) else setcolor(aink);
 end;
procedure FuckLine(xx1,yy1,xx2,yy2,Work_:integer;NeedShadow:boolean);
 var x,y,x2,y2:integer;
 var r,dx,ddx,ddy,dy:integer;
begin
       x:=xx1;y:=yy1;
      x2:=xx2;y2:=yy2;
    dx:=x2-x;dy:=y2-y;r:=round(sqrt(sqr(dx/10)+sqr(dy/10)));
    if r=0 then r:=1;
    ddx:=round(dx/5);ddy:=round(dy/5);
    dx:=round(dx/r/2);dy:=round(dy/r/2);

    if not needshadow then
    begin if ColSee then setcolor(12) else setcolor(aink);
          moveto(x,y);setlinestyle(0,7,1);
    end else
    begin moveto(x+dshdw,y+dshdw);setcolor(aShadowInk);
          setlinestyle(UserBitLn, $5555,1);
    end;
    linerel(x2-x,y2-y);
    moverel(-ddx,-ddy);linerel(+dy-dx   ,-dx-dy);
    linerel(-dy-dy   ,+dx+dx);linerel(+dx+dy   ,+dy-dx);
    if view_work_line then my_line_view(x+ddx*2,y+ddy*2,Work_,needshadow)
                      else my_line_view(x+ddx*2,y+ddy*2,0,needshadow);
 end;

procedure view_set15;
var i:integer;
  procedure view_set_node(x,y:integer;pr,num,tm,needshadow:boolean);
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

 procedure setings_image;
 procedure mfcl(x1,y1,x2,y2,ww:integer);
  begin if all_join_is_equal then ww:=666;
        if view_shadow then FuckLine(x1,y1,x2,y2,ww,true);
        FuckLine(x1,y1,x2,y2,ww,false);
  end;
 procedure threeTimeLine(needshadow:boolean);
  var vup1,vup2,vup3,vdw1,vdw2,vdw3:integer;
  begin vup1:=200; vup2:=200; vup3:=200;
        if not all_join_is_equal then begin inc(vup2,20); inc(vup3,40);end;
        vdw1:=vup1+20; vdw2:=vup2+20; vdw3:=vup3+20;
        
        STline(500,vup1,400,vdw1,needshadow);
        STline(500,vup2,450,vdw2,needshadow);
        STline(500,vup3,600,vdw3,needshadow);
        setcolor(aInk);setlinestyle(0,0,1);
        setfillstyle(8,aInk);Sbar3D(490,180,510,200,5,true,needshadow);
        if ProcWaitSendInfo then
        begin setfillstyle(9,aInk);Sbar3D(490,200,510,vdw3,0,false,needshadow);
        end;
  end;
 const hlpcol=12;

  begin
    if view_shadow then
    view_set_node(450,100,view_number_of_processors,view_nodes_number,view_time,true);
    mfcl(450,100,580,50,14);
    mfcl(450,100,580,100,27);
    mfcl(450,100,580,150,46);

    view_set_node(450,100,view_number_of_processors,view_nodes_number,view_time,false);setcolor(8);
    if not view_nodes_number then setcolor(hlpcol)else setcolor(aink);
       begin moveto(350,145);linerel(50,-10);linerel(25,-30);end;
    if not view_time then setcolor(hlpcol)else setcolor(aink);
       begin moveto(350,165);linerel(50,-10);linerel(45,-30);end;
    if not view_number_of_processors then setcolor(hlpcol)else setcolor(aink);
       begin moveto(350,45);linerel(55,0);linerel(55,20);end;
    if view_shadow then threeTimeLine(true);
    threeTimeLine(false);
  end;
begin
  clr;setings_image;setcolor(aink);settextjustify(0,2);
  for i:=1 to 9 do outtextxy(80,20+i*20,st(i)+' '+flag_name(i));
  setcolor(aink);outtextxy(330,20,'Press Keys - 1..8');
  setcolor(12);
  outtextxy(300,40,is_off(not view_number_of_processors));
  outtextxy(300,60,is_off(view_work_line));
  outtextxy(300,80,is_off(not view_alg));
  outtextxy(300,100,is_off(not (min_line_work=1)));
  outtextxy(300,120,is_off(not all_join_is_equal));
  outtextxy(300,140,is_off(not view_nodes_number));
  outtextxy(300,160,is_off(not view_time));
  outtextxy(300,180,is_off(not view_shadow));
  outtextxy(300,200,is_off(not ProcWaitSendInfo));
  setcolor(6);
end;
procedure set_new_flag(i:integer);
 begin
   case i of
     1:view_number_of_processors:=boolean(1-ord(view_number_of_processors));
     2:view_work_line:=boolean(1-ord(view_work_line));
     3:view_alg:=boolean(1-ord(view_alg));
     4:min_line_work:=1-min_line_work;
     5:all_join_is_equal:=boolean(1-ord(all_join_is_equal));
     6:view_nodes_number:=boolean(1-ord(view_nodes_number));
     7:view_time:=boolean(1-ord(view_time));
     8:view_shadow:=not view_shadow;
     9:ProcWaitSendInfo:=not ProcWaitSendInfo;
     else begin info(st(i));pause;end;
   end;
 end;
procedure setings;
var flag:boolean;
begin
  repeat
    view_set15;
    pause;
    flag:=false;
    case s of
    '1'..'9'  :set_new_flag(integer(s)-48);
    Alt_1..Alt_8:set_new_flag(integer(s)-119);
     else flag:=true;
    end;
  until flag;
end;
begin
  my_patology:=full_join;
end.