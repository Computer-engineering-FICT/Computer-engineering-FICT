Uses Crt;
Const inc_pre=5;
      tik_all:integer=60;
      diap_la:integer=8;
Type TZayavka=object
       present:boolean;
       prior:integer;
       takt:integer;
       v_ocher:integer;
       v_ocher_re:integer;
     end;
Type TOcher=array [1..20] of TZayavka;
Type TCPU=object
       busy:boolean;
       takt_left:integer;
       procedure Init;
       procedure Load(z:Tzayavka);
       procedure Step;
     end;
Type TFIFO=object
       a:TOcher;
       procedure Init;
       procedure Push_Za(z:TZayavka);
       function Get_Za:integer;
       procedure Shift;
       procedure Check_Prior;
       procedure Defrag;
     end;
var cpu:TCPU;
    fifo:TFIFO;
    input,v_cpu:TZayavka;
    tik:integer;
    q:integer;
    n:integer;
    result:array [2..10,1..3] of integer;
    la:integer;
    vsego_zayavok:integer;
    ogidanie:integer;
    prostoi:array [0..20] of integer;
     procedure TCPU.Init;
     begin
      busy:=false;
      takt_left:=0;
     end;
     procedure TCPU.Load;
     begin
      busy:=true;
      takt_left:=z.takt;
     end;
     procedure TCPU.Step;
     begin
      If busy then inc(result[la,1])
         else inc(result[la,2]);
      If busy then Dec(takt_left);
      If takt_left=0 then busy:=false;
     end;
     procedure TFIFO.Init;
     var i:integer;
     begin
      for i:=1 to 20 do
          a[i].present:=false;
     end;
     function TFIFO.Get_Za:integer;
     var j:integer;
         cur_pr:integer;
         num:integer;
     begin
      num:=0;
      cur_pr:=-1;
      for j:=20 downto 1 do
          if a[j].present then
             If a[j].prior>cur_pr then
                begin
                 num:=j;
                 cur_pr:=a[j].prior;
                end;
      Get_Za:=num;
     end;
     procedure TFIFO.Shift;
     var j:integer;
     begin
      for j:=20 downto 2 do
          a[j]:=a[j-1];
     end;
     procedure TFIFO.Push_Za(z:TZayavka);
     begin
      If a[20].present then
         begin
          WriteLn('FIFO overflow...');
          Halt;
         end;
      Shift;
      a[1]:=z;
     end;
     procedure TFIFO.Check_Prior;
     var i:integer;
     begin
      for i:=1 to 20 do
          if a[i].present then
             begin
              inc(a[i].v_ocher);
              inc(a[i].v_ocher_re);
              if a[i].v_ocher>inc_pre then
                 begin
                  inc(a[i].prior);
                  a[i].v_ocher:=0;
                 end;
             end;
     end;
     procedure TFIFO.Defrag;
     var b:TOcher;
         i,j:integer;
     begin
      for i:=1 to 20 do
          begin
           b[i].present:=false;
           b[i].prior:=0;
           b[i].takt:=0;
           b[i].v_ocher:=0;
           b[i].v_ocher_re:=0;
          end;
      i:=1;
      for j:=1 to 20 do
          if a[j].present then
             begin
              b[i]:=a[j];
              inc(i);
             end;
      a:=b;
     end;
     procedure OutXY(s:string;x,y:integer);
     begin
      GotoXY(x,y);
      Write(s);
     end;
    function Strr(d:integer):string;
    var s:string;
    begin
     Str(d,s);
     strr:=s;
    end;
    procedure Statistic(w:string);
    var i:integer;
    begin
     OutXY(w,3,18);
     OutXY('Lamda: '+strr(la),20,4);
     OutXY('Takt: '+strr(tik),10,5);
     OutXY('FIFO:',50,10);
     OutXY('CPU:',10,10);
     OutXY(chr(integer(cpu.busy)+$30),15,10);
     OutXY(Strr(cpu.takt_left),15,11);
     For i:=56 to 75 do
         if fifo.a[i-55].present then
            begin
             OutXY(strr(fifo.a[i-55].takt),i,10);
             OutXY(strr(fifo.a[i-55].prior),i,11);
            end else
            begin
             OutXY('-',i,10);
             OutXY('-',i,11);
            end;
      delay(300);
      if keypressed then halt;
     end;
     procedure ClearResults;
     var i,j:integer;
     begin
      for i:=2 to diap_la do
          for j:=1 to 3 do
               result[i,j]:=0;
     end;
begin
ClearResults;
randomize;
for la:=2 to diap_la do
 begin
 {Init}
 ClrScr;
 cpu.init;
 fifo.init;
 q:=0;
 vsego_zayavok:=0;
 ogidanie:=0;
 for n:=0 to 20 do prostoi[n]:=0;
 {Go}
 for tik:=1 to tik_all do
  begin
   if q=0 then
      begin
      {Заявка появилась}
       input.present:=true;
       input.prior:=random(3);
       input.takt:=2+random(5);
       fifo.push_za(input);
       inc(vsego_zayavok);
{       Statistic('Получена заявка и помещена в очередь');}
      end;
   If not (cpu.busy) then
      begin
       n:=fifo.get_za;
       if n<>0 then
          begin
           v_cpu:=fifo.a[n];
           fifo.a[n].present:=false;
           cpu.load(v_cpu);
           ogidanie:=ogidanie+v_cpu.v_ocher_re;
           inc(prostoi[v_cpu.v_ocher_re]);
          end;
       fifo.Defrag;
{       Statistic('Забрана заявка на процессор         '); }
      end;
   cpu.step;
   fifo.Check_Prior;
{   Statistic('Шаг процессора                         ');   }
   inc(q);
   if q=la then q:=0;
  end;
  ClrScr;
  WriteLn('Интенсивность потоков заявок (чем больше тем реже):',la);
  WriteLn('Загрузка процессора:', result[la,1]*100 div tik_all,'%');
  WriteLn('Простой процессора:', result[la,2]*100 div tik_all,'%');
  WriteLn('Среднее время простоя заявки в очереди:',ogidanie div vsego_zayavok);
  For n:=0 to 20 do Write(prostoi[n],' ');
  ReadLn;
end;
end.