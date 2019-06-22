unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,Unit2,Unit1;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
//type TRow=array of string[15];
var MyStrGrid:array [0..500,0..5000] of String[15];

function ChangeExt(Name,NewExt:string):string;
  var x:integer;
begin
  ChangeExt:=Name;
  x:=LastDelimiter('.',Name);
  ChangeExt[x+1]:=NewExt[1];
  ChangeExt[x+2]:=NewExt[2];
  ChangeExt[x+3]:=NewExt[3]
end;{ChangeExt}

function FindStr(Current:integer;var Same:integer):boolean;
  var i,j:integer;
      eqw:boolean;
begin
  FindStr:=false;
  for i:=1 to Current-1 do
  begin
    eqw:=true;
    if Form3.StringGrid1.Cells[1,i]<>MyStrGrid[1,Current] then
      eqw:=false;
    if Form3.StringGrid1.Cells[5+N+XCnt,i]<>MyStrGrid[5+N+XCnt,Current] then
      eqw:=false;
    for j:=8+N*2+XCnt to  8+N*2+XCnt +YCnt-1  do
      if Form3.StringGrid1.Cells[j,i]<>MyStrGrid[j,Current] then
        eqw:=false;
    if eqw then
    begin
      Same:=i;
      FindStr:=true;
      exit
    end
  end
end;

procedure CorrectX(Current,Same:integer);
  var i:integer;
begin
  for i:=4+N to 4+N+XCnt-1 do
    if MyStrGrid[i,Current]<>Form3.StringGrid1.Cells[i,Same] then
      Form3.StringGrid1.Cells[i,Same]:=' _'
end;

procedure TForm3.FormActivate(Sender: TObject);
  var j,i,k,Same,RowCnt,m:integer;
      f:file of integer;
      fs:TextFile;
      Save:boolean;
      Filename:string;

begin
  save:=false;
  if Form1.CheckBox1.Checked then
    if Form1.SaveDialog1.Execute then
    begin
      save:=true;
      FileName:=Form1.SaveDialog1. fileName
    end;

  if save then
  begin
    assignFile(fs,ChangeExt(FileName,'cap'));
    rewrite(fs);
    for i:=0 to XCnt-1 do
      writeln(fs,X[i]);
    for i:=0 to YCnt-1 do
      writeln(fs,Y[i]);
    CloseFile(fs);

    assignFile(f,FileName);
    rewrite(f);
    write(f,SostCnt);
    write(f,N);
    write(f,Xcnt);
    write(f,Ycnt);
    write(f,TrigCnt);
    i:=Form1.ComboBox1.ItemIndex;
    write(f,i);
    if IsMura then
      i:=1
    else
      i:=0;
    write(f,i);
  end;
  StringGrid1.RowCount:=2;
  StringGrid1.ColCount:=2+2*N+YCnt+7+N+XCnt;
  if TrigSize=2 then
    StringGrid1.ColCount:=StringGrid1.ColCount+N;

  RowCnt:=SostCnt*Stepin(XCnt)+1;

  MyStrGrid[1,0]:='ÈÑ';
  for i:=0 to SostCnt-1 do
    for j:=0 to Stepin(XCnt)-1 do
      MyStrGrid[1,i*Stepin(XCnt)+j+1]:=IntToStr(i);

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to N-1 do
       begin
//         if save then
//            write(f,ISost[i*Stepin(XCnt)+j,k])
         MyStrGrid[3+k,0]:='Q'+IntToStr(k);
         MyStrGrid[3+k,i*Stepin(XCnt)+j+1]:=IntToStr(ISost[i*Stepin(XCnt)+j,k]);

       end;

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to XCnt-1 do
       begin
//         if save then
//           write(f,TabIst[j,k])
         MyStrGrid[4+N+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabIst[j,k]);
         MyStrGrid[4+N+k,0]:=X[k];

       end;
   MyStrGrid[5+N+XCnt,0]:='ÑÏ';

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       MyStrGrid[5+N+XCnt,i*Stepin(XCnt)+j+1]:=IntToStr(TabPer[j,i]);

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to N-1 do
       begin
         MyStrGrid[7+N+XCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(SostP[i*Stepin(XCnt)+j,k]);
         MyStrGrid[7+N+XCnt+k,0]:='Q'+IntToStr(k)
       end;
   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to YCnt-1 do
       begin
//         if save then
//           write(f,TabVyhMura[i*Stepin(XCnt)+j,k]);
         MyStrGrid[8+N*2+XCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabVyhMura[i*Stepin(XCnt)+j,k]);
         MyStrGrid[8+N*2+XCnt+k,0]:=Y[k];

       end;

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
     if TrigSize=1 then
       for k:=0 to N-1 do
       begin
         if TabTrigger[i*Stepin(XCnt)+j,k]=2 then
          MyStrGrid[9+2*N+XCnt+YCnt+k,i*Stepin(XCnt)+j+1]:='  _'
         else
           MyStrGrid[9+2*N+XCnt+YCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabTrigger[i*Stepin(XCnt)+j,k]);
       case Form1.ComboBox1.ItemIndex of
         0:MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='T'+InttoStr(k);
         1:MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='D'+InttoStr(k);
         end;
//        if save then
//          write(f,TabTrigger[i*Stepin(XCnt)+j,k])
       end
     else
       for k:=0 to 2*N-1 do
       begin
         if TabTrigger[i*Stepin(XCnt)+j,k]=2 then
           MyStrGrid[9+2*N+XCnt+YCnt+k,i*Stepin(XCnt)+j+1]:='  _'

         else
           MyStrGrid[9+2*N+XCnt++YCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabTrigger[i*Stepin(XCnt)+j,k]);

       case Form1.ComboBox1.ItemIndex of
         2:if k mod 2=1 then
           MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='R'+InttoStr(k div 2)
           else
           MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='S'+InttoStr(k div 2);

         3:if k mod 2=1 then
             MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='J'+InttoStr(k div 2)
           else
             MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='K'+InttoStr(k div 2);

       end;
//        if save then
//          write(f,TabTrigger[i*Stepin(XCnt)+j,k]);
       end ;
//    if save then
//      closeFile(f)

   j:=0;
   for i:=0 to RowCnt-1 do
     if not FindStr(i,Same) then
     begin
       for k:=0 to StringGrid1.ColCount-1 do
         StringGrid1.Cells[k,j]:=MyStrGrid[k,i];
         StringGrid1.RowCount:=StringGrid1.RowCount+1;
       j:=j+1
     end
     else
     begin
       CorrectX(i,Same);
     end;
   for i:=0 to StringGrid1.RowCount-1 do
      StringGrid1.Cells[0,i]:=IntToStr(i);

   j:=j-1;
//   ShowMessage(IntToStr(TrigCnt));
   if save then
   begin
     write(f,j);
     for i:=1 to j do
       for k:=3 to 3+N-1 do
       begin
        m:=StrToInt(StringGrid1.Cells[k,i]);
        write(f,m);
       end;
     for i:=1 to j do
       for k:=4+N to 4+N+XCnt-1 do
       begin
         if trim(StringGrid1.Cells[k,i])='_' then
           m:=2
         else
           m:=StrToInt(StringGrid1.Cells[k,i]);
         write(f,m)
       end;

       for i:=1 to j do
         for k:=8+N*2+XCnt to 8+N*2+XCnt+YCnt-1 do
       begin
        m:=StrToInt(StringGrid1.Cells[k,i]);
        write(f,m);
       end;


       for i:=1 to j do
         for k:=9+2*N+XCnt+YCnt to 9+2*N+XCnt+YCnt+TrigCnt-1 do
         begin
           if trim(StringGrid1.Cells[k,i])='_' then
             m:=2
           else
             m:=StrToInt(StringGrid1.Cells[k,i]);
           write(f,m)
         end;
     CloseFile(f);
   end ;


//  +        write(f,ISost[i*Stepin(XCnt)+j,k])
//  +         write(f,TabIst[j,k])
//           write(f,TabVyhMura[i*Stepin(XCnt)+j,k]);

//   +       write(f,TabTrigger[i*Stepin(XCnt)+j,k])
//          closeFile(f)


{  for i:=0 to StringGrid1.ColCount do
    for j:=0 to StringGrid1.RowCount do
      StringGrid1.Cells[i,j]:=MyStrGrid[i,j];}
end;

end.
