unit Unit3;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
   ExtCtrls, Grids, LCLProc;


type

  BooleanMask = Array[1..20] of boolean;

  { TOperForm }

  TOperForm = class(TForm)
     AListBox: TListBox;
     ALoadButton: TButton;
     BListBox: TListBox;
     Button1: TButton;
     Button2: TButton;
     Button3: TButton;
     Button4: TButton;
    ExitButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RXS: TMemo;
    Result_StringGrid: TStringGrid;
    R_StringGrid: TStringGrid;
    S_StringGrid: TStringGrid;



   procedure ALoadButtonClick(Sender: TObject);
   procedure Button1Click(Sender: TObject);
   procedure Button2Click(Sender: TObject);
   procedure Button3Click(Sender: TObject);
   procedure Button4Click(Sender: TObject);
     procedure ExitButtonClick(Sender: TObject);
   procedure CreateBoolean(Grid:TStringGrid; var mask1:BooleanMask; var mask2:BooleanMask);
   procedure Label1Click(Sender: TObject);
   procedure LoadToGrids();
   procedure LoadToGrids2();
   procedure LoadToGrids3();
   procedure RXSChange(Sender: TObject);
   procedure OperationR(AMask:BooleanMask; BMask:BooleanMask);
   procedure OperationS(AMask:BooleanMask; BMask:BooleanMask);
   procedure OperationR2(AMask:BooleanMask; BMask:BooleanMask);
     private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;

implementation
Var LocalPath:String;
  ABoolean:BooleanMask;
    BBoolean:BooleanMask;
{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.ALoadButtonClick(Sender: TObject);
begin
    AListBox.Items.LoadFromFile(LocalPath+'DATA\A.TXT');
    BListBox.Items.LoadFromFile(LocalPath+'DATA\B.TXT');
    LoadToGrids();
    R_StringGrid.Cells[0,0] := 'R';
    S_StringGrid.Cells[0,0] := 'S';
    CreateBoolean(R_StringGrid, ABoolean, BBoolean);
    OperationR(ABoolean, BBoolean);
    OperationS(ABoolean, BBoolean);

    S_StringGrid.Height := (S_StringGrid.RowCount ) * S_StringGrid.DefaultRowHeight;
    S_StringGrid.Width := (S_StringGrid.ColCount ) * S_StringGrid.DefaultColWidth;
    R_StringGrid.Height := (R_StringGrid.RowCount ) * R_StringGrid.DefaultRowHeight;
    R_StringGrid.Width := (R_StringGrid.ColCount ) * R_StringGrid.DefaultColWidth;

    Result_StringGrid.Height := (R_StringGrid.RowCount ) * R_StringGrid.DefaultRowHeight;
    Result_StringGrid.Width := (R_StringGrid.ColCount ) * R_StringGrid.DefaultColWidth;
    S_StringGrid.Visible:= true;
    R_StringGrid.Visible:= true;
    Result_StringGrid.Visible:=true;



end;


procedure TOperForm.Button1Click(Sender: TObject);
var
  i,j:integer;
begin
  LoadToGrids3();
  Result_StringGrid.Cells[0,0]:='R U S';
  for i := 1 to Result_StringGrid.ColCount-1  do
   begin
    for j := 1 to Result_StringGrid.RowCount-1 do
     if (R_StringGrid.Cells[i,j]=IntToStr(1)) or (S_StringGrid.Cells[i,j]=IntToStr(1))  then
         Result_StringGrid.Cells[i,j]:=IntToStr(1)
         else
           Result_StringGrid.Cells[i,j]:=IntToStr(0)
   end;
end;

procedure TOperForm.Button2Click(Sender: TObject);
var
   i,j:integer;
begin

Result_StringGrid.Cells[0,0]:='R^-1';
LoadToGrids2();
 OperationR2(ABoolean, BBoolean);
 Result_StringGrid.Cells[1,1]:=IntToStr(0);
end;

procedure TOperForm.Button3Click(Sender: TObject);
var
   i1,j1,i2,j2:integer;
   b:boolean;
begin
 RXS.Clear;
 RXS.Append('S X R ={');

 for i1 := 1 to S_StringGrid.RowCount-1  do
    begin
        for j1 := 1 to S_StringGrid.ColCount-1 do
        for i2 := 1 to R_StringGrid.RowCount-1  do
        for j2 := 1 to R_StringGrid.ColCount-1 do
        if ((R_StringGrid.Cells[j1,i1]=IntToStr(1)) and  (S_StringGrid.Cells[j2,i2]=IntToStr(1))) then
            begin
            RXS.Append('(('+S_StringGrid.Cells[0,i1]+','+S_StringGrid.Cells[j1,0]+'),('+R_StringGrid.Cells[0,i2]+','+R_StringGrid.Cells[j2,0]+'))');
            b:=false;
            end;
       end;
  if b then RXS.Append('Декартовий добуток-пуста множина.')
  else  RXS.Append('}');
end;

procedure TOperForm.Button4Click(Sender: TObject);
  var
     i1,j1,i2,j2:integer;
     b:boolean;
  begin
   RXS.Clear;
   RXS.Append('S X R^-1 :');
   for i1 := 1 to S_StringGrid.RowCount-1  do
      begin
          for j1 := 1 to S_StringGrid.ColCount-1 do
          for i2 := 1 to Result_StringGrid.RowCount-1  do
          for j2 := 1 to Result_StringGrid.ColCount-1 do
          if ((S_StringGrid.Cells[j1,i1]=IntToStr(1)) and  (Result_StringGrid.Cells[j2,i2]=IntToStr(1))) then
              begin
               RXS.Append('(('+S_StringGrid.Cells[0,i1]+','+S_StringGrid.Cells[j1,0]+'),('+Result_StringGrid.Cells[0,i2]+','+Result_StringGrid.Cells[j2,0]+'))');
               b:=false;
              end;
         end;
    if b then RXS.Append('Декартовий добуток-пуста множина.');
  end;


  procedure TOperForm.OperationR2(AMask:BooleanMask; BMask:BooleanMask);
var
   i,j:integer;
begin
    for i := 1 to Result_StringGrid.RowCount-1  do
    begin
        for j := 1 to Result_StringGrid.ColCount-1 do
        begin

           if(not AMask[j]) then
               begin
               Result_StringGrid.Cells[j,i] :=IntToStr(1);
               end
           else Result_StringGrid.Cells[j,i]:=IntToStr(0);
        end;

    end;

end;

procedure TOperForm.OperationR(AMask:BooleanMask; BMask:BooleanMask);
var
   i,j:integer;
begin
    for i := 1 to R_StringGrid.RowCount-1  do
    begin
        for j := 1 to R_StringGrid.ColCount-1 do
        begin

           if(not AMask[i]) then
               begin
               R_StringGrid.Cells[j,i] :=IntToStr(1);
               end
           else R_StringGrid.Cells[j,i]:=IntToStr(0);
        end;
         R_StringGRid.Cells[1,1]:=IntToStr(0);
    end;

end;


procedure TOperForm.OperationS(AMask:BooleanMask; BMask:BooleanMask);
var
   i,j:integer;
begin
    for i := 1 to S_StringGrid.RowCount-1 do
    begin
        for j := 1 to S_StringGrid.ColCount-1 do
        begin

           if(not AMask[i] and (R_StringGrid.Cells[j,i]=IntToStr(0))) then
               begin
               S_StringGrid.Cells[j,i] :=IntToStr(1);
               end
           else   S_StringGrid.Cells[j,i]:=IntToStr(0);
        end;

    end;

end;


procedure TOperForm.CreateBoolean(Grid:TStringGrid;var mask1:BooleanMask;var mask2:BooleanMask);
var
   i,j:integer;
begin
      for i := 1 to Grid.RowCount-1 do
          mask1[i] := utf8Copy(Grid.Cells[0,i], 1, 1) = 'Ч';
      for j := 1 to Grid.ColCount-1 do
          mask2[j] := utf8Copy(Grid.Cells[j,0], 1, 1) = 'Ч';
end;

procedure TOperForm.Label1Click(Sender: TObject);
begin

end;

procedure TOperForm.LoadToGrids();
var
   tempStr:String;
   f:text;
begin
    assignFile(f, LocalPath+'DATA\A.TXT');
    reset(f);
    R_StringGrid.RowCount:=1;
    R_StringGrid.ColCount:=1;
    S_StringGrid.RowCount:=1;
    S_StringGrid.ColCount:=1;
    Result_StringGrid.RowCount:=1;
    Result_StringGrid.ColCount:=1;

    while(not eof(f)) do
    begin
         readln(f, tempStr);
         R_StringGrid.RowCount := R_StringGrid.RowCount+1;
         S_StringGrid.RowCount := S_StringGrid.RowCount+1;
         Result_StringGrid.RowCount := Result_StringGrid.RowCount+1;
         R_StringGrid.Cells[0, R_StringGrid.RowCount-1] := tempStr;
         S_StringGrid.Cells[0, S_StringGrid.RowCount-1] := tempStr;
         Result_StringGrid.Cells[0, Result_StringGrid.RowCount-1] := tempStr;

    end;

    CloseFile(f);
    assignFile(f, LocalPath+'DATA\B.TXT');
    reset(f);

    while(not eof(f)) do
    begin
         readln(f, tempStr);
         R_StringGrid.ColCount := R_StringGrid.ColCount+1;
         S_StringGrid.ColCount := S_StringGrid.ColCount+1;
         R_StringGrid.Cells[R_StringGrid.ColCount-1, 0] := tempStr;
         S_StringGrid.Cells[S_StringGrid.ColCount-1, 0] := tempStr;
         Result_StringGrid.ColCount := Result_StringGrid.ColCount+1;
         Result_StringGrid.Cells[Result_StringGrid.ColCount-1, 0] := tempStr;
    end;

     CloseFile(f);
end;

procedure TOperForm.LoadToGrids2();
var
   tempStr:String;
   f:text;
begin
    assignFile(f, LocalPath+'DATA\B.TXT');
    reset(f);
    Result_StringGrid.RowCount:=1;
    Result_StringGrid.ColCount:=1;

    while(not eof(f)) do
    begin
         readln(f, tempStr);
         Result_StringGrid.RowCount := Result_StringGrid.RowCount+1;
         Result_StringGrid.Cells[0, Result_StringGrid.RowCount-1] := tempStr;

    end;

    CloseFile(f);
    assignFile(f, LocalPath+'DATA\A.TXT');
    reset(f);

    while(not eof(f)) do
    begin
         readln(f, tempStr);
         Result_StringGrid.ColCount := Result_StringGrid.ColCount+1;
         Result_StringGrid.Cells[Result_StringGrid.ColCount-1, 0] := tempStr;
    end;

     CloseFile(f);
end;

procedure TOperForm.LoadToGrids3();
var
   tempStr:String;
   f:text;
begin
    assignFile(f, LocalPath+'DATA\A.TXT');
    reset(f);

    Result_StringGrid.RowCount:=1;
    Result_StringGrid.ColCount:=1;

    while(not eof(f)) do
    begin
         readln(f, tempStr);

         Result_StringGrid.RowCount := Result_StringGrid.RowCount+1;

         Result_StringGrid.Cells[0, Result_StringGrid.RowCount-1] := tempStr;

    end;

    CloseFile(f);
    assignFile(f, LocalPath+'DATA\B.TXT');
    reset(f);

    while(not eof(f)) do
    begin
         readln(f, tempStr);
         Result_StringGrid.ColCount := Result_StringGrid.ColCount+1;
         Result_StringGrid.Cells[Result_StringGrid.ColCount-1, 0] := tempStr;
    end;

     CloseFile(f);
end;

procedure TOperForm.RXSChange(Sender: TObject);
begin

end;

end.

