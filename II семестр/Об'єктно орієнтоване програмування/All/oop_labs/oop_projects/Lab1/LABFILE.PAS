Program LabFile;

  uses crt, lab1mod;

  var
    PlaneData: TPlaneData;
    DataFile, TmpFile: TPlaneFile;
    n, pos, number: integer;
  
  begin
    assign(DataFile, 'data.dat');
    repeat
      writeln('Choose operation');
      writeln('1. Create File');
      writeln('2. Add 1 to end');
      writeln('3. Add n to end');
      writeln('4. Delete 1 from start');
      writeln('5. Delete n from position');
      writeln('6. Show last');
      writeln('7. Show all');
      writeln('8. Exit');
      readln(number);
      case number of
        1:
          begin
            writeln('number of records: ');
            readln(n);
            CreateFile(DataFile, n);
          end;
        2:
          AddToEnd(DataFile, 1);
        3:
          begin
            writeln('number of records to add to end');
            readln(n);
            AddToEnd(DataFile, n);
          end;
        4:
          DeleteFromPos(DataFile, 1, 1);
        5:
          begin
            writeln('number of records to delete');
            readln(n);
            writeln('enter a position');
            readln(pos);
            DeleteFromPos(DataFile, n, pos);
          end;
        6:
          begin
            writeln('Last record:');
            ShowLast(DataFile);
            writeln;
          end;
        7:
          begin
            writeln('File: ');
            ShowFile(DataFile); 
            writeln;
          end;
      end;
    until number = 8;
  end.