program cos_teilor;
var x,stx,cost,e: real;
    i,fakt,z: integer;
Begin
Write('������� x: ');
Readln(x);
Write('������� �������� e: ');
Readln(e);
 stx:= x*x;  {x � �������}
 fakt:= 2;  {�������� ���������� � �����������}
 cost:= 1;  {������ ������� � ����������}
 i:= 2;  {�������}
 z:= -1;  {���� ��������}
while stx/fakt>=e do begin  {�� ��� ���, ���� ������� � ���������� �� ������ ��������}
                      cost:=cost+z*stx/fakt;
                      inc(i,2);
                      stx:=stx*x*x;
                      fakt:=fakt*(i-1)*i;
                      z:=z*(-1);  {����� �����}
                      end;
Writeln('���������� ��������� � ���������� = ',i div 2 + 1);
Writeln('�������� cos(',x:6:6,')= ',cost:6:6);
Writeln('�������� ����������: ',cos(x):6:6);
Readln;
End.