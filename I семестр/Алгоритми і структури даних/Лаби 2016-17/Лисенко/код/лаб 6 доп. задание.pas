{������ � ������ �����, ������ � 1 ����, �������� � 2 ���� + ���������� ��� ��������}
var
  ch: integer;
  b, p: boolean;

procedure read_file(name: string);
var f: text; int: integer; str: string;
begin
  reset(f, name);
  while not eof(f) do begin
    readln(int);
    readln(str);
    writeln(int, ' ', str)
  end;
  close(f)
end;

function write_line(p: boolean): boolean;
var int: integer; str, name: string; f: text;
begin
  writeln('������� ����� � �����, ������� ��������� ��������');
  readln(int);
  readln(str);
  if b then name:='text1' else name:='text2';
  append(f, name);
  writeln(f, int);
  writeln(f, str);
  write_line:= not p;
  writeln('�������� � ���� ', name);
  close(f)
end;

begin
  b:=True;
  p:=True;
  while b do begin
  writeln('1 - �������� ������, 2 - ���������� ���������� 1 �����, 3 - ���������� ���������� 2 �����, 4 - ���������');
  readln(ch);
  case ch of
      1: begin
        p:=write_line(p)
      end;
      2: read_file('text1');
      3: read_file('text2');
      4: b:=False;
      else writeln('������� ������������ ��������')
    end
  end
end.