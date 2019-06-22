Unit Lab1mod;

  Interface
  
  type
    TPlaneData = record
      Manufacturer: string[15];
      Model: string[10];
      Length: integer;
      Height: integer;
      Wingspan: integer;
    end;

    TPlaneFile = file of TPlaneData;

  var
    TmpFile: TPlaneFile;

  Procedure CreateFile(var DataFile: TPlaneFile; n: integer);
  Procedure AddToEnd(var DataFile: TPlaneFile; n: integer);
  Procedure DeleteFromPos(var DataFile: TPlaneFile; n, pos: integer);
  Procedure ShowFile(var DataFile: TPlaneFile);
  Procedure ShowLast(var DataFile: TPlaneFile);

  Implementation

  procedure InputRecord(var PlaneData: TPlaneData);
    begin
      with PlaneData do
        begin
          writeln('Manufacturer');
          readln(Manufacturer);
          writeln('model :');
          readln(Model);
          writeln('length :');
          readln(Length);
          writeln('height :');
          readln(Height);
          writeln('wingspan :');
          readln(Wingspan);
        end;
    end;

  {procedure nullInput(var nullData: TPlaneData);
    begin
      with nullData do
        begin
          Manufacturer := 'manufacturer';
          Model := 'model';
          Length := 0;
          Height := 0;
          Wingspan := 0;
        end;
    end;}

  procedure CreateFile(var DataFile: TPlaneFile; n: integer);
    var
      flag: boolean;
      i, j, k, pos: integer;
      PlaneData: TPlaneData;
      TmpFile: TPlaneFile;
    begin
      assign(TmpFile, 'tmp.dat');
      rewrite(DataFile);
      for i := 1 to n do
        begin
          k := 1;
          repeat
            writeln('position');
            readln(pos);
            reset(DataFile);
            rewrite(TmpFile);
            while not EoF(DataFile) do
              begin
                k := k + 1;
                read(DataFile, PlaneData);
                write(TmpFile, PlaneData);
              end;
            if pos > n then
             begin
                flag := false;
                writeln('Position not exist. Enter pos <= n');
             end
           else
             if pos <= k then
               flag := true
             else
               begin
                 flag := false;
                 writeln('Position not exist.');
               end
          until flag = true;
          reset(TmpFile);
          for j := 1 to pos - 1 do
            read(TmpFile, PlaneData);
          InputRecord(PlaneData);
          write(TmpFile, PlaneData);
          reset(TmpFile);
          rewrite(DataFile);
          while not EoF(TmpFile) do
            begin
              read(TmpFile, PlaneData);
              write(DataFile, PlaneData);
            end;
        end;
      close(DataFile);
      close(TmpFile);
    end;{CreateFile}

  procedure AddToEnd(var DataFile: TPlaneFile; n: integer);
    var
      i: integer;
      PlaneData: TPlaneData;
      TmpFile: TPlaneFile;
    begin
      assign(TmpFile, 'tmp.dat');
      rewrite(TmpFile);
      reset(DataFile);
      while not EoF(DataFile) do
        begin
          read(DataFile, PlaneData);
          write(TmpFile, PlaneData);
        end;
      for i := 1 to n do
        begin
          InputRecord(PlaneData);
          write(TmpFile, PlaneData);
        end;
      erase(DataFile);
      rename(TmpFile, 'data.dat');
    end;{AddToEnd}

  procedure DeleteFromPos(var DataFile: TPlaneFile; n, pos: integer);
    var
      i: integer;
      PlaneData: TPlaneData;
      TmpFile: TPlaneFile;
    begin
      assign(TmpFile, 'tmp.dat');
      reset(DataFile);
      rewrite(TmpFile);
      for i := 1 to pos - 1 do
        begin
          read(DataFile, PlaneData);
          write(TmpFile, PlaneData);
        end;
      for i := 1 to n do
        read(DataFile, PlaneData);
      while not EoF(DataFile) do
        begin
          read(DataFile, PlaneData);
          write(TmpFile, PlaneData);
        end;
      close(DataFile);
      close(TmpFile);
      erase(DataFile);
      rename(TmpFile, 'data.dat');
    end;

  procedure ShowFile(var DataFile: TPlaneFile);
    var
      PlaneData: TPlaneData;
    begin
      reset(DataFile);
      with PlaneData do
      repeat
        read(DataFile, PlaneData);
        write(Manufacturer:15, model:10, length:5, height:5, wingspan:5 );
        writeln;
      until EoF(DataFile);
      close(DataFile);
    end;{ShowAll}

  procedure ShowLast(var DataFile: TPlaneFile);
    var
      PlaneData: TPlaneData;
    begin
      reset(DataFile);
      while not EoF(DataFile) do
      begin
        read(DataFile, PlaneData);
        if EoF(DataFile) then
          begin
            with PlaneData do
            writeln(Manufacturer:10, model:10, length:5, height:5, wingspan:5 );
          end;
      end;
      close(DataFile);
    end;{ShowLast}

  begin
  end.