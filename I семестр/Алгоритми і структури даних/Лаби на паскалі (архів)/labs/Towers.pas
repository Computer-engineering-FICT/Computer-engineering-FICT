program towers;
  var 
    NRIng : Integer;
  procedure MoweTower(N,A,C,B: Integer);
    procedure MoweRing(Out_,In_ : Integer);
      begin
        Writeln (Out_,'-->',In_)
      end; {MoweRing}
    begin
     if n>0 then
       begin
         MoweTower(N-1,A,B,C);
         MoweRing (A,C);
        MoweTower(N-1,B,C,A)
      end
    end; {MoweTower}
  begin
    WriteLn ('������� ���������� �����');
    ReadLn (NRing);
    WriteLn('���������� ��������:');
    MoweTower(NRIng,1,3,2)
 end. {Prim4_9}

{��������� MoweRing ��������� ������� �� ����� ����� ����,
� ������� ��������� � �� ������� ����������� ���������
������ (���� A ������������� 1, B � 2, C � 3). ����� ����,
��������� ������ ������������� � ������ ��������� ������,
�.�. ������ ����� ���� ������ ������ ��� ��������� �������� N.}