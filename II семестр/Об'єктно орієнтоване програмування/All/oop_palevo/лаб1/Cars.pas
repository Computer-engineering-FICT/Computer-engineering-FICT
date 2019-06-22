unit Cars;

interface

type
 TCar=record
         Producer,Model:string;
         Price,MpG,Passengers:integer;
      end;

 CarFile=file of TCar;

procedure ReadCar(var TC:TCar); //Reading from terminal data for file
procedure MakeCar(var CF:CarFile); //Create new file by putting 1 new record
procedure AddCar(var CF:CarFile; M:integer); //Adding 1 new record in
                                             //M-position of file
procedure AddBlock(var CF:CarFile; N:integer); //Adding N-number of records in
                                               //beginning of file
procedure DeleteCar(var CF:CarFile); //Deleting 1 record from beginning of file
procedure DeleteBlock(var CF:CarFile; N:integer); //Deleting N-number of records
                                                  //from the beginning of file
procedure Review(var CF:CarFile; N:integer); //Reviewing N-number of records
                                             //from the beginning of file
procedure ReviewAll(var CF:CarFile); //Reviewing all file



implementation

procedure ReadCar(var TC:TCar);

Begin
 readln;                      //for not-baged reading type string
 readln(TC.Producer);
 readln(TC.Model);
 read(TC.MpG);
 read(TC.Passengers);
 read(TC.Price);
End;

procedure MakeCar(var CF:CarFile);

var
 SomeCar:TCar; //Abstraction of any record TCar, used for buffering

Begin
 ReadCar(SomeCar);
 ReWrite(CF);       //Creating new file
 write(CF,SomeCar);
 Close(CF);
End;

procedure AddCar(var CF:CarFile; M:integer);

var
 i:integer;
 SomeCar:TCar;
 TempCF:CarFile; //Template file, which used for making result

Begin
 Assign(TempCF,'Template.bat');
 Reset(CF);
 ReWrite(TempCF);
 for i:=1 to M-1 do
  begin               //Adding to template file all records before choosen position
   Read(CF,SomeCar);
   Write(TempCF,SomeCar);
  end;
 ReadCar(SomeCar);      //Adding to template input record on position
 Write(TempCF,SomeCar);
 while not EoF(CF) do
  begin                     //Adding to template rest records
   Read(CF,SomeCar);
   Write(TempCF,SomeCar);
  end;
 Close(CF);
 Close(TempCF);
 Rename(TempCF,'CarBase.bat'); //Swaping template and working vector
End;

procedure AddBlock(var CF:CarFile; N:integer);

var
 i:integer;
 TempCF:CarFile;
 SomeCar:TCar;

Begin
 Assign(TempCF, 'Template.bat');
 ReWrite(TempCF);
 Reset(CF);
 for i:=1 to N do
  begin               //Reading records and writing them in new template file
   ReadCar(SomeCar);
   write(CF,SomeCar);
  end;
 while not Eof(CF) do
  begin                 //Adding all records at the end of template file
   Read(CF,SomeCar);
   Write(TempCF,SomeCar);
  end;
 Close(TempCF);
 Close(CF);
 ReName(TempCF,'CarBase.bat');
End;

procedure DeleteCar(var CF:CarFile);

var
 TempCF:CarFile;
 SomeCar:TCar;

Begin
 Assign(TempCF, 'Template.bat');
 ReWrite(TempCF);
 Reset(CF);
 Seek(CF,1);  //Passing first record
 while not EoF(CF) do
  begin                //Moving all records (exept first) to the template file
   Read(CF,SomeCar);
   Write(TempCF,SomeCar);
  end;
 Close(TempCF);
 Close(CF);
 ReName(TempCF,'CarBase.bat');
End;

procedure DeleteBlock (var CF:CarFile; N:integer);

var
 SomeCar:TCar;
 TempCF:CarFile;

Begin
 Assign(TempCF, 'Template.bat');
 ReWrite(TempCF);
 Reset(CF);
 Seek(CF,N);  //Passing all deleting records
 while not EoF(CF) do
  begin                //Moving all records in file (exept first N-number) to the template file
   ReadCar(SomeCar);
   Write(CF,SomeCar);
  end;
 Close(TempCF);
 Close(CF);
 ReName(TempCF,'CarBase.bat');
End;


procedure Review(var CF:CarFile; N:integer);

var
 i:integer;
 SomeCar:TCar;

Begin
 Reset(CF);
 for i:=1 to N do
  begin
   Read(CF,SomeCar);
   Write(SomeCar.Producer,' | ',SomeCar.Model,' | ',SomeCar.MpG,' | ',
SomeCar.Passengers,' | ',SomeCar.Price);
   writeln;   //New line
  end;
 Close(CF);
End;

procedure ReviewAll(var CF:CarFile);

var
 SomeCar:TCar;

Begin
 Reset(CF);
 while not EoF(CF) do
  begin
   Read(CF,SomeCar);
   Write(SomeCar.Producer,' | ',SomeCar.Model,' | ',SomeCar.MpG,' | ',
SomeCar.Passengers,' | ',SomeCar.Price);
   Writeln;
  end;
 Close(CF);
End;//End of implementation

end.