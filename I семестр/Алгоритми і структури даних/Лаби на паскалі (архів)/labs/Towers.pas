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
    WriteLn ('¬ведите количество колец');
    ReadLn (NRing);
    WriteLn('–езультаты переноса:');
    MoweTower(NRIng,1,3,2)
 end. {Prim4_9}

{процедура MoweRing позвол€ет вывести на экран номер иглы,
с которой снимаетс€ и на которую переноситс€ очередное
кольцо (игле A соответствует 1, B Ц 2, C Ц 3).  роме того,
программа весьма чувствительна к объему свободной пам€ти,
т.е. задача может быть решена только дл€ небольших значений N.}