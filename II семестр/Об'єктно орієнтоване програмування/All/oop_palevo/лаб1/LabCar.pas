program Lab1_Sol;

uses Cars,CRT; //Cars for actions, CRT for function readkey

var
 CarBase:CarFile;  //File, were base saved
 C:0..8;           //Choose of needed actions
 Sure:char;        //Accepting of actions, which can't be retrying
 M:integer;        //Number of working records or number of record, were putting file-buffer

Begin
 writeln('Welcome to the CarManager 0.1 ! Choose needed actions:');
 C:=0;
 while C<>8 do
  begin
   Assign(CarBase,'CarBase.bat');
   case C of
       0:begin
           writeln('Type "1" create new CarBase (Attention! Old base, if exist, will be lost)');
           writeln('Type "2" to add one new car or type "3" if you want to add some number of cars at one time');
           writeln('Type "4" to delete one car or type "5" if you want to delete some number of cars at one time');
           writeln('Type "6" to review some number of first cars or type "7" if you want to review all base');
           writeln('Type "8" to exit program');
           writeln('Type "0" to get this text');
         end;
       1:begin
          writeln('Are you sure to create a new base? Y/n ');
          Sure:=readkey;
          if (Sure='Y') or (Sure='y') or (Sure=chr(189)) or (Sure=chr(157)) then
           begin
            writeln('Input producer of car, it`s model, miles per gallon, number of passenger`s sits and price');
            MakeCar(CarBase);
            write('Base created. Choose next action (0 for help) ');
           end;
          end;
       2:begin
          writeln('Input number of record, after what new car will be placed');
          read(M);
          writeln('Input producer of car, it`s model, miles per gallon, number of passenger`s sits and price');
          AddCar(CarBase,M);
          write('Record added. Choose next action (0 for help) ');
         end;
       3:begin
          writeln('How many records, which will be placed in the beginnig of base');
          read(M);
          writeln('Input ',M,'-times producer of car, it`s model, miles per gallon, number of passenger`s sits and price');
          AddBlock(CarBase,M);
          write('Records added. Choose next action (0 for help) ');
         end;
       4:begin
          writeln('Are you sure to delete first car? Y/n');
          Sure:=readkey;
          if (Sure='Y') or (Sure='y') or (Sure=chr(189)) or (Sure=chr(157)) then
           begin
            DeleteCar(CarBase);
            write('First record deleted. Choose next action (0 for help) ');
           end;
         end;
       5:begin
          writeln('How many records you want to delete from the beginning of base');
          read(M);
          writeln('Are you sure to delete ',M,'-number of cars? Y/n');
          Sure:=readkey;
          if (Sure='Y') or (Sure='y') or (Sure=chr(189)) or (Sure=chr(157)) then
           begin
            DeleteBlock(CarBase,M);
            write('First',M,' records deleted. Choose next action (0 for help) ');
           end;
         end;
       6:begin
          writeln('How many records you want to read?');
          read(M);
          Review(CarBase,M);
          write('Choose next action (0 for help) ');
         end;
       7:begin
          ReviewAll(CarBase);
          write('Choose next action (0 for help) ');
         end;
    end;
   read(C);
  end;
End.
