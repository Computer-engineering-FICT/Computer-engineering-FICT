program cos_teilor;
var x,stx,cost,e: real;
    i,fakt,z: integer;
Begin
Write('Введите x: ');
Readln(x);
Write('Введите точность e: ');
Readln(e);
 stx:= x*x;  {x в степени}
 fakt:= 2;  {значение факториала в знаменателе}
 cost:= 1;  {первый элемент в разложении}
 i:= 2;  {счётчик}
 z:= -1;  {знак элемента}
while stx/fakt>=e do begin  {до тех пор, пока элемент в разложении не меньше точности}
                      cost:=cost+z*stx/fakt;
                      inc(i,2);
                      stx:=stx*x*x;
                      fakt:=fakt*(i-1)*i;
                      z:=z*(-1);  {смена знака}
                      end;
Writeln('Количество элементов в разложении = ',i div 2 + 1);
Writeln('Значение cos(',x:6:6,')= ',cost:6:6);
Writeln('Значение компьютера: ',cos(x):6:6);
Readln;
End.