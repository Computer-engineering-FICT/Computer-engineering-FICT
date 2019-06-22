-----------------------------------
--    ������������ ������ � 1
--�� ������������� ����������������
--�������� �.�. ������ ��-21
--F  a = (B*(Z*MX))
--11 ������� 2005 �.
-----------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Data;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Data;

procedure MainProgram is
  Sem1,Sem2,Sem3: Suspension_Object;   -- ��������
  Sku1,Sku2: Suspension_Object;
  B,Z:Vector;
  MX:Matrix;
  a:integer;
  Task T1;
  Task T2;

  Task body T1 is
    Z1:Vector; 
    a1,c1:integer;  	
  begin
    put_line("Process T1 started");
    New_Line;
    Vector_Input(Z,"C:\Ada\Z.dat");
    Set_True(Sem2);                   --������ T2           S21
    Suspend_Until_True(Sem1);         --����� ������ �� T2  W21
    Set_True(Sku1);
    Suspend_Until_True(Sku1);         --����������� Z1:=Z   ��
      for i in 1..N loop
        Z1(i):=Z(i);
      end loop;
    Set_True(Sku1);
    a1:=0;
    for i in 1..h loop                --���� �1
      for j in 1..n loop
        a1:=a1+b(i)*Z1(j)*MX(j)(i);		
      end loop;
    end loop;
    Set_True(Sku2);
    Suspend_Until_True(Sku2);         --���� a:=a+a1        ��
      a:=a+a1;
    Set_True(Sku2);
    Suspend_Until_True(Sem3);         --����� ������ �� T2  W22
    put(a);                           --����� a
    New_line;
    put_line("Process T1 finished");	
    New_Line;
  end T1;

  Task body T2 is
    Z2:Vector; 
    a2,c2:integer;  	
  begin	
    put_line("Process T2 started");
    New_Line;
    Vector_Input(B,"C:\Ada\B.dat");
    Matrix_Input(MX,"C:\Ada\MX.dat");
    Set_True(Sem1);                  --������ T1            S11
    Suspend_Until_True(Sem2);        --����� ������ �� T1   W11
    Suspend_Until_True(Sku1);        --����������� Z2:=Z    ��
      for i in 1..N loop
        Z2(i):=Z(i);
      end loop;
    Set_True(Sku1);
    a2:=0;
    for i in h+1..n loop             --���� �2
      for j in 1..n loop
        a2:=a2+b(i)*Z2(j)*MX(j)(i);		
      end loop;
    end loop;
    Suspend_Until_True(Sku2);        --���� a:=a+a2         ��
      a:=a+a2;
    Set_True(Sku2);
    Set_True(Sem3);                  --������ T1            S12    
    put_line("Process T2 finished");	
    New_Line;
  end T2;
begin
  New_Line;
  put_line("Main program started");
  New_Line;
end MainProgram;
