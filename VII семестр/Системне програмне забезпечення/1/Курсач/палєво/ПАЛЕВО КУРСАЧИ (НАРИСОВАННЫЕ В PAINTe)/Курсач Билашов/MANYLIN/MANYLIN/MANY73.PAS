program many_lines;
uses crt,graph,windos,
     alltext7,add_man7,allnode7,my_view7,as_work7; {все что нужно}
const
  {press_enter_}
       {цвет вывода на экран графиков сравниваемых алгоритмов}
  col_alg_grafik:array[1..maxa] of integer = (aink,14,13,12,11,10,9,7);
       {стиль прорисовки графиков алгоритмов}
  style_alg_grafik:array[1..maxa] of integer = (0,0,0,0,0,0,0,0);
       {количество случайно-формируемых АОГ для временной статистики}
  col_graf_for_statistics=200;
var alg_time:longint;
    error:integer;
    f:text;
    last_marked:integer;
    s1:string;
    i,low,hhh,j,x,x2,y:integer;
    yy2,yyy2:array[1..maxa] of integer;
    last_status:integer;
    my_all_proc,my_optimum,z:integer;
    no_view:boolean;
    otl:boolean;
    tact:integer;
    h1,h2,m1,m2,ts1,ts2,tss1,tss2:word; {время}
    prc,yy,sum,yyy:array[1..maxa] of longint;

var ppp:array[0..max_nodes+1] of integer;
procedure marked_node_at_new_processor;
 var i,j:integer;
begin
  j:=0;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if j<processor then j:=processor;
  array_of_nodes[marked_node].processor:=j+1;
  correct_number_of_processor;
  refresh_processors;
  set_size_all_nodes;view;
end;
procedure Swap_nodes(a,b:integer);
  begin
    set_node_as(a,0);set_node_as(b,a);set_node_as(0,b);
    array_of_nodes[0]:=array_of_nodes[a];
    array_of_nodes[a]:=array_of_nodes[b];
    array_of_nodes[b]:=array_of_nodes[0];
  end;
{function get_time_join(i:integer):integer;
var a:integer;
begin
  with array_of_lines[i] do if level_of_line=who_see then
  with array_of_nodes[first_node] do if level_of_node=who_see then
  begin
   a:=node_time+work_at_node;
   if processor<>array_of_nodes[second_node].processor then
      inc(a,work_at_line);
   get_time_join:=a;
  end;
end;}
function find_near_node:integer;
var r,r2,i,j:integer;
begin
 j:=0;r:=0;
 for i:=1 to last_node do with array_of_nodes[i] do if level_of_node=who_see then
 begin case my_win of
  time      :r2:=abs(strela_x-proc_size) +2*abs(strela_y-((up_size+down_size)div 2));
  graf_nodes:r2:=abs(strela_x-x_position)+2*abs(strela_y-y_position);
  three_dim :r2:=abs(strela_x-proc_size) +  abs(strela_y-up_size);
 end;
 if (j=0)or(r>r2) then begin r:=r2;j:=i;end;
 end;
 find_near_node:=j;
end;
function get_buzy_node:integer;
var i,j:integer;
begin
  j:=0;
  for i:=1 to last_node do with array_of_nodes[i] do if level_of_node=who_see then
  if number=0 then
  begin
    if j=0 then j:=i else
    if node_time>array_of_nodes[j].node_time then j:=i;
  end;
  get_buzy_node:=j;
end;
procedure set_status_nodes(a,b:st_type);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do if level_of_node=who_see then
  if status<>a then status:=b;
end;
procedure set_short_way(who:integer);
var i,j,ln,m,nt:integer;
begin
  if who<>0 then if array_of_nodes[who].status=no_use then
  begin
    for i:=1 to last_line do with array_of_lines[i] do
     if level_of_line=who_see then
      if second_node=who then set_short_way(first_node);
    m:=0;ln:=0;nt:=array_of_nodes[who].time_end;
    for i:=1 to last_line do with array_of_lines[i] do
     if level_of_line=who_see then
      if second_node=who then  with array_of_nodes[first_node] do
      begin
        if type_way
          then j:=number-work_at_node-work_at_line
          else j:=number+node_time-time_end-work_at_line;
        if ln=0 then begin m:=j;ln:=i;end else
        if m>j then begin m:=j;ln:=i;end;
      end;
    with array_of_nodes[who] do
    begin
     if ln=0 then begin number:=0;line_to_status:=ln;end else
      begin
       number:=m;
       last_status:=who;
       line_to_status:=ln;
      end;
     status:=correct;
    end;
  end;
end;
procedure all_numbers_(j:integer);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then number:=j;
end;
procedure set_line(i:integer;b:boolean);
var j:integer;
begin
  if i<>0 then
  begin
    with array_of_nodes[i] do if level_of_node=who_see then
    if b then case status of
    correct: begin
      for j:=1 to last_line do with array_of_lines[j] do
      if level_of_line=who_see then
      if line_to_status=j then if second_node=i then
      begin set_line(first_node,true);type_of_line:=large;end else
      begin set_line(first_node,false);type_of_line:=small;end;
      status:=at_way;
     end;
    no_use:begin
           if line_to_status<>0 then with array_of_lines[line_to_status] do
           begin set_line(first_node,true);type_of_line:=large;end;
           status:=at_way;
         end;
    end else case status of
    correct: begin
        for j:=1 to last_line do with array_of_lines[j] do
        if level_of_line=who_see then
        if second_node=i then
         begin
          set_line(first_node,false);
          type_of_line:=small;
         end;
        status:=no_use;
        end;
    at_way:begin
            if line_to_status<>0 then
            with array_of_lines[line_to_status] do
           begin set_line(first_node,false);type_of_line:=small;end;
           status:=no_use;
         end;
    end;
   end;
end;
procedure set_all_lines_small;
var i:integer;
begin
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then type_of_line:=small;
end;
procedure set_rang_of_nodes;
var i,j:integer;
    stop:boolean;
begin
  higest_rang:=0;
  set_all_number(0);
  repeat
    stop:=true;
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
    with array_of_nodes[second_node] do
      if array_of_nodes[first_node].number>=number then
      begin
        stop:=false;
        number:=array_of_nodes[first_node].number+1;
        if number>higest_rang then higest_rang:=number;
      end;
  until stop;
end;
function get_between_pos_x(var n1,n2,a,b:integer):integer;
begin
  with array_of_nodes[n1] do
  get_between_pos_x:=x_position+
  round((array_of_nodes[n2].x_position-x_position)/b*a);
end;
function get_between_pos_y(var n1,n2,a,b:integer):integer;
begin
  with array_of_nodes[n1] do
  get_between_pos_y:=y_position+
  round((array_of_nodes[n2].y_position-y_position)/b*a);
end;
procedure graf_set;
var i,j,a:integer;
begin
  set_rang_of_nodes;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  with array_of_nodes[first_node] do
  begin
    j:=array_of_nodes[second_node].number-number;
    if j>1 then if j<5 then
    begin
     for a:=1 to j-1 do
     begin
      inc(last_node);
      array_of_nodes[last_node]:=array_of_nodes[first_node];
      with array_of_nodes[last_node] do
      begin
x_position:=get_between_pos_x(first_node,second_node,a,j);
y_position:=get_between_pos_y(first_node,second_node,a,j);
        number:=array_of_nodes[first_node].number+a;
        level_of_node:=who_see;
        work_at_node:=0;
      end;
      inc(last_line);
      array_of_lines[last_line]:=array_of_lines[i];
      with array_of_lines[last_line] do
      begin
        if a<>1 then first_node:=last_node-1;
        level_of_line:=who_see;
        second_node:=last_node;
      end;
    end;
    first_node:=last_node;
  end;
 end;
end;
procedure get_last_node(var who:integer);
var i:integer;
begin
  who:=0;
  for i:=1 to last_node do with array_of_nodes[i] do if level_of_node=who_see then
    if status<>use then if who=0 then who:=i else
      if array_of_nodes[who].time_end<time_end then who:=i;
end;
procedure get_short_way2;
var i,j:integer;
    stop:boolean;
begin
  last_status:=0;
  set_status_nodes(use,no_use);
  set_all_lines_small;
  get_last_node(i);
  all_numbers_(0);
  set_short_way(i);
  set_line(i,true);
end;
procedure get_short_way;
var i,j:integer;
    stop:boolean;
begin
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  if time_end<>line_time then
  if time_end=array_of_nodes[second_node].node_time
     then type_of_line:=large
     else type_of_line:=small;
  nodes_at_large_line_use;
end;
procedure view_mark_info(hide:boolean);
begin
  {setlinestyle(0,1,1);settextjustify(0,0);
  if marked_node<>0 then
  with array_of_nodes[marked_node] do
  begin
    if hide then setcolor(afon) else setcolor(aink);
    outtextxy(30,450,st(marked_node)+' : '+st(number)+':'+st(ord(status)));
  end;}
end;
function no_line_with(a,b:integer):boolean;
var i:integer;
begin
  no_line_with:=true;finding_line:=0;
  for i:=1 to last_line do if finding_line=0 then
  with array_of_lines[i] do if level_of_line=who_see then if first_node=a then
  begin
    if second_node=b then
    begin no_line_with:=false;finding_line:=i;end
  end
    else  if first_node=b then if second_node=a then
    begin
      no_line_with:=false;
      finding_line:=i;
    end;
end;
procedure move(i:integer);
begin
  with array_of_nodes[i] do
       begin x_position:=strela_x;y_position:=strela_y;end;
  view;
end;
function is_cycle(j,mm:integer):boolean;
 var i,k:integer; f:boolean;
 begin
   for i:=1 to last_node do with array_of_nodes[i] do
   if level_of_node=who_see then number:=0;
   array_of_nodes[j].number:=1;
   repeat
     f:=true;
     for i:=1 to last_line do with array_of_lines[i] do
     if level_of_line=who_see then
     with array_of_nodes[second_node] do
     if number=0 then
     begin
       k:=array_of_nodes[first_node].number;
       if k>0 then begin number:=k+1;f:=false;end;
     end;
   until f;
   if array_of_nodes[mm].number<>0 then is_cycle:=true
                                   else is_cycle:=false;
 end;
procedure GetNodeVindow(var i:integer;ss:string);
 var txt:boolean;s2:string;j:integer;
 begin
   newset(0,0,1,1,7,afon);txt:=false;
   bar3d(170,200,350,300,4,true);
   setusercharsize(1,1,1,1);
   setcolor(aink); settextjustify(1,1);outtextxy(240,213,ss);
   setusercharsize(2,1,2,1);
   repeat
      setcolor(aink);outtextxy(250,253,st(i));
      pause;
      if ColSee then setcolor(7) else setcolor(afon);
      outtextxy(250,253,st(i));
      case s of
        Down:if i>0 then dec(i);
        Up  :inc(i);
        '0'..'9':begin
                      if txt then s2:=s2+s else s2:=s;
                      txt:=true;
                      val(s2,i,j);
                      if j<>0 then begin i:=0;txt:=false;end else s2:=st(i);
                    end;
        else txt:=false;
      end;
   until s in [enter,esc];
  setusercharsize(1,1,1,1);
 end;
procedure line_options;
var j,i:integer;
begin
 j:=find_near_node;
 if j<>marked_node then if marked_node<>0 then
 if j<>0 then
 case s of
 '?','I':if no_line_with(j,marked_node)=false then
   with array_of_lines[finding_line] do
   case s of
    '?':case my_text of
        english:info('Begin:'+st(line_time)+'  End:'+st(time_end));
        russian:info('Начало:'+st(line_time)+' Окончанўе:'+st(time_end));
        polyk  :info('P-Beg:'+st(line_time)+'  P-End:'+st(time_end));
         else   info('Beg:'+st(line_time)+'  End:'+st(time_end));
        end;
    'I':with array_of_nodes[second_node] do
      info(st(line_number)+' := '+st(node_time)+' - max( '+
      st(number)+' , '+st(line_time)+' )');
     end;
#8:if no_line_with(j,marked_node)=false then
      begin
       array_of_lines[finding_line]:=array_of_lines[last_line];
       dec(last_line);view;flag_sort:=false;
      end;
'l':if is_cycle(j,marked_node) then
        begin info2(note(cannot_create_line));error_sound(1);end else
        if not no_line_with(j,marked_node) then
        with array_of_lines[finding_line] do
        begin i:=work_at;
              GetNodeVindow(i,'EDIT LINE:');
              if s=enter then work_at:=i;
              s:='■';view;
        end else
        if max_lines<=last_line then
        begin
             info(' Мало памяти. Осталось '+st(max_lines-last_line)+' связей.')
        end else
      begin
       inc(last_line);
       with array_of_lines[last_line] do
       begin
        first_node:=marked_node;
        level_of_line:=who_see;
        second_node:=j;type_of_line:=small;
        if last_line>1
          then set_work_at_line(array_of_lines[last_line-1].work_at_line)
          else new_work_at_line(last_line);
        with array_of_lines[last_line] do
        begin
          i:=work_at;
          GetNodeVindow(i,'EDIT LINE:');
          if s=enter then work_at:=i;
          s:='■';view;
        end;
       end;{view_line(last_line);}flag_sort:=false;
      end;
'*','/':if no_line_with(j,marked_node)=false then
      begin
       {view_line(finding_line);setwritemode(xorput);
       view_line(finding_line); }
       case s of
        '*':array_of_lines[finding_line].type_of_line:=large;
        '/':array_of_lines[finding_line].type_of_line:=small;
       end;
       setwritemode(normalput);view_line(finding_line,false);view;
      end;
'P':with array_of_nodes[marked_node] do begin
             if my_win=time then
              begin
                j:=get_processor_by_strela;
                if j<>0 then
                 begin swap_processors(processor,j);set_size_all_nodes;end;
              end;
             if my_win=graf_nodes then
               swap_processors(processor,array_of_nodes[j].processor);
             view;end;
     end;
end;
procedure effective_place_for_marked_node;
var al,i,j,more_effective,my_proc,my_time,last_proc:integer;
    sm:string;
begin
  if marked_node=0 then marked_node:=find_near_node;
  if array_of_nodes[marked_node].level_of_node<>who_see
     then marked_node:=find_near_node;
  last_proc:=array_of_nodes[marked_node].processor;
  view;
  setfillstyle(1,afon);setcolor(7);settextjustify(1,1);
  bar3d(10,5,630,25,3,true);
  al:=get_max_number_of_processor;
  more_effective:=0;my_proc:=1;setcolor(7);
  for i:=1 to al do
  begin
    array_of_nodes[marked_node].processor:=i;
    work;
    j:=get_max_time_work;
    outtextxy(round(10+560/(al+1)*i),15,st(j));
    if (i=1)or(j<more_effective) then
    begin
      more_effective:=j;
      my_proc:=i;
    end;
    if i=last_proc then my_time:=j;
  end;
  circle(round(10+560/(al+1)*my_proc),15,20);
  sm:='[ '+st(more_effective-my_time)+' ]';
  case my_text of
   english:info('ENTER- отказать, ESC - подтвердить  '+sm);
   russian:info('ENTER- отказать, ESC - подтвердить  '+sm);
   polyk  :info('ENTER- P-отказать, ESC - p_подтвердить  '+sm);
   else    info('ENTER- отказать, ESC - хай жўве '+sm);
  end;
  repeat pause;until (s=Esc)or(s=enter);
  if s=esc then array_of_nodes[marked_node].processor:=my_proc
   else array_of_nodes[marked_node].processor:=last_proc;
  s:='№';
end;
procedure full_optimaze(preriv:boolean);
var i,j,min_work:integer;
    block:boolean;
procedure load_work;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then processor:=line_to_status;
end;
procedure save_work;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then line_to_status:=processor;
end;
procedure inc_process;
var first,i:integer;
    go:boolean;
begin
  go:=true;first:=1;
  for i:=1 to last_node do
  begin
    if go then with array_of_nodes[i] do if level_of_node=who_see then
    begin
      inc(processor);
      if (processor>my_all_proc)or(processor>first)
         then processor:=1 else go:=false;
      inc(first);
    end;
  end;
  if go then
  begin block:=true;sound(200);delay(100);
        sound(100);delay(100);nosound;end;
end;
procedure input_proc;
procedure view_proc(insert:boolean);
begin
  if insert then setcolor(afon) else setcolor(8);
  outtextxy(300,125,st(my_all_proc));
end;
begin
  setfillstyle(1,7);setcolor(aink);settextjustify(1,1);
  bar3d(200,100,400,150,5,true);setcolor(afon);
  outtextxy(300,115,note(modeling_by_processors)+' '+st(my_all_proc));
  repeat
    view_proc(true);pause;view_proc(false);
    case s of
      up:inc(my_all_proc);
      down:if my_all_proc>1 then dec(my_all_proc);
    end;
  until s=enter;
  view_proc(true);
end;
begin
  input_proc;
  block:=false;min_work:=-1;
  repeat
    work;
    j:=get_max_time_work;
    if (min_work=-1)or(min_work>=j) then
    begin
      save_work;
      if preriv then if min_work<>-1 then
        begin block:=true;s:=enter;end;
      sound(600);delay(100);nosound;
      if not preriv then begin set_size_all_nodes;view;end;
      min_work:=j;info2(st(min_work));
    end;
    inc_process;
    if keypressed then
    begin
      pause;
      if (s=enter)or(s=esc) then block:=true;
    end;
  until block;
  if s=enter then load_work;
  work_all;sound(400);delay(100);nosound;
  info(note(end_of_work));
  s:=enter;
end;
procedure by_referat;
var i,j:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node=who_see then number:=-1;
  for i:=1 to last_line do with array_of_lines[i] do
   if level_of_line=who_see then
    with array_of_nodes[second_node] do
    if (number=-1)or(number>array_of_lines[i].time_end)
      then number:=array_of_lines[i].time_end;
  for i:=1 to last_line do with array_of_lines[i] do
   if level_of_line=who_see then
    with array_of_nodes[second_node] do
    begin
    line_number:=array_of_nodes[second_node].node_time-
      max(number,line_time);
    end;
end;
procedure my_harkar{(alg:boolean)};
var i,t0,t1,last_proc:integer;
begin
  type_way:=true;get_short_way2;
  tmin:=0;
  t0:=get_max_time_work;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  if type_of_line=large then 
  begin
    line_number:=used_line;
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
    if line_number<array_of_lines[tmin].line_number then tmin:=i;
  end;
end;
procedure you_sarkar(flag:boolean);
var t0,max_time,tmin:integer;
begin
  sort_graf;
  all_at_another;
  work;t0:=get_max_time_work;
  for tmin:=last_line downto 1 do with array_of_lines[tmin] do 
  if not long_line(tmin) then line_number:=1000 else with array_of_nodes[first_node] do
  begin
    save_proc;
    set_processor(processor,array_of_nodes[second_node].processor);
    work;
    max_time:=get_max_time_work;
    line_number:=t0-max_time;
    if max_time<t0 then t0:=get_max_time_work else
    if flag and (max_time=t0 ) then t0:=get_max_time_work else load_proc;
  end;
end;
procedure kuku;
var
    j,i:integer;
begin
  for i:=1 to kol_rand_nodes do ppp[i]:=0;
  for i:=1 to kol_rand_nodes do with array_of_nodes[i] do
   if level_of_node=who_see then inc(ppp[processor]);
  j:=0;
  for i:=1 to kol_rand_nodes do
  begin
  if ppp[i]=1 then if j=0 then j:=i else set_processor(i,j);
  end;
  correct_number_of_processor;
end;
procedure init_by(nn:integer);
var i:integer;
begin
  all_at_another;
  tmin:=-1;
   for i:=1 to last_node do with array_of_nodes[i] do
     if level_of_node=who_see then status:=no_use;
end;
procedure by_form_(nn:integer;name_alg:boolean);
var i:integer;
begin
   if nn<>0 then
   begin
   if nn=6 then you_sarkar(true) else
   if nn=7 then you_sarkar(false) else
   if nn=8 then begin all_at_one;work;end else
   if nn=9 then begin all_at_another;work;end else
   if nn=10 then file_of_summa(false) else
   if nn<6 then
   begin
    init_by(nn);work;
    while is_one_no_use(nn) do
    begin
      case nn of
        1,2:begin type_way:=true;get_short_way2;end;
        3:begin type_way:=false;get_short_way2;end;
        4:my_harkar{(true)};
        5:my_harkar2;
      end;
      case nn of
        1,2,3:all_at_large_to_one_proc;
        4  :go_harkar;
        5  :go2;
      end;
      work;
      if view_alg then begin set_size_all_nodes;view;info(alg_name[ord(my_text),nn]);pause;end;
    end;
   end;
   gettime(h2,m2,ts2,tss2);
   correct_number_of_processor;
   if nn=2 then begin kuku;work;end;
   if name_alg then begin work_all;view; info2(alg_name[ord(my_text),nn]+'  '+last_info);end;
   end else info('Do not determin...');
end;
procedure user_change_short_way;
var b:boolean;
 begin
   setfillstyle(1,10);setcolor(aink);
   bar3d(50,mmyy(50),590,mmyy(350),2,true);
   outtextxy(300,200,'kljhbcsrcwEDTBT%n');
     pause;
   view;
 end;
procedure table_short_way;
 var i,y1:integer;
  procedure view_way(i:integer;b:boolean);
  begin
    setusercharsize(3,2,3,2);
    if b then newset(afon,0,1,1,1,afon) else newset(afon,afon,1,1,3,7);
    y1:=i*15+73;
    bar(55,y1-5,335,y1+10);
    outtextxy(175,y1,get_name_way(i));
    setusercharsize(1,1,1,1);
  end;
begin
  newset(8,0,1,1,3,7);bar3d(50,80,340,220,5,true);
  settextjustify(1,1);
  for i:=1 to max_way do view_way(i,false);i:=1;
  repeat
    view_way(i,true);pause;view_way(i,false);
    case s of
      up   :if i>1 then dec(i) else i:=max_way;
      right:i:=max_way;
      left :i:=1;
      down :if i<max_way then inc(i) else i:=1;
      enter :case i of
              1:begin my_alg;refresh_processors;work_all;end;
              2:begin my_harkar2;go_harkar;work_all;end;{(false)}
              3:begin type_way:=true;get_short_way2;end;
              4:begin type_way:=false;get_short_way2;end;
              5:begin get_short_way;end;
              6:by_referat;
              7:set_all_lines_small;
              8:begin set_all_lines_small;for i:=1 to last_node do
                with array_of_nodes[i] do
                if level_of_node=who_see then status:=no_use;
                end;
              9:begin all_at_large_to_one_proc;work_all;end;
             end;
    end;
  until (s=enter)or(s=esc);
  s:=enter;
end;
procedure table_full_change;
const
  max_way=4;
  name_way:array[0..3,1..max_way]of string=
    (('Stop at first','Full optimization','Begining setings','Suitest place for the NODE'),
    ('до первого лучшего','полная оптимизация','начальная установка','лучшее место для указанного'),
    ('до первого лучшего','полная оптимизация','начальная установка','лучшее место для указанного'),
    ('до первого лучшего','полная оптимизация','начальная установка','лучшее место для указанного')
    );
var i:integer;
procedure view_way(i:integer;b:boolean);
begin
  if b then setcolor(aink) else setcolor(9);
  outtextxy(175,80+i*10,name_way[ord(my_text),i]);
end;
begin
  setcolor(9);setfillstyle(1,11);bar3d(50,50,300,150,5,true);
  settextjustify(1,1);setcolor(12);
  outtextxy(175,60,note(Algoritms_of_));
  for i:=1 to max_way do view_way(i,false);i:=1;
  repeat
    view_way(i,true);pause;view_way(i,false);
    case s of
      up   :if i>1 then dec(i);
      right:i:=max_way;
      left :i:=1;
      down :if i<max_way then inc(i);
      enter :begin case i of
              1:full_optimaze(true);
              2:full_optimaze(false);
              3:begin
                for i:=1 to last_node do with array_of_nodes[i] do
                 if level_of_node=who_see then processor:=1;
                work_all;view;
                case my_text of
                 english:info('Start state is set');
                 russian:info('Начальное состояние установлено');
                 polyk :info('Start state is set');
                  else info('Start state is set');
                end;
                s:=';';i:=1;end;
              4:begin effective_place_for_marked_node;
                      work_all;end;
             end; s:=enter;end;
    end;
  until (s=enter)or(s=esc);
  s:=enter;
end;
procedure new_node;
 var i:integer;
begin
  inc(last_node);
  with array_of_nodes[last_node] do
  begin
    level_of_node:=who_see;user_number:=last_node;
    x_position:=strela_x;y_position:=strela_y;
    if (marked_node>0)and(marked_node<=last_node)
    then work_at_node:=array_of_nodes[marked_node].work_at_node
    else new_work_at_node(last_node);
    processor:=1;i:=random(50)+10;
    GetNodeVindow(i,'Create New NODE:');
    if s=esc then dec(last_node) else work_at_node:=i;
    s:='■';
  end;
end;
procedure table_for_edit;
var i:integer;
const max_edit=9;
 name_edit:array[0..3,1..max_edit] of string=
 (('Crete the NODE','Delete the NODE','Create the LINE',
  'Delete the LINE','Change Node NUMBER',
  'Chsnge Line NUMBER','ALL Nodes at ONE processor',
  'ALL at another processors','Move the NODE'),
  ('создать узел','удалить узел','нарисовать линию',
  'удалить линию','изменить значение узла',
  'изменить значение линии','все на один процессор',
  'все на разные процессоры','передвинуть узел'),
  ('создать узел','удалить узел','нарисовать линию',
  'удалить линию','изменить значение узла',
  'изменить значение линии','все на один процессор',
  'все на разные процессоры','передвинуть узел'),
  ('создать узел','удалить узел','нарисовать линию',
  'удалить линию','изменить значение узла',
  'изменить значение линии','все на один процессор',
  'все на разные процессоры','передвинуть узел'));
 hot_key:array[1..max_edit]of string=('N','Shift-D',
   'L','Backspace','ENTER+ENTER','L+L','Shift-1','Shift-2','M');
procedure view_edit(i:integer;insert:boolean);
var x1:integer;
begin
  x1:=46+i*15;
  if insert then newset(afon,0,1,1,1,afon) else newset(afon,afon,1,1,7,7);
  bar(104,x1-5,436,x1+9);
{  if insert then if ColSee then setcolor(12)else setcolor(0)else setcolor(afon);}
  outtextxy(318,x1,name_edit[ord(my_text),i]);
  outtextxy(145,x1,hot_key[i]);
end;
begin
  setusercharsize(3,2,3,2);
  newset(6,0,1,1,7,7);
  bar3d(100,50,440,200,4,true);
  settextjustify(1,1);
  for i:=1 to max_edit do view_edit(i,false);i:=1;
  repeat
    view_edit(i,true);pause;view_edit(i,false);
    case s of
      up   :if i>1 then dec(i) else i:=max_edit;
      right:i:=max_edit;
      left :i:=1;
      down :if i<max_edit then inc(i) else i:=1;
      enter :begin case i of
             1:new_node;
             2:if marked_node<>0 then
               begin delete_marked_node;
               info(note(Del_NODE_and_LINES));end;
             3:begin view;s:='l';line_options;end;
             4:begin s:=backspace;line_options;end;
             5:s:=enter;
             6:begin s:='L';line_options;s:=enter;end;
             7:begin all_at_one    ;work_all;end;
             8:begin all_at_another;work_all; end;
             9:if marked_node<>0 then
             begin view;move(marked_node);end;
             end;s:=enter;end;
    end;
  until (s=enter)or(s=esc);
  setusercharsize(1,1,1,1);
{  s:=enter;}
end;
procedure sum_what;
var j:integer;
begin
  low:=1;hhh:=1;
  for j:=2 to maxa do if use_algoritm[j]<>0 then
  begin
    if sum[low] >sum[j]    then low:=j;
    if sum[hhh] <sum[j]  then hhh:=j;
  end;
end;
procedure prc_what;
var j:integer;
begin
  low:=1;hhh:=1;
  for j:=2 to maxa do if use_algoritm[j]<>0 then
  begin
    if prc[low] >prc[j]    then low:=j;
    if prc[hhh] <prc[j]  then hhh:=j;
  end;
end;
procedure v_alg;
const out_alg=5;
var
  dsum:integer;
  j:integer;
begin
  sum_what;
  dsum:=sum[hhh]-sum[low];
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  if dsum=0 then yyy2[j]:=mmyy(360)
    else yyy2[j]:=mmyy(360)-round((sum[j]-sum[low])/dsum*mmyy(160));
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  begin
    setlinestyle(style_alg_grafik[j],1,3);
    setcolor(col_alg_grafik[j]);
    moveto(17+i*3,yyy[j]);
    lineto(20+i*3,yyy2[j]);
    yyy[j]:=yyy2[j];
  end;
  prc_what;
  dsum:=prc[hhh]-prc[low];
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  if dsum=0 then yy2[j]:=mmyy(110)
    else yy2[j]:=mmyy(180)-round((prc[j]-prc[low])/dsum*mmyy(140));
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  begin
    setlinestyle(style_alg_grafik[j],1,3);
    setcolor(col_alg_grafik[j]);
    moveto(17+i*3,yy[j]);
    lineto(20+i*3,yy2[j]);
    yy[j]:=yy2[j];
  end;
end;
procedure last;
var j,k:integer;
begin
  k:=0;setcolor(aink);
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  begin
    inc(k);
    outtextxy(i*3+j*5,yyy2[j],st(k));
    outtextxy(i*3+j*5,yy2[j],st(k));
  end;
end;
procedure vvv;
var j,k:integer;
begin
  clr;settextjustify(1,1);setlinestyle(1,1,1);
  setcolor(aink);outtextxy(70,mmyy(20),note(Processors));
  outtextxy(70,mmyy(190),note(work_));
  setcolor(6);moveto(20,mmyy(362));linerel(620,0);
              moveto(20,mmyy(198)); linerel(620,0);
              moveto(20,mmyy(182));linerel(620,0);
              moveto(20,mmyy(38)); linerel(620,0);
  k:=0;
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  begin
    inc(k);
    setlinestyle(style_alg_grafik[j],1,3);
    sum[j]:=0;yyy[j]:=mmyy(340);yy[j]:=mmyy(180);prc[j]:=0;
    setcolor(col_alg_grafik[j]);moveto(k*80-70,mmyy(374));linerel(40,0);
    setcolor(aink);
    outtextxy(k*80-50,mmyy(392),alg_name[ord(my_text),use_algoritm[j]]);
    outtextxy(k*80-50,mmyy(405),st(k));
  end;
end;
procedure table_use_algoritm;
var i:integer;
  function place_alg(i:integer):integer;
  var j:integer;
  begin
    place_alg:=0;
    for j:=maxa downto 1 do if use_algoritm[j]=i then place_alg:=j;
  end;
  procedure view_alg_ststus(i:integer;flag:boolean);
  var y:integer;
  begin
    y:=20+15*i;
    if flag then begin setfillstyle(1,11);setcolor(11);end else
                 begin setfillstyle(1,afon);setcolor(afon);end;
    bar3d(160,mmyy(y-3),280,mmyy(y+8),0,false);
    settextjustify(0,1);setcolor(aink);
    outtextxy(180,mmyy(y+2),alg_name[ord(my_text),i]);
    if place_alg(i)=0 then begin setfillstyle(1,afon);setcolor(14);end
    else begin setfillstyle(1,col_alg_grafik[place_alg(i)]);end;
    bar3d(50,mmyy(y-3),150,mmyy(y+8),0,false);
  end;
  procedure set_alg(i:integer);
  begin
    if place_alg(i)=0 then if place_alg(0)=0 then info(note(No_enoph_room))
    else begin use_algoritm[place_alg(0)]:=i;info(note(is_set));end
    else begin use_algoritm[place_alg(i)]:=0;info(note(Set_is_OFF));end;
    view_alg_ststus(i,false);
  end;
  procedure sort_massive_alg;
  var i,j,a:integer;
  begin
    for j:=1 to maxa-1 do for i:=1 to maxa-1 do
    if use_algoritm[i]<use_algoritm[i+1] then
    begin
      a:=use_algoritm[i+1];
      use_algoritm[i+1]:=use_algoritm[i];
      use_algoritm[i]:=a;
    end;
  end;
begin
  clr; settextjustify(0,1);setcolor(5);
  outtextxy(30,10,note(Chose_algoritm));
  outtextxy(300,20,'F1     - '+note(algoritm_time_statistics));
  outtextxy(300,30,'F4     - '+note(Start_all_algoritms_for_random_DAG));
  outtextxy(300,40,'SPACE  - Change you algoritm and its color.');
  outtextxy(300,50,'ENTER  - Return to main program.');
  view_kol(200);
  for i:=1 to all_algorit do view_alg_ststus(i,false);
  i:=1;
  repeat
    view_alg_ststus(i,true);pause;view_alg_ststus(i,false);
    case s of
      up:if i>1 then dec(i) else i:=all_algorit;
      down:if i<all_algorit then inc(i) else i:=1;
      left:if i>5 then dec(i,5) else i:=all_algorit;
      right:if i<all_algorit-5 then inc(i,5) else i:=1;
      ' ': begin
             set_alg(i);
             {if place_alg(i)<>0 then info('Установлен') else info('Изьят');}
           end;
    end;
  until (s=enter)or(s=F4)or(s=F1);
  tact:=i;
  sort_massive_alg;
end;
procedure ffff;
var
  fff,kk:text;
  j,k,x3:integer;
  ss,s2,s3,s4:string;
begin
  assign(fff,'alg_g.txt');reset(fff);{assign(kk,'aaaaa.txt');rewrite(kk);}
  for j:=1 to maxa do begin read(fff,k);use_algoritm[j]:=k;end;readln(fff);
  for j:=1 to maxa do readln(fff,ss);
  readln(fff,ss);read(fff,j);
  vvv; tact:=1; i:=1;
  while (j<>0) and not keypressed do
  begin
{    write(kk,'         ');}s4:=ss;
    for j:=1 to maxa do  if use_algoritm[j]<>0 then
    begin
      read(fff,x);
      sum[j]:=sum[j]+x;
      read(fff,x2);
      prc[j]:=prc[j]+x2;
      read(fff,x3);
{      write(kk,'  ',x,'/',x2,'/',x3);}
    end;
 {   writeln(kk);}
    v_alg;
    inc(tact);inc(i);
    readln(fff,ss);
    read(fff,j);
  end;
  last;
  close(fff);{close(kk);}
end;
function ddd(a,b:real):real;
begin
  if b=0 then ddd:=0 else ddd:=a/b;
end;
procedure ffff2;
var tt,ttt:integer;
begin
  prc_what;clr;settextjustify(0,2);
  for tt:=0 to 1 do for j:=1 to maxa do  if use_algoritm[j]<>0 then
  begin
    ttt:=mmyy(10)+10*j+mmyy(100)*tt;
    setcolor(col_alg_grafik[j]);setlinestyle(0,1,3);line(5,mmyy(3)+ttt,40,mmyy(3)+ttt);
    setlinestyle(0,1,1);setcolor(aink);outtextxy(60,ttt,alg_name[ord(my_text),use_algoritm[j]]);
  end;
  setcolor(aink);
  outtextxy(10,mmyy(10),note(by_processors));
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(140,mmyy(10)+10*j,strr(ddd(prc[j],prc[hhh])*100));
  if prc[hhh]-prc[low]<>0 then
  for j:=1 to maxa do if use_algoritm[j]<>0 then outtextxy(240,mmyy(10)+10*j,strr(ddd(prc[j]-prc[low],prc[hhh]-prc[low])*100));
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(340,mmyy(10)+10*j,strr(ddd(prc[j],prc[low])*100)+'%');
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(440,mmyy(10)+10*j,st(prc[j]));
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(540,mmyy(10)+10*j,strr(ddd(prc[j],tact)));
  sum_what;
  outtextxy(10,mmyy(100),note(By_time));
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(140,mmyy(110)+10*j,strr(ddd(sum[j],sum[hhh])*100));
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  outtextxy(240,mmyy(110)+10*j,strr(ddd(sum[j]-sum[low],sum[hhh]-sum[low])*100)+'%');
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(340,mmyy(110)+10*j,strr(ddd(sum[j],sum[low])*100)+'%');
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(440,mmyy(110)+10*j,stl(sum[j]));
  for j:=1 to maxa do  if use_algoritm[j]<>0 then outtextxy(540,mmyy(110)+10*j,strr(ddd(sum[j],tact)));
end;
procedure view_file_with_grafik;
var    i:integer;
begin
   i:=1;
   repeat
     if i=1 then ffff else ffff2;
     info(note(press)+' SPACE');
     pause;
     case s of
       ' ':i:=3-i;
       else info(st(ord(s)));
     end;
   until (s=enter)or(s=esc);
   s:='№';
end;

procedure all_algoritmicus_graf;
var j,k:integer;
    fff:text;
begin
  setlinestyle(0,1,3);
  assign(fff,'alg_g.txt');rewrite(fff);
  for j:=1 to maxa do write(fff,use_algoritm[j],' ');writeln(fff);
  k:=0;
  for j:=1 to maxa do if use_algoritm[j]<>0
    then begin inc(k);writeln(fff,k,'-',alg_name[ord(my_text),use_algoritm[j]]);end
    else writeln(fff,'..........');
  writeln(fff,'работа/процессоры           Low/High');
  {randomize;}vvv;tact:=0;
  for i:=1 to 200 do if keypressed=false then
  begin
    inc(tact);
    random_graf;correct_number_of_processor;
    write(fff,i:3,'  ');
    for j:=1 to maxa do  if use_algoritm[j]<>0 then
    begin
      by_form_(use_algoritm[j],false);
      x:=get_max_time_work;
      sum[j]:=sum[j]+x;
      x2:=get_max_number_of_processor;
      prc[j]:=prc[j]+x2;
      write(fff,x,' ',x2,' ',alg_time,'  ');
    end;
    writeln(fff);
    v_alg;
  end;
  last;
  prc_what;
  writeln(fff,0);
  writeln(fff,'по процессорам: ');
  for j:=1 to maxa do  if use_algoritm[j]<>0 then
  write(fff,ddd(prc[j],prc[hhh])*100:9:2,'+');
  writeln(fff);
  if prc[hhh]-prc[low]<>0 then for j:=1 to maxa do
  if use_algoritm[j]<>0 then
  write(fff,ddd(prc[j]-prc[low],prc[hhh]-prc[low])*100:9:2,'%');
  writeln(fff);
  for j:=1 to maxa do  if use_algoritm[j]<>0 then
    write(fff,ddd(prc[j],prc[low])*100:9:2,'%');
  writeln(fff);writeln(fff);
  for j:=1 to maxa do  if use_algoritm[j]<>0 then write(fff,prc[j]:10);
  writeln(fff);
  for j:=1 to maxa do  if use_algoritm[j]<>0 then
    write(fff,ddd(prc[j],tact):10:2);
  writeln(fff);
  sum_what;
  writeln(fff);
  writeln(fff,'по времени: ');
  for j:=1 to maxa do  if use_algoritm[j]<>0 then
    write(fff,ddd(sum[j],sum[hhh])*100:9:2,'+');
  writeln(fff);
  for j:=1 to maxa do if use_algoritm[j]<>0 then
  write(fff,ddd(sum[j]-sum[low],sum[hhh]-sum[low])*100:9:2,'%');
  writeln(fff);
  for j:=1 to maxa do  if use_algoritm[j]<>0 then
  write(fff,ddd(sum[j],sum[low])*100:9:2,'%');
  writeln(fff);writeln(fff);
  for j:=1 to maxa do  if use_algoritm[j]<>0 then write(fff,sum[j]:10);
  writeln(fff);
  for j:=1 to maxa do  if use_algoritm[j]<>0 then write(fff,ddd(sum[j],tact):10:2);
  writeln(fff);
  close(fff);
  info(note(press)+' ENTER');
  pause;
  view;s:='v';
  setlinestyle(0,1,1);
end;
procedure statistic_algoritm(use_algoritm:integer);
var i,j:integer;
    time_string:string;
    my_time,add_work,add_processors:longint;
    fl:text;
    dirinfo:tsearchrec;
begin
  clr;settextjustify(1,1);setcolor(5);
  outtextxy(300,20,note(Analiz_of_the_algoritm)+alg_name[ord(my_text),use_algoritm]);
  outtextxy(300,40,note(_for_)+st(col_graf_for_statistics)+note(identical_DAG));
  outtextxy(300,60,note(Number_of_NODES_is)+st(kol_rand_nodes));
  outtextxy(300,80,note(_Fill_with_lines)+st(fill_with_lines)+'%');
  setcolor(aink);setfillstyle(1,3);
  bar3d(200,100,200+col_graf_for_statistics,110,5,true);
  outtextxy(200,90,'0%');outtextxy(200+col_graf_for_statistics,90,'100%');setfillstyle(0,afon);
  gettime(h1,m1,ts1,tss1);
  outtextxy(300,120,st(h1)+' час '+st(m1)+' min '+st(ts1)+' sek '+st(tss1));
  time_string:='';add_work:=0;add_processors:=0;
  for i:=1 to col_graf_for_statistics do
  begin
    bar3d(200,100,200+i,110,0,false);
    random_graf;
    by_form_(use_algoritm,false);
    gettime(h2,m2,ts2,tss2);
    setcolor(afon);{спрятать данные}
    outtextxy(300,160,time_string);
    outtextxy(300,130,stl(add_work));
    outtextxy(300,140,stl(add_processors));
                {расчитать новые данные}
    inc(add_work,get_max_time_work);
    inc(add_processors,get_max_number_of_processor);
    time_string:=st(h2)+' hour '+st(m2)+' min '+st(ts2)+' sec '+st(tss2);
    setcolor(aink);{вывести обновленные данные}
    outtextxy(300,160,time_string);
    outtextxy(300,130,stl(add_work));
    outtextxy(300,140,stl(add_processors));
  end;
  my_time:=longint(h2)-longint(h1);
  my_time:=my_time*60+longint(m2)-longint(m1);
  my_time:=my_time*60+longint(ts2)-longint(ts1);
  my_time:=my_time*100+longint(tss2)-longint(tss1);
  outtextxy(300,180,note(time_comparing)+stl(my_time));
  info(note(Press)+' ESC, F2');
  repeat
    pause;
    case s of
      f2,esc:begin
         assign(fl,'exemple.txt');
         findfirst('exemple.txt',faarchive,dirinfo);
         if doserror<>0 then
         begin
           case my_text of
english   :begin
           rewrite(fl);
           writeln(fl,'Analizin  any algoritm for ',col_graf_for_statistics,' DAG.');
           writeln(fl,'Summary                           NAME of');
           writeln(fl,'Work    Processors  DAG  Time     algoritm');
           end;
russian   :begin
           rewrite(fl);
           writeln(fl,'Анализируются различные алгоритмы для ',col_graf_for_statistics,' графов.');
           writeln(fl,'Суммарные                         Название');
           writeln(fl,'Решения Процессоров Граф Времени  алгоритма');
           end;
polyk     :begin
           rewrite(fl);
           writeln(fl,'Анализируются различные алгоритмы для ',col_graf_for_statistics,' графов.');
           writeln(fl,'Суммарные                         Название');
           writeln(fl,'Решения Процессоров Граф Времени  алгоритма');
           end;
else       begin
           rewrite(fl);
           writeln(fl,'Анализируются различные алгоритмы для ',col_graf_for_statistics,' графов.');
           writeln(fl,'Суммарные                         Название');
           writeln(fl,'Решения Процессоров Граф Времени  алгоритма');
           end;
           end;
         end else append(fl);
         write(fl,add_work:7,add_processors:6,kol_rand_nodes:4);
         writeln(fl,fill_with_lines:4,'%',my_time:8,'     ',alg_name[ord(my_text),use_algoritm]);
         close(fl);
         clr;
         info(note(File_exemple_txt_saving));pause;
         s:=esc;
         end;
    end;
  until s=ESC;view;
end;
procedure node_info;
 procedure out_number(tt:text_num;y,n:integer);
   begin
     setcolor(afon);outtextxy(60,mmyy(y),note(tt));
     if n=0 then begin setcolor(6);outtextxy(160,mmyy(y),'---');end
            else begin setcolor(14);outtextxy(160,mmyy(y),st(n));end;
   end;
 procedure node_image;
   const x=180;
   var sum,i,j,y,yy,yyy,yy1,yyy1,aaa,p1:integer;
       my_line:boolean;
  begin
    if marked_node<>0 then with array_of_nodes[marked_node] do
    begin
      j:=time_end;
      setcolor(aink);setlinestyle(0,7,1);
      y:=mmyy(150);yyy:=mmyy(300);aaa:=time_end-node_time;p1:=processor;
      setfillstyle(6,afon);bar3d(x-10,y,x+10,yyy,5,true);
      setcolor(aink);
      outtextxy(x+20,y,st(node_time));
      outtextxy(x+20,yyy,st(time_end));
      outtextxy(x+20,mmyy(225),st(work_at_node));
      settextjustify(1,1);
      setcolor(7);setfillstyle(1,8);fillellipse(x-20,y+5,8,8);
      setcolor(afon);outtextxy(x-20,y+5,st(marked_node));sum:=0;
      my_line:=false;
      for i:=1 to last_line do with array_of_lines[i] do
      if level_of_line=who_see then
      if long_line(i) then
      if (array_of_nodes[second_node].processor=p1)or(array_of_nodes[first_node].processor=p1) then
      if line_time>=node_time then if array_of_lines[i].time_end<=j then
      begin
       yy1 :=line_time-node_time;
       yyy1:=time_end-node_time;
       yy  :=mmyy(round(yy1/aaa*150)+150);
       yyy :=mmyy(round(yyy1/aaa*150)+150);
       y   :=round((yy+yyy)/2);setcolor(aink);
       setlinestyle(0,7,1);setfillstyle(1,14);setcolor(7);
       bar3d(90,yy,140,yyy,0,false);setcolor(aink);
         outtextxy(120,yy,st(yy1));
         outtextxy(90,yyy-5,st(yyy1));
       if array_of_nodes[first_node].processor=p1 then
        begin moveto(90,yy);lineto(70,y);lineto(90,yyy);end else
        begin moveto(140,yy);lineto(160,y);lineto(140,yyy);end;
       setfillstyle(9,7);setcolor(aink);
       if my_patology=shina then bar3d(170,yy,190,yyy,0,false);
       setcolor(afon);outtextxy(150,y,st(work_at_line));
       if array_of_nodes[first_node].processor<>p1 then inc(sum,work_at_line)
       else if not my_line then
        begin
          my_line:=true;
          inc(sum,work_at_line);
        end;
      end;
      i:=time_end-node_time-work_at_node;
      if my_patology=shina then
      outtextxy(140,mmyy(315),st(i)+'-'+st(sum)+'= '+st(i-sum));
     end;
  end;
 begin
   mashtab:=mashtab/1.5;
   window_x:=round(window_x-250/mashtab);
   window_y:=round(window_y-25/mashtab);
   view;
   with array_of_nodes[marked_node] do
   begin
   setfillstyle(1,2);setcolor(10);
   bar3d(40,mmyy(45),240,mmyy(330),2,true);
   setcolor(aink);outtextxy(140,mmyy(60),note(data_about_node));
   settextjustify(0,2);{setcolor(1);
   outtextxy(60,mmyy(75),note(beg));
   outtextxy(60,mmyy(90),note(work_));
   outtextxy(60,mmyy(105),note(stand_at));
   outtextxy(60,mmyy(120),note(ending));}
   out_number(beg,     75 ,node_time);
   out_number(work_,   90 ,work_at_node);
   out_number(stand_at,105,time_end-node_time-work_at_node);
   out_number(ending,  120,time_end);
   node_image;
   pause;
{   settextjustify(1,1);}
   window_x:=round(window_x+250/mashtab);
   window_y:=round(window_y+25/mashtab);
   mashtab:=mashtab*1.5;
   view;s:='№';
   end;
 end;
procedure new_processor(s:char);
 begin
   if marked_node<>0 then
               with array_of_nodes[marked_node] do
               begin
               case s of
                 '(':if processor>1 then dec(processor)else
                       begin dec(processor);
                             for i:=1 to last_node do with array_of_nodes[i] do
                              if level_of_node=who_see then inc(processor);
                             {correct_number_of_processor;}
                             refresh_processors;
                       end;
                 ')':inc(processor);
               end;
               if keypressed=false then begin work_all;view;end;
               end;
 end;
procedure get_near_processor_node(s:char);
  var i,p,t,t2,j:integer;
 begin
   with array_of_nodes[marked_node] do
     begin p:=processor;t:=node_time;j:=0;t2:=t;end;
   case s of
     pg_up:for i:=1 to marked_node-1 do with array_of_nodes[i] do
           if level_of_node=who_see then if node_time<=t then
           if (j=0)or(t2<node_time ) then begin j:=i;t2:=node_time;end;
     pg_down:for i:=marked_node+1 to last_node do with array_of_nodes[i] do
          if level_of_node=who_see then if node_time>=t then
          if (j=0)or(t2>node_time ) then begin j:=i;t2:=node_time;end;
   end;
   if j=0 then info('?????') else
    begin Swap_nodes(marked_node,j);marked_node:=j;end;
 end;
procedure ShiftLineUp(where:boolean);{поменять местами пересылки}
var LL,LLF,LLF2,n1,n2:integer;
    LLX:lines_object;
    s1:string;
 begin n1:=marked_node;  n2:=find_near_node;
       LLF:=0;
       for LL:=1 to last_line do
           with array_of_lines[LL] do if level_of_line=who_see then
           if second_node=n2 then if first_node =n1 then LLF:=LL;

       if LLF=0 then info('Вершины '+st(n1)+' и '+st(n2)+' не связаны.') else
       begin LLF2:=0;
             for LL:=1 to last_line do
             with array_of_lines[LL] do if level_of_line=who_see then
             if first_node =n1 then if LLF<>LL then
             begin if where then if LLF>LL then
                   if (LLF2=0)or(LLF2<LL) then LLF2:=LL;
                   if not where then if LLF<LL then
                   if (LLF2=0)or(LLF2>LL) then LLF2:=LL;
             end;
             if LLF2=0 then info('Пересылку '+st(n1)+'-->-'+st(n2)+' некуда двигать')
             else begin
                  LLx:=array_of_lines[LLF];
                  array_of_lines[LLF]:=array_of_lines[LLF2];
                  array_of_lines[LLF2]:=LLx;
                  work_all;view;
                  info('Пересылка '+st(n1)+'-->-'+st(n2)+' передвинута');
                  end;
       end;
 end;
procedure no_key; begin info(note(incorrect_key)+st(ord(s))+'='+s);end;
procedure case4;
 begin
   case s of
   'l':ShiftLineUp(true);{поменять местами пересылки}
                 'P':line_options;
                 'n':marked_node_at_new_processor;
                 'm':if marked_node<>0 then with array_of_nodes[marked_node] do
                     if level_of_node=who_see then
                     begin
                       i:=get_processor_by_strela;
                       processor:=i;
                       if i=0 then for i:=1 to last_node do
                        with array_of_nodes[i] do
                        if level_of_node=who_see then inc(processor);
                       work_all;view;
                       info('MOVE to '+st(processor)+' PROCESSOR.');
                     end;
                 else no_key;
               end;
 end;
procedure case3;
 begin
   if my_win=graf_nodes then
    case s of
      'Y':begin yarusno_parallel_forma;view;end;
      'n': begin new_node;work_all;view;flag_sort:=false;end;
      'm':if marked_node<>0 then move(marked_node);
      #8,'l','/','*','P','G','H','I','?':line_options;
      'D':if marked_node<>0 then
          begin
            delete_marked_node;view;flag_sort:=false;{marked_node:=0;}
            info(note(Del_NODE_and_LINES));
          end;
       else no_key;
    end else if my_win=time then case4 else no_key;
 end;
procedure Durka1;
  var i,j:integer;
 begin
   for i:=1 to last_node do with array_of_nodes[i] do
   if level_of_node=who_see then begin processor:=i;status:=no_use;end;
{   for i:=1 to last_line do with array_of_lines[i] do
                         if level_of_line=who_see then status:=no_use;}
   type_way:=true;get_short_way2;
   work_all;view;info('Kukareku');pause;
 end;
procedure case2;
 var i:integer;
 begin
   case s of
      'L':begin
            for i:=1 to last_line do with array_of_lines[i] do
            if level_of_line=who_see then
            with array_of_nodes[first_node] do
         if array_of_nodes[second_node].processor=processor then
            type_of_line:=large else type_of_line:=small;
            view;
          end;
      'A','S','W','Z': begin move_screen;view;end;
      '(',')':new_processor(s);
      'V':begin set_size_all_nodes;view;end;
      'v':begin work_all;view;{info('View...');}end;
      tab:begin if my_win=graf_nodes then my_win:=time else
                if my_win=time then my_win:=graf_nodes;
                work_all;view;end;
      'c':begin set_center_scren;view;end;  {'C':begin correct_number_of_processor;view;end;}
      'C':begin copy_this_level_to_new;view;info('Level  '+st(who_see));end;
      '[':if who_see>1 then begin dec(who_see);
           work_all;view;info('Level  '+st(who_see));end else
           info('It''s the first LEVEL.');
      ']':if who_see<get_last_generation then
          begin inc(who_see);work_all;view;info('Level  '+st(who_see));end
          else info('It''s the last LEVEL.');
      't':begin compare_two_level;view;
                case error of
                1:info('Cannot compare all nodes!!!!');
                else info('All compared');
          end;end;
      '{':if who_see>1 then
          begin
            shift_who_see(who_see-1,who_see);
            dec(who_see);view;info('Level  '+st(who_see));
          end;
      '}':if who_see<get_last_generation then
          begin shift_who_see(who_see,who_see+1);
          inc(who_see);view;info('Level  '+st(who_see));end;
      'r':begin correct_number_of_processor;
                refresh_processors;
                set_size_all_nodes;view;
                info(note(Refresh_processors_));end;
      'J':begin type_way:=true;get_short_way2;
                all_at_large_to_one_proc;set_size_all_nodes;view;end;
      ':':user_change_short_way;
      'e':begin table_patology;view;end;
      'w':begin table_win;view;end;
      'o':begin any_lines:=true;random_graf;any_lines:=false;sort_graf;all_at_another;
                work_all;
            s:='№';view;end;
      'a':begin table_other_win;view;end;
      'j':begin table_short_way;view;end;
      '\':begin durka1;view;info('Algoritm --- durka ');end;
      'k':begin table_full_change;view;
                info(note(end_of_optimaze));s:=';';end;
      'b':if my_win=graf_nodes then
          begin table_for_edit;view;info(last_info);s:='№';end
          else info(note(only_for_dag_options));
      '`':begin if my_text=english then my_text:=other
                else my_text:=pred(my_text);
                InitNewLanguage(my_text);
                view;info(note(well_come));
                end;
      enter:begin view_mark_info(true);
                  view_node(marked_node,false,false);
                  last_marked:=marked_node;
                  marked_node:=find_near_node;
                  view_node(marked_node,true,false);
                  view_mark_info(false);
                  if last_marked=marked_node then if marked_node<>0 then
                  with array_of_nodes[marked_node] do
                   begin
                     i:=work_at_node;
                     GetNodeVindow(i,'Edit NODE:');
                     if s=enter then work_at_node:=i;
                     view;s:='■';
                   end;
                  work_all;view;
             end;
      '+':begin mashtab:=mashtab*1.5;set_center_scren;view;
                end;
      '-':begin mashtab:=mashtab/1.5;set_center_scren;view;
                end;
      '~':begin if ColSee then ColSee:=false else ColSee:=true;view;end;
      ' ':begin clear_coord;marked_node:=0;view;end;
      '$':begin graf_set;work_all;view;info(note(Set_graph));end;
      '!':begin all_at_one    ;work_all;view;end;
      '@':begin all_at_another;work_all;view;end;
      '#':begin correct_work_at_lines;view;info(note(correct_work_at_lines_));end;
      'i':node_info;
      'p':begin set_all_lines_small;view;end;
      'K':begin set_ohered;work_all;view;end;
      '1'..'8':begin info2('Wait...');by_form_(use_algoritm[ord(s)-48],true);end;
      else case3;
   end;
 end;
procedure case1;
 begin
     case s of
      KeyHome,KeyEnd:ShiftLineUp(s=KeyHome);
      Alt_x       :s:=esc;
      Ctr_left    :new_processor('(');
      Ctr_right   :new_processor(')');
      down,up,left,right:move_strela;
      Alt_1,Alt_2,Alt_6,Alt_7:begin i:=integer(s)-119;set_new_flag(i);view;info(flag_name(i));end;
      F1:begin help;view;s:='?';end;
      f11:begin
           if my_text=other then my_text:=english else my_text:=succ(my_text);
           view;
          end;
      F2 :begin flag_sort:=false;save(false);view;s:='№';end;
      F3 :begin flag_sort:=false;load;work_all;view;s:='№';end;
      F4 :begin
            view_alg:=false;table_use_algoritm;
            case s of
              F4   :all_algoritmicus_graf;
              F1   :statistic_algoritm(tact);
              else view;
            end;
            s:='№';
          end;
      F5 :begin
            view_kol_nodes;
            if s<>esc then
            begin
                random_graf;
                any_lines:=false;
                sort_graf;all_at_another;
                work_all;
            end;
            s:='№';view;
            info(st(round(last_line/kol_rand_nodes*100/kol_rand_nodes))+'%');
          end;
      F6:begin view_file_with_grafik;view;s:='№';end;
      F7 :begin setings;work_all;view;s:='№';end;
      F10: begin
             tables(5,200,100);
             case s of
               '1':file_of_lines;
               '2':file_of_summa(true);
             end;
             work_all;view;
             case s of
               '1':info('Файл File_1.txt  сформирован.');
               '2':info('Файл File_2.txt  сформирован.');
             end;s:='№';
           end;
      Ctr_F10:begin delete_who_see;view;info('стерли текущий слой');s:='№';end;
      Pg_up:{if marked_node>1 then}
            begin get_near_processor_node(pg_up);
{            Swap_nodes(marked_node,marked_node-1);}
{                  dec(marked_node);}
                  work_all;view;end;
      Pg_down:{if marked_node<>0 then if marked_node<last_node then}
            begin get_near_processor_node(pg_down);
                  {Swap_nodes(marked_node,marked_node+1);}
                  {inc(marked_node);}
                  work_all;view;
                  end;
      else if s<>'№' then
      info(note(incorrect_function_key)+' '+st(integer(s))+'='+s);
    end;
 end;
begin
  last_marked:=0;
  randomize;
  my_all_proc:=3;
  use_buzy:=3;
  full_mem:=use_line;
  view_alg:=false;
  my_text:=russian; ColSee:=true; 
  if ParamCount>0 then for i:=1 to ParamCount do
   begin
    s1:=ParamStr(i);
    if s1='text16' then my_text:=english;
    if s1='text26' then my_text:=russian;
    if s1='text36' then my_text:=polyk;
    if s1='text46' then my_text:=other;
    if s1='bw' then ColSee:=false;
    if pos('?',s1)<>0 then
      begin
        writeln('text16 - english');
        writeln('text26 - russian (initial)');
        writeln('text36 - polyk');
        writeln('text46 - other');
        writeln('?      - View ParamStrings ');
        writeln('bw     -  ');
        writeln('...');halt(1);
      end;
   end;
  InitNewLanguage(my_text);
  i:=Detect;
  initgraph(i,j,'egavga.bgi');     i:= GraphResult;  
  if i=grOk then Writeln('Graphics error:', GraphErrorMsg(i));
  fnt:=installuserfont('nuts.bgi');i:= GraphResult;
  if i<>grOk then
    begin closegraph;Writeln('Error Font :', GraphErrorMsg(i));end;
  SetPalette(0,63);SetPalette(15,0);
  settextstyle(fnt,horizdir,0);
  clear_coord;load_sys_info;
  marked_node:=0;last_node:=0;last_line:=0;
  work_all; view;info(note(well_come));
  repeat
    strela; pause;strela;
    if s=esc then get_upper_string else if functional_key then
    case s of
     F9 :begin tables(4,400,30);view;end;
     F8 :begin tables(3,300,30);view;end;
    end;
    if functional_key then case1 else case2;
  until s=esc;
  closegraph;save_sys_info;
end.