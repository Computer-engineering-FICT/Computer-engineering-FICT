program Vector;
  const Vmin = 1;
        Vmax = 15;
  type  TIndex = Vmin..Vmax;
        TVector = array [TIndex] of integer;
        
  function InputOfArray (var X:TVector):integer;
    var i: integer;
    begin
      write('Введiть розмiр масиву: ');
      readln(Result);
      if Result > Vmax then Result := Vmax;
      writeln('Введiть значення');
      for i := Vmin to Result do
        begin
          write('X[',i,']=');
          readln(X[i]);
        end;
    end;

  procedure Sorting1(var X: TVector; HighIndex: TIndex);
    var i,j: TIndex;
        z: Integer;
    begin
      for i := Vmin to HighIndex-1 do
        begin
          for j := i+1 to HighIndex do
            begin
              if X[i] > X[j] then
              begin
                z := X[j];
                X[j] := X[i];
                X[i] := z;
              end;
            end;
        end;
    end;

  function SearchingTheMaxValue(var Vector: TVector; HighestIndex: TIndex): integer;
    var c: TIndex;
    begin
      Result := Vector[Vmin];
      for c := Vmin + 1 to HighestIndex do
      if Result < Vector[c] then Result := Vector[c];
    end;

var ArraySize, Action: integer;
    c: TIndex;
    x: TVector;
begin
  ArraySize:=InputOfArray(X);
    writeln('Виберiть дiю:');
    writeln('             1. Сортувати масив');
    writeln('             2. Знайти максимальне значення в масивi');
    write('Ваш вибiр: ');
    readln(Action);
    case Action of      
      1: begin
           Sorting1(X, ArraySize);
              writeln('Вiдсортований масив:');
              for c := Vmin to ArraySize do writeln('X[',c,']=',X[c]);
         end;
      2: writeln('Максимальне значення: ', SearchingTheMaxValue(X, ArraySize));
    end;
end.