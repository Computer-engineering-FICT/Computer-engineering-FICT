type
  fi=array[1..100] of integer;
  fs=array[1..100] of string;
var
  file_: text;
  ch, int: integer;
  b: boolean;
  str: string;
  
procedure read_line(w: string; n:integer);
var i,int: integer; str: string; f:text;
begin
  reset(f, w);
  i:=1;
  while not eof(f) do begin
    readln(f,int);
    readln(f,str);
    if i=n then begin
      writeln('integer: ', int);
      writeln('string: ', str);
      break
    end;
    i:=i+1
  end;
  close(f)
end;

procedure write_line(w: string; int: integer; str: string);
var f:text; i:integer;
begin
  append(f, w);
  writeln(f, int);
  writeln(f, str);
  close(f);
  reset(f, w);
  i:=0;
  while not eof(f) do begin
    readln(f);
    readln(f);
    i:=i+1
  end; 
  writeln('запись прошла успешно в строку ', i);
  close(f)
end;

procedure delete_line(w: string; n: integer);
var f: text; a1: fi; a2: fs; i,k: integer;
begin
  reset(f, w);
  i:=1;
  k:=1;
  while not eof(f) do begin
    if i<>n then begin
      readln(f, a1[k]);
      readln(f, a2[k]);
      k:=k+1
    end 
    else begin
      readln(f);
      readln(f)
    end;
    i:=i+1
  end;
  close(f);
  rewrite(f, w);
  i:=1;
  for i:=1 to k-1 do begin
    writeln(f, a1[i]);
    writeln(f, a2[i]);
  end;
  close(f)
end;

procedure read_file(w: string);
var int:integer; str:string; f:text;
begin
  reset(f, w);
  writeln('------');
  while not eof(f) do begin
    readln(f, int);
    readln(f, str);
    writeln(int,' ', str)
    end;
  close(f)
end;

begin
  b:=True;
  while b do begin
    writeln('1 - добавить запись; 2 - прочитать заданную строку; 3 - вывести содержимое всего файла; 4 - удалить заданную строку; 5 - остановка программы');
    readln(ch);
    case ch of
      1: begin
        writeln('введите число и стоку, которые неободимо записать');
        readln(int);
        readln(str);
        write_line('text', int, str)
      end;
      2: begin
        write('введите номер строки для чтения: ');
        readln(int);
        read_line('text', int);
      end;
      3: read_file('text');
      4: begin
        write('введите номер строки для удаления: ');
        readln(int);
        delete_line('text', int);
      end;
      5: b:=False;
      else writeln('введена неправильная комманда')
    end;
    writeln('-----------------------------')
  end
end.