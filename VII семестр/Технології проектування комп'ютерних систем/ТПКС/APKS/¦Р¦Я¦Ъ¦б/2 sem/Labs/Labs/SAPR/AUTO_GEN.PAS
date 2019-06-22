{$B+}
program chekgraf;
uses crt;

type file_name=string[12];

const
  max_blk = 64;
  max_a  = max_blk;
  max_x  = 32;
  max_y  = 32;
  max_t  =  2;
  max_p  =  8;
  max_s  = 256;
  bs_file    : file_name='graf.txt';
  stdout_file: file_name='';
  underl='---------------------------------------';

type
  sygn_str=string[32];
  string4=string[4];


  sygnals=record
    v,m:longint;                { values + mask   }
  end;

  tblock=record               { блок (схемы)  }
    p1,p0   : integer;             { переходы по 1,0 }
    x       : sygnals;          { условия         }
    y       : sygnals;          { функции         }
    a       : integer;          { разметка        }
    flg     : boolean           { флажок          }
  end;

  tTriggerEntryInfo=record
    tab:  sygnals;
    name: char
  end;

  tTriggerInfo=array[1..max_t] of tTriggerEntryInfo;

var
    mura : boolean;
    nb   : integer;         {число блоков}
    nx   : byte;         {число условий x}
    ny   : byte;         {число функций y}
    nt   : byte;         {число входов триггера}
    p    : byte;         {порядок автомата}

    blk   : array[1..max_blk] of tblock;
    entry : tTriggerInfo;
    cout  : text;
    aut_name: string4;

procedure pause;
var x,y: byte;
begin
  if stdout_file='' then begin
    x:=wherex; y:=wherey;
    write('  Press any key...');
    readkey;
    gotoxy(x,y);
    write('                  ');
    gotoxy(x,y)
  end
end;

procedure halt_prog(erl: byte);
begin
  if erl=0 then write(cout,'  Выполнение завершено.')
           else write(cout,'* Выполнение прервано.');
  write(cout, ' Код выхода: ',erl,' - ');
  case erl of
    0: writeln(cout,'без ошибок.');
    1: writeln(cout,'по предупреждению (*).');
    2: writeln(cout,'по критической ошибке (!).')
  end;
  close(cout);
  pause;
  halt(erl)
end;

procedure total(e: boolean);
begin
  if e then writeln(cout,' Все ОК.')
       else writeln(cout,' Обнаружены ошибки.');
  writeln(cout,underl)
end;

{/******************************************************************/}
function bit(a: longint; n: byte): byte;
begin
  bit:=(a shr (n-1)) and 1;
end;

procedure set_bit(var a: longint; n,v: byte);
begin
  dec(n);
  a:=a and ((-1) xor (1 shl n));
  a:=a or (v shl n)
end;

{/******************************************************************/}
function digit(a:sygnals; n: byte): char;
begin
  dec(n);
  a.m:=(a.m shr n) and 1;
  if a.m = 1 then
    digit:=chr( (a.v shr n) and 1 + ord('0') )
  else
    digit:='*'
end;

procedure set_digit(var a: sygnals; n: byte; d: char);
begin
  case d of
    '0': begin set_bit(a.m,n,1); set_bit(a.v,n,0) end;
    '1': begin set_bit(a.m,n,1); set_bit(a.v,n,1) end;
    '*': set_bit(a.m,n,0);
  end
end;

{/****** килит все пробелы в строке s ******************************/}
procedure kill_space(var s:string);
var i,j: byte;
begin
  j:=1;
  for i:=1 to length(s) do
    if (s[i]<>' ') and (j<>i) then begin
      s[j]:=s[i];
      inc(j)
    end;
  s[0]:=chr(j-1)
end;

{/****** обрезает n символов в конце строки s **********************/}
function kill_end_char(s: string; n: byte): string;
begin
  kill_end_char:=s;
  if length(s)>n-1 then kill_end_char[0]:=chr(ord(s[0])-n);
end;

{/****** sygnals -> string *****************************************/}
function _str(var a: sygnals; n: byte): sygn_str;
var i: byte;
begin
  _str[0]:=chr(n);
  for i:=1 to n do _str[i]:=digit(a,n-i+1)
end;

{/****** string -> sygnals *****************************************/}
procedure _sygnals(var a: sygnals; var s: string; n: byte);
var i: byte;
begin
  kill_space(s);
  if length(s)<> n then begin
    writeln(cout,'! Неожиданное число сигналов: ',length(s), ' ("', s, '")');
    halt_prog(2)
  end;
  for i:=1 to n do set_digit(a,i,s[n-i+1])
end;

{/*****************************************************************/}
procedure check_overflow(a,min_a,max_a: integer; descr: string; echo: boolean);
begin
  if (a<min_a) or (a>max_a) then begin
    writeln(cout,'! Недопустимое количество ', descr, ': ', a);
    writeln(cout,'  Допустимое количество ',descr,': ',min_a,'..',max_a);
    halt_prog(2)
  end else
    if echo then writeln(cout,'  Число ', descr:7, ': ', a)
end;

{/*****************************************************************/}
procedure drop_flags;
var i: integer;
begin
  for i:=1 to nb do blk[i].flg:=false
end;

{/******************************************************************/}
{/*                     R E A D _ B S                              */}
{/******************************************************************/}
function Read_BS: boolean;

var f   : text;
    i,j : integer;
    ok  : boolean;
    s   : string;
begin
  FillChar(blk,SizeOf(blk),0);
  ok:=true;
  assign(f, bs_file);
  {$I-}
  Reset(F);
  {$I+}
  if IOResult <> 0 then begin
    writeln(cout,'! Ошибка открытия файла: ', bs_file);
    halt_prog(2)
  end;
  writeln(cout,' Ввод данных (файл данных: ', bs_file,')');
  readln(f);
  readln(f,nb,nx,ny);
  check_overflow(nb, 2, max_blk, 'блоков',true);
  check_overflow(nx, 0, max_x, 'условий',true);
  check_overflow(ny, 1, max_y, 'функций',true);

  readln(f);
  for i:=1 to nb do with blk[i] do begin
    read(f,j);
    if i<>j then begin
      writeln(cout,'! Неожиданный номер блока: ',j,'.');
      halt_prog(2)
    end;
    read(f,p1,p0);
    readln(f,s);
    y.m:=-1;
    if p1=p0 then _sygnals(y,s,ny)
             else _sygnals(x,s,nx);
  end;
  readln(f);
  readln(f,nt);
  check_overflow(nt,1,max_t, 'входов триггера', false);
  entry[2].name:=' ';
  for j:=1 to nt do with entry[j] do begin
    readln(f,s);
    kill_space(s);
    name:=s[1];
    s[1]:=' ';
    _sygnals(tab,s,4);
  end;
  write  (cout, '  Тип триггеров: ');
  for j:=1 to nt do write(cout,entry[j].name);
  writeln(cout);
  close(f);
  total(ok);
  Read_BS:=ok
end;

{/******************************************************************/}
{/*                   E X P L O R E _ B S                          */}
{/******************************************************************/}
function explore_bs: boolean;

  var path : array[1..max_blk] of integer;
      eop  : integer;
      error, unreach, done: boolean;

  procedure write_path(first: integer);
  var i: integer;
  begin
    for i:=first to eop do begin
      if i<>first then write(cout,'-');
      write(cout, path[i])
    end;
    writeln(cout)
  end;

  function x_loop_path(first: integer): boolean;
  var i: integer;
      err: boolean;
  begin
    err:=true;
    for i:=first to eop do
      with blk[path[i]] do
        err:=err and not (p1=p0);
    x_loop_path:=err
  end;

  function block_no(n: integer): integer;
  var i,r: integer;
  begin
    r:=0;
    for i:=1 to eop do if path[i]=n then inc(r);
    block_no:=r
  end;

  function pos_first(n: integer): integer;
  var i: integer;
  begin
    for i:=1 to eop do if path[i]=n then begin
      pos_first:=i;
      exit
    end;
    pos_first:=0
  end;

  procedure explore(cur_block: integer);
  begin
    inc(eop); path[eop]:=cur_block;
    with blk[cur_block] do begin
      if flg then begin
        if cur_block=1 then begin
          write(cout,'  Путь найден  : '); write_path(1);
        end else begin
          if block_no(cur_block) = 1 then begin
            write(cout,'  Петля найдена: '); write_path(1);
          end else begin
            write(cout,'  Цикл найден  : ');
            write_path(pos_first(cur_block));
            if x_loop_path(pos_first(cur_block)) then begin
              writeln(cout,'* Ошибка: цикл без операторного блока.');
              error:=true
            end
          end
        end
      end;
      if not flg then begin
        flg:=true;
        explore(p1);
        if p0<>p1 then explore(p0)
      end
    end; {with}
    dec(eop)
  end;

  procedure explore_back(cur_block: integer);
  var i: integer;
  begin
    if not blk[cur_block].flg then begin
      blk[cur_block].flg:=true;
      for i:=1 to nb do with blk[i] do begin
        if  p1=cur_block                then explore_back(i);
        if (p0=cur_block) and (p1<>p0)  then explore_back(i)
      end
    end
  end;

  procedure drop;
  begin
    eop:=0;
    error:=false;
    drop_flags
  end;

var i: integer;
begin
  writeln(cout,' Прямой проход блок-схемы.');
  drop; explore(1);
  unreach:=false;
  for i:=1 to nb do unreach:=unreach or not blk[i].flg;
  if unreach then begin
    write(cout,'* Недостижимые вершины найдены:'#10#13'  ');
    for i:=1 to nb do if not blk[i].flg then write(cout,' ',i:2);
    writeln
  end;
  done:=not(error or unreach);
  total(done);

  writeln(cout,' Обратный проход блок-схемы.');
  drop; explore_back(1);
  unreach:=false;
  for i:=1 to nb do unreach:=unreach or not blk[i].flg;
  if unreach then begin
    write(cout,'* Висящие вершины найдены:'#10#13'  ');
    for i:=1 to nb do if not blk[i].flg then write(cout,' ',i:2);
    writeln
  end;
  done:=done and not unreach;
  total(not unreach);
  explore_bs:=done
end;

{/******************************************************************/}
{/*            R E M O V E _ B A D _ J U M P S                     */}
{/******************************************************************/}
procedure Remove_bad_jmps;
  { bad_jmp: возвращает true в двух случаях:                         }
  {   1. [cur_block] ─┐             |  2. <cur_block> ─┐             }
  {          <block> ─┴─> <jmp_to>  |         [block] ─┴─> <jmp_to>  }
  function bad_jmp(cur_block, jmp_to: integer): boolean;
  var cur_block_oper, block_oper: boolean;   {true если блок операторный}
      block: integer;
  begin
    if (blk[jmp_to].p1<>blk[jmp_to].p0) and blk[jmp_to].flg then begin
      with blk[cur_block] do cur_block_oper:=(p1=p0);
      for block:=1 to nb do with blk[block] do
        if (block<>cur_block) and ((p0=jmp_to) or (p1=jmp_to)) then begin
          block_oper:=(p1=p0);
          if block_oper<>cur_block_oper then begin
            bad_jmp:=true; exit
          end
        end
    end;
    bad_jmp:=false
  end;

  var jmps_removed: integer;

  {  дублирует блок <jmp>  }
  procedure add_dup_block(cur: integer; var jmp,jmp1: integer);
  begin
    if not bad_jmp(cur, jmp) then exit;
    inc(nb);
    writeln(cout,'  Блок ', cur,': обнаружен кривой переход в условный блок ',jmp);
    writeln(cout,'          блок ', jmp, ' продублирован новым блоком ',nb,'.');
    with blk[nb] do begin
      p1:=blk[jmp].p1;
      p0:=blk[jmp].p0;
      x:=blk[jmp].x;
      y:=blk[jmp].y;
    end;
    if jmp=jmp1 then jmp1:=nb;
    jmp:=nb;
    inc(jmps_removed);
  end;

  procedure explore(cur_block: integer);
  begin
    with blk[cur_block] do
      if not flg then begin
        flg:=true;
        add_dup_block(cur_block,p1,p0);
        explore(p1);
        if p0<>p1 then begin
          add_dup_block(cur_block,p0,p1);
          explore(p0)
        end
      end
  end;

begin
  writeln(cout,' Развязка кривых переходов.');
  jmps_removed:=0;
  drop_flags;
  explore(1);
  writeln(cout,' Всего блоков продублировано: ',jmps_removed);
  writeln(cout,underl)
end;

{/******************************************************************/}
{/*                       M A R K _ B S                            */}
{/******************************************************************/}
procedure mark_bs(mura: boolean);
var ctr: integer;

  procedure explore(cur_block: integer);
  var i: integer;
  begin
    with blk[cur_block] do
      if not flg then begin
        if mura then begin
          if p0=p1 then begin a:=ctr; inc(ctr) end
        end else begin
          for i:=1 to nb do
            if (blk[i].p1=cur_block) and (blk[i].p0=cur_block) then begin
              a:=ctr; inc(ctr)
            end
        end;
        flg:=true;
        explore(p1);
        if p0<>p1 then explore(p0)
      end
  end;

  var i: integer;
begin
  writeln(cout,' Разметка графа автомата ',aut_name,'.');
  ctr:=0;
  for i:=1 to max_blk do blk[i].a:=-1;
  drop_flags;
  explore(1);
  writeln(cout,'  Число вершин графа: ',ctr);
  writeln(cout,'  ┌─────────────┬─────────────┐');
  writeln(cout,'  │ Номер блока │  Код блока  │');
  writeln(cout,'  ├─────────────┼─────────────┤');
  for i:=1 to nb do with blk[i] do begin
    if a>=0 then writeln(cout,'  │', i:8,'     │', a:8,'     │')
  end;
  writeln(cout,'  └─────────────┴─────────────┘');
  p:=trunc(ln(ctr)/ln(2) + 0.999999);
  check_overflow(p, 1, max_p, 'разрядов(триггеров)', true);
  total(true);
end;

{/******************************************************************/}
{/*           С Т Р У К Т У Р Н А Я   Т А Б Л И Ц А                */}
{/******************************************************************/}
type
  tTrigerFunctions=array[1..max_t] of sygnals;
  tStructTabLine=record
    bn: integer;              {  ссылка на блок блоксхемы       }
    x : sygnals;           {  условие перехода               }
    y : sygnals;           {  функции выхода                 }
    a : integer;              {  исходное состояние             }
    b : integer;              {  состояние перехода             }
    t : tTrigerFunctions;  {  функции возбуждения триггеров  }
  end;

var
  s   : array[1..max_s] of tStructTabLine;
  eos : integer;              {  End of Struct. Table           }

{/******************************************************************/}
{/*                       G E N                                    */}
{/******************************************************************/}
function gen(mura: boolean): boolean;

  procedure halt_gen(cur_block: integer);
  begin
    writeln(cout,'! Некорректное условие: блок ',cur_block);
    halt_prog(2)
  end;

  function xnx(var x: sygnals; x1,x2: sygnals): boolean;
  begin
    x.v:=(x1.v and x1.m) or (x2.v and x2.m);
    x.m:=x1.m or x2.m;
    xnx:=((x1.m and x2.m) and (x1.v xor x2.v)) = 0
  end;

  var tmp_x: sygnals;
      block: integer;
  procedure explore_mura(cur_block: integer; gx: sygnals);
  begin
    if blk[cur_block].a < 0 then with blk[cur_block] do begin
        if not xnx(tmp_x,gx,x) then halt_gen(cur_block);
        explore_mura(p1, tmp_x);
        x.v:=not x.v;
        if not xnx(tmp_x,gx,x) then halt_gen(cur_block);
        x.v:=not x.v;
        explore_mura(p0, tmp_x)
    end else begin
      inc(eos);
      check_overflow(eos, 0, max_s,'строк структурной таблицы',false);
      with s[eos] do begin
        bn:=block;
        a:=blk[block].a;
        y:=blk[block].y;
        b:=blk[cur_block].a;
        x:=gx
      end
    end
  end;

  var opb: integer;
  procedure explore_mili(cur_block: integer; gx: sygnals);
  begin
    {write(' ',cur_block);}
    if blk[cur_block].a<0 then
      with blk[cur_block] do begin
        if p1=p0 then opb:=cur_block;
        if not xnx(tmp_x,gx,x) then halt_gen(cur_block);
        explore_mili(p1, tmp_x);
        if p1<>p0 then begin
          x.v:=not x.v;
          if not xnx(tmp_x,gx,x) then halt_gen(cur_block);
          x.v:=not x.v;
          explore_mili(p0, tmp_x)
        end
    end else begin
      inc(eos);
      check_overflow(eos,0,max_s,'строк структурной таблицы',false);
      with s[eos] do begin
        bn:=block;
        a:=blk[block].a;
        b:=blk[cur_block].a;
        if opb>=0 then y:=blk[opb].y else y:=blk[block].y;
        opb:=-1;
        x:=gx
      end
    end
  end;

  var i,j,k : integer;
      pos   : byte;
      error : boolean;

  const zero: sygnals=(v:0;m:0);

begin
  writeln(cout,' Генерация структурной таблицы автомата.');
  FillChar(s,SizeOf(s),0);
  eos:=0;

  for block:=1 to nb do with blk[block] do
    if a>=0 then begin
      {write(block,'->');}
      if mura then explore_mura(p1,zero)
      else begin
        opb:=-1;
        explore_mili(p1,x);
        if p1<>p0 then begin
          x.v:=not x.v;
          explore_mili(p0,x);
          x.v:=not x.v
        end
      end;
      {writeln}
    end;

  for i:=1 to eos do with s[i] do begin
    for j:=1 to p do begin
      pos:=4 - bit(b,j) * 2 - bit(a,j);
      for k:=1 to nt do set_digit(t[k], j, digit(entry[k].tab, pos));
    end
  end;

  total(true);
  gen:=true
end;

{/******************************************************************/}
{/*            W R I T E _ S T R U C _ T A B                       */}
{/******************************************************************/}
procedure write_struc_tab(mura: boolean);
const
  l1='┌───────┬───────┬──────────┬───────┬──────────┬───────────────┬───────────────┐';
  l2='├───────┼───────┼──────────┼───────┼──────────┼───────────────┼───────────────┤';
  l3='└───────┴───────┴──────────┴───────┴──────────┴───────────────┴───────────────┘';
var i   : integer;
    no_rep : boolean;
begin
  writeln(cout,#13#10'  Структурная таблица автомата ', aut_name,'.');
  writeln(cout,l1);
  writeln(cout,'│ Номер │  Код  │ Условия  │  Код  │ Выходные │ Функции возбуждения триггеров │');
  write  (cout,'│ блока │ блока │ перехода │ перех.│ сигналы  │');
  writeln(cout,'         ',entry[1].name,'           ',entry[2].name,'         │');
  for i:=1 to eos do with s[i] do begin
    {$B-}
    no_rep:=(i=1) or (s[i-1].a<>a);
    if no_rep then begin
      writeln(cout,l2);
      write(cout,'│',bn:5,'  │',a:5)
    end else
      write(cout,'│       │     ');
    write(cout,'  │',_str(x,nx):9,' │',b:5,'  │');
    if mura and not no_rep then
      write(cout,'         ')
    else
     write(cout,_str(y,ny):9);
    write(cout,' │',_str(t[1],p):14,' │');
    if nt=2 then write(cout,_str(t[2],p):14,' │')
            else write(cout,'               │');
    writeln(cout);
  end;
  writeln(cout,l3);
end;

{/******************************************************************/}
{/*            R E S U L T _ F U N C T I O N S                     */}
{/******************************************************************/}
procedure Result_Functions(mura: boolean);

  function str_sygnals(arg: char; a: sygnals; n: byte): string;
  var i: byte;
      s,s1: string;
  begin
    s:='';
    for i:=n downto 1 do begin
      str(i,s1);
      case digit(a,i) of
        '1': s:=s+arg+s1+'^';
        '0': s:=s+'!'+arg+s1+'^'
      end;
    end;
    str_sygnals:=s;
  end;

var i,j,e: integer;
    a1: sygnals;
    first: boolean;
begin
  writeln(cout,#13#10' Выходные функции.');
  for i:=1 to ny do begin
    first:=true;
    write(cout,'    Y',i,' = ');
    for j:=1 to eos do with s[j] do begin
      {$B-}
      if not (mura and (j>1) and (s[j-1].a=a)) then begin
        if bit(y.v and y.m, i)=1 then begin
          if first then first:=false else write(cout,' | ');
          if not mura then
            write(cout,str_sygnals('X',x,nx));
          a1.v:=a; a1.m:=-1;
          write(cout,kill_end_char(str_sygnals('A',a1,p),1));
        end
      end
    end;
    writeln(cout)
  end;
  total(true);
  writeln(cout,' Функции возбуждения триггеров.');
  for i:=1 to p do begin
    for e:=1 to nt do begin
      first:=true;
      write(cout,'    ',entry[e].name,i,' = ');
      for j:=1 to eos do with s[j] do begin
        if bit(t[e].v and t[e].m, i)=1 then begin
          if first then first:=false else write(cout,' | ');
          write(cout,str_sygnals('X',x,nx));
          a1.v:=a; a1.m:=-1;
          write(cout,kill_end_char(str_sygnals('A',a1,p),1));
        end
      end;
      writeln(cout)
    end
  end;
  total(true)
end;

procedure Result_Sheme(mura: boolean);

  procedure WriteShemeSeg(arg : char; a: sygnals; n: byte;
                          sym_and, fn: char; fn_no: integer);
  var i: byte;
      sym_or,inv: char;
  begin
    if fn=' ' then sym_or:=' ' else sym_or:='1';
    for i:=n downto 1 do if digit(a,i)<>'*' then begin
      if digit(a,i)='0' then inv:='o'else inv:='┤';
      write(cout, arg, i);
      write(cout, ' ──', inv, '  ', sym_and, ' │  ', sym_or);
      if fn<>' ' then write(cout, ' ├── ', fn, fn_no) else write(cout,' │');
      writeln(cout);
      sym_and:=' ';
      sym_or :=' ';
      fn     :=' '
    end
  end;


var i,j,e: integer;
    a1: sygnals;
    out_s, and_s: char;
    first: boolean;
begin
  writeln(cout,#13#10' Схемы выходных функций.'#13#10);
  for i:=1 to ny do begin
    out_s:='Y';
    writeln(cout,'     ┌────┬────┐');
    first:=true;
    for j:=1 to eos do with s[j] do begin
      {$B-}
      if not (mura and (j>1) and (s[j-1].a=a)) then begin
        if bit(y.v and y.m, i)=1 then begin
          if not first then writeln(cout,'     ├────┤    │');
          first:=false;
          and_s:='&';
          if not mura then begin
            WriteShemeSeg('X',x,nx,and_s,out_s,i);
            if x.m<>0 then begin and_s:=' '; out_s:=' ' end
          end;
          a1.v:=a; a1.m:=-1;
          WriteShemeSeg('A',a1,p,and_s,out_s,i);
          out_s:=' '
        end
      end
    end;
    writeln(cout,'     └────┴────┘');
    writeln(cout)
  end;
  total(true);
  writeln(cout,' Схемы функций возбуждения триггеров.'#13#10);
  for i:=1 to p do begin
    for e:=1 to nt do begin
      out_s:=entry[e].name;
      writeln(cout,'     ┌────┬────┐');
      first:=true;
      for j:=1 to eos do with s[j] do begin
        if bit(t[e].v and t[e].m, i)=1 then begin
          if not first then writeln(cout,'     ├────┤    │');
          first:=false;
          and_s:='&';
          WriteShemeSeg('X',x,nx,and_s,out_s,i);
          if x.m<>0 then begin and_s:=' '; out_s:=' ' end;
          a1.v:=a; a1.m:=-1;
          WriteShemeSeg('A',a1,p,and_s,out_s,i);
          out_s:=' '
        end
      end;
      writeln(cout,'     └────┴────┘');
      writeln(cout)
    end
  end;
  total(true)
end;

{/******************************************************************/}
{/*                          M A I N                               */}
{/******************************************************************/}
var ok: boolean;
  par1: byte;
begin
  par1:=2;
  mura:=true;
  aut_name:='МУРА';
  if ParamCount>=1 then
    if ParamStr(1)='mili' then begin aut_name:='МИЛИ'; mura:=false end else
      if ParamStr(1)<>'mura' then par1:=1;

  if ParamCount>=par1   then     bs_file:=ParamStr(par1);
  if ParamCount>=par1+1 then stdout_file:=ParamStr(par1+1);

  assign(cout,stdout_file);
  rewrite(cout);

  if stdout_file='' then clrscr else writeln('Файл вывода: ',stdout_file);
  writeln(cout,'Использование: AUTO_GEN [ mili | mura ] [ <файл_данных> [ <файл_вывода> ] ]');
  writeln(cout,'Генерация абстрактного автомата ', aut_name,'.');
  writeln(cout,underl);

  ok:=Read_BS;

  ok:=ok and Explore_BS;
  if not ok then halt_prog(1);
  pause;

  if not mura then remove_bad_jmps;
  Mark_BS(mura);
  ok:=Gen(mura);
  pause;
  if not ok then halt_prog(1);

  write_struc_tab(mura);
  pause;

  Result_Functions(mura);
  pause;

  Result_Sheme(mura);
  halt_prog(0)
end.
