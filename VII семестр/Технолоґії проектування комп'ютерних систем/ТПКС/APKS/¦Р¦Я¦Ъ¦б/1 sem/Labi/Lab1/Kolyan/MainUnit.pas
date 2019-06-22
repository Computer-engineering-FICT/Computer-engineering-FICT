unit MainUnit;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, MainForm;
type sost_mura=record
            versh_num:integer;
            y:array[0..3] of integer;
            //по Х-куда переходит, по Y-какие x-ы
            //если в 0-й строке - 0, то переходит по 1
            //-1 -отрицание
            set_per:set of byte;
            perehodi:array [0..20,-1..10] of string;
          end;
      sost_mili=record
            versh_num:integer;
            y:array[0..20,0..3] of integer;
            //по [..,0]-куда переходит, по Y-какие x-ы
            //если в -1-й строке - 0, то переходит по 1
            //-1 -отрицание
            set_per:set of byte;
            perehodi:array [0..20,-1..10] of string;
          end;
var end_ind,first_ind,SostNum,TrigCol,SostCol,cur_memo,start_index,end_index,VershCol:integer;
    Perehodi:array[1..40,1..40] of string;
    Signali:array[0..3,1..40] of string;
    way_glob:array[0..30] of integer;
    razm_sost:array[1..30,0..10] of integer;
    f:text;
    block_coord:array[1..40,1..2] of integer;
    avtomat_mili:array [1..30] of sost_mili;
    avtomat_mura:array [1..30] of sost_mura;
    way:array [0..30,0..30] of integer;
    versh_in_sost:set of byte;
    mas_x,mas_y:array[0..20] of integer;
procedure matrix_to_SG;
procedure SG_to_Matrix;
procedure Draw_Algoritm;
procedure Save_Alg;
procedure Open_Alg;
procedure Testing_Input_Data;
procedure Razmetka;
procedure functions;
procedure draw_shema;
implementation

function test_link (start_ind,end_ind:integer):boolean;
var i,j,g,k,l,m:integer;
    way:array [1..50,1..2] of integer;
    prov,prov1:boolean;
begin
  test_link:=false;
  i:=1; j:=1;
  way[i,1]:=start_ind;
  repeat
    prov:=false;
    for  g:=1 to VershCol do
      if (perehodi[g,way[i,1]]<>'') and (perehodi[g,way[i,1]]<>'end') then
      begin
        prov1:=false;
        inc(j);
        for k:=1 to j-1 do
          if way[k,1]=g then begin
            prov1:=true;
            dec(j);
          end;
        if not prov1 then  begin
            way[j,1]:=g;
            way[j,2]:=way[i,1];
        end;
        if g=end_ind then begin
          test_link:=true;
          way_glob[0]:=0;
          while j<>1 do begin
            l:=way[j,2];
            for m:=1 to j-1 do
              if way[m,1]=l then
                j:=m;
            inc(way_glob[0]);
            way_glob[way_glob[0]]:=way[j,1];
          end;
          exit;
        end;
      end;
    if i=j then prov:=true;
      inc(i);
  until prov;
end;

procedure test_for_linkage;
var i,l:integer;
    prov4,prov2:boolean;
begin
  prov2:=false;
  if not test_link(start_index,end_index) then begin
    prov2:=true;
    form1.Memo1.Lines[cur_memo]:='Начальная вершина не связана с конечной.............ERROR';
    inc(cur_memo);
  end else begin
    form1.Memo1.Lines[cur_memo]:='Путь Н-К:  ';
    for l:=way_glob[0] downto 1 do
      form1.Memo1.Lines[cur_memo]:=form1.Memo1.Lines[cur_memo]+inttostr(way_glob[l])+'.';
    form1.Memo1.Lines[cur_memo]:=form1.Memo1.Lines[cur_memo]+inttostr(end_index);
    inc(cur_memo);
  end;
  for i:=1 to VershCol do
    if (signali[0,i]<>'start') and (signali[0,i]<>'end') then begin
      if not test_link(start_index,i) then begin
        prov2:=true;
        form1.Memo1.Lines[cur_memo]:='Вершина №'+inttostr(i)+' не связана с начальной вершиной.............ERROR';
        inc(cur_memo);
      end else
      if not test_link(i,end_index) then begin
        prov2:=true;
        form1.Memo1.Lines[cur_memo]:='Вершина №'+inttostr(i)+' не связана с конечной вершиной.............ERROR';
        inc(cur_memo);
      end;
      if test_link(start_index,i) and test_link(i,end_index) then begin
        prov4:=test_link(start_index,i);
        form1.Memo1.Lines[cur_memo]:='Путь Н-К для вершины №'+inttostr(i)+':  ';
        for l:=way_glob[0] downto 1 do
          form1.Memo1.Lines[cur_memo]:=form1.Memo1.Lines[cur_memo]+inttostr(way_glob[l])+'.';
        prov4:=test_link(i,end_index);
        for l:=way_glob[0] downto 1 do
          form1.Memo1.Lines[cur_memo]:=form1.Memo1.Lines[cur_memo]+inttostr(way_glob[l])+'.';
        form1.Memo1.Lines[cur_memo]:=form1.Memo1.Lines[cur_memo]+inttostr(end_index);
        inc(cur_memo);
      end;
    end;
  if prov2 then begin
    form1.Memo1.Lines[cur_memo]:='Граф не является связным..................ERROR';
    inc(cur_memo);
  end else begin
    form1.Memo1.Lines[cur_memo]:='Граф является связным..................OK';
    inc(cur_memo);
  end;
end;

procedure test_for_cycles;
var ll,num_cond,num_link,cur_cycle_num,l,i,j,g,k,m,num_cycle,cur_mas,cur_mas1:integer;
    mas:array [-1..200,1..400] of array [1..2] of byte;
    cycles:array[1..50] of set of byte;
    prov,prov1,prov2:boolean;
    came_from:array[1..50] of set of byte;
    cur_cycle:array[1..50] of byte;
begin
  for i:=1 to 50 do
    cycles[i]:=[];
  num_cycle:=0;
  for i:=1 to VershCol do
    if (signali[0,i]<>'start') and (signali[0,i]<>'end') then
      for j:=1 to VershCol do
        if (perehodi[i,j]<>'') and (perehodi[i,j]<>'end') and (perehodi[i,j]<>'start')then begin
          k:=0;
          repeat
            inc(k);
            m:=-1;
            repeat
              inc(m);
              mas[m,k][1]:=0;
              mas[m,k][2]:=0;
            until m=200;
            mas[-1,k][1]:=1;
          until k=400;
          for l:=1 to VershCol do
            came_from[l]:=[];
          mas[0,1][1]:=1;
          mas[1,1][1]:=i;
          cur_mas:=1;
          repeat
            prov:=true;
            for k:=1 to mas[0,cur_mas][1] do
              for g:=1 to VershCol do begin
                if (perehodi[g,mas[k,cur_mas][1]]<>'') and (perehodi[g,mas[k,cur_mas][1]]<>'end') and (perehodi[g,mas[k,cur_mas][1]]<>'start')then
                  if not (mas[k,cur_mas][1] in came_from[g]) then begin
                    for l:=1 to cur_mas do
                      mas[-1,l][1]:=1;
                    prov:=false;
                    inc(mas[0,cur_mas+1][1]);
                    mas[mas[0,cur_mas+1][1],cur_mas+1][1]:=g;
                    mas[mas[0,cur_mas+1][1],cur_mas+1][2]:=mas[k,cur_mas][1];
                    include(came_from[g],mas[k,cur_mas][1]);
                    if g=j then begin
                      prov1:=false;
                      while not prov1 do begin
                        prov1:=true;
                        for l:=1 to cur_mas do
                          if mas[-1,l][1]<mas[0,l][1] then
                            prov1:=false;
                        if cur_mas1<>1 then
                          prov1:=true;
                        cur_mas1:=cur_mas+1;
                        m:=mas[0,cur_mas1][1];
                        for l:=1 to 50 do
                          cur_cycle[l]:=0;
                        cur_cycle_num:=1;
                        cur_cycle[1]:=mas[m,cur_mas1][1];
                          l:=mas[-1,cur_mas1-1][1];
                          repeat
                            if mas[l,cur_mas1-1][1]=mas[m,cur_mas1][2] then
                            begin
                              mas[-1,cur_mas1-1][1]:=l+1;
                              inc(cur_cycle_num);
                              cur_cycle[cur_cycle_num]:=mas[l,cur_mas1-1][1];
                              dec(cur_mas1);
                              m:=l;
                              l:=mas[-1,cur_mas1-1][1];
                            end else
                              inc(l);
                            mas[-1,cur_mas1-1][1]:=l;
                          until (l>mas[0,cur_mas1-1][1]) or (cur_mas1=1);
                       if cur_mas1=1 then begin
                        inc(num_cycle);
                        for l:=1 to cur_cycle_num do
                          include(cycles[num_cycle],cur_cycle[l]);
                        prov2:=false;
                        for l:=1 to num_cycle-1 do
                          if cycles[l]=cycles[num_cycle] then
                            prov2:=true;


                        for ll:=l+1 to cur_cycle_num do
                          if (cur_cycle[l]=cur_cycle[ll]) and not (cur_cycle[l]=cur_cycle[1]) then
                            prov2:=true;

                        if prov2 then begin
                          cycles[num_cycle]:=[];
                          dec(num_cycle);
                        end else begin
                          num_cond:=0;
                          num_link:=0;
                          for l:=1 to VershCol do
                            if l in cycles[num_cycle] then
                              if signali[0,l]='link' then
                                inc(num_link) else
                              if signali[0,l]='cond' then
                                inc(num_cond);
                          if (num_cond>=1) and (num_link>=1) then begin
                            form1.memo1.lines[cur_memo]:='Имеется цикл ';
                            for l:=cur_cycle_num downto 1 do
                              form1.memo1.lines[cur_memo]:=form1.memo1.lines[cur_memo]+inttostr(cur_cycle[l])+'.';
                            form1.memo1.lines[cur_memo]:=form1.memo1.lines[cur_memo]+' ..........OK';
                            inc(cur_memo);
                          end else
                          if (num_cond>=1) and (num_link<1) then begin
                            form1.memo1.lines[cur_memo]:='Имеется цикл ';
                            for l:=cur_cycle_num downto 1 do
                              form1.memo1.lines[cur_memo]:=form1.memo1.lines[cur_memo]+inttostr(cur_cycle[l])+'.';
                            form1.memo1.lines[cur_memo]:=form1.memo1.lines[cur_memo]+' (нет операторной вершины)..........ERROR';
                            inc(cur_memo);
                          end else
                          if (num_cond<1) and (num_link>=1) then begin
                            form1.memo1.lines[cur_memo]:='Имеется цикл ';
                            for l:=cur_cycle_num downto 1 do
                              form1.memo1.lines[cur_memo]:=form1.memo1.lines[cur_memo]+inttostr(cur_cycle[l])+'.';
                            form1.memo1.lines[cur_memo]:=form1.memo1.lines[cur_memo]+' (нет условной вершины)..........ERROR';
                            inc(cur_memo);
                          end;

                        end;
                       end;
                      end;
                    end;

                  end;
              end;
            inc(cur_mas);
          until prov;
        end;
end;

procedure Testing_Input_Data;
var num_x,num_y,num_yes,num_no,num_out,num_in,i,j,start_num,end_num:integer;
    test_start,test_end:boolean;
begin
  cur_memo:=0;
  start_num:=0;
  start_index:=0;
  for i:=1 to VershCol do
    if signali[0,i]='start' then begin
      inc(start_num);  // кол-во 'start'
      start_index:=i;  // последний 'start'
    end;
  if start_num=1 then
    Form1.Memo1.Lines[cur_memo]:='Имеется одна стартовая вершина............ОК'
  else if start_num=0 then
    Form1.Memo1.Lines[cur_memo]:='Стартовая вершина отсутствует.............ERROR'
  else if start_num>1 then
    Form1.Memo1.Lines[cur_memo]:='Имеется множество ('+inttostr(start_num)+') стартовых вершин.............ERROR';
  inc(cur_memo);
  end_num:=0;
  end_index:=0;
  for i:=1 to VershCol do
    if signali[0,i]='end' then begin
      inc(end_num);
      end_index:=i;
    end;
  if end_num=1 then
    Form1.Memo1.Lines[cur_memo]:='Имеется одна конечная вершина............ОК'
  else if end_num=0 then
    Form1.Memo1.Lines[cur_memo]:='Конечная вершина отсутствует.............ERROR'
  else if end_num>1 then
    Form1.Memo1.Lines[cur_memo]:='Имеется множество ('+inttostr(end_num)+') конечных вершин.............ERROR';
  inc(cur_memo);
  if not ((start_num=1) and (end_num=1)) then
  begin
    Form1.Memo1.Lines[cur_memo]:='Повторите тестирование продолжится после исправления ошибок.............EXIT';
    exit;
  end;

  //тетируем наличие входов в начале и выходов в конце
  test_start:=false;
  for i:=1 to VershCol do
    if ((perehodi[start_index,i]<>'') and (perehodi[start_index,i]<>'end')) then
      test_start:=true;
  if test_start then
    Form1.Memo1.Lines[cur_memo]:='Начальная вершина имеет входы................ERROR'
  else Form1.Memo1.Lines[cur_memo]:='Начальная вершина не имеет входов................ОК';
  inc(cur_memo);
  test_end:=false;
  for i:=1 to VershCol do
    if (perehodi[i,end_index]<>'') and (perehodi[i,end_index]<>'end') then
      test_end:=true;
  if test_end then
    Form1.Memo1.Lines[cur_memo]:='Конечная вершина имеет выходы................ERROR'
  else Form1.Memo1.Lines[cur_memo]:='Конечная вершина не имеет выходов................OK';
  inc(cur_memo);

  if test_start or test_end then
  begin
    Form1.Memo1.Lines[cur_memo]:='Повторите тестирование продолжится после исправления ошибок.............EXIT';
    exit;
  end;

  //тестируем вершины на наличие однотипных сигналов (Х,Y)
  //и на количество входов/выходов
  for i:=1 to VershCol do begin
    if signali[0,i]='start' then begin
      num_out:=0;
      for j:=1 to VershCol do
        if perehodi[j,i]='start' then
          inc(num_out);
      if num_out>1 then begin
        Form1.memo1.lines[cur_memo]:='Начальная вершина имеет более одного выхода..............ERROR';
        inc(cur_memo);
      end else if num_out<1 then begin
        Form1.memo1.lines[cur_memo]:='Начальная вершина не имеет выхода..............ERROR';
        inc(cur_memo);
      end;
    end;
    if signali[0,i]='link'then begin
      num_out:=0;
      num_in:=0;
      for j:=1 to VershCol do begin
        if (Perehodi[i,j]<>'') and (Perehodi[i,j]<>'end') then
          inc(num_in);
        if perehodi[j,i]='link' then
          inc(num_out);
      end;
      if num_in<1 then begin
        form1.memo1.lines[cur_memo]:='Операторная вершина №'+inttostr(i)+' не имеет входов...........ERROR';
        inc(cur_memo);
      end;
      if num_out>1 then begin
        form1.memo1.lines[cur_memo]:='Операторная вершина №'+inttostr(i)+' имеет более одного выхода......ERROR';
        inc(cur_memo);
      end;
      if num_out<1 then begin
        form1.memo1.lines[cur_memo]:='Операторная вершина №'+inttostr(i)+' не имеет выхода......ERROR';
        inc(cur_memo);
      end;
      num_x:=0; num_y:=0;
      for j:=1 to 3 do
        if signali[j,i]<>'' then
          if signali[j,i][1]='x' then
            inc(num_x) else
          if signali[j,i][1]='y' then
            inc(num_y);
      if num_x>0 then begin
        form1.memo1.lines[cur_memo]:='Операторная вершина №'+inttostr(i)+' имеет недопустимые сигналы X......ERROR';
        inc(cur_memo);
      end;
      if num_y=0 then begin
        form1.memo1.lines[cur_memo]:='Операторная вершина №'+inttostr(i)+' не имеет необходимых сигналов Y......ERROR';
        inc(cur_memo);
      end;
    end;
    if signali[0,i]='cond' then begin
      num_yes:=0;
      num_no:=0;
      num_in:=0;
      for j:=1 to VershCol do begin
        if (Perehodi[i,j]<>'') and (Perehodi[i,j]<>'end') then
          inc(num_in);
        if perehodi[j,i]='yes' then
          inc(num_yes);
        if perehodi[j,i]='no' then
          inc(num_no);
      end;
      if num_in<1 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' не имеет входов...........ERROR';
        inc(cur_memo);
      end;
      if num_yes<1 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' не имеет выходов типа Yes...........ERROR';
        inc(cur_memo);
      end;
      if num_yes>1 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' имеет слишком много выходов типа Yes...........ERROR';
        inc(cur_memo);
      end;
      if num_no<1 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' не имеет выходов типа No...........ERROR';
        inc(cur_memo);
      end;
      if num_no>1 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' имеет слишком много выходов типа No...........ERROR';
        inc(cur_memo);
      end;
      num_x:=0; num_y:=0;
      for j:=1 to 3 do
        if signali[j,i]<>'' then
          if signali[j,i][1]='x' then
            inc(num_x) else
          if signali[j,i][1]='y' then
            inc(num_y);
      if num_y>0 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' имеет недопустимые сигналы Y......ERROR';
        inc(cur_memo);
      end;
      if num_x<>1 then begin
        form1.memo1.lines[cur_memo]:='Логическая вершина №'+inttostr(i)+' должна иметь ровно один сигнал X......ERROR';
        inc(cur_memo);
      end;
    end;
  end;
  //тестирование графа на связность
  test_for_linkage;
  //нахождение циклов и проверка их на корректность
  test_for_cycles;
end;

procedure SG_to_matrix;
var i,j:integer;
begin
  for i:=1 to VershCol do begin
    for j:=1 to VershCol do
      perehodi[j,i]:='';
    for j:=1 to 3 do
      signali[j,i]:='';
  end;
  for i:=1 to VershCol do
    for j:=1 to VershCol do begin
      Perehodi[j,i]:=Form1.StringGrid1.Cells[j,i];
{      if ((Perehodi[j,i]='yes') or (Perehodi[j,i]='no')) then
        Signali[0,i]:='cond';
      if perehodi[j,i]='start' then
        Signali[0,i]:='start';
      if perehodi[j,i]='end' then
        Signali[0,i]:='end';
      if (perehodi[j,i]='link') and (signali[0,i]='') then
        Signali[0,i]:='link';}
    end;
  for i:=1 to VershCol do
    for j:=1 to 3 do
      Signali[j,i]:=Form1.StringGrid2.Cells[j,i];
end;

Procedure Save_Alg;
var i,j:integer;
begin
  assign (f,'alg.txt');
  rewrite(f);
  writeln(f,VershCol);
  for i:=1 to VershCol do
    for j:=1 to VershCol do
      writeln(f,perehodi[j,i]);
  for i:=1 to VershCol do
    for j:=0 to 3 do
      writeln(f,signali[j,i]);
  for i:=1 to VershCol do
    for j:=1 to 2 do
      writeln(f,Block_Coord[i,j]);
  close(f);
end;

procedure matrix_to_SG;
var i,j:integer;
begin
  form1.StringGrid1.RowCount:=VershCol+1;
  form1.StringGrid1.ColCount:=VershCol+1;
  form1.StringGrid2.RowCount:=VershCol+1;
  for i:=1 to VershCol do begin
    form1.StringGrid1.Cells[0,i]:=inttostr(i);
    form1.StringGrid1.Cells[i,0]:=inttostr(i);
    form1.StringGrid2.Cells[0,i]:=inttostr(i);
  end;
  for i:=1 to VershCol do
    for j:=1 to VershCol do
      Form1.StringGrid1.Cells[j,i]:=Perehodi[j,i];
  for i:=1 to VershCol do
    for j:=1 to 3 do
      Form1.StringGrid2.Cells[j,i]:=Signali[j,i];
end;

Procedure Open_Alg;
var i,j:integer;
begin
  assign (f,'alg.txt');
  reset(f);
  readln(f,VershCol);
  form1.edit1.text:=inttostr(vershcol);
  for i:=1 to VershCol do
    for j:=1 to VershCol do
      form1.StringGrid1.Cells[j,i]:='';
  for i:=1 to VershCol do
    for j:=0 to 3 do
      form1.StringGrid2.Cells[j,i]:='';
  for i:=1 to VershCol do begin
    Block_Coord[i,1]:=0;
    Block_Coord[i,2]:=0;
  end;
  form1.StringGrid1.RowCount:=VershCol+1;
  form1.StringGrid1.ColCount:=VershCol+1;
  form1.StringGrid2.RowCount:=VershCol+1;
  for i:=1 to VershCol do begin
    form1.StringGrid1.Cells[0,i]:=inttostr(i);
    form1.StringGrid1.Cells[i,0]:=inttostr(i);
    form1.StringGrid2.Cells[0,i]:=inttostr(i);
  end;

  for i:=1 to VershCol do
    for j:=1 to VershCol do
      readln(f,perehodi[j,i]);
  for i:=1 to VershCol do
    for j:=0 to 3 do
      readln(f,signali[j,i]);
  for i:=1 to VershCol do
    for j:=1 to 2 do
      readln(f,Block_Coord[i,j]);
  for i:=1 to VershCol do begin
    Form1.ComboBox1.Items.Add(inttostr(i));
    Form1.ComboBox2.Items.Add(inttostr(i));
    Form1.ComboBox3.Items.Add(inttostr(i));
  end;
  close(f);
  matrix_to_SG;
  Draw_Algoritm;
end;
procedure Draw_Algoritm;
var i,j:integer;
procedure Draw_Start(number,xbl,ybl:integer);
begin
  Form1.Image1.Canvas.RoundRect(xbl-35,ybl,xbl+35,ybl+25,10,10);
  Form1.Image1.canvas.TextOut(xbl-25,ybl+5,' Начало');
  Form1.Image1.canvas.TextOut(xbl-22,ybl-7,inttostr(number));
end;
procedure Draw_End(number,xbl,ybl:integer);
begin
  Form1.Image1.Canvas.RoundRect(xbl-35,ybl,xbl+35,ybl+25,10,10);
  Form1.Image1.canvas.TextOut(xbl-25,ybl+5,'  Конец');
  Form1.Image1.canvas.TextOut(xbl-27,ybl-7,inttostr(number));
end;
procedure Draw_operator(number,xbl,ybl:integer;signals:string);
begin
  Form1.Image1.Canvas.Rectangle(xbl-35,ybl,xbl+35,ybl+25);
  Form1.Image1.canvas.TextOut(xbl-25,ybl+5,signals);
  Form1.Image1.canvas.TextOut(xbl-27,ybl-7,inttostr(number));
end;
procedure Draw_cond(number,xbl,ybl:integer;signals:string);
begin
  Form1.Image1.Canvas.MoveTo(xbl,ybl);
  Form1.Image1.Canvas.Lineto(xbl-35,ybl+15);
  Form1.Image1.canvas.LineTo(xbl,ybl+30);
  Form1.Image1.Canvas.LineTo(xbl+35,ybl+15);
  Form1.Image1.Canvas.LineTo(xbl,ybl);
  Form1.Image1.canvas.TextOut(xbl-15,ybl+8,signals);
  Form1.Image1.canvas.TextOut(xbl-23,ybl,inttostr(number));
  Form1.Image1.canvas.TextOut(xbl+4,ybl+29,'1');
  Form1.Image1.canvas.TextOut(xbl-44,ybl+3,'0');
end;
procedure Draw_Links;
var i,j,xx,yy,xx1,yy1:integer;
begin
  //ведем связь из i в j
  for i:=1 to VershCol do
  if signali[0,i]<>'end' then
    if signali[0,i]<>'cond' then begin
      form1.Image1.Canvas.MoveTo(block_coord[i,1],block_coord[i,2]+25);
      form1.Image1.Canvas.LineTo(block_coord[i,1],block_coord[i,2]+35);
      xx:=block_coord[i,1]-7;
      yy:=block_coord[i,2]+35;
      for j:=1 to VershCol do
        if (perehodi[j,i]<>'') and (perehodi[j,i]<>'end') then
        begin
          form1.image1.canvas.TextOut(xx,yy,inttostr(j)+'.');
          inc(xx,10);
        end;
    end else
    begin
      form1.Image1.Canvas.MoveTo(block_coord[i,1],block_coord[i,2]+30);
      form1.Image1.Canvas.LineTo(block_coord[i,1],block_coord[i,2]+40);
      form1.Image1.Canvas.MoveTo(block_coord[i,1]-35,block_coord[i,2]+15);
      form1.Image1.Canvas.LineTo(block_coord[i,1]-45,block_coord[i,2]+15);
      xx:=block_coord[i,1]-10;
      yy:=block_coord[i,2]+40;
      xx1:=block_coord[i,1]-60;
      yy1:=block_coord[i,2]+12;
      for j:=1 to VershCol do
        if (perehodi[j,i]='yes') then
        begin
          form1.image1.canvas.TextOut(xx,yy,inttostr(j)+'.');
          inc(xx,10);
        end else
        if (perehodi[j,i]='no') then
        begin
          form1.image1.canvas.TextOut(xx1,yy1,inttostr(j)+'.');
          inc(xx,10);
        end;
    end;

{  for i:=1 to VershCol do
    for j:=1 to VershCol do
      if (perehodi[j,i]<>'') and (perehodi[j,i]<>'end') then
      begin
        if signali[0,i]<>'cond' then
        begin
          form1.Image1.Canvas.MoveTo(block_coord[i,1],block_coord[i,2]+25);
          form1.Image1.Canvas.LineTo(block_coord[i,1],block_coord[i,2]+35);
          if block_coord[j,2]<block_coord[i,2] then

        end else
        begin
        end;
      end;}
end;
begin
  //рисуем блоки
  form1.Image1.canvas.Rectangle(0,0,633,1000);
  for i:=1 to VershCol do
    if signali[0,i]='start' then
      Draw_Start(i,block_coord[i,1],block_coord[i,2])
    else if signali[0,i]='end' then
      Draw_End (i,block_coord[i,1],block_coord[i,2])
    else if signali[0,i]='link' then
      Draw_Operator(i,block_coord[i,1],block_coord[i,2],signali[1,i]+signali[2,i]+signali[3,i])
    else if signali[0,i]='cond' then
      Draw_Cond(i,block_coord[i,1],block_coord[i,2],signali[1,i]+signali[2,i]+signali[3,i]);
  //рисуем связи
  Draw_Links;
end;

procedure find_ways(from,tto:integer;avt:string);
//ищем пути из from в tto
var tto2,ll,num_cond,num_link,cur_way_num,l,i,j,g,k,m,num_way,cur_mas,cur_mas1:integer;
    mas:array [-1..30,1..100] of array [1..2] of byte;
    set_ways:array[1..50] of set of byte;
    prov,prov1,prov2:boolean;
    came_from:array[1..50] of set of byte;
    cur_way:array[1..50] of byte;
procedure main;
var l,k,g,ll:integer;
begin
begin
        begin
          k:=0;
          repeat
            inc(k);
            m:=-1;
            repeat
              inc(m);
              mas[m,k][1]:=0;
              mas[m,k][2]:=0;
            until m=20;
            mas[-1,k][1]:=1;
          until k=100;

          for l:=1 to VershCol do
            came_from[l]:=[];
          mas[0,1][1]:=1;
          mas[1,1][1]:=from;
          cur_mas:=1;
          repeat
            prov:=true;
            for k:=1 to mas[0,cur_mas][1] do
              for g:=1 to VershCol do begin
                if (perehodi[g,mas[k,cur_mas][1]]<>'') and (perehodi[g,mas[k,cur_mas][1]]<>'end') and ((not(g in versh_in_sost)) or (g=tto))then
                  if not (mas[k,cur_mas][1] in came_from[g]) then begin
                    for l:=1 to cur_mas do
                      mas[-1,l][1]:=1;
                    prov:=false;
                    inc(mas[0,cur_mas+1][1]);
                    mas[mas[0,cur_mas+1][1],cur_mas+1][1]:=g;
                    mas[mas[0,cur_mas+1][1],cur_mas+1][2]:=mas[k,cur_mas][1];
                    include(came_from[g],mas[k,cur_mas][1]);
                    if g=tto then begin
                      prov1:=false;
                      while not prov1 do begin
                        prov1:=true;
                        cur_mas1:=cur_mas+1;
                        m:=mas[0,cur_mas1][1];
                        for l:=1 to 50 do
                          cur_way[l]:=0;
                        cur_way_num:=1;
                        cur_way[1]:=mas[m,cur_mas1][1];
                        for l:=1 to cur_mas1-1 do
                          if mas[-1,l][1]<mas[0,l][1] then
                            prov1:=false;
                          l:=mas[-1,cur_mas1-1][1];
                          repeat
                            if mas[l,cur_mas1-1][1]=mas[m,cur_mas1][2] then
                            begin
                              mas[-1,cur_mas1-1][1]:=l+1;
                              inc(cur_way_num);
                              cur_way[cur_way_num]:=mas[l,cur_mas1-1][1];
                              dec(cur_mas1);
                              m:=l;
                              l:=mas[-1,cur_mas1-1][1];
                            end else
                              inc(l);
                            mas[-1,cur_mas1-1][1]:=l;
                          until (l>mas[0,cur_mas1-1][1]) or (cur_mas1=1);
                        if cur_mas1=1 then begin
                        inc(num_way);
                        for l:=1 to cur_way_num do
                          include(set_ways[num_way],cur_way[l]);
                        prov2:=false;
                        for l:=1 to num_way-1 do
                          if set_ways[l]=set_ways[num_way] then
                            prov2:=true;
                        for l:=1 to cur_way_num-1 do
                          for ll:=l+1 to cur_way_num do
                            if (cur_way[l]=cur_way[ll]) and not ((cur_way[l]=tto) and (cur_way[l]=from)) then
                              prov2:=true;
                        if prov2 then begin
                          set_ways[num_way]:=[];
                          dec(num_way);
                        end else begin
                          inc(way[0,0]);
                          way[0,way[0,0]]:=cur_way_num;
                          for l:=cur_way_num downto 1 do
                            way[cur_way_num-l+1,way[0,0]]:=cur_way[l];

                        end;
                       end;
                      end;
                    end;

                  end;
              end;
            inc(cur_mas);
          until prov;
        end;

  end;

end;
begin
  for i:=0 to 30 do
    for g:=0 to 30 do
      way[g,i]:=0;
  if avt='mura' then begin
    from:=avtomat_mura[from].versh_num;
    tto:=avtomat_mura[tto].versh_num;
    if signali[0,tto]='start' then
      for i:=1 to VershCol do
        if signali[0,i]='end' then
          tto:=i;
  for i:=1 to 50 do
    set_ways[i]:=[];
  num_way:=0;
  main;
  end else
  begin
    from:=avtomat_mili[from].versh_num;
    if from=end_ind then from:=first_ind;
    tto:=avtomat_mili[tto].versh_num;
    for i:=1 to 50 do
      set_ways[i]:=[];
    num_way:=0;
    main;
    if tto=end_ind then tto:=first_ind;
    main;
  end;

end;

function dectobin(dec:integer):string;
var col_mas,pp,ostt,chast:integer;
    st,st1:string;
    st2:array[1..10] of char;
begin
  st:='';
  if (dec=0) or (dec=1) then
    dectobin:=inttostr(dec)
  else begin
   asm
     push ebx
     mov ebx,dec
     mov chast,ebx
     mov ostt,ebx
     pop ebx
   end;
   while chast>1 do begin
     ostt:=chast mod 2;
     chast:=chast div 2;
     if ostt=0 then
       st:='0'+st
     else st:='1'+st;
   end;
     if chast=0 then
       st1:='0'+st
     else st1:='1'+st;
     st:=st1;
    dectobin:=st;
  end;
end;

procedure Razmetka;
label lab1,lab2,lab3,lab4;
var pr4,pl,oo,cur_mas,pr1,i,j,o,p,g:integer;
    pr,prov3:boolean;
    stt,st,sttt:string;
function provka(ok:integer;par:string):boolean;
var i:integer;
begin
  provka:=false;
  for i:=1 to VershCol do
    if perehodi[ok,i]=par then
      provka:=true;
end;
begin
  versh_in_sost:=[];
  for i:=1 to 30 do
    for j:=0 to 10 do
      razm_sost[i,j]:=0;
  for i:=0 to 20 do begin
    mas_x[i]:=0;
    mas_y[i]:=0;
  end;
  if Form1.RadioGroup3.ItemIndex=0 then begin
    //автомат Мили
    i:=0;
    repeat
      inc(i);
      g:=0;
      repeat
        j:=-1;
        repeat
          inc(j);
          avtomat_mili[i].y[g,j]:=0;
        until j=3;
        inc(g);
      until g>20;
      j:=-2;
      repeat
        inc(j);
        g:=-1;
        repeat
          inc(g);
          avtomat_mili[i].perehodi[g,j]:='';
        until g=20;
      until j=10;
    until i=30;
    SostCol:=1;
    SostNum:=2;
    for i:=1 to VershCol do begin
      if (signali[0,i]='end') or provka(i,'start') then begin
        razm_sost[SostCol,0]:=i;
        razm_sost[SostCol,1]:=1;
        include(versh_in_sost,i);
        if signali[0,i]='end' then
          end_ind:=i
        else
          first_ind:=i;
        inc(SostCol);
      end else
      if provka(i,'link') then begin
        razm_sost[SostCol,0]:=i;
        razm_sost[SostCol,1]:=SostNum;
        include(versh_in_sost,i);
        inc(SostCol);
        inc(SostNum);
      end;
    end;
    TrigCol:=1;
    pr:=false;
    while not pr do begin
      o:=1;
      for i:=1 to TrigCol do
        o:=o*2;
      if o>=SostNum-1 then
        pr:=true
      else inc(TrigCol);
    end;
    for i:=1 to SostCol do begin
      if razm_sost[i,0]<>first_ind then
        avtomat_mili[razm_sost[i,1]].versh_num:=razm_sost[i,0];
    end;
    //а теперь, наконец, ищем пути из состояния i в состояние j
    dec(SostCol);
    dec(SostNum);
    for i:=1 to SostNum do
      for j:=1 to SostNum do begin
        find_ways(i,j,'mili');
        for o:=1 to way[0,0] do begin
          if avtomat_mili[i].perehodi[0,0]='' then
            avtomat_mili[i].perehodi[0,0]:='1' else
            avtomat_mili[i].perehodi[0,0]:=inttostr(strtoint(avtomat_mili[i].perehodi[0,0])+1);
          avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),0]:=inttostr(j);
          include(avtomat_mili[i].set_per,j);
          avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),-1]:='0';{inttostr(way[0,o]-2);}
          avtomat_mili[i].y[strtoint(avtomat_mili[i].perehodi[0,0]),0]:=0;
          {if way[0,o]>2 then}
            for p:=1 to way[0,o]-1 do begin
              if perehodi[way[p+1,o],way[p,o]]='yes' then begin
                pl:=strtoint(avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),-1]);
                avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),-1]:=inttostr(pl+1);
                avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),pl+1]:=signali[1,way[p,o]];
              end else
              if perehodi[way[p+1,o],way[p,o]]='no' then begin
                pl:=strtoint(avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),-1]);
                avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),-1]:=inttostr(pl+1);
                avtomat_mili[i].perehodi[strtoint(avtomat_mili[i].perehodi[0,0]),pl+1]:='-'+signali[1,way[p,o]];
              end;
              if signali[0,way[p,o]]='link' then
                for pl :=1 to 3 do
                  if signali[0,way[p,o]]<>'' then begin
                    inc(avtomat_mili[i].y[strtoint(avtomat_mili[i].perehodi[0,0]),0]);
                    stt:=signali[pl,way[p,o]];
                    for oo:=2 to length(stt) do
                      stt[oo-1]:=stt[oo];
                    setlength(stt,length(stt)-1);
                    if stt<>'' then begin
                      pr4:=avtomat_mili[i].y[strtoint(avtomat_mili[i].perehodi[0,0]),0];
                      avtomat_mili[i].y[strtoint(avtomat_mili[i].perehodi[0,0]),pr4]:=strtoint(stt);
                    end;
                  end;
            end;
        end;
      end;
     //конец нахождения путей

    form1.stringgrid3.ColCount:=SostCol+1;
    form1.stringgrid3.RowCount:=TrigCol+2;
    form1.stringGrid3.Cells[0,0]:='Вершина';
    form1.stringGrid3.Cells[0,1]:='Состояние';
    for i:=1 to TrigCol do
      form1.stringGrid3.Cells[0,i+1]:='  Q'+inttostr(i);
    for i:=1 to SostCol do begin
      form1.StringGrid3.Cells[i,0]:=inttostr(razm_sost[i,0]);
      form1.StringGrid3.Cells[i,1]:='a'+inttostr(razm_sost[i,1]);
      for j:=2 to TrigCol+1 do begin
        if length(dectobin(razm_sost[i,1]-1))>TrigCol+1-j then begin
          sttt:=dectobin(razm_sost[i,1]-1);
          if sttt[j-1-TrigCol+length(sttt)]='0' then
            form1.StringGrid3.Cells[i,j]:='0'
          else form1.StringGrid3.Cells[i,j]:='1';
        end else form1.StringGrid3.Cells[i,j]:='0';
      end;
    end;

  //структурная таблица автомата в СГ

    Form1.StringGrid4.colcount:=TrigCol*2+2;
    Form1.StringGrid4.cells[0,0]:='ИС';
    for i:=1 to TrigCol do
      Form1.StringGrid4.cells[i,0]:='Q'+inttostr(i);
    Form1.StringGrid4.cells[TrigCol+1,0]:='СП';
    for i:=1 to TrigCol do
      Form1.StringGrid4.cells[i+TrigCol+1,0]:='Q'+inttostr(i)+'+';
    //Найти сколько есть Х-ов и Y-ков и внести в соответствующий массив
    for o:=1 to VershCol do
      for g:=1 to 3 do
        if signali[g,o]<>'' then begin
          st:=signali[g,o];
          if st[2]<>'' then
            st[1]:=st[2];
          if st[3]<>'' then
            st[2]:=st[3];
          if st[4]<>'' then
            st[3]:=st[4];
          setlength(st,length(st)-1);
          prov3:=false;
          if signali[g,o][1]='x' then begin
            for p:=1 to mas_x[0] do
              if mas_x[p]=strtoint(st) then
                prov3:=true;
              if not prov3 then begin
                inc(mas_x[0]);
                mas_x[mas_x[0]]:=strtoint(st);
              end;
          end else begin
            for p:=1 to mas_y[0] do
              if mas_y[p]=strtoint(st) then
                prov3:=true;
            if not prov3 then begin
              inc(mas_y[0]);
              mas_y[mas_y[0]]:=strtoint(st);
            end;
          end;
        end;
        for p:=1 to mas_x[0]-1 do
          for g:=1 to mas_x[0]-1 do
            if mas_x[g]>mas_x[g+1] then begin
              pr1:=mas_x[g];
              mas_x[g]:=mas_x[g+1];
              mas_x[g+1]:=pr1;
            end;
        for p:=1 to mas_y[0]-1 do
          for g:=1 to mas_y[0]-1 do
            if mas_y[g]>mas_y[g+1] then begin
              pr1:=mas_y[g];
              mas_y[g]:=mas_y[g+1];
              mas_y[g+1]:=pr1;
            end;
        form1.stringgrid4.ColCount:=form1.stringgrid4.ColCount+mas_x[0]+mas_y[0];
        for g:=1 to mas_x[0] do
          form1.stringgrid4.cells[g+TrigCol*2+1,0]:='x'+inttostr(mas_x[g]);
        for g:=1 to mas_y[0] do
          form1.stringgrid4.cells[g+TrigCol*2+1+mas_x[0],0]:='y'+inttostr(mas_y[g]);
        if form1.radiogroup4.ItemIndex=0 then begin
          form1.stringgrid4.ColCount:=form1.stringgrid4.ColCount+TrigCol;
          for o:=form1.stringgrid4.ColCount-TrigCol to form1.stringgrid4.ColCount-1 do
            form1.stringgrid4.Cells[o,0]:=' D'+inttostr(o-(form1.stringgrid4.ColCount-TrigCol)+1);
        end else begin
          form1.stringgrid4.ColCount:=form1.stringgrid4.ColCount+TrigCol*2;
          for o:=form1.stringgrid4.ColCount-2*TrigCol to form1.stringgrid4.ColCount-1 do
            if ((o-(form1.stringgrid4.ColCount-2*TrigCol)+1) mod 2)=1 then
              form1.stringgrid4.Cells[o,0]:=' R'+inttostr((o-(form1.stringgrid4.ColCount-2*TrigCol)) div 2+1)
            else form1.stringgrid4.Cells[o,0]:=' S'+inttostr((o-(form1.stringgrid4.ColCount-2*TrigCol)) div 2+1);
        end;


    cur_mas:=1;
    for i:=1 to SostNum do
      for j:=1 to strtoint(avtomat_mili[i].perehodi[0,0]) do begin
          form1.stringGrid4.RowCount:=cur_mas+1;
          form1.stringGrid4.cells[0,cur_mas]:=' a'+inttostr(i);
          for g:=2 to TrigCol+1 do begin
            if length(dectobin(i-1))>TrigCol+1-g then begin
              sttt:=dectobin(i-1);
              if sttt[g-1-TrigCol+length(sttt)]='0' then
                form1.StringGrid4.Cells[g-1,cur_mas]:='0'
              else form1.StringGrid4.Cells[g-1,cur_mas]:='1';
            end else form1.StringGrid4.Cells[g-1,cur_mas]:='0';
          end;
          form1.stringGrid4.cells[TrigCol+1,cur_mas]:=' a'+avtomat_mili[i].perehodi[j,0];
          for g:=2 to TrigCol+1 do begin
            if length(dectobin(strtoint(avtomat_mili[i].perehodi[j,0])-1))>TrigCol+1-g then begin
              sttt:=dectobin(strtoint(avtomat_mili[i].perehodi[j,0])-1);
              if sttt[g-1-TrigCol+length(sttt)]='0' then
                form1.StringGrid4.Cells[g+TrigCol,cur_mas]:='0'
              else form1.StringGrid4.Cells[g+TrigCol,cur_mas]:='1';
            end else form1.StringGrid4.Cells[g+TrigCol,cur_mas]:='0';
          end;
          if avtomat_mili[i].perehodi[j,-1]='0' then
            for o:=1 to mas_x[0] do
              form1.stringgrid4.Cells[o+TrigCol*2+2-1,cur_mas]:=' --'
          else
            for o:=TrigCol*2+2 to TrigCol*2+2+mas_x[0]-1 do begin
              pr1:=0;
              for p:=1 to strtoint(avtomat_mili[i].perehodi[j,-1]) do
                if avtomat_mili[i].perehodi[j,p]=form1.StringGrid4.Cells[o,0] then
                  pr1:=1 else
                if avtomat_mili[i].perehodi[j,p]='-'+form1.StringGrid4.Cells[o,0] then
                  pr1:=-1;
              if pr1=1 then
                form1.StringGrid4.Cells[o,cur_mas]:='1';
              if pr1=-1 then
                form1.StringGrid4.Cells[o,cur_mas]:='0';
              if pr1=0 then
                form1.StringGrid4.Cells[o,cur_mas]:='--';
            end;
          for o:=TrigCol*2+2+mas_x[0] to TrigCol*2+1+mas_x[0]+mas_y[0] do begin
            form1.stringgrid4.Cells[o,cur_mas]:='0';
            for p:=1 to avtomat_mili[i].y[j,0] do
              if 'y'+inttostr(avtomat_mili[i].y[j,p])=form1.stringgrid4.Cells[o,0] then
                form1.stringgrid4.Cells[o,cur_mas]:='1';
          end;
          if form1.RadioGroup4.ItemIndex=0 then
            //D-triggers
            for o:=1 to TrigCol do
              form1.stringgrid4.cells[o+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:=form1.stringGrid4.cells[o+TrigCol+1,cur_mas]
          else
            //RS-triggers
            for o:=1 to TrigCol do begin
              if (form1.stringgrid4.cells[o,cur_mas]='0') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='0') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='--';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
              end else
              if (form1.stringgrid4.cells[o,cur_mas]='0') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='1') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='1';
              end else
              if (form1.stringgrid4.cells[o,cur_mas]='1') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='0') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='1';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
              end else
              if (form1.stringgrid4.cells[o,cur_mas]='1') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='1') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='--';
              end;
            end;
          inc(cur_mas);
      end;


  end else
  begin
    //автомат Мура
    i:=0;
    repeat
      inc(i);
      j:=-1;
      repeat
        inc(j);
        avtomat_mura[i].y[j]:=0;
      until j=3;
      j:=-2;
      repeat
        inc(j);
        g:=-1;
        repeat
          inc(g);
          avtomat_mura[i].perehodi[g,j]:='';
        until g=20;
      until j=10;
    until i=30;
    SostCol:=1;
    SostNum:=2;

    for i:=1 to VershCol do
      if (signali[0,i]='start') or (signali[0,i]='end') then begin
        razm_sost[SostCol,0]:=i;
        razm_sost[SostCol,1]:=1;
        include(versh_in_sost,i);
        inc(SostCol);
      end else
      if signali[0,i]='link' then begin
        razm_sost[SostCol,0]:=i;
        razm_sost[SostCol,1]:=SostNum;
        include(versh_in_sost,i);
        inc(SostCol);
        inc(SostNum);
      end;
    TrigCol:=1;
    pr:=false;
    while not pr do begin
      o:=1;
      for i:=1 to TrigCol do
        o:=o*2;
      if o>=SostNum-1 then
        pr:=true
      else inc(TrigCol);
    end;
    //теперь находим сигналы и записываем их в автомат
    for i:=1 to SostCol do begin
      if avtomat_mura[razm_sost[i,1]].versh_num<>1 then
        avtomat_mura[razm_sost[i,1]].versh_num:=razm_sost[i,0];
      if (signali[0,razm_sost[i,0]]='start') or (signali[0,razm_sost[i,0]]='end') then
        avtomat_mura[razm_sost[i,1]].y[0]:=0
      else begin
        avtomat_mura[razm_sost[i,1]].y[0]:=0;
        for j:=1 to 3 do begin
          stt:=signali[j,razm_sost[i,0]];
          for o:=2 to length(stt) do
            stt[o-1]:=stt[o];
          setlength(stt,length(stt)-1);
          if stt<>'' then
            avtomat_mura[razm_sost[i,1]].y[j]:=strtoint(stt);
          if signali[j,razm_sost[i,0]]<>'' then
            inc(avtomat_mura[razm_sost[i,1]].y[0]);
        end;
      end;
    end;
    //а теперь, наконец, ищем пути из состояния i в состояние j
    dec(SostCol);
    dec(SostNum);
    for i:=1 to SostNum do
      for j:=1 to SostNum do begin
        find_ways(i,j,'mura');
        for o:=1 to way[0,0] do begin
          if avtomat_mura[i].perehodi[0,0]='' then
            avtomat_mura[i].perehodi[0,0]:='1' else
            avtomat_mura[i].perehodi[0,0]:=inttostr(strtoint(avtomat_mura[i].perehodi[0,0])+1);
          avtomat_mura[i].perehodi[strtoint(avtomat_mura[i].perehodi[0,0]),0]:=inttostr(j);
          include(avtomat_mura[i].set_per,j);
          avtomat_mura[i].perehodi[strtoint(avtomat_mura[i].perehodi[0,0]),-1]:=inttostr(way[0,o]-2);
          if way[0,o]>2 then
            for p:=1 to way[0,o]-1 do begin
              if perehodi[way[p+1,o],way[p,o]]='yes' then
                avtomat_mura[i].perehodi[strtoint(avtomat_mura[i].perehodi[0,0]),p-1]:=signali[1,way[p,o]]
              else
              if perehodi[way[p+1,o],way[p,o]]='no' then
                avtomat_mura[i].perehodi[strtoint(avtomat_mura[i].perehodi[0,0]),p-1]:='-'+signali[1,way[p,o]];
            end;
        end;
      end;
     //конец нахождения путей

    form1.stringgrid3.ColCount:=SostCol+1;
    form1.stringgrid3.RowCount:=TrigCol+2;
    form1.stringGrid3.Cells[0,0]:='Вершина';
    form1.stringGrid3.Cells[0,1]:='Состояние';
    for i:=1 to TrigCol do
      form1.stringGrid3.Cells[0,i+1]:='  Q'+inttostr(i);
    for i:=1 to SostCol do begin
      form1.StringGrid3.Cells[i,0]:=inttostr(razm_sost[i,0]);
      form1.StringGrid3.Cells[i,1]:='a'+inttostr(razm_sost[i,1]);
      for j:=2 to TrigCol+1 do begin
        if length(dectobin(razm_sost[i,1]-1))>TrigCol+1-j then begin
          sttt:=dectobin(razm_sost[i,1]-1);
          if sttt[j-1-TrigCol+length(sttt)]='0' then
            form1.StringGrid3.Cells[i,j]:='0'
          else form1.StringGrid3.Cells[i,j]:='1';
        end else form1.StringGrid3.Cells[i,j]:='0';
      end;
    end;

  //структурная таблица автомата в СГ

    Form1.StringGrid4.colcount:=TrigCol*2+2;
    Form1.StringGrid4.cells[0,0]:='ИС';
    for i:=1 to TrigCol do
      Form1.StringGrid4.cells[i,0]:='Q'+inttostr(i);
    Form1.StringGrid4.cells[TrigCol+1,0]:='СП';
    for i:=1 to TrigCol do
      Form1.StringGrid4.cells[i+TrigCol+1,0]:='Q'+inttostr(i)+'+';
    //Найти сколько есть Х-ов и Y-ков и внести в соответствующий массив
    for o:=1 to VershCol do
      for g:=1 to 3 do
        if signali[g,o]<>'' then begin
          st:=signali[g,o];
          if st[2]<>'' then
            st[1]:=st[2];
          if st[3]<>'' then
            st[2]:=st[3];
          if st[4]<>'' then
            st[3]:=st[4];
          setlength(st,length(st)-1);
          prov3:=false;
          if signali[g,o][1]='x' then begin
            for p:=1 to mas_x[0] do
              if mas_x[p]=strtoint(st) then
                prov3:=true;
              if not prov3 then begin
                inc(mas_x[0]);
                mas_x[mas_x[0]]:=strtoint(st);
              end;
          end else begin
            for p:=1 to mas_y[0] do
              if mas_y[p]=strtoint(st) then
                prov3:=true;
            if not prov3 then begin
              inc(mas_y[0]);
              mas_y[mas_y[0]]:=strtoint(st);
            end;
          end;

        end;
        for p:=1 to mas_x[0]-1 do
          for g:=1 to mas_x[0]-1 do
            if mas_x[g]>mas_x[g+1] then begin
              pr1:=mas_x[g];
              mas_x[g]:=mas_x[g+1];
              mas_x[g+1]:=pr1;
            end;
        for p:=1 to mas_y[0]-1 do
          for g:=1 to mas_y[0]-1 do
            if mas_y[g]>mas_y[g+1] then begin
              pr1:=mas_y[g];
              mas_y[g]:=mas_y[g+1];
              mas_y[g+1]:=pr1;
            end;
        form1.stringgrid4.ColCount:=form1.stringgrid4.ColCount+mas_x[0]+mas_y[0];
        for g:=1 to mas_x[0] do
          form1.stringgrid4.cells[g+TrigCol*2+1,0]:='x'+inttostr(mas_x[g]);
        for g:=1 to mas_y[0] do
          form1.stringgrid4.cells[g+TrigCol*2+1+mas_x[0],0]:='y'+inttostr(mas_y[g]);
        if form1.radiogroup4.ItemIndex=0 then begin
          form1.stringgrid4.ColCount:=form1.stringgrid4.ColCount+TrigCol;
          for o:=form1.stringgrid4.ColCount-TrigCol to form1.stringgrid4.ColCount-1 do
            form1.stringgrid4.Cells[o,0]:=' D'+inttostr(o-(form1.stringgrid4.ColCount-TrigCol)+1);
        end else begin
          form1.stringgrid4.ColCount:=form1.stringgrid4.ColCount+TrigCol*2;
          for o:=form1.stringgrid4.ColCount-2*TrigCol to form1.stringgrid4.ColCount-1 do
            if ((o-(form1.stringgrid4.ColCount-2*TrigCol)+1) mod 2)=1 then
              form1.stringgrid4.Cells[o,0]:=' R'+inttostr((o-(form1.stringgrid4.ColCount-2*TrigCol)) div 2+1)
            else form1.stringgrid4.Cells[o,0]:=' S'+inttostr((o-(form1.stringgrid4.ColCount-2*TrigCol)) div 2+1);
        end;


    cur_mas:=1;
    for i:=1 to SostNum do
      for j:=1 to strtoint(avtomat_mura[i].perehodi[0,0]) do begin
          form1.stringGrid4.RowCount:=cur_mas+1;
          form1.stringGrid4.cells[0,cur_mas]:=' a'+inttostr(i);
          for g:=2 to TrigCol+1 do begin
            if length(dectobin(i-1))>TrigCol+1-g then begin
              sttt:=dectobin(i-1);
              if sttt[g-1-TrigCol+length(sttt)]='0' then
                form1.StringGrid4.Cells[g-1,cur_mas]:='0'
              else form1.StringGrid4.Cells[g-1,cur_mas]:='1';
            end else form1.StringGrid4.Cells[g-1,cur_mas]:='0';
          end;
          form1.stringGrid4.cells[TrigCol+1,cur_mas]:=' a'+avtomat_mura[i].perehodi[j,0];
          for g:=2 to TrigCol+1 do begin
            if length(dectobin(strtoint(avtomat_mura[i].perehodi[j,0])-1))>TrigCol+1-g then begin
              sttt:=dectobin(strtoint(avtomat_mura[i].perehodi[j,0])-1);
              if sttt[g-1-TrigCol+length(sttt)]='0' then
                form1.StringGrid4.Cells[g+TrigCol,cur_mas]:='0'
              else form1.StringGrid4.Cells[g+TrigCol,cur_mas]:='1';
            end else form1.StringGrid4.Cells[g+TrigCol,cur_mas]:='0';
          end;
          if avtomat_mura[i].perehodi[j,-1]='0' then
            for o:=1 to mas_x[0] do
              form1.stringgrid4.Cells[o+TrigCol*2+2-1,cur_mas]:=' --'
          else
            for o:=TrigCol*2+2 to TrigCol*2+2+mas_x[0]-1 do begin
              pr1:=0;
              for p:=1 to strtoint(avtomat_mura[i].perehodi[j,-1]) do
                if avtomat_mura[i].perehodi[j,p]=form1.StringGrid4.Cells[o,0] then
                  pr1:=1 else
                if avtomat_mura[i].perehodi[j,p]='-'+form1.StringGrid4.Cells[o,0] then
                  pr1:=-1;
              if pr1=1 then
                form1.StringGrid4.Cells[o,cur_mas]:='1';
              if pr1=-1 then
                form1.StringGrid4.Cells[o,cur_mas]:='0';
              if pr1=0 then
                form1.StringGrid4.Cells[o,cur_mas]:='--';
            end;
          for o:=TrigCol*2+2+mas_x[0] to TrigCol*2+1+mas_x[0]+mas_y[0] do begin
            form1.stringgrid4.Cells[o,cur_mas]:='0';
            for p:=1 to avtomat_mura[{strtoint(avtomat_mura[}i{].perehodi[j,0])}].y[0] do
              if 'y'+inttostr(avtomat_mura[{strtoint(avtomat_mura[}i{].perehodi[j,0])}].y[p])=form1.stringgrid4.Cells[o,0] then
                form1.stringgrid4.Cells[o,cur_mas]:='1';
          end;
          if form1.RadioGroup4.ItemIndex=0 then
            //D-triggers
            for o:=1 to TrigCol do
              form1.stringgrid4.cells[o+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:=form1.stringGrid4.cells[o+TrigCol+1,cur_mas]
          else
            //RS-triggers
            for o:=1 to TrigCol do begin
              if (form1.stringgrid4.cells[o,cur_mas]='0') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='0') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='--';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
              end else
              if (form1.stringgrid4.cells[o,cur_mas]='0') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='1') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='1';
              end else
              if (form1.stringgrid4.cells[o,cur_mas]='1') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='0') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='1';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
              end else
              if (form1.stringgrid4.cells[o,cur_mas]='1') and (form1.stringgrid4.cells[o+1+TrigCol,cur_mas]='1') then begin
                form1.stringgrid4.cells[o*2+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='0';
                form1.stringgrid4.cells[o*2+1+TrigCol*2+mas_x[0]+mas_y[0],cur_mas]:='--';
              end;
            end;
          inc(cur_mas);
      end;


  end;
end;

procedure functions;
var i,j,g,o:integer;
    prov:boolean;
    st,st1:string;
procedure cut_dup(var stt:string);
var i,g,j,k,m:integer;
    mas:array[1..100] of string;
begin
  g:=0;
  repeat
    inc(g);
    if pos(' V ',stt)<>0 then begin
      mas[g]:=copy(stt,pos('=',stt)+1,pos(' V ',stt)-pos('=',stt)-1);
      delete(stt,pos('=',stt)+1,pos(' V ',stt)+2-pos('=',stt));
    end else begin
      mas[g]:=copy(stt,pos('=',stt)+1,length(stt)-pos('=',stt));
      delete(stt,pos('=',stt)+1,length(stt)-pos('=',stt));
    end;
  until length(stt)=pos('=',stt);
  m:=g;
  for i:=1 to g-1 do
    for j:=i+1 to g do
      if mas[i]=mas[j] then begin
        for k:=j+1 to m do
          mas[k-1]:=mas[k];
        if j<=m then
          dec(m);
      end;
  for i:=1 to m-1 do
    stt:=stt+mas[i]+' V ';
  stt:=stt+mas[m];
end;

begin
  form1.memo2.Clear;
  for i:=TrigCol*2+mas_x[0]+2 to TrigCol*2+1+mas_x[0]+mas_y[0] do begin
    prov:=false;
    st:=form1.stringgrid4.cells[i,0]+'=';
    for j:=1 to form1.stringgrid4.RowCount-1 do
      if form1.stringgrid4.cells[i,j]='1' then begin
        prov:=true;
        if st[length(st)]<>'=' then begin
          st:=st+' V ';
        end;
        if form1.RadioGroup3.itemindex=0 then
          for g:=TrigCol*2+2 to TrigCol*2+1+mas_x[0] do
            if form1.stringgrid4.cells[g,j]='1' then
              st:=st+form1.stringgrid4.cells[g,0] else
              st:=st+'not('+form1.stringgrid4.cells[g,0]+')';
        for g:=1 to TrigCol do
          if form1.stringgrid4.cells[g,j]='1' then
            st:=st+form1.stringgrid4.cells[g,0] else
            st:=st+'not('+form1.stringgrid4.cells[g,0]+')';
      end;
      if not prov then
        st:=st+'0';
      cut_dup(st);
      form1.memo2.Lines.Add(st);

  end;
  for i:=TrigCol*2+2+mas_y[0]+mas_x[0] to form1.stringgrid4.colcount-1 do begin
    prov:=false;
    st:=form1.stringgrid4.cells[i,0]+'=';
    for j:=1 to form1.stringgrid4.RowCount-1 do
      if form1.stringgrid4.cells[i,j]='1' then begin
        prov:=true;
        if st[length(st)]<>'=' then
          st:=st+' V ';
        for g:=TrigCol*2+2 to TrigCol*2+1+mas_x[0] do
          if form1.stringgrid4.cells[g,j]='1' then
            st:=st+form1.stringgrid4.cells[g,0] else
            st:=st+'not('+form1.stringgrid4.cells[g,0]+')';
        for g:=1 to TrigCol do
          if form1.stringgrid4.cells[g,j]='1' then
            st:=st+form1.stringgrid4.cells[g,0] else
            st:=st+'not('+form1.stringgrid4.cells[g,0]+')';
      end;
      if not prov then
        st:=st+'0';
      cut_dup(st);
      form1.memo2.Lines.Add(st);
  end;

end;

procedure Draw_shema;
var pr,k,i,j,g,x1,y1,x2,y2,m:integer;
    mas:array [1..100] of string;
    st,st1:string;

procedure strtomas(var stt:string);
var i,g,j,k:integer;
begin
  g:=0;
  repeat
    inc(g);
    if pos(' V ',stt)<>0 then begin
      mas[g]:=copy(stt,pos('=',stt)+1,pos(' V ',stt)-pos('=',stt)-1);
      delete(stt,pos('=',stt)+1,pos(' V ',stt)+2-pos('=',stt));
    end else begin
      mas[g]:=copy(stt,pos('=',stt)+1,length(stt)-pos('=',stt));
      delete(stt,pos('=',stt)+1,length(stt)-pos('=',stt));
    end;
  until length(stt)=pos('=',stt);
  m:=g;
end;

procedure Draw_Trigger(xx,yy:integer;trigtype:string;num:integer);
begin
  form1.image2.canvas.Rectangle(xx,yy,xx+40,yy+60);
  form1.image2.canvas.moveto(xx+10,yy);
  form1.image2.canvas.lineto(xx+10,yy+60);
  form1.image2.canvas.moveto(xx+30,yy);
  form1.image2.canvas.lineto(xx+30,yy+60);

  form1.image2.canvas.moveto(xx-10,yy+15);
  form1.image2.canvas.lineto(xx,yy+15);
  form1.image2.canvas.moveto(xx+40,yy+15);
  form1.image2.canvas.lineto(xx+50,yy+15);
  if trigtype='D' then begin
    form1.image2.canvas.textout(xx+15,yy+5,'D');
    form1.image2.canvas.textout(xx-20,yy+5,'D'+inttostr(i));
    form1.image2.canvas.textout(xx+50,yy+5,'Q'+inttostr(i));
    form1.image2.canvas.textout(xx+1,yy+5,'D');
  end else begin
    form1.image2.canvas.moveto(xx-10,yy+45);
    form1.image2.canvas.lineto(xx,yy+45);
    form1.image2.canvas.textout(xx+15,yy+5,'RS');
    form1.image2.canvas.textout(xx-20,yy+5,'R'+inttostr(i));
    form1.image2.canvas.textout(xx-20,yy+35,'S'+inttostr(i));
    form1.image2.canvas.textout(xx+50,yy+5,'Q'+inttostr(i));
    form1.image2.canvas.textout(xx+1,yy+5,'R');
    form1.image2.canvas.textout(xx+1,yy+35,'S');

  end;
end;

procedure Draw_and(xx,yy,num,size:integer;out_name:string);
var i,j:integer;
begin
  form1.image2.canvas.rectangle(xx,yy,xx+30,yy+15*(size+1));
  for i:=1 to size do begin
    form1.image2.canvas.moveto(xx,yy+i*15);
    form1.image2.canvas.lineto(xx-15,yy+i*15);
    if pos(' ',mas[num])<>0 then begin
    form1.image2.canvas.textout(xx-40,yy+i*15-7,copy(mas[num],1,pos(' ',mas[num])-1));
    delete(mas[num],1,pos(' ',mas[num]));
    end else begin
    form1.image2.canvas.textout(xx-40,yy+i*15-7,copy(mas[num],1,length(mas[num])));
    delete(mas[num],1,length(mas[num]));
    end;
  end;
  form1.image2.canvas.textout(xx+10,yy+5,'&');
  if m>1 then begin
    form1.image2.canvas.moveto(xx+30,yy+(size+1)*7);
    form1.image2.canvas.lineto(xx+30+5*num,yy+(size+1)*7);
    form1.image2.canvas.lineto(xx+30+5*num,y1+num*10);
    form1.image2.canvas.lineto(350,y1+num*10);
  end else begin
    form1.image2.canvas.moveto(xx+30,yy+(size+1)*7);
    form1.image2.canvas.lineto(xx+40,yy+(size+1)*7);
    form1.image2.canvas.textout(xx+40,yy+(size)*7,out_name);
  end;
end;

procedure Draw_or(xx,yy,size:integer;out_name:string);
begin
  form1.image2.canvas.rectangle(xx,yy,xx+30,yy+10*(size+1));
  form1.image2.canvas.textout(xx+10,yy+5,'1');
  form1.image2.canvas.moveto(xx+30,yy+(size+1)*5);
  form1.image2.canvas.lineto(xx+40,yy+(size+1)*5);
  form1.image2.canvas.textout(xx+40,yy+size*5,out_name);
end;

begin
  form1.Image2.canvas.rectangle(0,0,753,25000);
  for i:=1 to TrigCol do
    if form1.radiogroup4.ItemIndex=0 then
      Draw_trigger(30,(i-1)*90+30,'D',i)
    else
      Draw_trigger(30,(i-1)*90+30,'RS',i);
  x1:=200;
  y1:=30;
  y2:=y1;
  for i:=0 to form1.memo2.Lines.Count-1 do begin
    if y2<>30 then
      y1:=y2+30;
    y2:=y1;
    st1:=copy(form1.memo2.Lines[i],1,2);
    if (st1[1]='y') or (st1=' D') or (st1=' R') or (st1=' S')  then begin
     st:=form1.memo2.Lines[i];
    if (i<form1.memo2.Lines.Count-1) then begin
      st1:=copy(form1.memo2.Lines[i+1],1,2);
    if (st1[1]='y') or (st1=' D') or (st1=' R') or (st1=' S') then
    begin end
    else begin
      st:=st+form1.memo2.Lines[i+1];
      if (i<form1.memo2.Lines.Count-2) then begin
      st1:=copy(form1.memo2.Lines[i+2],1,2);
      if (st1[1]='y') or (st1=' D') or (st1=' R') or (st1=' S') then begin
      end else begin
        st:=st+form1.memo2.Lines[i+2];
        if (i<form1.memo2.Lines.Count-3) then begin
          st1:=copy(form1.memo2.Lines[i+3],1,2);
          if (st1[1]='y') or (st1=' D') or (st1=' R') or (st1=' S') then begin
          end else
            st:=st+form1.memo2.Lines[i+3];
            if (i<form1.memo2.Lines.Count-4) then begin
              st1:=copy(form1.memo2.Lines[i+4],1,2);
              if (st1[1]='y') or (st1=' D') or (st1=' R') or (st1=' S') then begin
              end else
                st:=st+form1.memo2.Lines[i+4];
            end;
          end;
        end;
      end;
    end;
    end;
    strtomas(st);
    setlength(st,length(st)-1);
    if m>1 then
      Draw_Or(350,y1,m,st);
    for j:=1 to m do begin
      pr:=1;
      k:=1;
      repeat
        while (mas[j][pr]<>'0') and (mas[j][pr]<>'1') and(mas[j][pr]<>'2') and(mas[j][pr]<>'3') and(mas[j][pr]<>'4') and(mas[j][pr]<>'5') and(mas[j][pr]<>'6') and(mas[j][pr]<>'7') and(mas[j][pr]<>'8') and(mas[j][pr]<>'9') and (pr<length(mas[j])) do
          inc(pr);
        while (mas[j][pr]<>'n') and (mas[j][pr]<>'Q') and (mas[j][pr]<>'x') and (pr<length(mas[j])) do
          inc(pr);
        if pr<length(mas[j]) then begin
          setlength(mas[j],length(mas[j])+1);
          for g:=length(mas[j])-1 downto pr do
            mas[j][g+1]:=mas[j][g];
          mas[j][pr]:=' ';
          inc(k);
        end;
      until pr>=length(mas[j]);
      Draw_and(x1,y2,j,k,st);
      inc(y2,(k+1)*15+10);
    end;
   end;
  end;

end;
end.
