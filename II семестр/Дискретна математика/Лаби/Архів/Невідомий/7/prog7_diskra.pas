1 procedure WS (v);

(*����� � ������ � ����� � ������� � ������� v; ���������� �����, ������ � ���������� *)
2 begin
3 ������� := ?; ������� ver[j+1] 
then
 begin exch:=ver[j]; 
el:=lst[j]; 
em:=m[j]; 
ver[j]:=ver[j+1]; 
lst[j]:=lst[j+1]; 
m[j]:=m[j+1]; 
ver[j+1]:=exch; 
lst[j+1]:=el; 
m[j+1]:=em; 
end; 
end;
{=====================================================}
 begin while menu'4' do begin textmode(1); 
textbackground(blue); 
clrscr; textcolor(red); 
gotoxy(16,3);
 writeln('� � � � �'); 
textcolor(white);
gotoxy(5,5); 
writeln('* ������������ ������ � ������ *'); 
textcolor(black); 
gotoxy(7,22); 
writeln('Created by Olga GluSHko'); 
gotoxy(15,24); 
write('2010'); 
textcolor(white); 
gotoxy(7,10);
 write('+-----------MENU-----------?'); 
gotoxy(7,11); write('|');
textcolor(green); 
write('1 �������� ����� '); 
textcolor(white);
write('|'); 
gotoxy(7,12); 
write('|');
textcolor(green);
 write('2 �������� ����� '); 
textcolor(white);
write('|'); 
gotoxy(7,13); 
write('|');
extcolor(green);
 write('3 ����� �������� ����� '); 
textcolor(white);write('|'); 
gotoxy(7,14); 
write('|');
textcolor(green); 
write('4 ����� ');
 textcolor(white);
write('|'); 
gotoxy(7,15); 
write('|');
textcolor(white+128); 
write('�������� ����� ������ ����');
 textcolor(white);
write('|'); 
gotoxy(7,16); 
write('?--------------------------+'); 
menu:=readkey; 
case menu of

'1': begin
{������������ ������, ���� ��� ���� ������} textmode(2); 
textbackground(blue); 
clrscr;
 textcolor(lightgreen); 
if mem then release(size); 
repeat clrscr; 
write('����� ������ �����: '); 
writeln('(1) - ������'); 
gotoxy(21,wherey); 
writeln('(2) - ���'); 
gotoxy(21,wherey); 
writeln('(3) - ���������'); 
gotoxy(21,wherey); 
write('(4) - ������...'); 
raz:=0; repeat 
craz:=readkey; 
case craz of

'1': raz:=10;

'2': raz:=100;

'3': raz:=400;

'4': begin write(' ___');
 gotoxy(wherex-3,wherey);
 read(raz); 
if (raz400) then begin raz:=0; gotoxy(38,wherey-1); write('ERROR...'); delay(1000); end; end; end; until (craz='1') or (craz='2') or (craz='3') or (craz='4'); clrscr; until raz>0; writeln; write('����� ������ ������������� �����: '); writeln('0 - ���������'); gotoxy(35,wherey); write('1 - ���������'); mg:=readkey; if mg='1' then mgsi:=true else mgsi:=false; clrscr; mark(size);

Make_Graph(mgsi); mem:=true;{������ ������ ����� �����������} sor:=false; {������� �� �������������} readkey; end;

'2': begin {�������� ����� } textmode(2); textbackground(blue); clrscr; textcolor(lightgreen); gotoxy(32,3); Writeln('�������� �����:'); key:=-1; find:=false; prosm:=true; schet:=0;

Write_S(key,prosm,find,schet); writeln; readkey; end;

'3': begin {����� �������� �����} clrscr; textcolor(lightgreen); if not(sor) then begin writeln('������������� ������� �� ����������?'); writeln(' 1-��'); writeln(' 2-���'); sormen:=readkey; if sormen='1' then begin

Sort; sor:=true; end; end; prosm:=false; write('��� ����� ������ : '); readln(key); writeln; start(t); kols:=0; for fil:=1 to 10000 do begin schet:=0; find:=false;

Write_S(key,prosm,find,schet); {����� � ������} kols:=kols+schet; end; stop(t); if not(find) then write('� ��������� ����� ������� ���...') else begin writeln('������� ����� ',ver[p],' �������!'); writeln('���������� ���������: ',kols/10000:5:1); report('����� ������ �������',t); end; readkey; end; end; end; end.