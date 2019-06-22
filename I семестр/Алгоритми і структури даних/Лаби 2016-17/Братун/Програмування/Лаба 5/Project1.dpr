program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  MA = array [1..100000] of real;
var
  a: MA;
  max, min, numb: real;
  i,n,t: integer;
  m: char;

//�������
procedure  Bubble_sort (n: integer; var a: MA);
 var
   i,j:integer;
   tmp: real;
 begin
  for i:=1 to n-1 do
    for j:=1 to n-i do
      if a[j]>a[j+1] then
        begin
          tmp:=a[j];
          a[j]:=a[j+1];
          a[j+1]:=tmp;
        end;
 end;

//�������
procedure Insertion_sort (n: integer; var a: MA);
 var
   i,j:integer;
   tmp: real;
 begin
    for i:=2 to n do
      begin
        tmp:=a[i];
        j:=i-1;
        while (j > 0) and (tmp < a[j]) do
					begin
            a[j+1]:=a[j];
            j:=j-1;
          end;
        a[j+1]:=tmp;
      end;
 end;


procedure Find_Max (n: integer; a: MA; var max: real; var t: integer);
 var
    i:integer;
 begin
    max:=a[1];
    t:=1;
    for i:=2 to n do
      if a[i]>max then
        begin
          max:=a[i];
          t:=i;
        end;
 end;

procedure Find_Min (n: integer; a: MA; var min: real;  var t: integer);
 var
    i:integer;
 begin
    min:=a[1];
    t:=1;
    for i:=2 to n do
      if a[i]<min then
        begin
          min:=a[i];
          t:=i;
        end;
 end;


Function numb_old (n:integer; a:MA):real;
 var i, j, k, k_old: integer;
     numb: real;
begin
  k_old:=0;
  for i:=1 to n do
    begin
      k:=0;
		  numb:=a[i];
		  for j:=1 to n do if numb = a[j] then k:= k+1;
      if k > k_old then
        begin
				  numb_old:= numb;
				  k_old:=k;
        end;
    end;
end;




begin
 write ('����� ������ �������: ');
 readln (n);
 writeln ('����� ������� �������:');
 for i:=1 to n do read (a[i]);
 writeln ('��� ����� ������� � ��������:');
 writeln ('1: ������������� ������� ��������');
 writeln ('2: ������������� ������� �������');
 writeln ('3: ����� ������������ �������');
 writeln ('4: ����� ����������� �������');
 writeln ('5: ����� �����, ������� ������������ ������ ����');

 readln;
 read (m);

 case m of
 '1': begin
        Bubble_sort (n, a);
        writeln ('��������������� ������ ������� ��������:');
        for i:=1 to n do write (a[i]:1:2,'  ');
      end;
 '2': begin
        Insertion_sort (n, a);
        writeln ('��������������� ������ ����� �������:');
        for i:=1 to n do write (a[i]:1:2,'  ');
      end;
 '3': begin
        Find_Max (n, a, max, t);
        write ('������������ ������� ', max:1:2,' ��� ������ � ������ ', t);
      end;
 '4': begin
        Find_Min (n, a, min, t);
        write ('����������� ������� ', min:1:2,' ��� ������ � ������ ', t);
      end;
 '5': begin
        numb:=numb_old(n, a);
        write ('����� ', numb:1:2);
      end;
 end;
 readln (m);
 readln;
end.
