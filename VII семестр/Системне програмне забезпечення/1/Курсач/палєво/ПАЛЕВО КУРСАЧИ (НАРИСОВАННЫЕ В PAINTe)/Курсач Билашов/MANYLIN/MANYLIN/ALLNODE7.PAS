unit allnode7;
interface
uses alltext7,add_man7,graph,windos,crt;
type all_patology=(full_join,shina,memory);
const
  max_patology=2;
var my_patology:all_patology;
    any_lines:boolean;
const kol_rand_nodes:integer=10;
      fill_with_lines:integer=10;
      max_nodes=100;
      max_lines=200;
      max_proc =100;
      color_of_elipse     =6;
      color_of_main_lines =12;
      color_of_lines      =6;
      small               =1;
      large               =3;
      max_time_of_line    =20;
      max_time_of_node    =20;
type
  all_win=(graf_nodes,time,three_dim);
  type_mem=(use_line,no_use_line);
  st_type=(no_use,correct,at_way,use);
{  node_ptr=^node;
  line_ptr=^lines_object;
  proc_ptr=^proc;}
  node=record
   x_position,y_position :integer;
   midle_size,up_size,down_size,proc_size:integer;
   work_at_node :integer;
   processor    :integer;
   node_time    :integer;
   time_end     :integer;
   user_number,number       :integer;
   level_of_node            :integer;
   ff,line_to_status        :integer;
   status                   :st_type;
   first_line               :integer;
   {it_next:node_ptr;
   it_line:line_ptr;
   it_proc:proc_ptr;}
   end;
  lines_object=object
     first_node,second_node :integer;
     work_at                :integer;
     mem                    :type_mem;
     line_number            :integer;
     level_of_line          :integer;
     line_time,time_end     :integer;
     type_of_line           :integer;
     {n1,n2:node_ptr;
     next_ln:line_ptr;}
{     next_line:integer;}
     function work_at_line:integer;
     procedure set_work_at_line(i:integer);
     end;
  proc=record
    last_time:integer;
    buzy_time:integer;
    our_node:integer;
   end;
var
  my_win:all_win;

  array_of_nodes:array [0..max_nodes] of node;
  array_of_lines:array [0..max_lines] of lines_object;
  array_of_proc:array [0..max_proc] of proc;

    finding_line,last_node,last_line:integer;
    finding_node:integer;
    who_see:integer;
    marked_node:integer;
    use_buzy:integer;
    tmin,error,time_buzy,mashtab_buzy:integer;
    many_join ,flag_sort{,view_status}:boolean;

function get_last_generation:integer;
procedure shift_who_see(a,b:integer);
procedure compare_two_level;
procedure replace_last_who_see;
procedure copy_this_level_to_new;
function no_line_with(a,b:integer):boolean;
procedure yarusno_parallel_forma;
function get_processor_by_strela:integer;
procedure random_graf;
procedure view_kol(j:integer);
procedure view_kol_nodes;
procedure set_processor(p1,p2:integer);
procedure go2;
procedure set_use(p1:integer);
procedure nodes_at_large_line_use;
procedure correct_work_at_lines;
procedure load_sys_info;
procedure save_sys_info;
procedure load_proc;
procedure save_proc;
procedure dos_opt(var ss:string;ff:boolean);
procedure load;
procedure save(bb:boolean);
procedure my_bar(dt,j:integer);
procedure at_celindr(var i,x,y:integer);
procedure new_work_at_line(i:integer);
procedure new_work_at_node(i:integer);
procedure set_all_number(new_number:integer);
function long_line(i:integer):boolean;
function buzy(i:integer):integer;
procedure size_time_at(var i,i1,i2:integer);
function size_time_at_node(i:integer):integer;
function size_time_at_line(i:integer):integer;
procedure next_dt(var i:integer);
procedure next_dt_node(var i:integer);
procedure next_dt_line(var i:integer);
procedure all_at_another;
procedure refresh_processors;
procedure correct_number_of_processor;
function get_max_number_of_processor:integer;
function get_max_time_work:integer;
function is_processor(proc:integer):boolean;
procedure convert_proc(from,to_:integer);
function small_klaster:boolean;
procedure swap_processors(p1,p2:integer);
procedure all_at_large_to_one_proc;
procedure clear_coord;
procedure delete_all_lines_who;
procedure  delete_who_see;
procedure delete_marked_node;
procedure set_node_as(a,b:integer);
procedure go_harkar;
procedure sort_graf;
procedure set_rang_of_nodes;
{procedure create_fast_mas;}
{procedure fast_work;}

implementation
var last_name:string;
    maxx:integer;
{procedure fast_work;
 var i:integer;
     n:node_ptr;
     l:line_ptr;
     node_go:integer;
 procedure who_can_start(var n:node_ptr);
  var nn:node_ptr;
  begin
    n:=nil;
    nn:=@array_of_nodes[1];
    while nn<>nil do
     begin
       if nn^.number=0 then
        begin
          n:=nn;
          nn:=nil;
        end else
         begin
           if nn^.number<0 then n:=nn;
           nn:=nn^.it_next;
         end;
     end;
  end;
 procedure start_node_work(var n:node_ptr);
  var  l:line_ptr;
      nn:node_ptr;
  begin
    dec(node_go);
    n^.number:=1;
    with n^ do
     begin   {исполнение узла}{
       if node_time<it_proc^.last_time then node_time:=it_proc^.last_time;
       time_end:=node_time+work_at_node;
       it_proc^.last_time:=time_end;
             {кто будет следующим}{
       l:=it_line;
       while l<>nil do
        begin
          l^.line_time:=time_end;

          if processor<>l^.n2^.processor then l^.time_end:=time_end+l^.work_at_line
                                         else l^.time_end:=time_end;
          inc(l^.n2^.number);
          if     l^.n2^.node_time<l^.time_end
            then l^.n2^.node_time:=l^.time_end;
          l:=l^.next_ln;
        end;
     end;
  end;
 begin
   info('+');
   n:=@array_of_nodes[1];
   while n<>nil do {подготовка к исполнению}{
    begin
      n^.it_proc^.last_time:=0; {откуда можем начинать исполнение}{
      n^.node_time:=0;
      n^.number:=0;
      n:=n^.it_next;
    end;
   n:=@array_of_nodes[1];
   while n<>nil do
    begin
      l:=n^.it_line;
      while l<>nil do  {кто не может быть первым узлом}{
       begin
         dec(l^.n2^.number);
         l:=l^.next_ln;
       end;
      n:=n^.it_next;
    end;
   node_go:=last_node;
   while node_go>0 do
    begin
      who_can_start(n);
      if n=nil then node_go:=0 else start_node_work(n);
    end;
 end;}
{procedure create_fast_mas;
 var i:integer;
     j:line_ptr;
 begin
   for i:=1 to last_line do with array_of_lines[i] do
   if level_of_line=who_see then
    begin
      next_ln:=nil;
      n1:=@array_of_nodes[first_node];
      n2:=@array_of_nodes[second_node];
    end;
   for i:=1 to last_node do with array_of_nodes[i] do
    begin
     if i<last_node then it_next:=@array_of_nodes[i+1]
                    else it_next:=nil;
     it_line:=nil;
     it_proc:=@array_of_proc[processor];
    end;
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
     begin
       with array_of_nodes[first_node] do
        begin
          if it_line=nil then it_line:=@array_of_lines[i] else
          begin
            j:=it_line;
            if j^.second_node>second_node then
             begin
               next_ln:=it_line;
               it_line:=@array_of_lines[i];
             end else while j<>nil do
              begin
                if j^.next_ln=nil then
                 begin
                   j^.next_ln:=@array_of_lines[i];
                   j:=nil;
                 end else if j^.next_ln^.second_node>second_node then
                  begin
                    next_ln:=j^.next_ln;
                    j^.next_ln:=@array_of_lines[i];
                    j:=nil;
                  end else j:=j^.next_ln;
              end;
          end;
        end;
     end;
 end;}
procedure clear_coord;
begin mashtab:=1;strela_x:=300;strela_y:=100;
      view_inverse:=false;
      window_y:=0;window_x:=0;
      who_see:=1;
      view_alg:=false;
      {min_line_work:=0;}
      { это задается в системном файле
       view_number_of_processors:=true;}
      {view_time:=true;
      view_work_line:=true;}
      {view_nodes_number:=false;}
end;
function lines_object.work_at_line:integer;
begin
  case mem of
    use_line   :work_at_line:=work_at;
    no_use_line:work_at_line:=min_line_work;
  end;
end;
procedure lines_object.set_work_at_line(i:integer);
begin
  work_at:=i;
end;
procedure dos_opt(var ss:string;ff:boolean);
var dd:tsearchrec;
    ooo:array[1..20]of tsearchrec;
    fff:file;
    i,j :integer;
procedure init_list;
begin
  clr;
  i:=1;settextjustify(0,2);setcolor(aink);
  findfirst('files\*.lin',faarchive,dd);
  while (doserror=0)and(i<20) do
  begin
    ooo[i]:=dd;
    outtextxy(100,i*9+35,dd.name);
    findnext(dd);inc(i);
  end;
  j:=i-1;i:=1;
  setcolor(aink);
  if ff then outtextxy(220,20,'SAVING  INFORMATION:')
        else outtextxy(220,20,'LOADING INFORMATION:');
  setcolor(1);
  outtextxy(400,40,note(press)+' SPACE');
  outtextxy(400,30,'Файл :'+last_name);
  outtextxy(400,50,'BackSpace- delete this file');
end;
begin
  init_list;
  if j<>0 then repeat
    settextjustify(0,2);
    setcolor(aink);outtextxy(80,i*9+35,'>');
    pause;
    setcolor(afon);outtextxy(80,i*9+35,'>');
    case s of
      backspace:begin
                 ss:=ooo[i].name;
                 setfillstyle(1,7);settextjustify(1,1);
                 setcolor(aink);bar3d(100,150,500,250,10,true);
                 setcolor(afon);outtextxy(300,184,note(Deleting_this_FILE)+ss);
                 setcolor(aink);outtextxy(300,217,'ESC-'+note(no_)+', ENTER-'+note(yes));
                 repeat pause until s in [enter,esc];
                 if s<>enter then init_list else
                 begin
             assign(fff,'files\'+ss);erase(fff);init_list;
             end;s:='№';
                end;
      #72:if i>1 then dec(i);
      #80:if i<j then inc(i);
      #75:i:=1;
      #77:i:=j;
    end;
  until (s=' ')or(s=#13)or(s=#27) else
  if ff then s:=' ' else s:=#27;
  ss:='';
  case s of
    ' ':if ff then begin input(400,200,ss);if ss<>#27 then ss:=ss+'.lin';end;
    #13:ss:=ooo[i].name;
  end;
  settextjustify(1,1);
end;
procedure load_sys_info;
var f:text;
    i,j:integer;
    b:byte;
    sss:string;
begin assign(f,'many7.ini');reset(f);
      i:=0;
      readln(f,j,window_x,window_y,strela_x,strela_y,mashtab);
      my_patology:=all_patology(i);
      my_win:=all_win(j);
      readln(f,sss);
      readln(f,b,sss);view_number_of_processors:=boolean(b);
      readln(f,b,sss);view_work_line:=boolean(b);
      readln(f,b,sss);view_alg:=boolean(b);
      readln(f,min_line_work,sss);
      readln(f,b,sss);all_join_is_equal:=boolean(b);
      readln(f,b,sss);view_nodes_number:=boolean(b);
      readln(f,b,sss);view_time:=boolean(b);
      readln(f,b,sss);view_shadow:=boolean(b);
      readln(f,b,sss);ProcWaitSendInfo:=boolean(b);
      close(f);
end;
procedure save_sys_info;
var   f:text;
begin assign(f,'many7.ini');rewrite(f);
  write(f,ord(my_win):2,' ',window_x,' ',window_y,' ',strela_x,' ',strela_y);
  writeln(f,' ',mashtab,' ',ord(my_patology));
  writeln(f,'установки пользователя:');
  writeln(f,ord(view_number_of_processors),' виден номер процессора');
  writeln(f,ord(view_work_line),' вес или номер вершины');
  writeln(f,ord(view_alg),' ???');
  writeln(f,min_line_work,' ???');
  writeln(f,ord(all_join_is_equal),' все связи одного веса');
  writeln(f,ord(view_nodes_number),' виден номер вершины');
  writeln(f,ord(view_time),' видно время исполнения Start...Stop');
  writeln(f,ord(view_shadow),' граф отбрасывает тени');
  writeln(f,ord(ProcWaitSendInfo),' процессор ждет пересылки');
  writeln(f,'');
  writeln(f,'');
  close(f);
end;

procedure load;
var name_file:string;
    f:text;
    i,j,l,sy:integer;
    my:integer;
begin
  my:=round(getmaxy/200);
  dos_opt(name_file,false);
  if name_file<>'' then
  begin
    last_name:=name_file;
    assign(f,'files/'+name_file);reset(f);
    readln(f,name_file);
    readln(f,last_node,name_file);
    readln(f,last_line,name_file);
    readln(f,name_file);
    if name_file='System info:' then
    begin
      i:=0;
      read(f,sy,window_x,window_y,strela_x,strela_y,mashtab);
      if SeekEoln(f) then readln(f,name_file) else readln(f,i);
      my_patology:=all_patology(i);
      my_win:=all_win(sy);
      readln(f,name_file);
    end;
    for i:=1 to last_node do with array_of_nodes[i] do
    begin
    read(f,j,x_position,y_position,work_at_node,l);
    read(f,node_time,time_end,processor,number,line_to_status);
    level_of_node:=1;status:=st_type(l);user_number:=i;
    if SeekEoln(f) then readln(f,name_file) else
    begin
      read(f,level_of_node);
      if SeekEoln(f) then readln(f,name_file) else readln(f,user_number);
    end;
    if (level_of_node<1)or(level_of_node>last_node) then level_of_node:=1;
    end;
    readln(f,name_file);
    for i:=1 to last_line do with array_of_lines[i] do
    begin
      read(f,j,type_of_line,first_node,second_node);
      read(f,work_at,line_time,time_end);
      mem:=use_line;level_of_line:=1;
      if SeekEoln(f) then readln(f,name_file) else readln(f,level_of_line);
      with array_of_nodes[first_node] do
        if level_of_node<>array_of_nodes[second_node].level_of_node then
      begin
        level_of_node:=1;
        array_of_nodes[second_node].level_of_node:=1;
        level_of_line:=1;
      end;
    end;
    close(f);
  end;
  marked_node:=0;
end;
procedure save(bb:boolean);
var name_file:string;
    f:text;
    i:integer;
begin
  if bb then name_file:=last_name
     else dos_opt(name_file,true);
  if name_file<>'' then
  begin
    last_name:=name_file;
    assign(f,'files/'+name_file);
    rewrite(f);
    writeln(f,'This file is for the programm /manylins v 7.20/');
    writeln(f,last_node,'  - how many nodes');
    writeln(f,last_line,'  - how many lines');
    writeln(f,'System info:');
    write(f,ord(my_win):2,' ',window_x,' ',window_y,' ',
          strela_x,' ',strela_y);
    writeln(f,' ',mashtab,' ',ord(my_patology));
    writeln(f,'-Num--X----Y--Work-Status-Start-Stop-Proc-Number-?-LEV-UsNb');
    {writeln(f,'--------------------------------------');}
    for i:=1 to last_node do with array_of_nodes[i] do
    begin
   write(f,i:3,x_position:5,y_position:5,
   work_at_node:5,ord(status):5);
   writeln(f,node_time:6,time_end:6,processor:4,number:5,
   line_to_status:6,level_of_node:3,user_number:4);
    end;
    writeln(f,'-Num-Type-FirstN-SecondN-Work-Start-Stop--LEV------');
    {writeln(f,'--------------------------------------');}
    for i:=1 to last_line do with array_of_lines[i] do
    begin
      write(f,i:4,type_of_line:4,first_node:6);
      write(f,second_node:7,work_at_line:7,line_time:6,time_end:6);
      writeln(f,level_of_line:4);
    end;
    close(f);
  end;
end;
procedure new_work_at_line(i:integer);
  begin
    if i<>0 then with array_of_lines[i] do
     set_work_at_line(random(max_time_of_line)+1);
  end;
procedure new_work_at_node(i:integer);
  begin
    if i<>0 then with array_of_nodes[i] do if level_of_node=who_see then
    work_at_node:=random(max_time_of_node)+max_time_of_node;
  end;
procedure set_all_number(new_number:integer);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then number:=new_number;
end;
function long_line(i:integer):boolean;
  begin
    long_line:=false;
    if (i>0)and(i<=last_line) then with array_of_lines[i] do
    with array_of_nodes[first_node] do
    if processor<>array_of_nodes[second_node].processor
      then long_line:=true;
  end;
function long_line_by_number(i:integer):boolean;
var a,b:integer;
  begin
    long_line_by_number:=false;
    if (i>0)and(i<=last_line) then with array_of_lines[i] do
    begin
      with array_of_nodes[first_node] do
      if (number>0)and(number<=last_node) then
      a:=array_of_nodes[number].processor;
      with array_of_nodes[second_node] do
      if (number>0)and(number<=last_node) then
      b:=array_of_nodes[number].processor;
      if a<>b then long_line_by_number:=true;
    end;
  end;
function buzy(i:integer):integer;
var j,summa:integer;
begin
  summa:=0;
  for j:=1 to last_node do with array_of_nodes[j] do if level_of_node=who_see then
  if processor=i then summa:=summa+time_end-node_time;
  buzy:=summa;
end;
procedure size_time_at(var i,i1,i2:integer);
begin
  if use_buzy=1 then
  begin i1:=size_time_at_node(i); i2:=0; end else
  if use_buzy=2 then
  begin i2:=size_time_at_line(i); i1:=0; end else
  begin i1:=size_time_at_node(i);
        i2:=size_time_at_line(i); end;
end;
function size_time_at_node(i:integer):integer;
var j,summa:integer;
begin
  summa:=0;
  for j:=1 to last_node do with array_of_nodes[j] do
  if level_of_node=who_see then
  if (node_time<=i)and(time_end>i) then inc(summa);
  size_time_at_node:=summa;
end;
function size_time_at_line(i:integer):integer;
var j,summa:integer;
begin
  summa:=0;
  for j:=1 to last_line do with array_of_lines[j] do
  if level_of_line=who_see then
  if (line_time<=i)and(time_end>i) then inc(summa);
  size_time_at_line:=summa;
end;
procedure next_dt(var i:integer);
var a,b:integer;
begin
  a:=i;b:=i;
  if use_buzy=1 then next_dt_node(a) else
  if use_buzy=2 then next_dt_line(a) else
  begin
    next_dt_node(a);
    next_dt_line(b);
    a:=min(a,b);
  end;
  i:=a;
end;
procedure next_dt_node(var i:integer);
var dt:integer;
    f:boolean;
    j:integer;
begin
   dt:=all_time;
   for j:=1 to last_node do with array_of_nodes[j] do
   if level_of_node=who_see then
   begin
     if (i>=node_time)and(i<time_end) then
       if time_end<dt then dt:=time_end;
     if i<node_time then if node_time<dt then dt:=node_time;
   end;
   i:=dt;
end;
procedure next_dt_line(var i:integer);
var dt:integer;
    f:boolean;
    j:integer;
begin
   dt:=all_time;
   for j:=1 to last_line do with array_of_lines[j] do
   if level_of_line=who_see then
   begin
     if (i>=line_time)and(i<time_end) then
       if time_end<dt then dt:=time_end;
     if i<line_time then if line_time<dt then dt:=line_time;
   end;
   i:=dt;
end;
function get_max_number_of_processor:integer;
var j,kol:integer;
begin
  kol:=0;
  for j:=1 to last_node do with array_of_nodes[j] do
    if level_of_node=who_see then if processor>kol then
     kol:=processor;
  get_max_number_of_processor:=kol;
end;
function is_processor(proc:integer):boolean;
var j,kol:integer;
begin
  is_processor:=false;
  for j:=1 to last_node do with array_of_nodes[j] do
  if level_of_node=who_see then
  if processor=proc then is_processor:=true;
end;
procedure convert_proc(from,to_:integer);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if processor=from then processor:=to_;
end;procedure correct_number_of_processor;
var i,j:integer;
begin
  j:=get_max_number_of_processor;i:=1;
  while i<=get_max_number_of_processor do
  if is_processor(i)=false
  then convert_proc(get_max_number_of_processor,i)
  else inc(i);
end;
procedure refresh_processors;
var
  proc:array[0..max_proc+2] of record
    x_screen,num,kol:integer;end;
  i,x:integer;
  f:boolean;
begin
  correct_number_of_processor;
  maxx:=get_max_number_of_processor;
  for i:=1 to maxx do with proc[i] do
      begin x_screen:=0;num:=i;kol:=0;end;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  with proc[processor] do
    begin inc(x_screen,x_position);
          inc(kol);processor:=-processor;end;
  for i:=1 to maxx do with proc[i] do
      if kol<>0 then x_screen:=round(x_screen/kol);
  repeat
    f:=true;
    for i:=1 to maxx-1 do
    if proc[i].x_screen>proc[i+1].x_screen then
    begin
      proc[maxx+1]:=proc[i];
      proc[i]:=proc[i+1];
      proc[i+1]:=proc[maxx+1];
      f:=false;
    end;
  until f;
  for i:=1 to maxx do swap_processors(-proc[i].num,i);
end;
procedure swap_processors(p1,p2:integer);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    if processor=p1 then processor:=p2 else
    if processor=p2 then processor:=p1;
  end;
end;
procedure all_at_another;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin status:=no_use;processor:=i;end;
  {view_number_of_processors:=true;}
  refresh_processors;
end;
procedure all_at_large_to_one_proc;
  var i,j:integer;
  begin
    j:=get_max_number_of_processor;
    for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node=who_see then if status=at_way then
    begin
      processor:=j+1;
      status:=use;
    end;
    correct_number_of_processor;
    refresh_processors;
  end;
procedure my_bar(dt,j:integer);
const scr_x=300;
var mmm:array[1..6] of pointtype;
    ddx1,ddx2,cp:integer;
    rr1,rr0:integer;
begin
  cp:=col_proc+1;
  rr0:=110+round(500/cp*j);
  rr1:=110+round(500/cp*(j+1));
  ddx1:=round(150/all_time*last_dt);
  ddx2:=round(150/all_time*dt);
  mmm[1].x:=rr0-ddx1;
  mmm[2].x:=rr1-ddx1;
  mmm[3].x:=rr1-ddx2;
  mmm[4].x:=rr0-ddx2;
  with array_of_proc[j] do mmm[1].y:=mmyy(60 +2*ddx1-last_time*3);
  with array_of_proc[j] do mmm[2].y:=mmyy(60 +2*ddx1-last_time*3);
  with array_of_proc[j] do mmm[3].y:=mmyy(60 +2*ddx2-last_time*3);
  with array_of_proc[j] do mmm[4].y:=mmyy(60 +2*ddx2-last_time*3);
  case array_of_proc[j].last_time of
    0:   begin setcolor(1);setfillstyle(1,afon);end;
    2:   begin setcolor(aink);setfillstyle(2,14);end;
    3:   begin setcolor(aink);setfillstyle(8,afon);end;
    4:   begin setcolor(aink);setfillstyle(6,9);end;
    5:   begin setcolor(aink);setfillstyle(6,afon);end;
    else begin setcolor(aink);setfillstyle(9,afon);end;
  end;
  fillpoly(4,mmm);
  mmm[1].x:=rr1-ddx1;
  mmm[2].x:=mmm[1].x;
  mmm[3].x:=rr1-ddx2;
  mmm[4].x:=rr0-ddx2;
  mmm[5].x:=mmm[4].x;
  mmm[6].x:=mmm[3].x;
  with array_of_proc[j] do mmm[1].y:=mmyy(60 +2*ddx1);
  with array_of_proc[j] do mmm[2].y:=mmyy(60 +2*ddx1-last_time*3);
  with array_of_proc[j] do mmm[3].y:=mmyy(60 +2*ddx2-last_time*3);
  with array_of_proc[j] do mmm[4].y:=mmm[3].y;
  with array_of_proc[j] do mmm[5].y:=mmyy(60 +2*ddx2);
  with array_of_proc[j] do mmm[6].y:=mmm[5].y;
  case array_of_proc[j].last_time of
    0:   begin setcolor(aink);setfillstyle(1,afon);end;
    2:   begin setcolor(aink);setfillstyle(9,6);end;
    3:   begin setcolor(aink);setfillstyle(9,afon);end;
    4:   begin setcolor(aink);setfillstyle(1,1);end;
    5:   begin setcolor(aink);setfillstyle(1,afon);end;
    else begin setcolor(aink);setfillstyle(3,afon);end;
  end;
  fillpoly(6,mmm);
end;
function het(i:integer):boolean;
begin
  i:=i mod 2;
  if i=0 then het:=true else het:=false;
end;
procedure at_celindr(var i,x,y:integer);
var fff:real;
begin
  fff:=(2*pi/col_proc*(i div 2));
  if het(i) then fff:=-fff;
  fff:=fff-pi/2;
  x:=320+round(200*sin(fff));
  y:=mmyy(round(200-170*cos(fff)));
end;

function get_max_time_work:integer;
var i,time:integer;
begin
  time:=1;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if node_time+work_at_node>time
                       then time:=node_time+work_at_node;
  get_max_time_work:=time;
end;
procedure delete_all_lines_who;
var i:integer;
begin
  i:=1;
  while i<=last_line do with array_of_lines[i] do
    if level_of_line<>who_see then inc(i) else
    begin
      array_of_lines[i]:=array_of_lines[last_line];
      dec(last_line);
    end;
end;
procedure delete_marked_node;
var i:integer;
begin
  i:=1;
  while i<=last_line do with array_of_lines[i] do
  if level_of_line<>who_see then inc(i) else
  begin
    if (first_node=marked_node)or(second_node=marked_node) then
    begin
      array_of_lines[i]:=array_of_lines[last_line];
      dec(last_line);
    end else inc(i);
  end;
  array_of_nodes[marked_node]:=array_of_nodes[last_node];
  set_node_as(marked_node,0);
  set_node_as(last_node,marked_node);
  marked_node:=0;dec(last_node);
end;
procedure set_node_as(a,b:integer);
var i:integer;
begin
  for i:=1 to last_line do with array_of_lines[i] do
  begin
    if first_node =a then first_node :=b;
    if second_node=a then second_node:=b;
  end;
  for i:=1 to last_node do with array_of_nodes[i] do
    if number=a then number:=b;
end;
procedure replace_last_who_see;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node>who_see then dec(level_of_node);
  for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line>who_see then dec(level_of_line);
end;
procedure  delete_who_see;
var i:integer;
begin
  delete_all_lines_who;
  i:=1;
  while last_node>=i do with array_of_nodes[i] do
    if level_of_node<>who_see then inc(i) else
    begin marked_node:=i;delete_marked_node end;
  marked_node:=0;
  if who_see>1 then
    if get_last_generation<who_see then who_see:=get_last_generation;
  replace_last_who_see;
end;
procedure set_processor(p1,p2:integer);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if processor=p1 then processor:=p2;
end;
procedure set_use(p1:integer);
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if processor=p1 then status:=use;
end;
procedure go2;
var j:integer;
begin
  if tmin<1 then begin end else
  with array_of_lines[tmin] do
  with array_of_nodes[second_node] do
  begin
    if line_number<=0 then
    begin
set_processor(processor,array_of_nodes[first_node].processor);
      correct_number_of_processor;
    end;
  end;
end;
procedure go_harkar;
var j:integer;
begin
  if tmin<1 then begin
    for j:=1 to last_node do with array_of_nodes[j] do
    if level_of_node=who_see then
    if status=at_way then status:=use;
  end else
  with array_of_lines[tmin] do
  with array_of_nodes[second_node] do
  begin
    if line_number<=0 then
    begin
      set_use(processor);
set_processor(processor,array_of_nodes[first_node].processor);
      correct_number_of_processor;
    end else begin
    for j:=1 to last_node do with array_of_nodes[j] do
    if level_of_node=who_see then
    if status=at_way then status:=use;end;
  end;
end;
procedure save_proc;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then ff:=processor;
end;
procedure load_proc;
var i:integer;
begin
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then processor:=ff;
end;
procedure swap_nodes(i,j:integer);
var k:integer;
begin
  array_of_nodes[last_node+1]:=array_of_nodes[i];
  array_of_nodes[i]:=array_of_nodes[j];
  array_of_nodes[j]:=array_of_nodes[last_node+1];
  for k:=1 to last_line do with array_of_lines[k] do
  if level_of_line=who_see then
  begin
   if first_node=i then first_node:=j else
   if first_node=j then first_node:=i;
   if second_node=i then second_node:=j else
   if second_node=j then second_node:=i;
  end
end;
procedure sort_graf;
var i,j:integer;
    flag:boolean;
begin
  if flag_sort=false then
  begin
    set_rang_of_nodes;
    repeat
      flag:=false;
      j:=0;
      for i:=1 to last_node do with array_of_nodes[i] do
      if level_of_node=who_see then
      if j=0 then j:=i else
      if number<array_of_nodes[j].number then
      begin
        flag:=true;
        swap_nodes(i,j);
{        info(st(i)+'-'+st(j));}
        j:=i;
      end;
    until flag=false;
    repeat
      flag:=false;
      for i:=1 to last_line-1 do with array_of_lines[i] do
      if work_at_line>array_of_lines[i+1].work_at_line then
      begin
{        info(st(i)+'-'+st(j));}
        flag:=true;
        array_of_lines[last_line+1]:=array_of_lines[i];
        array_of_lines[i]:=array_of_lines[i+1];
        array_of_lines[i+1]:=array_of_lines[last_line+1];
      end;
    until flag=false;
    flag_sort:=true;
  end;
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
procedure new_rnd_line(nn1,nn2:integer);
begin
  inc(last_line);
    with array_of_lines[last_line] do
    begin
      level_of_line:=who_see;
      first_node:=nn1;second_node:=nn2;
      inc(array_of_nodes[nn2].number);
      type_of_line:=small;
      new_work_at_line(last_line);
    end;
  inc(array_of_nodes[nn2].number);
end;
function kol_this_rang(my_rang:integer):integer;
var i,kol:integer;
begin
  kol:=0;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  if number=my_rang then inc(kol);
  kol_this_rang:=kol;
end;
function pos_this_node(my_node:integer):integer;
var i,j:integer;
begin
  j:=1;
  for i:=1 to my_node-1 do with array_of_nodes[i] do
  if level_of_node=who_see then
  if number=array_of_nodes[my_node].number then inc(j);
  pos_this_node:=j;
end;
function no_line_with(a,b:integer):boolean;
var i:integer;
begin
  no_line_with:=true;finding_line:=0;
  for i:=1 to last_line do if finding_line=0 then
  with array_of_lines[i] do if level_of_line=who_see then
  if first_node=a then
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
procedure view_kol(j:integer);
  begin
     setlinestyle(0,1,1);settextjustify(1,1);
     newset(0,0,1,1,12,0);
     bar3d(100+j,110,400+j,190,2,true);setcolor(14);
     outtextxy(250+j,140,note(kol_of_nodes)+st(kol_rand_nodes));
     outtextxy(250+j,160,note(fill_of_nodes_mas)+st(fill_with_lines)+'%');
     setcolor(afon);
     outtextxy(250+j,120,note(create_rand_dag));
     if j=0 then outtextxy(250+j,180,note(Press)+': Up,Down,Left,Right,O');
  end;
procedure view_kol_nodes;
var flag:boolean;
begin
  repeat
    flag:=false;
    view_kol(0);pause;
    case s of
      left :if fill_with_lines>1 then dec(fill_with_lines);
      right:if fill_with_lines<49 then inc(fill_with_lines);
      up   :if kol_rand_nodes<max_nodes then inc(kol_rand_nodes);
      down :if kol_rand_nodes>3         then dec(kol_rand_nodes);
      'o'  :begin any_lines:=true;flag:=true;end;
{      left,right:if many_join then many_join:=false else many_join:=true;}
      else flag:=true;
    end;
  until flag;
  end;
procedure yarusno_parallel_forma;
  var i,n1,rrr:integer;
  begin
    set_rang_of_nodes;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    n1:=kol_this_rang(number);
    rrr:=pos_this_node(i);
    y_position:=round(180/(higest_rang+1)*(number))+20;
    x_position:=round(620/(n1+1)*rrr)+random(41)-20;
  end;

end;
procedure random_graf;
var
  fill,i,n1,n2,last_r,num_r:integer;
  rrr:integer;
begin
  fill:=round(kol_rand_nodes*kol_rand_nodes/100*fill_with_lines);
{  info(st(fill));pause;}
  flag_sort:=false;
  marked_node:=0;last_node:=0;last_line:=0;who_see:=1;
  for i:=1 to kol_rand_nodes do
  begin
    inc(last_node);
    with array_of_nodes[last_node] do
      begin
        level_of_node:=who_see;new_work_at_node(last_node);
        processor:=i;number:=0;user_number:=last_node;
      end;
  end;
  if any_lines then
  else
BEGIN
  
  for i:=1 to kol_rand_nodes-1 do
  begin
    n2:=i+random(kol_rand_nodes-i)+1;
    new_rnd_line(i,n2);
  end;
  for i:=2 to kol_rand_nodes do with array_of_nodes[i] do
    if number=0 then new_rnd_line(random(i-1)+1,i);
  if keypressed then pause;
END;
  while (last_line<fill)and(not keypressed) do
  begin
    n1:=random(kol_rand_nodes-1)+1;
    n2:=n1+random(kol_rand_nodes-n1)+1;
    if no_line_with(n1,n2) then new_rnd_line(n1,n2);
{    info(st(last_line)+' '+st(n1)+' '+st(n2));}
  end;
  yarusno_parallel_forma;
  if all_join_is_equal then correct_work_at_lines;
end;
procedure correct_work_at_lines;
  var i,j,k:integer;
  begin
    for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node=who_see then
    begin
      k:=0;
      for j:=1 to last_line do with array_of_lines[j] do
      if level_of_line=who_see then
      if first_node=i then if k=0
      then k:=work_at_line
      else set_work_at_line(k);
    end;
  end;
function small_klaster:boolean;
  var i,j,sum,sum2,p1,sn:integer;
 begin
   small_klaster:=false;
   if marked_node=0 then info('To Mark the NODE place.') else
    begin
      sum:=0;p1:=array_of_nodes[marked_node].processor;
      for i:=1 to last_line do with array_of_lines[i] do
       if level_of_line=who_see then
        if first_node=marked_node then begin inc(sum);j:=i;end;
      if sum=0 then info('NEED line to OTHER node.') else
      if sum >1 then info('Only ONE line from NODE requaed.') else
       begin
         with array_of_lines[j] do sn:=second_node;
         sum2:=0;
         for i:=1 to last_line do with array_of_lines[i] do
          if level_of_line=who_see then
           if second_node=sn then inc(sum2);
         if sum2<>1 then info('ERROR: Exist other lines to second node.') else
        begin
         small_klaster:=true;
         array_of_lines[j]:=array_of_lines[last_line];
         dec(last_line);
         with array_of_nodes[sn] do
           inc(work_at_node,array_of_nodes[marked_node].work_at_node);
         set_node_as(marked_node,sn);
         delete_marked_node;
         marked_node:=sn;
        end;
       end;
    end;
 end;
procedure nodes_at_large_line_use;
  var i,j:integer;
  begin
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
    if type_of_line=large then
    begin
      with array_of_nodes[first_node] do
      if status<>use then status:=at_way;
      with array_of_nodes[second_node] do
      if status<>use then status:=at_way;
    end;
  end;
function get_processor_by_strela:integer;
 var i:integer;
 begin
   i:=round(strela_x/mashtab+window_x);
   i:=round((i-10)*(all_proc+1)/560);
   if i<1 then i:=0;
   if i>all_proc then i:=all_proc+1;
   get_processor_by_strela:=i;
 end;
function get_last_generation:integer;
 var i,last_generation:integer;
 begin
   last_generation:=0;
   for i:=1 to last_node do with array_of_nodes[i] do
    if level_of_node>last_generation then
     last_generation:=level_of_node;
   get_last_generation:=last_generation;
 end;
procedure copy_this_level_to_new;
var i,j,last_generation:integer;
begin
  last_generation:=get_last_generation+1;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    inc(last_node);
    number:=last_node;
    array_of_nodes[last_node]:=array_of_nodes[i];
    array_of_nodes[last_node].level_of_node:=last_generation;
  end else number:=0;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  if level_of_line=who_see then
  begin
      inc(last_line);
      array_of_lines[last_line]:=array_of_lines[i];
      with array_of_lines[last_line] do
      begin
        first_node:=array_of_nodes[first_node].number;
        second_node:=array_of_nodes[second_node].number;
        level_of_line:=last_generation;
      end;
  end;
  who_see:=last_generation;
end;
procedure compare_two_level;
var i,j:integer;
begin
  error:=0;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=who_see then
  if (level_of_line=who_see)or(level_of_line=who_see+1) then
    type_of_line:=small;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=who_see then
  begin
    number:=0;
    for j:=1 to last_node do
    if array_of_nodes[j].level_of_node=who_see+1 then
    if x_position=array_of_nodes[j].x_position then
    if y_position=array_of_nodes[j].y_position then
    if number=0 then
    begin
      number:=j;
      array_of_nodes[j].number:=i;
    end else error:=1;
  end;
  if error=0 then
  begin
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see then
    if long_line(i)=long_line_by_number(i)
     then type_of_line:=small
     else type_of_line:=large;
    for i:=1 to last_line do with array_of_lines[i] do
    if level_of_line=who_see+1 then
    if long_line(i)=long_line_by_number(i)
     then type_of_line:=small else type_of_line:=large;
  end;
end;
procedure shift_who_see(a,b:integer);
var i,j:integer;
begin
  j:=get_last_generation;
  for i:=1 to last_node do with array_of_nodes[i] do
  if level_of_node=a then level_of_node:=b else
  if level_of_node=b then level_of_node:=a;
  for i:=1 to last_line do with array_of_lines[i] do
  if level_of_line=a then level_of_line:=b else
  if level_of_line=b then level_of_line:=a;
end;
begin
  {many_join:=false;}
  who_see:=1;
  last_name:='';
  view_work_line:=true;
  any_lines:=false;
end.