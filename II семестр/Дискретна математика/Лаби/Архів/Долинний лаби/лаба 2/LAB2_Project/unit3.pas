unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids, LCLProc;

type

  { TOperForm }
   TArray = Array [1..100] of String;
   TGender = Array [1..100] of Byte;
   TMatrix = Array [1..100] of TGender;

   TFile = File of Text;
  TOperForm = class(TForm)
     Label1: TLabel;
     Label2: TLabel;
     Union: TImage;
     MatrixC: TStringGrid;
     Dekart: TImage;
     Opposite: TImage;
     RCreate: TButton;
     CClear: TButton;
     SCreate: TButton;
     RSClear: TButton;
    ExitButton: TButton;
    InfoPanel: TPanel;
    MatrixR: TStringGrid;
    MatrixS: TStringGrid;
    Dekart_Opposite: TImage;
   procedure ExitButtonClick(Sender: TObject);
   procedure ClearC;
   procedure ClearR;
   procedure ClearS;
   procedure CClearClick(Sender: TObject);
   procedure Label1Click(Sender: TObject);
   procedure RSClearClick(Sender: TObject);
   procedure CreateAB;
   procedure RCreateClick(Sender: TObject);
   procedure SCreateClick(Sender: TObject);
   procedure MatrixRClick(Sender: TObject);
   procedure MatrixSClick(Sender: TObject);
   procedure UnionClick(Sender: TObject);
   procedure DekartClick(Sender: TObject);
   procedure OppositeClick(Sender: TObject);
   procedure Dekart_OppositeClick(Sender: TObject);





   private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;
  A,B,ArrayS,ArrayR,ArrayR1:TArray;
  Gender_A,Gender_B:TGender;
  lengthA,lengthB,lengthS,lengthR,lengthR1:integer;
  R_relation, S_relation, Union_Relation, Oppos_Relation : TMatrix;

implementation

{$R *.lfm}

{ TOperForm }



procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;



procedure TOperForm.CreateAB;
  var   i:integer;
        str:string;
        f:textfile;
  begin
    assignFile(f, 'DATA\A.txt');
    reset(f);
    i:=1;
    lengthA:=0;
    while not (EOF(f)) do
      begin
        Readln(f, Str);
        if pos('Ч',Str)=1
           then  Gender_A[i]:=1
           else  Gender_A[i]:=0;
        Delete(Str,1,4);
        A[i]:=Str;
        Inc(lengthA);
        Inc(i);
      end;
    closefile(f);

    assignFile(f, 'DATA\B.txt');
    reset(f);
    i:=1;
    lengthB:=0;
    while not (EOF(f)) do
      begin
        Readln(f, Str);
        if pos('Ч',Str)=1
           then Gender_B[i]:=1
           else Gender_B[i]:=0;
        Delete(Str,1,4);
        B[i]:=Str;
        Inc(lengthB);
        Inc(i);
      end;
    closefile(f);
    Infopanel.Caption:='формування бази імен';
end;

procedure TOperForm.RCreateClick(Sender: TObject);
  var i,j,k:integer;
      used:Boolean;
  begin
    CreateAB;
    ClearR;
    For i:=1 to lengthA do
      For j:=1 to lengthB do
        R_Relation[i,j]:=0;
    For i:=1 to lengthA do (* Просматриваем А *)
      If Gender_A[i]=1 then (* Выбираем мужчину *)
         For j:=1 to lengthB do (* Просматриваем В *)
           If Gender_B[j]=0 then (* Выбираем женщину *)
             begin
                  used:=false;
                  For k:=1 to lengthA do (*Проверяем на занятость*)
                      If R_relation[k,j]=1 then used:=true;
                      If (Not used ) and ( (Random(100) + 0) > 50) then
                        begin
                             R_relation[i,j]:=1;
                             Break;
                        end;
             end;
    For i:=1 to lengthA do
    For j:=1 to lengthB do
    MatrixR.Cells[j,i]:=IntToStr(R_relation[i,j]);

    Infopanel.Caption:='формування R';

    lengthR:=0;
    For i:=1 to lengthA do
      For j:=1 to lengthB do
        begin
          if  R_relation[i,j] =1
             then
               begin
                 ArrayR[lengthR+1]:=   '{'+A[i]+','+ B[j]+'}';
                 Inc(lengthR);
               end;
        end;
  end;


procedure TOperForm.SCreateClick(Sender: TObject);
  var i,j:integer;
  begin
    CreateAB;
    ClearS;
    For i:=1 to lengthA do
      For j:=1 to lengthB do    S_Relation[i,j]:=0;
        For i:=1 to lengthA do (* Просматриваем А *)
            If Gender_A[i]=1 then (* Выбираем мужчину *)
              For j:=1 to lengthB do (* Просматриваем B *)
              (* Если мужчина, то выбираем сразу его братом а *)
              (* Если женщина и она не жена, выбираем ее сестрой а *)
                  If ( Gender_B[j]=1 ) and  ((Random(100) + 0) > 60) and( B[j]<>A[i])
                     then S_Relation[i,j]:=1
                     else If ( Gender_B[j]=0 )and (R_relation[i,j]=0  ) and ( (Random(100) + 0) > 60)
                              then S_Relation[i,j]:=1;
    For i:=1 to lengthA do
      For j:=1 to lengthB do
        MatrixS.Cells[j,i]:=IntToStr(S_relation[i,j]);

    Infopanel.Caption:='формування S';

    lengthS:=0;
    For i:=1 to lengthA do
      For j:=1 to lengthB do
        begin
          if  S_relation[i,j] =1
             then
               begin
                    ArrayS[lengthS+1]:=   '{'+A[i]+','+ B[j]+'}';
                    Inc(lengthS);
               end;
        end;
  end;




procedure TOperForm.ClearR;
  var k,l : integer;
  begin
    for k:=1 to lengtha do
       begin
         MatrixR.Cells[0,k]:=A[k];
         for l:=1 to lengthb do
           MatrixR.Cells[k,l]:='';
       end;
    MatrixR.Cells[0,0]:='R';
    For k:=1 to lengthB do
       MatrixR.Cells[k,0]:=B[k];
end;


procedure TOperForm.ClearS;
  var k,l : integer;
  begin
    for k:=1 to lengtha do
       begin
         MatrixS.Cells[0,k]:=A[k];
         for l:=1 to lengthb do
              MatrixS.Cells[k,l]:='';
       end;
    MatrixS.Cells[0,0]:='S';
    For k:=1 to lengthB do
        MatrixS.Cells[k,0]:=B[k];
  end;

procedure TOperForm.RSClearClick(Sender: TObject);
  begin
    ClearR;
    ClearS;
  end;


procedure TOperForm.ClearC;
   var k,l,m,n : integer;
begin
   if (lengthA > lengthS)
      then m:=lengthA
      else  m:=lengthS;
   n:=lengthB;
   if (lengthR > n)
      then n:=lengthR;
   if (lengthR1 > n)
      then n:=lengthR1;
   for k:=0 to m do
     for l:=0 to n do
         MatrixC.Cells[l,k]:='';
end;


procedure TOperForm.CClearClick(Sender: TObject);
begin
   ClearC;
end;

procedure TOperForm.Label1Click(Sender: TObject);
begin

end;


procedure TOperForm.MatrixRClick(Sender: TObject);
    var a,b : integer;
begin
  a:=MatrixR.Col;
  b:=MatrixR.Row;
  if S_Relation[b,a]=1
     then  InfoPanel.Caption:=MatrixR.Cells[0,MatrixR.Row]+' є братом'+ MatrixR.Cells[MatrixR.Col,0]
     else  InfoPanel.Caption:=MatrixR.Cells[0,MatrixR.Row]+' не є братом'+MatrixR.Cells[MatrixR.Col,0];
end;

procedure TOperForm.MatrixSClick(Sender: TObject);
    var a,b : integer;
begin
  a:=MatrixS.Col;
  b:=MatrixS.Row;
  if R_Relation[b,a]=1
     then  InfoPanel.Caption:=MatrixS.Cells[0,MatrixS.Row]+' є чоловіком'+ MatrixS.Cells[MatrixS.Col,0]
     else  InfoPanel.Caption:=MatrixS.Cells[0,MatrixS.Row]+' не є чоловіком'+MatrixS.Cells[MatrixS.Col,0];
end;


procedure TOperForm.UnionClick(Sender: TObject);
 var i,j:integer;
begin
  ClearC;
  MatrixC.DefaultColWidth:=60;
  For i:=1 to lengthA do
  For j:=1 to lengthB do
    begin
      Union_Relation[i,j]:=0;
      if (S_Relation[i,j]=1) or (R_Relation[i,j]=1)
         then Union_Relation[i,j]:=1;
    end;
  MatrixC.Cells[0,0]:='';
  For i:=1 to lengthA do
    MatrixC.Cells[i,0]:=B[i];
  For i:=1 to lengthA do
    begin
      MatrixC.Cells[0,i]:=A[i];
      For j:=1 to lengthB do
         MatrixC.Cells[j,i]:=IntToStr(Union_relation[i,j]);
    end;
  Infopanel.Caption:='формування об''єднання';
end;


procedure TOperForm.DekartClick(Sender: TObject);
 var i,j:integer;
begin
  ClearC;
  MatrixC.DefaultColWidth:=300;
  MatrixC.Cells[0,0]:='';
  For i:=1 to lengthR do
     MatrixC.Cells[i,0]:=ArrayR[i];
  For i:=1 to lengthS do
     begin
        MatrixC.Cells[0,i]:=ArrayS[i];
        For j:=1 to lengthR do
           MatrixC.Cells[j,i]:='{'+ArrayS[i]+','+ ArrayR[j]+'}';
     end;
  Infopanel.Caption:='формування декартового добутку S i R';
end;


procedure TOperForm.OppositeClick(Sender: TObject);
 var i,j:integer;
begin
  ClearC;
  MatrixC.DefaultColWidth:=60;
  For i:=1 to lengthA do
     For j:=1 to lengthB do
        begin
           Oppos_Relation[j,i]:=0;
             if R_Relation[i,j]=1
                then Oppos_Relation[j,i]:=1;
        end;
  MatrixC.Cells[0,0]:='';
  For i:=1 to lengthA do
    MatrixC.Cells[i,0]:=A[i];
  For i:=1 to lengthA do
     begin
        MatrixC.Cells[0,i]:=B[i];
        For j:=1 to lengthB do
           MatrixC.Cells[j,i]:=IntToStr(Oppos_Relation[i,j]);
     end;
  Infopanel.Caption:='формування оберненого відношення до R';
  lengthR1:=0;
  For i:=1 to lengthA do
    For j:=1 to lengthB do
      begin
          if  Oppos_Relation[i,j] =1
             then
               begin
                    ArrayR1[lengthR1+1]:=   '{'+B[i]+','+A[j] +'}';
                    Inc(lengthR1);
               end;
      end;
end;


procedure TOperForm.Dekart_OppositeClick(Sender: TObject);
 var i,j:integer;
begin
  ClearC;
  MatrixC.DefaultColWidth:=300;
  MatrixC.Cells[0,0]:='';
  For i:=1 to lengthR1 do
     MatrixC.Cells[i,0]:=ArrayR1[i];
  For i:=1 to lengthS do
     begin
        MatrixC.Cells[0,i]:=ArrayS[i];
        For j:=1 to lengthR1 do
           MatrixC.Cells[j,i]:='{'+ArrayS[i]+','+ ArrayR1[j]+'}';
     end;
  Infopanel.Caption:='формування декартового добутку S i R-1';
end;



end.

