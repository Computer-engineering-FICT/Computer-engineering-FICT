program Lab1;

uses Country,CRT; {Country for actions, CRT for function readkey}

var
 CntrBase:CountFile;  {File, were base saved}
 Choose:0..8;           {Choose of needed actions}
 Sure:char;        {Accepting of actions, which can't be retrying}
 N,M:integer;        {Number of working records and number of record, were putting file-buffer}

Begin
 clrscr;
 writeln('Welcome to the CountriesManager! Choose needed actions:');
 Choose:=0;
 while Choose<>7 do
  begin
   Assign(CntrBase,'country.dat');
   case Choose of
       0:begin
           writeln('1 - create new DataBase (Old base, if exist, will be lost)');
           writeln('2 - add one new country');
           writeln('3 - add n new countries');
           writeln('4 - delete first countries');
           writeln('5 - delete n countries beginning position number m');
           writeln('6 - review review n countries beginning position number m');
           writeln('7 - exit program');
           writeln('0 - get this menu');
         end;
       1:begin
          writeln('Are you sure to create a new base? Y/n ');
          Sure:=readkey;
          if (Sure='Y') or (Sure='y') or (Sure=chr(189)) or (Sure=chr(157)) then
           begin
            MakeBase(CntrBase);
            AddRecsToBase(CntrBase);
            write('Base created. Choose next action (0 for help) ');
           end;
          end;
       2:begin
          AddtoEnd(CntrBase);
          write('Record added. Choose next action (0 for help) ');
         end;
       3:begin
          AddRecsToEndBase(CntrBase);
          write('Records added. Choose next action (0 for help) ');
         end;
       4:begin
          writeln('Are you sure to delete first record? Y/n');
          Sure:=readkey;
          if (Sure='Y') or (Sure='y') or (Sure=chr(189)) or (Sure=chr(157)) then
           begin
            DeleteRec(CntrBase);
            write('First record deleted. Choose next action (0 for help) ');
           end;
         end;
       5:begin
          writeln('Are you sure to delete records? Y/n');
          Sure:=readkey;
          if (Sure='Y') or (Sure='y') or (Sure=chr(189)) or (Sure=chr(157)) then
           begin
            DeleteBlock(CntrBase);
            write('Records deleted. Choose next action (0 for help) ');
           end;
         end;
       6:begin
          ViewBlock(CntrBase);
          write('Choose next action (0 for help) ');
         end;
    end;
   readln(Choose);
  end;
End.
