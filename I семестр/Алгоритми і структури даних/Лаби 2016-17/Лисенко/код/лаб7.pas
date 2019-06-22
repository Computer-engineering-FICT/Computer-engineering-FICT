type
  link = ^s;
  s = record
       int: integer;
       str: string;
       next: link;
  end;
var
  b: boolean;
  ch, int: integer;
  str: string;
  start, element: link;

procedure write_element(start: link; int: integer; str: string);
var i: integer; element, tmp: link;
begin
  element:=start;
  i:=2;
  while element^.next<>nil do begin
    element:=element^.next;
    i:=i+1
  end;  
  new(tmp);
  element^.next:=tmp;
  element:=element^.next;
  element^.int:=int;
  element^.str:=str;
  element^.next:=nil;
  writeln('������ ������ ������� � ������� � �������� ', i)
end;

procedure read_element(start: link; n: integer);
var i,int: integer; str: string; element: link;
begin
  element:=start;
  if n=1 then begin
    writeln('integer: ', element^.int);
    writeln('string: ', element^.str);
  end;
  i:=2;
  while element^.next<>nil do begin
    element:=element^.next;
    if i=n then begin
      writeln('integer: ', element^.int);
      writeln('string: ', element^.str);
      break
    end;
    i:=i+1;
  end
end;

procedure read_list(start: link);
var int:integer; str:string; element: link;
begin
  element:=start;
  writeln('------');
  writeln(element^.int,' ', element^.str);
  while element^.next<>nil do begin
    element:=element^.next;
    writeln(element^.int,' ', element^.str)
  end 
end;

function delete_element(start: link; n: integer): link;
var i:integer; element:link;
begin
  if n=1 then begin
    delete_element:=start^.next;
    writeln('������� ������� �����');
  end
  else begin
    element:=start;
    i:=1;
    while element^.next<>nil do
      if n=i+1 then begin
        element^.next:=element^.next^.next;
        writeln('������� ������� �����');
        break
      end;
    delete_element:=start
  end
end;

begin
  new(start);
  writeln('������� ����� � ������ ��� ������� ��������');
  readln(int);
  readln(str);
  start^.int:=int;
  start^.str:=str;
  start^.next:=nil;
  writeln('-----------------------------');
  b:=True;
  while b do begin
    writeln('1 - �������� ������; 2 - ��������� �������� �������; 3 - ������� ���������� ����� ������; 4 - ������� �������� �������; 5 - ��������� ���������');
    readln(ch);
    case ch of
      1: begin
        writeln('������� ����� � �����, ������� ��������� ��������');
        readln(int);
        readln(str);
        write_element(start, int, str)
      end;
      2: begin
        write('������� ����� �������� ��� ������: ');
        readln(int);
        read_element(start, int);
      end;
      3: read_list(start);
      4: begin
        write('������� ����� �������� ��� ��������: ');
        readln(int);
        start:=delete_element(start, int);
      end;
      5: b:=False;
      else writeln('������� ������������ ��������')
    end;
    writeln('-----------------------------')
  end
end.