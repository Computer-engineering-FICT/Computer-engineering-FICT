Unit sserv1;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

  procedure Zaoch_5_1(a,b:word);
  Procedure MulAll(wa,wb : Word);

  Function Mul1(A,B : string) : string;
  Function Mul2(A,B : string) : string;
  Function Mul3(A,B : string) : string;
  Function Mul4(A,B : string) : string;
  Function Mul5(A,B : string) : string;
  Function Mul6(A,B : string) : string;

  Function AplusBOK(wa,wb,wpa,wpb : string; OpMinus : Boolean) : string;
  Function AplusBDK_2_11_a2(wa,wb,wpa,wpb : string;OpMinus : boolean) : string;
  Function AplusBDK_2_11_b(wa,wb,wpa,wpb : string;OpMinus : boolean) : string;
  Function PlusAll_2_11_a(wa,wb : string) : string;
  Function PlusAll_2_11_a2(wa,wb : string) : string;
  Function PlusAll_2_11_b(wa,wb : string) : string;

  Function APlusB(wa,wb : string; Min : boolean) : string;
  Function APlusB_dk(wa,wb : string; Min : boolean) : string;
  Function APlusB_memory_dk(wa,wb : string; Min : boolean) : string;
  Procedure ControlMod3(wa,wb : word{,res : word}{;operation : byte}); {0: "+"; 1: "*"}

  Function PKtoDK(s : string; znakdigs : integer) : string;

Implementation
uses ServiceUnit;
var Perenos : boolean;

Function APlusB(wa,wb : string; Min : boolean) : string;
var Pa,pb,ma,mb : string;
begin
pa:=Copy(wa,1,6);
Delete(wa,1,7);
ma:=wa;
pb:=Copy(wb,1,6);
Delete(wb,1,7);
mb:=wb;
APlusBOk(ma,mb,pa,pb,min);
end;

Function APlusB_dk(wa,wb : string; Min : boolean) : string;
var Pa,pb,ma,mb : string;
begin
pa:=Copy(wa,1,6);
Delete(wa,1,7);
ma:=wa;
pb:=Copy(wb,1,6);
Delete(wb,1,7);
mb:=wb;
AplusBDK_2_11_a2(ma,mb,pa,pb,min);
end;

Function APlusB_memory_dk(wa,wb : string; Min : boolean) : string;
var Pa,pb,ma,mb : string;
begin
pa:=Copy(wa,1,6);
Delete(wa,1,7);
ma:=wa;
pb:=Copy(wb,1,6);
Delete(wb,1,7);
mb:=wb;
APlusBDk_2_11_b(ma,mb,pa,pb,min);
end;
//////////////////---------------------------------------------------------

Function PlusAll_2_11_a(wa,wb : string) : string;
begin
WriteOut('2.11 Проделать операции машинного сложения и вычитания');
WriteOut('         A1 + B1, B2 + A1, A2 + B1, B2 + A2');
WriteOut('                        и');
WriteOut('         A1 - B1, B2 - A1, B1 - A2, A2 - B2');
WriteOut('  а) п.1  Хранение порядков и мантисс в ОП в ПК, операции в ОК.');
WriteOut('                      ');
WriteOut('1. A1 + B1');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB(wa,wb,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('2. B2 + A1');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB(wb,wa,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
WriteOut('                      ');
WriteOut('3. A2 + B1');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB(wa,wb,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('4. B2 + A2');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB(wb,wa,false);

{--------------------}
If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
WriteOut('                      ');
WriteOut('1. A1 - B1');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB(wa,wb,True);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('2. B2 - A1');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB(wb,wa,True);

If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('3. B1 - A2');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB(wb,wa,True);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('4. A2 - B2');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB(wa,wb,True);
writeout('')
end;

//////////////////---------------------------------------------------------

Function PlusAll_2_11_a2(wa,wb : string) : string;
begin
WriteOut('2.11 a) п.2 ');
WriteOut('  Хранение порядков и мантисс в ОП в ПК, операции в ДК.');
WriteOut('                      ');
WriteOut('1. A1 + B1');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_dk(wa,wb,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('2. B2 + A1');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_dk(wb,wa,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
WriteOut('                      ');
WriteOut('3. A2 + B1');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_dk(wa,wb,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('4. B2 + A2');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_dk(wb,wa,false);

{--------------------}
If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
WriteOut('                      ');
WriteOut('1. A1 - B1');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_dk(wa,wb,True);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('2. B2 - A1');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_dk(wb,wa,True);

If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('3. B1 - A2');
WriteOut('   '+wb+' ПК');
WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_dk(wb,wa,True);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('4. A2 - B2');
WriteOut('   '+wa+' ПК');
WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_dk(wa,wb,True);
writeout('')
end;

//////////////////---------------------------------------------------------

Function PlusAll_2_11_b(wa,wb : string) : string;
begin
WriteOut('2.11 б) ');
WriteOut('  Хранение порядков и мантисс в ОП в ДК, операции в ДК.');
WriteOut('                      ');
WriteOut('1. A1 + B1');
//WriteOut('   '+wa+' ПК');
//WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wa,wb,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('2. B2 + A1');
//WriteOut('   '+wb+' ПК');
//WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wb,wa,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
WriteOut('                      ');
WriteOut('3. A2 + B1');
//WriteOut('   '+wa+' ПК');
//WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wa,wb,false);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('4. B2 + A2');
//WriteOut('   '+wb+' ПК');
//WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wb,wa,false);

{--------------------}
If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
WriteOut('                      ');
WriteOut('1. A1 - B1');
//WriteOut('   '+wa+' ПК');
//WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wa,wb,True);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('2. B2 - A1');
//WriteOut('   '+wb+' ПК');
//WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wb,wa,True);

If wa[8]='1' then wa[8]:='0' else wa[8]:='1';
If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('3. B1 - A2');
//WriteOut('   '+wb+' ПК');
//WriteOut('   '+wa+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wb,wa,True);

If wb[8]='1' then wb[8]:='0' else wb[8]:='1';
WriteOut('                      ');
WriteOut('4. A2 - B2');
//WriteOut('   '+wa+' ПК');
//WriteOut('   '+wb+' ПК');
WriteOut('                      ');
APlusB_memory_dk(wa,wb,True);
writeout('')
end;



Procedure MulAll(wa,wb : Word);
var p : string;
    sa,sb : string;
begin
 sa:=extendbin(ToBin(wa),10);
 sb:=ToBinFrac(wb);

 WriteOut('2.4) Произвести операции машинного умножения в ПК двух дробей');
 WriteOut('     p=a1*b1 следующими способами:');
 WriteOut('     а) умножением А,Б,В,Г');
 WriteOut('');
 Mul1(sa,sb);
 Mul2(sa,sb);
 Mul3(sa,sb);
 Mul4(sa,sb);
 WriteOut('');
 WriteOut('     б) сокращенным умножением');
 WriteOut('');
 Mul5(sa,sb);
 WriteOut('');
 WriteOut('     в) умножением на 2 разряда множителя');
 WriteOut('');
 p:=Mul6(sa,sb);
 WriteOut('');
 WriteOut(' Округлить произведение до 10 двоичных разрядов справа от ');
 WriteOut(' запятой;');
 WriteOut(' Проделать операции над кодами алгебраических знаков и');
 WriteOut(' записать в ПК округленные результаты произведений');
 WriteOut(' а1*b1; а1*b2; а2*b1; а2*b2');
 WriteOut('');
 WriteOut(' а1=+0,'+sa+' '+'b1=+0,'+sb);
 WriteOut(' Операция над мантиссами |P| =|a1|*|b1|=0,'+p);
 WriteOut(' Sign(P)=Sign(a1) xor Sign(b1) = 0+0 = 0, [P]пк =0,'+p);
 WriteOut('');
 WriteOut(' а1=+0,'+sa+' '+'b2=-0,'+sb);
 WriteOut(' Операция над мантиссами |P| =|a1|*|b2|=0,'+p);
 WriteOut(' Sign(P)=Sign(a1) xor Sign(b2) = 0+1 = 1, [P]пк =1,'+p);
 WriteOut('');
 WriteOut(' а2=-0,'+sa+' '+'b1=+0,'+sb);
 WriteOut(' Операция над мантиссами |P| =|a2|*|b1|=0,'+p);
 WriteOut(' Sign(P)=Sign(a2) xor Sign(b1) = 1+0 = 1, [P]пк =1,'+p);
 WriteOut('');
 WriteOut(' а2=-0,'+sa+' '+'b2=-0,'+sb);
 WriteOut(' Операция над мантиссами |P| =|a2|*|b2|=0,'+p);
 WriteOut(' Sign(P)=Sign(a2) xor Sign(b2) = 1+1 = 0, [P]пк =0,'+p);
 WriteOut('');

end;

Function GetFill(C: Char; X: Integer): String;
Var S: String;
  I: Integer;
Begin
  S := '';
  For I := 1 To X Do
    S := S + C;
  Result := S;
End;

Function _Shl(X: String): String;
Begin
  Delete(X, 1, 1);
  X := X + '0';
  Result := X;
End;

Function _Shr(X: String): String;
Begin
  Insert('0', X, 1);
  SetLength(X, Length(X) - 1);
  Result := X;
End;

Function Plus(X, Y: String): String;
Var I: Integer;
  P: Boolean;
  R: String;
Begin
  R := '';
  P := False;

  If Length(X) <> Length(Y) Then
  Begin
    While Length(X) <> Length(Y) Do
      If Length(X) < Length(Y) Then Insert('0', X, 1) Else Insert('0', Y, 1);
  End;

  For I := 1 To Length(X) Do R := R + '0';
  For I := Length(X) Downto 1 Do
  Begin
    If (X[I] = '1') And (Y[I] = '1') Then
    Begin
      If P Then R[I] := '1' Else R[I] := '0';
      P := True;
    End;

    If (X[I] = '1') And (Y[I] = '0') Then
    Begin
      If P Then R[I] := '0' Else
      Begin
        R[I] := '1';
        P := False;
      End;
    End;

    If (X[I] = '0') And (Y[I] = '1') Then
    Begin
      If P Then R[I] := '0' Else
      Begin
        R[I] := '1';
        P := False;
      End;
    End;

    If (X[I] = '0') And (Y[I] = '0') Then
    Begin
      If P Then R[I] := '1' Else R[I] := '0';
      P := False;
    End;

  End;
  Perenos:=P;
//  If P Then R := '1' + R;
  Result := R;
End;


Function Mul1;
Var I, steps: Integer;
  C: String;
  OutS   : String;
Begin

  WriteOut('Схема А) ');
  WriteOut('');
  WriteOut('"a" - неподвижно, "b","S" сдвигается влево');


  //Edit1.Text := A;
  //Edit2.Text := B;

  steps := Length(A) + 1;
  B := '0' + B;
  C := '0';
  OutS := '';

  For I := 1 To (steps - 1) * 2 Do C := C + '0';

  WriteOut(GetFill(' ', Length(B) + 16)+
    GetFill('-', Length(C) + 4));

  WriteOut(' Рг "b"  '+GetFill(' ',Steps+7)+
    '|' + GetFill(' ',steps - 1) + '|#|' + A + '| Рг "a"');

  WriteOut('                           |0000000000|0|0000000000| СМ У "0"');

  WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 13) +
    GetFill('-', Length(C) + 4));


  For I := 1 To steps Do
  Begin
    OutS := OutS + '|' + B[1] + '|' + Copy(B, 2, Length(B) - 1) + '| ';
    If B[1] = '1' Then
    Begin
      C := Plus(C, A);
      OutS := OutS + '"+a"  N:' + IntToStr(I);
    End Else
    Begin
      OutS := OutS + '"+0"  N:' + IntToStr(I);
    End;
    If I <= 9 then OutS:=OutS+'  ' else OutS:=OutS+' ';
    OutS := OutS + ' |' + Copy(C, 1, steps - 1) + '|' + Copy(C, steps, 1) + '|' + Copy(C, steps + 1, steps - 1) + '|';
    WriteOut(OutS);
    B := _Shl(B);
    C := _Shl(C);
    WriteOut('| |' + GetFill(' ', Length(B) - 1) + '|' + ' сдв."b","S"'+
      ' |' + Copy(C, 1, steps - 1) + '|' + Copy(C, steps, 1) + '|' + Copy(C, steps + 1, steps - 1) + '|');
    OutS := '';
    WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 13) +
      GetFill('-', Length(C) + 4));
  End;
  WriteOut(GetFill(' ', Steps+15) +' |' + GetFill(' ', Steps - 1) + '|1| окр.     |');
  C := Plus(C, GetFill('0', steps - 1) + '1' + GetFill('0', steps - 1));
  WriteOut(GetFill(' ', Steps+15) +' |' + Copy(C, 1, steps - 1) + '|' + Copy(C, steps, 1) + '|' + Copy(C, steps + 1, steps - 1) + '| Р окр.');
  WriteOut(' Ответ:  p=0,'+ Copy(c,1,Steps-1));
  WriteOut('');
  Result:=Copy(c,1,Steps-1);
End;

Function Mul2;
Var I, steps: Integer;
  C: String;
  OutS   : String;
Begin
  WriteOut('Схема Б) ');
  WriteOut('');
  WriteOut('"S" - неподвижно, "a" сдвигается вправо, "b" сдвигается влево');
  WriteOut('');
  steps := Length(A) + 1;
  B := '0' + B;
  C := '00';
  OutS := '';
  For I := 1 To steps - 1 Do A := A + '0';
  For I := 1 To (steps - 1) * 2 Do C := C + '0';

  WriteOut('                            --------------------------');
  WriteOut(' Рг "b"                     |00|'+Copy(A,1,10)+'|'+Copy(A,11,10)+'| Рг "a" -> a1');
  WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 14) +
    GetFill('-', Length(C) + 4));


  I := 1;
  While (Pos('1', B) <> 0) Do
  Begin
    OutS := '|' + B[1] + '|' + Copy(B, 2, Length(B) - 1) + '| ';
    If B[1] = '1' Then
    Begin
      C := Plus(C, A);
      OutS := OutS + ' "+a"   N:' + IntToStr(I);
    End Else
    Begin
      OutS := OutS + ' "+0"   N:' + IntToStr(I);
    End;
    If Length(IntToStr(I)) = 1 Then OutS := OutS + ' ';
    OutS := OutS + ' |' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '| СМ';
    if I=1 then OutS := OutS+' У "0"';
    A := _Shr(A);
    B := _Shl(B);
    WriteOut(OutS);
    WriteOut('| |' + GetFill(' ', Length(B) - 1) + '|' + ' cдв. "a","b" '+
      '|00|' + Copy(A, 1, steps - 1) + '|' + Copy(A, (steps), steps - 1) + '| Рг "a"');
    inc(I);
    OutS := '';
    WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 14) +
      GetFill('-', Length(C) + 4));
  End;
  WriteOut(GetFill(' ', Steps+16) +' |  |' + GetFill(' ', Steps - 1) + '|1 oкр.    |');
  b:= '00'+GetFill('0', steps - 1) + '1' + GetFill('0', steps - 2);
  C := Plus(C,b);

  WriteOut(GetFill(' ', Steps +17)  +
    '|' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '| CM    P окр.');

  WriteOut(' Ответ:  p=0,'+ Copy(c,3,Steps-1));
  WriteOut('');
  Result:=Copy(c,3,Steps-1);
End;

Function Mul3;
Var I, steps: Integer;
  C: String;
  OutS   : String;
Begin
  WriteOut('Схема В) ');
  WriteOut('');
  WriteOut('"a" - неподвижно, "b","S" сдвигается вправо.');
  WriteOut('');

  steps := Length(A) + 1;
  B := B + '0';
  C := '00';
  OutS := '';
  For I := 1 To steps - 1 Do A := A + '0';
  For I := 1 To (steps - 1) * 2 Do C := C + '0';

  WriteOut(GetFill(' ', Length(B) + 16)+
    GetFill('-', Steps + 4));

  WriteOut(' Рг "b"  '+GetFill(' ',Steps+7)+
    '|##|' + Copy(A,1,Steps-1) + '| Рг "a"');

  WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 13) +
    GetFill('-', Length(C) + 4));



  For I := 1 To steps Do
  Begin

//  While (Pos('1', B) <> 0) Do  {!!!!!!!!!!!!!!!!!}
//  Begin
    OutS := '|' + Copy(B, 1, Length(B) - 1) + '|' + B[Length(B)] + '|';
    If B[Length(B)] = '1' Then
    Begin
      C := Plus(C, A);
      OutS := OutS + ' "+a"   N:' + IntToStr(I);
    End Else
    Begin
      OutS := OutS + ' "+0"   N:' + IntToStr(I);
    End;
    If Length(IntToStr(I)) = 1 Then OutS := OutS + ' ';
    OutS := OutS + ' |' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '|';
    C := _Shr(C);
    B := _Shr(B);
    if I=1 then OutS:=Outs+' У "0"';
    WriteOut(OutS);
    WriteOut('|' + GetFill(' ', Length(B) - 1) + '| |' + ' cдв "b","S" '+
      '|' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '|');
//    inc(I);
    OutS := '';
    WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 13) +
      GetFill('-', Length(C) + 4));
  End;
  WriteOut(GetFill(' ', Steps+15) +' |  |' + GetFill(' ', Steps - 1) + '|1 oкр.    |');
  b:= '00'+GetFill('0', steps - 1) + '1' + GetFill('0', steps - 2);
  C := Plus(C,b);


  WriteOut(' ' + GetFill(' ', Steps+15) +
    '|' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '| P oкр.');

  WriteOut(' Ответ:  p=0,'+ Copy(c,3,Steps-1));
  WriteOut('');
  Result:=Copy(c,3,Steps-1);
End;


Function Mul4;
Var I, steps: Integer;
  C: String;
  OutS   : String;
Begin
  WriteOut('Схема Г) ');
  WriteOut('');
  WriteOut('"S" - неподвижно, "a" сдвигается влево, "b" сдвигается вправо.');
  WriteOut('');

  steps := Length(A) + 1;
  B := B + '0';
  C := '0';
  OutS := '';
  For I := 1 To (steps - 1) * 2 Do C := C + '0';
  For I := 1 To (steps) Do A := '0' + A;
  WriteOut(GetFill(' ', Length(B) + 15) + GetFill('-', Length(C) + 4));

  WriteOut(GetFill(' ', Length(B) + 15)+
  '|'+ Copy(C, 1, steps - 1) + '|' + Copy(C, steps, 1) + '|' + Copy(C, steps + 1, steps - 1) + '| СМ У "0"');

  WriteOut(' Рг. "b" '+GetFill(' ', Length(B) + 6)+
      '|' + Copy(A, 1, steps - 1) + '|' + Copy(A, steps, 1) + '|' + Copy(A, steps + 1, steps - 1) + '| Рг "a" -> a1');

  WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 12) +
    GetFill('-', Length(C) + 4));
  For I := 1 To steps Do
  Begin
    OutS := '|' + Copy(B, 1, Length(B) - 1) + '|' + B[Length(B)] + '|';
    If B[Length(B)] = '1' Then
    Begin
      C := Plus(C, A);
      OutS := OutS + ' "+a"  N:' + IntToStr(I);
    End Else
    Begin
      OutS := OutS + ' "+0"  N:' + IntToStr(I);
    End;
    If Length(IntToStr(I)) = 1 Then OutS := OutS + ' ';
    OutS := OutS + ' |' + Copy(C, 1, steps - 1) + '|' + Copy(C, steps, 1) + '|' + Copy(C, steps + 1, steps - 1) + '| CM "S"';
    WriteOut(OutS);
    A := _Shl(A);
    B := _Shr(B);
    WriteOut('|' + GetFill(' ', Length(B) - 1) + '| | cдв "a","b"'+
      '|' + Copy(A, 1, steps - 1) + '|' + Copy(A, steps, 1) + '|' + Copy(A, steps + 1, steps - 1) + '| Рг "a"');
    OutS := '';
    WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 12) +
      GetFill('-', Length(C) + 4));
  End;

  WriteOut(GetFill(' ', Steps+14) +' |' + GetFill(' ', Steps - 1) + '|1| oкр.     |');


  C := Plus(C, GetFill('0', steps - 1) + '1' + GetFill('0', steps - 1));
  WriteOut(GetFill(' ', Steps+14)+
    ' |' + Copy(C, 1, steps - 1) + '|' + Copy(C, steps, 1) + '|' + Copy(C, steps + 1, steps - 1) + '| P oкр.');

  WriteOut(' Ответ:  p=0,'+ Copy(c,1,Steps-1));
  WriteOut('');
  Result:=Copy(c,1,Steps-1);
End;

Function Mul5;
Var m,i,n, steps: Integer;
  C: String;
  OutS   : String;
Begin
  steps := Length(A) + 1;
  B := '0' + B;

  OutS := '';
  m:=0;
  Repeat
  Inc(m);
  until (((Steps-1) - m) <= (exp(m*ln(2))));
//  m:=10;
  a:=a+GetFill('0',m);
  C := '00'+GetFill('0',Steps-1+m);
  n:=Steps-1;
  WriteOut('m выбирается по формуле n-m<=2^m, откуда');
  WriteOut('n='+InTToStr(n)+', m='+IntToStr(m)+', n+1='+IntToStr(n)+'+1='+IntToStr(n+1)+
  ' количество тактов.');

  WriteOut(GetFill(' ', Length(B) + 20) +
    GetFill(' ', (n div 2))+'n'+GetFill(' ', (n div 2))+' '+
    GetFill(' ', (m div 2))+'m');

//    GetFill('-', Length(C) + 4));

  WriteOut(GetFill(' ', Length(B) + 17) +
    GetFill('-', Length(C) + 4));

  WriteOut(GetFill(' ', Length(B) + 16) +
   ' |' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '| CM У "0"');

  WriteOut(' Рг. "b" '+GetFill(' ', Length(B) + 8)+
      '|00|' + Copy(A, 1, steps - 1) + '|' + Copy(A, (steps), steps - 1) + '| Рг "a"');

  WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 14) +
    GetFill('-', Length(C) + 4));

  I := 1;
  //a:0010111010
  //b:1010101111
  While i <= Steps  Do
  Begin
    OutS := '|' + B[1] + '|' + Copy(B, 2, Length(B) - 1) + '| ';
    If B[1] = '1' Then
    Begin
      C := Plus(C, A);
      OutS := OutS + ' "+a"   N:' + IntToStr(I);
    End Else
    Begin
      OutS := OutS + ' "+0"   N:' + IntToStr(I);
    End;
    If Length(IntToStr(I)) = 1 Then OutS := OutS + ' ';
    OutS := OutS + ' |' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '| CM "S"';
    A := _Shr(A);
    B := _Shl(B);
    WriteOut(OutS);
    WriteOut('| |' + GetFill(' ', Length(B) - 1) + '|' + ' сдв. "a","b" '+
      '|00|' + Copy(A, 1, steps - 1) + '|' + Copy(A, (steps), steps - 1) + '| Рг "a"');
    inc(I);
    OutS := '';
    WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 14) +
      GetFill('-', Length(C) + 4));
  End;

  WriteOut(GetFill(' ', Steps+16) +' |' + GetFill(' ', Steps + 2) + '|1 oкр.');

  a:= GetFill('0', steps + 1) + '1' + GetFill('0', m-1);
  C := Plus(C,a);

  WriteOut(GetFill(' ', Steps + 17)  +
    '|' + Copy(C, 1, 2) + '|' + Copy(C, 3, steps - 1) + '|' + Copy(C, (steps) + 2, steps - 1) + '| CM->P oкр.');

  WriteOut(' Ответ:  p=0,'+ Copy(c,3,Steps-1));
  WriteOut('');
  Result:=Copy(c,3,Steps-1);
End;

Function Mul6;
Var I,i1, steps: Integer;
  C: String;
  OutS,Reg   : String;
  OldOp : integer;
Begin
  OldOp:=0;
  steps := Length(A) + 1;
  B := B + '00';
  C := '000';
  OutS := '';
  For I := 1 To steps - 1 Do A := A + '0';
  For I := 1 To (steps - 1) * 2 Do C := C + '0';

  WriteOut(GetFill(' ', Length(B) + 3) + GetFill(' ', 14) +
    GetFill('-', Length(C) + 4));

  Reg:='000'+Copy(A,1,Steps-1);
   For i1:=1 to Length(Reg) do
      Begin
       If Reg[i1]='1' then Reg[i1]:='0' else Reg[i1]:='1';
  end;
      reg:=Plus(reg,'1');

  WriteOut(GetFill(' ', Length(B) + 3) + GetFill(' ', 14) +
    '|'+Copy(Reg,1,3)+' '+Copy(Reg,4,Length(Reg)-3)+'| [-a1]д');

  Reg:='000'+Copy(A,1,Steps-1);
  Reg:=_Shl(Reg);

  WriteOut(GetFill(' ', Length(B) + 3) + GetFill(' ', 14) +
    '|'+Copy(Reg,1,3)+' '+Copy(Reg,4,Length(Reg)-3)+'| 2a1');

  WriteOut(GetFill(' ', Length(B) + 3) + GetFill(' ', 14) +
    GetFill('-', Length(C) + 4));

  WriteOut(' Рг "b"  '+ GetFill(' ', Steps+9) +
    '|000 '+Copy(a,1,Steps-1)+'| Рг "a"');

  WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 14) +
    GetFill('-', Length(C) + 4));


  For i:=1 to (((Steps-1) div 2 )+1) do
  Begin

    C := _Shr(C);
    If (c[4] = '1') and (c[2] = '1') and (c[3] = '1') then
    c[1]:='1';
    C := _Shr(C);
    If (c[4] = '1') and (c[2] = '1') and (c[3] = '1') then
    c[1]:='1';

    B := _Shr(B);
    B := _Shr(B);

    OutS:='|' + GetFill(' ', Length(B) - 2) + '|  |' + ' cдв. "b","S" '+
      '|' + Copy(C, 1, 3) + ' ' + Copy(C, 4, steps - 1) + '|' + Copy(C, (steps) + 3, steps - 1) + '|';

    if I=1 then OutS:=OutS+' У "0"';
    WriteOut(OutS);

    OutS := '';

    OutS := '|' + Copy(B, 1, Length(B) - 2) + '|' + B[Length(B)-1]+B[Length(B)] + '|';

   If (OldOp = 0) then
   begin
    If Copy(b,Length(b)-1,2) = '00' then
     begin
      OutS := OutS + ' " +0"   N:' + IntToStr(I);
     end;
    If Copy(b,Length(b)-1,2) = '01' then
     begin
      C := Plus(C, A);
      OutS := OutS + ' " +a"   N:' + IntToStr(I);
      OldOp:=0;
     end;
    If Copy(b,Length(b)-1,2) = '10' then
     begin
      C := Plus(C, A);
      C := Plus(C, A);
      OutS := OutS + ' "+2a"   N:' + IntToStr(I);
      OldOp:=0;
     end;
    If Copy(b,Length(b)-1,2) = '11' then
     begin
      Reg:='000'+A;
      For i1:=1 to Length(Reg) do
      Begin
       If Reg[i1]='1' then Reg[i1]:='0' else Reg[i1]:='1';
      end;
      reg:=Plus(reg,'1');
      c:=Plus(c,reg);
      OutS := OutS + ' " -a"   N:' + IntToStr(I);
      OldOp:=1;
     end;
    end else
    begin
    If Copy(b,Length(b)-1,2) = '00' then
     begin
      C := Plus(C, A);
      OutS := OutS + ' " +a"   N:' + IntToStr(I);
      OldOp:=0;
     end;
    If Copy(b,Length(b)-1,2) = '01' then
     begin
      C := Plus(C, A);
      C := Plus(C, A);
      OutS := OutS + ' "+2a"   N:' + IntToStr(I);
      OldOp:=0;
     end;
    If Copy(b,Length(b)-1,2) = '10' then
     begin
      Reg:='000'+A;
      For i1:=1 to Length(Reg) do
      Begin
       If Reg[i1]='1' then Reg[i1]:='0' else Reg[i1]:='1';
      end;
      reg:=Plus(reg,'1');
      c:=Plus(c,reg);
      OutS := OutS + ' " -a"   N:' + IntToStr(I);
      OldOp:=1;
     end;
    If Copy(b,Length(b)-1,2) = '11' then
     begin
      OutS := OutS + ' " +0"   N:' + IntToStr(I);
     end;

    end;

    If Length(IntToStr(I)) = 1 Then OutS := OutS + ' ';
    OutS := OutS + ' |' + Copy(C, 1, 3) + ' ' + Copy(C, 4, steps - 1) + '|' + Copy(C, (steps) + 3, steps - 1) + '|';
    WriteOut(OutS);


    OutS := '';
    WriteOut(GetFill('-', Length(B) + 3) + GetFill(' ', 14) +
      GetFill('-', Length(C) + 4));
  End;
  WriteOut(GetFill(' ', Steps +18) + '|' + GetFill(' ', Steps+3) +
  '|1 oкр.    |');

  B:= '000'+GetFill('0', steps-1) + '1' + GetFill('0', steps - 2);
  C := Plus(C,b);
  WriteOut(GetFill(' ', Steps+18) +
    '|' + Copy(C, 1, 3) + ' ' + Copy(C, 4, steps - 1) + '|' + Copy(C, (steps) + 3, steps - 1) + '| P oкр.');
  WriteOut('');
  WriteOut(' Количество тактов: n/2+1='+IntToStr(Steps-1)+'/2+1='+IntToStr(((Steps-1) div 2) +1));
  WriteOut(' Ответ:  p=0,'+ Copy(c,4,Steps-1));
  WriteOut('');
  Result:=Copy(c,4,Steps-1);

End;

Function RendPoint(s : string; x : integer) : String;
var ss : string;
begin
 ss:=s;
 Insert('.',ss,x+1);
 Result:=ss;
 //Copy(s,1,x)+'.'+Copy(s,x+1,Length(s)-x);
end;

Function RendDR(s : string) : String;
begin
 Result:=Copy(s,1,Length(s)-1)+'|'+Copy(s,Length(s),1)+'|';
end;

Function InvertS (s : string ) : String;
var i : integer;
begin
For i:=1 to Length(s) do
if Copy(s,i,1) = '1' then s[i]:='0' else s[i]:='1';
Result:=s;
end;

Function PKtoOK(s : string; znakdigs : integer) : string;
begin
If GetFill('0',ZnakDigs) = Copy(s,1,znakdigs) then Result:=s;
If GetFill('1',ZnakDigs) = Copy(s,1,znakdigs) then
begin
s:=Copy(s,1,2)+InvertS(Copy(s,znakdigs+1,Length(s)-znakdigs+1));
Result:=s;
end;
end;

Function PKtoDK(s : string; znakdigs : integer) : string;
begin
If GetFill('0',ZnakDigs) = Copy(s,1,znakdigs) then Result:=s;
If GetFill('1',ZnakDigs) = Copy(s,1,znakdigs) then
begin
s:=Copy(s,1,2)+InvertS(Copy(s,znakdigs+1,Length(s)-znakdigs+1));
s:=Plus(s, GetFill('0',Length(s)-1)+'1');
Result:=s;
end;
end;

Function DKtoPK(s : string; znakdigs : integer) : string;
begin
If GetFill('0',ZnakDigs) = Copy(s,1,znakdigs) then Result:=s;
If GetFill('1',ZnakDigs) = Copy(s,1,znakdigs) then
begin
s:=Copy(s,1,2)+InvertS(Copy(s,znakdigs+1,Length(s)-znakdigs+1));
s:=Plus(s, GetFill('0',Length(s)-1)+'1');
Result:=s;
end;
end;


Function OKtoPK(s : string; znakdigs : integer) : string;
begin
If GetFill('0',ZnakDigs) = Copy(s,1,znakdigs) then Result:=s;
If GetFill('1',ZnakDigs) = Copy(s,1,znakdigs) then
begin
s:=Copy(s,1,2)+InvertS(Copy(s,znakdigs+1,Length(s)-znakdigs+1));
//For i:=znakdigs+1 to Length(s) do
//if Copy(s,i,1) = '1' then s[i]:='0' else s[i]:='1';
Result:=s;
end;
end;

////////////////////////////////////////////////////////////////////////////////

Function AplusBDK_2_11_a2(wa,wb,wpa,wpb : string;OpMinus : boolean) : string;

var col1,col2 : TStringList;
i : integer;
rpa,rpb,mpa,mpb : string ; {razrad poryadka}
CMP,rCMP : string;
r,s,s1: string;
DeltaP : integer;
p1,p2 : string;
begin
col1:=TStringList.Create;
col2:=TStringList.Create;
//  A := extendbin(ToBin(wa),10);
//  B := ToBinFrac(wb);
//  pa:= extendbin(ToBin(abs(wpa)),4);
//  pb:= extendbin(ToBin(abs(wpb)),4);
//
p1:=Copy(wpa,1,1)+Copy(wpa,1,1)+Copy(wpa,3,Length(wpa)-1);
p2:=Copy(wpb,1,1)+Copy(wpb,1,1)+Copy(wpb,3,Length(wpb)-1);
rpa:=Copy(wpa,1,2);
rpb:=Copy(wpb,1,2);
mpa:=Copy(wpa,3,Length(wpa));
mpb:=Copy(wpb,3,Length(wpb));

Delete(wa,2,1);
Delete(wb,2,1);

wa:=Copy(wa,1,1)+wa+'0';
wb:=Copy(wb,1,1)+wb+'0';

Col1.Add('  РП1   '+wpa+'   [П1]пк');
Col1.Add('  РП2   '+wpb+'   [П2]пк');

Col2.Add('  РM1   '+RendDR(RendPoint(wa,2))+'   [M1]пк');
Col2.Add('  РM2   '+RendDR(RendPoint(wb,2))+'   [M2]пк');

CMP:=MPA;

If wpa[1] = '1' then rCMP:='11' else rCMP:='00';
cmp:=PKtoDk(rCMP+CMP,2);

Col1.Add('  CMП  '+RendPoint(CMP,2)+'   [П1]дк');

If wpb[1] = '1' then s:='00' else s:='11';
s:=PKtoDK(s+mpb,2);
s1:=Plus(CMP,s);
Col1.Add('      +'+RendPoint(s,2)+'   [-П2]дк');
Col1.Add('       -------');
Col1.Add('       '+RendPoint(s1,2)+' ');

{If Perenos then
 begin
   s1:=Plus(s1,GetFill('0',Length(s1)-1)+'1');
   Col1.Add('            +1 ЦП');
   Col1.Add('       -------');
   Col1.Add('       '+RendPoint(s1,2)+'[dП]дк');
 end;
 }
CMP:=s1;
If Copy(s1,1,2) = '00' then DeltaP:=1 else DeltaP:=-1;
If s1 = GetFill('1',Length(s1)) then DeltaP := 0;


If DeltaP = 1 then
 begin
  i:=1;
  Repeat
//  wa:=_shr(wa);
//  wa[1]:=wa[2];
//  wa[3]:='0';
  wb:=_shr(wb);
  wb[1]:=wb[2];
  wb[3]:='0';

    Col2.Add('        '+RendDR(RendPoint(wb,2))+'   сдв.№'+IntToStr(i));
    Col1.Add('      +'+'11.'+GetFill('1',Length(CMP)-2));
    Col1.Add('       -------');
    CMP:=Plus(CMP,GetFill('1',Length(CMP)-1)+'1');
    Col1.Add('       '+RendPoint(CMP,2));

{    If (CMP <> GetFill('1',Length(CMP))) then
      begin
        CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
        Col1.Add('            +1 ЦП');
        Col1.Add('       -------');
        Col1.Add('       '+RendPoint(CMP,2));
      end;
 }
   Inc(i);
  until (CMP = GetFill('0',Length(CMP)));
  Col1[Col1.Count-1]:=Col1[Col1.Count-1]+'  [dП=0]дк';
  Col2.Add('                           | |');
  wa:=PKtoDK(wa,2);
  wb:=PKtoDK(wb,2);
  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   [M1]дк');

  If OpMinus then
  begin
  wb:=InvertS(wb);
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [-M2]дк');
  end
  else
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [M2]дк');

  Col2.Add('        '+GetFill('-',Length(wa)+3));
  r:=Plus(wa,wb);
  CMP:=PKtoDK(p1,2);
  Col1.Add('  CMП  '+RendPoint(CMP,2)+'  [П1]дк');
 end;

If DeltaP = -1 then
 begin
  i:=1;
  Repeat
  wa:=_shr(wa);
  wa[1]:=wa[2];
  wa[3]:='0';

  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   сдв.№'+IntToStr(i));
    Col1.Add('      +'+'00.'+GetFill('0',Length(CMP)-3)+'1');
    Col1.Add('       -------');
    CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');


    Col1.Add('       '+RendPoint(CMP,2));

   Inc(i);
  until (CMP = GetFill('0',Length(CMP)));
  Col1[Col1.Count-1]:=Col1[Col1.Count-1]+'  [dП=0]дк';
  wa:=PKtoDK(wa,2);
  wb:=PKtoDK(wb,2);
  Col2.Add('                           | |');
  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   [M1]дк');


  If OpMinus then
  begin
  wb:=InvertS(wb);
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [-M2]дк');
  end
  else
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [M2]дк');


  Col2.Add('        '+GetFill('-',Length(wa)+3));
  r:=Plus(wa,wb);
  CMP:=PKtoDK(p2,2);
  Col1.Add('  CMП  '+RendPoint(CMP,2)+'  [П2]дк');
 end;
  Col2.Add('        '+RendDR(RendPoint(r,2)));



  {
  If perenos then
   begin
    r:=Plus(r,GetFill('0',Length(r)-1)+'1');
    Col2.Add('          '+GetFill(' ',Length(r)-2)+'|1|  ЦП');
    Col2.Add('        '+GetFill('-',Length(wa)+3));
    Col2.Add('        '+RendDR(RendPoint(r,2)));
   end;
   !!!!!!!!!!!!!!!!! 2002 !!!!!!!!!!!!!!!!!!!!!
   I dont know!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   }


//  If Copy(r,1,2)='11' then
//   begin
//    r:=Plus(r,'00'+GetFill('1',Length(r)-2));
//    Col2.Add('       +00.'+GetFill('1',Length(r)-2));
//    Col2.Add('        '+GetFill('-',Length(wa)+3));
//   end;

  r:=DKtoPK(r,2);
  Col2.Add('        '+RendDR(RendPoint(r,2))+'  [MP]пк');

  //I think it is not right, but...
  if r[1] = '0' then
  if (r[3] <> '0') and (r[Length(r)] ='1') then
   begin
    r:=Plus(r,GetFill('0',Length(r)-1)+'1');
    Col2.Add('          '+GetFill(' ',Length(r)-2)+'|1|  Окр');
    Col2.Add('        '+GetFill('-',Length(wa)+3));
   end;

  Col2.Add('        '+RendDR(RendPoint(r,2))+'');





 While r[3] = '0' do
  begin
  Col1.Add('      +'+'11.'+GetFill('1',Length(CMP)-3)+'0');
  r:=_shl(r);
  r[2]:=r[1];
  r[Length(r)]:=r[Length(r)-1];
  r[Length(r)-1]:='0';
  Col1.Add('       -------');
  CMP:=Plus(CMP,GetFill('1',Length(CMP)-1)+'0');
  Col1.Add('       '+CMP);
  CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
  Col1.Add('            +1 ЦП');
  Col1.Add('       -------');
  Col1.Add('       '+RendPoint(CMP,2));
  end;
  CMP:=DKtoPK(CMP,2);
  Col1.Add('       '+RendPoint(CMP,2)+'  [ПP]пк');


 Delete(CMP,1,1);
 Delete(r,1,1);
 Delete(r,Length(r),1);
 Col1.Add('');
 Col1.Add('  Ответ:'+RendPoint(CMP,1)+'.'+
   RendPoint(r,1));

For i:=0 to Col1.Count-1 do
If (Col2.Count -1 >= i) then
WriteOut(Col1[i]+GetFill(' ',25-LEngth(Col1[i]))+Col2[i]) else WriteOut(Col1[i]);

col1.free;
col2.free;
end;

////////////////////////////////////////////////////////////////////////////////

Function AplusBDK_2_11_b(wa,wb,wpa,wpb : string;OpMinus : boolean) : string;

var col1,col2 : TStringList;
i : integer;
rpa,rpb,mpa,mpb : string ; {razrad poryadka}
CMP,rCMP : string;
r,s,s1: string;
DeltaP : integer;
p1,p2 : string;
begin
col1:=TStringList.Create;
col2:=TStringList.Create;
//  A := extendbin(ToBin(wa),10);
//  B := ToBinFrac(wb);
//  pa:= extendbin(ToBin(abs(wpa)),4);
//  pb:= extendbin(ToBin(abs(wpb)),4);
//
p1:=Copy(wpa,1,1)+Copy(wpa,1,1)+Copy(wpa,3,Length(wpa)-1);
p2:=Copy(wpb,1,1)+Copy(wpb,1,1)+Copy(wpb,3,Length(wpb)-1);
rpa:=Copy(wpa,1,2);
rpb:=Copy(wpb,1,2);
mpa:=Copy(wpa,3,Length(wpa));
mpb:=Copy(wpb,3,Length(wpb));



Delete(wa,2,1);
Delete(wb,2,1);

s:=Copy(wa,1,1)+wa;
s:=PKTODK(s,2);
Delete(s,1,1);
WriteOut('   '+RendPoint(Copy(PKTODK(p1,2),2,Length(PKTODK(p1,2))),1)+'.'+
               RendPoint(s,1)+' ДК');

s:=Copy(wb,1,1)+wb;
s:=PKTODK(s,2);
Delete(s,1,1);
WriteOut('   '+RendPoint(Copy(PKTODK(p2,2),2,Length(PKTODK(p2,2))),1)+'.'+
               RendPoint(s,1)+' ДК');

WriteOut('   ');


wa:=Copy(wa,1,1)+wa+'0';
wb:=Copy(wb,1,1)+wb+'0';

Col1.Add('  РП1   '+RendPoint(Copy(PKTODK(p1,2),2,Length(PKTODK(p1,2))),1)+'   [П1]дк');
Col1.Add('  РП2   '+RendPoint(Copy(PKTODK(p2,2),2,Length(PKTODK(p2,2))),1)+'   [П2]дк');


Col2.Add('  РM1   '+RendDR(RendPoint(PKTODK(wa,2),2))+'   [M1]дк');
Col2.Add('  РM2   '+RendDR(RendPoint(PKTODK(wb,2),2))+'   [M2]дк');




CMP:=MPA;

If wpa[1] = '1' then rCMP:='11' else rCMP:='00';
cmp:=PKtoDk(rCMP+CMP,2);

Col1.Add('  CMП  '+RendPoint(CMP,2)+'   [П1]дк');

If wpb[1] = '1' then s:='00' else s:='11';
s:=PKtoDK(s+mpb,2);
s1:=Plus(CMP,s);
Col1.Add('      +'+RendPoint(s,2)+'   [-П2]дк');
Col1.Add('       -------');
Col1.Add('       '+RendPoint(s1,2)+' ');

{If Perenos then
 begin
   s1:=Plus(s1,GetFill('0',Length(s1)-1)+'1');
   Col1.Add('            +1 ЦП');
   Col1.Add('       -------');
   Col1.Add('       '+RendPoint(s1,2)+'[dП]дк');
 end;
 }
CMP:=s1;
If Copy(s1,1,2) = '00' then DeltaP:=1 else DeltaP:=-1;
If s1 = GetFill('1',Length(s1)) then DeltaP := 0;


If DeltaP = 1 then
 begin
  i:=1;
  Repeat
//  wa:=_shr(wa);
//  wa[1]:=wa[2];
//  wa[3]:='0';
  wb:=_shr(wb);
  wb[1]:=wb[2];
  wb[3]:='0';

    Col2.Add('        '+RendDR(RendPoint(wb,2))+'   сдв.№'+IntToStr(i));
    Col1.Add('      +'+'11.'+GetFill('1',Length(CMP)-2));
    Col1.Add('       -------');
    CMP:=Plus(CMP,GetFill('1',Length(CMP)-1)+'1');
    Col1.Add('       '+RendPoint(CMP,2));

{    If (CMP <> GetFill('1',Length(CMP))) then
      begin
        CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
        Col1.Add('            +1 ЦП');
        Col1.Add('       -------');
        Col1.Add('       '+RendPoint(CMP,2));
      end;
 }
   Inc(i);
  until (CMP = GetFill('0',Length(CMP)));
  Col1[Col1.Count-1]:=Col1[Col1.Count-1]+'  [dП=0]дк';
  Col2.Add('                           | |');
  wa:=PKtoDK(wa,2);
  wb:=PKtoDK(wb,2);
  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   [M1]дк');

  If OpMinus then
  begin
  wb:=InvertS(wb);
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [-M2]дк');
  end
  else
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [M2]дк');

  Col2.Add('        '+GetFill('-',Length(wa)+3));
  r:=Plus(wa,wb);
  CMP:=PKtoDK(p1,2);
  Col1.Add('  CMП  '+RendPoint(CMP,2)+'  [П1]дк');
 end;

If DeltaP = -1 then
 begin
  i:=1;
  Repeat
  wa:=_shr(wa);
  wa[1]:=wa[2];
  wa[3]:='0';

  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   сдв.№'+IntToStr(i));
    Col1.Add('      +'+'00.'+GetFill('0',Length(CMP)-3)+'1');
    Col1.Add('       -------');
    CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');


    Col1.Add('       '+RendPoint(CMP,2));

   Inc(i);
  until (CMP = GetFill('0',Length(CMP)));
  Col1[Col1.Count-1]:=Col1[Col1.Count-1]+'  [dП=0]дк';
  wa:=PKtoDK(wa,2);
  wb:=PKtoDK(wb,2);
  Col2.Add('                           | |');
  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   [M1]дк');


  If OpMinus then
  begin
  wb:=InvertS(wb);
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [-M2]дк');
  end
  else
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [M2]дк');


  Col2.Add('        '+GetFill('-',Length(wa)+3));
  r:=Plus(wa,wb);
  CMP:=PKtoDK(p2,2);
  Col1.Add('  CMП  '+RendPoint(CMP,2)+'  [П2]дк');
 end;
  Col2.Add('        '+RendDR(RendPoint(r,2)));



  {
  If perenos then
   begin
    r:=Plus(r,GetFill('0',Length(r)-1)+'1');
    Col2.Add('          '+GetFill(' ',Length(r)-2)+'|1|  ЦП');
    Col2.Add('        '+GetFill('-',Length(wa)+3));
    Col2.Add('        '+RendDR(RendPoint(r,2)));
   end;
   !!!!!!!!!!!!!!!!! 2002 !!!!!!!!!!!!!!!!!!!!!
   I dont know!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   }


//  If Copy(r,1,2)='11' then
//   begin
//    r:=Plus(r,'00'+GetFill('1',Length(r)-2));
//    Col2.Add('       +00.'+GetFill('1',Length(r)-2));
//    Col2.Add('        '+GetFill('-',Length(wa)+3));
//   end;

  r:=DKtoPK(r,2);
  Col2.Add('        '+RendDR(RendPoint(PKTODK(r,2),2))+'  [MP]дк');

  //I think it is not right, but...
  if r[1] = '0' then
  if (r[3] <> '0') and (r[Length(r)] ='1') then
   begin
    r:=Plus(r,GetFill('0',Length(r)-1)+'1');
    Col2.Add('          '+GetFill(' ',Length(r)-2)+'|1|  Окр');
    Col2.Add('        '+GetFill('-',Length(wa)+3));
   end;

  Col2.Add('        '+RendDR(RendPoint(r,2))+'');





 While r[3] = '0' do
  begin
  Col1.Add('      +'+'11.'+GetFill('1',Length(CMP)-3)+'0');
  r:=_shl(r);
  r[2]:=r[1];
  r[Length(r)]:=r[Length(r)-1];
  r[Length(r)-1]:='0';
  Col1.Add('       -------');
  CMP:=Plus(CMP,GetFill('1',Length(CMP)-1)+'0');
  Col1.Add('       '+CMP);
  CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
  Col1.Add('            +1 ЦП');
  Col1.Add('       -------');
  Col1.Add('       '+RendPoint(CMP,2));
  end;
  CMP:=DKtoPK(CMP,2);
  Col1.Add('       '+RendPoint(PKTODK(CMP,1),2)+'  [ПP]дк');


 Delete(CMP,1,1);
 Delete(r,1,1);
 Delete(r,Length(r),1);
 Col1.Add('');

 s:=PKTODK(CMP,1);
 if cmp[1] = '1' then
 begin
 delete(s,2,1);
 end;

 s1:=PKTODK(r,1);
 if r[1] = '1' then
 begin
 delete(s1,2,1);
 end;

 Col1.Add('  Ответ:'+RendPoint(s,1)+'.'+
   RendPoint(s1,1));

For i:=0 to Col1.Count-1 do
If (Col2.Count -1 >= i) then
WriteOut(Col1[i]+GetFill(' ',25-LEngth(Col1[i]))+Col2[i]) else WriteOut(Col1[i]);

col1.free;
col2.free;
end;

////////////////////////////////////////////////////////////////////////////////

Function AplusBOK(wa,wb,wpa,wpb : string;OpMinus : boolean) : string;

var col1,col2 : TStringList;
i : integer;
rpa,rpb,mpa,mpb : string ; {razrad poryadka}
CMP,rCMP : string;
r,s,s1: string;
DeltaP : integer;
p1,p2 : string;
begin
col1:=TStringList.Create;
col2:=TStringList.Create;
//  A := extendbin(ToBin(wa),10);
//  B := ToBinFrac(wb);
//  pa:= extendbin(ToBin(abs(wpa)),4);
//  pb:= extendbin(ToBin(abs(wpb)),4);
//
p1:=Copy(wpa,1,1)+Copy(wpa,1,1)+Copy(wpa,3,Length(wpa)-1);
p2:=Copy(wpb,1,1)+Copy(wpb,1,1)+Copy(wpb,3,Length(wpb)-1);
rpa:=Copy(wpa,1,2);
rpb:=Copy(wpb,1,2);
mpa:=Copy(wpa,3,Length(wpa));
mpb:=Copy(wpb,3,Length(wpb));

Delete(wa,2,1);
Delete(wb,2,1);

wa:=Copy(wa,1,1)+wa+'0';
wb:=Copy(wb,1,1)+wb+'0';

Col1.Add('  РП1   '+wpa+'   [П1]пк');
Col1.Add('  РП2   '+wpb+'   [П2]пк');

Col2.Add('  РM1   '+RendDR(RendPoint(wa,2))+'   [M1]пк');
Col2.Add('  РM2   '+RendDR(RendPoint(wb,2))+'   [M2]пк');

CMP:=MPA;

If wpa[1] = '1' then rCMP:='11' else rCMP:='00';
cmp:=PKtoOk(rCMP+CMP,2);
//cmp:=s;
//FOr i:=1 to Length(mpa) do If CMP[i] = '1' then CMP[i] := '0' else CMP[i] := '1';

Col1.Add('  CMП  '+RendPoint(CMP,2)+'   [П1]oк');

If wpb[1] = '1' then s:='00' else s:='11';
s:=PKtoOK(s+mpb,2);
s1:=Plus(CMP,s);
Col1.Add('      +'+RendPoint(s,2)+'   [-П2]oк');
Col1.Add('       -------');
Col1.Add('       '+RendPoint(s1,2)+' ');

If Perenos then
 begin
   s1:=Plus(s1,GetFill('0',Length(s1)-1)+'1');
   Col1.Add('            +1 ЦП');
   Col1.Add('       -------');
   Col1.Add('       '+RendPoint(s1,2)+'[dП]ок');
 end;
CMP:=s1;
If Copy(s1,1,2) = '00' then DeltaP:=1 else DeltaP:=-1;
If s1 = GetFill('1',Length(s1)) then DeltaP := 0;


If DeltaP = 1 then
 begin
  i:=1;
  Repeat
//  wa:=_shr(wa);
//  wa[1]:=wa[2];
//  wa[3]:='0';
  wb:=_shr(wb);
  wb[1]:=wb[2];
  wb[3]:='0';

    Col2.Add('        '+RendDR(RendPoint(wb,2))+'   сдв.№'+IntToStr(i));
    Col1.Add('      +'+'11.'+GetFill('1',Length(CMP)-3)+'0');
    Col1.Add('       -------');
    CMP:=Plus(CMP,GetFill('1',Length(CMP)-1)+'0');
    Col1.Add('       '+RendPoint(CMP,2));
    If (CMP <> GetFill('1',Length(CMP))) then
      begin
        CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
        Col1.Add('            +1 ЦП');
        Col1.Add('       -------');
        Col1.Add('       '+RendPoint(CMP,2));
      end;

   Inc(i);
  until (CMP = GetFill('1',Length(CMP)));
  Col1[Col1.Count-1]:=Col1[Col1.Count-1]+'  [dП=0]ок';
  Col2.Add('                           | |');
  wa:=PKtoOK(wa,2);
  wb:=PKtoOK(wb,2);
  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   [M1]oк');

  If OpMinus then
  begin
  wb:=InvertS(wb);
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [-M2]oк');
  end
  else
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [M2]oк');

  Col2.Add('        '+GetFill('-',Length(wa)+3));
  r:=Plus(wa,wb);
  CMP:=PKtoOK(p1,2);
  Col1.Add('  CMП  '+RendPoint(CMP,2)+'  [П1]oк');
 end;

If DeltaP = -1 then
 begin
  i:=1;
  Repeat
  wa:=_shr(wa);
  wa[1]:=wa[2];
  wa[3]:='0';

//  wb:=_shr(wb);
//  wb[1]:=wb[2];
//  wb[3]:='0';


  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   сдв.№'+IntToStr(i));
    Col1.Add('      +'+'00.'+GetFill('0',Length(CMP)-3)+'1');
    Col1.Add('       -------');
    CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
    Col1.Add('       '+RendPoint(CMP,2));

   Inc(i);
  until (CMP = GetFill('1',Length(CMP)));
  Col1[Col1.Count-1]:=Col1[Col1.Count-1]+'  [dП=0]ок';
  wa:=PKtoOK(wa,2);
  wb:=PKtoOK(wb,2);
  Col2.Add('                           | |');
  Col2.Add('        '+RendDR(RendPoint(wa,2))+'   [M1]oк');


  If OpMinus then
  begin
  wb:=InvertS(wb);
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [-M2]oк');
  end
  else
  Col2.Add('       +'+RendDR(RendPoint(wb,2))+'   [M2]oк');


  Col2.Add('        '+GetFill('-',Length(wa)+3));
  r:=Plus(wa,wb);
  CMP:=PKtoOK(p2,2);
  Col1.Add('  CMП  '+RendPoint(CMP,2)+'  [П2]oк');
 end;
  Col2.Add('        '+RendDR(RendPoint(r,2)));

  If perenos then
   begin
//    Col2.Add('        '+RendDR(RendPoint(r,2))+'');
    r:=Plus(r,GetFill('0',Length(r)-1)+'1');
    Col2.Add('          '+GetFill(' ',Length(r)-2)+'|1|  ЦП');
    Col2.Add('        '+GetFill('-',Length(wa)+3));
    Col2.Add('        '+RendDR(RendPoint(r,2)));
   end;


//  If Copy(r,1,2)='11' then
//   begin
//    r:=Plus(r,'00'+GetFill('1',Length(r)-2));
//    Col2.Add('       +00.'+GetFill('1',Length(r)-2));
//    Col2.Add('        '+GetFill('-',Length(wa)+3));
//   end;
  r:=OKtoPK(r,2);
  Col2.Add('        '+RendDR(RendPoint(r,2))+'  [MP]пк');

  if (r[3] <> '0') and (r[Length(r)] ='1') then
   begin
//
    r:=Plus(r,GetFill('0',Length(r)-1)+'1');
    Col2.Add('          '+GetFill(' ',Length(r)-2)+'|1|  Окр');
    Col2.Add('        '+GetFill('-',Length(wa)+3));
   end;

  Col2.Add('        '+RendDR(RendPoint(r,2))+'');





 While r[3] = '0' do
  begin
  Col1.Add('      +'+'11.'+GetFill('1',Length(CMP)-3)+'0');
  r:=_shl(r);
  r[2]:=r[1];
  r[Length(r)]:=r[Length(r)-1];
  r[Length(r)-1]:='0';
  Col1.Add('       -------');
  CMP:=Plus(CMP,GetFill('1',Length(CMP)-1)+'0');
  Col1.Add('       '+CMP);
  CMP:=Plus(CMP,GetFill('0',Length(CMP)-1)+'1');
  Col1.Add('            +1 ЦП');
  Col1.Add('       -------');
  Col1.Add('       '+RendPoint(CMP,2));
  end;
  CMP:=OKtoPK(CMP,2);
  Col1.Add('       '+RendPoint(CMP,2)+'  [ПP]пк');


 Delete(CMP,1,1);
 Delete(r,1,1);
 Delete(r,Length(r),1);
 Col1.Add('');
 Col1.Add('  Ответ:'+RendPoint(CMP,1)+'.'+
   RendPoint(r,1));

For i:=0 to Col1.Count-1 do
If (Col2.Count -1 >= i) then
WriteOut(Col1[i]+GetFill(' ',25-LEngth(Col1[i]))+Col2[i]) else WriteOut(Col1[i]);

col1.free;
col2.free;
end;

procedure Zaoch_5_1;
var ast,bst:string;
begin
writeout('5) Умножение дробей');
writeout('');
ast:=tobinfrac(a);
bst:=tobinfrac(b);
writeout('');
Mul1(ast,bst);
writeout('');
Mul2(ast,bst);
writeout('');
Mul3(ast,bst);
writeout('');
Mul4(ast,bst);
writeout('Умножение на два разряда множителя');
writeout('');
Mul6(ast,bst);
end;

Procedure ControlMod3(wa,wb : word{,res : word}{;operation : byte}); {0: "+"; 1: "*"}
 function sign(x : integer) : integer;
 Begin
   Result := 0;
   if x > 0 then Result:=1;
   if x < 0 then Result:=-1;
   if x = 0 then Result:=0;
 End;

const signs : array[1..4,1..2] of char = (('0','0'),('0','1'),('1','0'),('1','1'));
      signsI: array[1..4,1..2] of integer = ((1,1),(1,-1),(-1,1),(-1,-1));

var
    sa,sb,ress : string;
    saB,sbB,ressB : string; {Back}
    saA,sbA,ressA : string; {Addit}
    i : integer;
    res : integer;
Begin
 Writeout('7)     Выполнить контроль по модулю 3 всех арифметических операций');
 Writeout('7.1    Контроль операции сложения');
 Writeout(' (a+b) mod 3 = ((a mod 3)+(b mod 3)) mod 3');
 Writeout('');


 for i:=1 to 4 do
 begin

 res:=SignsI[i,1]*wa + SignsI[i,2]*wb;


 If Res > 1000 then Res:=Res-1000;
 If Res < -1000 then Res:=Res+1000;
 Res:=Abs(Res);

 sa:=extendbin(ToBinFrac(wa),10);
 sb:=extendbin(ToBinFrac(wb),10);
 ress:=extendbin(ToBinFrac(res),10);

 insert(signs[i,1],sa,1);
 insert(signs[i,2],sb,1);
 if (SignsI[i,1]*wa/1000 + SignsI[i,2]*wb/1000) > 0 then
         insert('0',ress,1) else insert('1',ress,1);

 insert('.',sa,2);
 insert('.',sb,2);
 insert('.',ress,2);

 saB:=InBackCode(sa);
 sbB:=InBackCode(sb);
 ressB:=InBackCode(ress);

 saA:=InAdditCode(sa);
 sbA:=InAdditCode(sb);
 ressA:=InAdditCode(ress);

 Writeout('('+ress+'пк) mod 3 = (('+sa+'пк mod 3)+('+sb+'пк mod 3)) mod 3');
 Writeout('('+ressB+'ок) mod 3 = (('+saB+'ок mod 3)+('+sbB+'ок mod 3)) mod 3');
 Writeout('('+ressA+'дк) mod 3 = (('+saA+'дк mod 3)+('+sbA+'дк mod 3)) mod 3');
 Writeout('Остаток ra = (a mod 3) = '+extendbin(ToBin(Abs(SignsI[i,1]*wa mod 3)),2));
 Writeout('Остаток rb = (b mod 3) = '+extendbin(ToBin(Abs(SignsI[i,2]*wb mod 3)),2));
 Writeout('Сумма остатков по mod 3 = ('+extendbin(ToBin(Abs(wa mod 3)),2)+'+'+extendbin(ToBin(Abs(wb mod 3)),2)+' mod 3) = '+extendbin(ToBin(Abs(((SignsI[i,1]*wa mod 3)+(SignsI[i,2]*wb mod 3)) mod 3)),2));
 Writeout('Остаток результата по mod 3 = '+extendbin(tobin(Abs((SignsI[i,1]*wa + SignsI[i,2]*wb) mod 3)),2));
 Writeout('');
 end;

 Writeout('7.1    Контроль операции умножения');
 Writeout(' (a*b) mod 3 = ((a mod 3)*(b mod 3)) mod 3');
 Writeout('');


 for i:=1 to 4 do
 begin
 res:=SignsI[i,1]*wa * SignsI[i,2]*wb div 1000;


 sa:=extendbin(ToBinFrac(wa),10);
 sb:=extendbin(ToBinFrac(wb),10);
 ress:=extendbin(ToBinFrac(Abs(res)),10);

 insert(signs[i,1],sa,1);
 insert(signs[i,2],sb,1);
 if (SignsI[i,1]*wa/1000 * SignsI[i,2]*wb/1000) > 0 then
         insert('0',ress,1) else insert('1',ress,1);

 insert('.',sa,2);
 insert('.',sb,2);
 insert('.',ress,2);

 saB:=InBackCode(sa);
 sbB:=InBackCode(sb);
 ressB:=InBackCode(ress);

 saA:=InAdditCode(sa);
 sbA:=InAdditCode(sb);
 ressA:=InAdditCode(ress);

 Writeout('('+ress+'пк) mod 3 = (('+sa+'пк mod 3)*('+sb+'пк mod 3)) mod 3');
 Writeout('('+ressB+'ок) mod 3 = (('+saB+'ок mod 3)*('+sbB+'ок mod 3)) mod 3');
 Writeout('('+ressA+'дк) mod 3 = (('+saA+'дк mod 3)*('+sbA+'дк mod 3)) mod 3');
 Writeout('Остаток ra = (a mod 3) = '+extendbin(ToBin(wa mod 3),2));
 Writeout('Остаток rb = (b mod 3) = '+extendbin(ToBin(wb mod 3),2));
 Writeout('Сумма остатков по mod 3 = ('+extendbin(ToBin(Abs(wa mod 3)),2)+'+'+extendbin(ToBin(Abs(wb mod 3)),2)+' mod 3) = '+extendbin(ToBin(Abs(((wa mod 3)*(wb mod 3)) mod 3)),2));
 Writeout('Остаток результата по mod 3 = '+extendbin(tobin(Abs((SignsI[i,1]*wa * SignsI[i,2]*wb) mod 3)),2));
 Writeout('');
 end;

End;


End.

