unit Unit15;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TOperForm }
  TArray = Array [0..100] of Integer;
  TOperForm = class(TForm)
    Clear: TButton;
    Download_Vect: TButton;
    Input_m_n: TButton;
    Input_Vect: TButton;
    Generate: TButton;
    Qual_Elem_Inp: TEdit;
    Qual_Vect_Inp: TEdit;
    ExitButton: TButton;
    Label1: TLabel;
    Qual_Elem_Info: TLabel;
    Qual_Vect_Info: TLabel;
    leksi: TRadioButton;
    anti_leksi: TRadioButton;
    Result_Vector: TStringGrid;
    Vector_File: TRadioButton;
    Vector_Input: TRadioButton;
    First_Vector: TStringGrid;
    procedure ClearClick(Sender: TObject);
    procedure Download_VectClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure First_VectorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GenerateClick(Sender: TObject);
    procedure Input_m_nClick(Sender: TObject);
    procedure Input_VectClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;
  m,n : integer;
  b:TArray;
implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.First_VectorClick(Sender: TObject);

begin

if First_Vector.Cells[First_Vector.Col,First_Vector.Row]='0'
 then  First_Vector.Cells[First_Vector.Col,First_Vector.Row]:='1'
 else  First_Vector.Cells[First_Vector.Col,First_Vector.Row]:='0';
end;

procedure TOperForm.FormCreate(Sender: TObject);
begin

end;

procedure TOperForm.Download_VectClick(Sender: TObject);
var   i:integer;
      str:string;
      f:textfile;
begin      // input first vector from file
     if Vector_File.Checked then
       begin
         assignFile(f, 'DATA\P3.txt');
         reset(f);
         Readln(f, Str);
         m:=StrToInt(Str); // quality of vectors
         Qual_Vect_Inp.text:=IntToStr(m);
         Readln(f, Str);
         n:=StrToInt(Str); // quality of elements
         Qual_Elem_Inp.text:=IntToStr(n);
         i:=0;
         while not (EOF(f)) do
               begin
                 Readln(f, Str);
                 b[n-i-1]:=StrToInt(Str);
                 Inc(i);
               end;
         closefile(f);
         for i:=0 to n-1 do
             First_Vector.Cells[n-i-1,0]:=IntToStr(b[i]);
       end;
end;

procedure TOperForm.ClearClick(Sender: TObject);
var i,k: integer;
begin
  for i:=0 to 100 do  // erase grid
    for k:=0 to 100 do
        Result_Vector.Cells[i,k]:='';
end;


procedure TOperForm.Input_m_nClick(Sender: TObject);
var   i:integer;
begin
   if Vector_Input.Checked then   // input m,n from display
       begin
         for i:=1 to n do
             First_Vector.Cells[n-i,0]:='';
         m:=StrToInt(Qual_Vect_Inp.text); // quality of vectors
         n:=StrToInt(Qual_Elem_Inp.text); // quality of elements
         for i:=1 to n do
             First_Vector.Cells[n-i,0]:='0';
       end;
end;

procedure TOperForm.Input_VectClick(Sender: TObject);
var   i:integer;
begin  // input first vector from display
   if Vector_Input.Checked
    then
        for i:=0 to n-1 do
            b[i]:=StrToInt(First_Vector.Cells[n-i-1,0]);
end;


procedure TOperForm.GenerateClick(Sender: TObject);
var i,m0:integer;
begin

   if leksi.checked
    then
        begin
          m0:=m;      // quality of vectors
          for i:=0 to m-1 do  // write numbers of vectors
              Result_Vector.Cells[0,i]:=IntToStr(i+1);
          b[n]:=0; //  first condition
          while (b[n]=0) do
                begin
                  for i:=0 to n-1 do  // output current vector
                      Result_Vector.Cells[i+1,m0-m]:=IntToStr(b[n-i-1]);
                  m:=m-1;  // rest of vectors
                  if (m=0) // check rest of vectors
                   then break
                   else
                     begin
                       i:=0;   // find first position with 0
                       while (b[i]=1)and (i<m0-1) do
                             begin
                               b[i]:=0;
                               inc(i);
                             end;
                       b[i]:=1;
                     end;
                end;
        end;
    if anti_leksi.checked
     then
        begin
          m0:=m;      // quality of vectors
          for i:=0 to m-1 do  // write numbers of vectors
              Result_Vector.Cells[0,i]:=IntToStr(i+1);
          b[n]:=1; //  first condition
          while (b[n]=1) do
                begin
                  for i:=0 to n-1 do  // output current vector
                      Result_Vector.Cells[i+1,m0-m]:=IntToStr(b[n-i-1]);
                  m:=m-1;  // rest of vectors
                  if (m=0) // check rest of vectors
                   then break
                   else
                     begin
                       i:=0;   // find first position with 1
                       while (b[i]=0)and (i<m0-1) do
                             begin
                               b[i]:=1;
                               inc(i);
                             end;
                       b[i]:=0;
                     end;
                end;
        end;

end;

end.

