unit AutoGenUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, MainGraphUnit, ListControl, ExtCtrls;

type
  TAutoGenForm = class(TForm)
    NOP: TSpinEdit;
    COMPL: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OkBut: TButton;
    CancelBut: TButton;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    dY: TSpinEdit;
    dX: TSpinEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    NOC: TLabel;
    procedure CancelButClick(Sender: TObject);
    procedure OkButClick(Sender: TObject);
    procedure NOPChange(Sender: TObject);
    procedure COMPLChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CountNumOfCons;
  end;

var
  AutoGenForm: TAutoGenForm;

implementation

uses GraphWin;

{$R *.DFM}

procedure TAutoGenForm.CountNumOfCons;
var NumOfPoints:integer;
    NumOfCons,MaxNumOfCons:integer;
    completion:extended;
begin
  NumOfPoints:=NOP.Value;
  completion:=COMPL.Value/100;
  MaxNumOfCons:=round((NumOfPoints-1)*NumOfPoints/2);
  NumOfCons:=round(completion*MaxNumOfCons);
  NOC.Caption:=inttostr(NumOfCons);
end;


procedure TAutoGenForm.CancelButClick(Sender: TObject);
begin
  Close
end;

procedure TAutoGenForm.OkButClick(Sender: TObject);
var completion:extended;
    NumOfPoints:integer;
    NumOfCons,MaxNumOfCons:integer;
    i,j,X,Y:integer;
    Matrix:TIntMatrix;
    Numbers,Count,Check :TIntMatrix;
    MaxCount,MaxNumber:integer;
    fP,tP:PPoint;
    R:integer;
    Alpha,dAlpha:extended;
    X0,Y0:integer;

    function NoCheck:boolean;
    var i:integer;
    begin
      Result:=true;
      for i:=0 to Check.ColCount-1 do
        if Check[0,i]=1 then break;
    end;
begin
  NumOfPoints:=NOP.Value;
  completion:=COMPL.Value/100;
  MaxNumOfCons:=round((NumOfPoints-1)*NumOfPoints/2);
  NumOfCons:=round(completion*MaxNumOfCons);
  Matrix:=TIntMatrix.create(NumOfPoints,NumOfPoints);
  Count :=TIntMatrix.create(1,NumOfPoints);
  Check :=TIntMatrix.create(1,NumOfPoints);
  Numbers :=TIntMatrix.create(1,NumOfPoints);
  MainForm.Graph.Destroy;
  MainForm.Graph:=TGraph.Create;
  // Заполнение матрицы //
  for i:=0 to NumOfPoints-1 do
    for j:=i+1 to NumOfPoints-1 do
    begin
      if(NumOfCons<>0)and((random < completion)or(MaxNumOfCons=NumOfCons))then
      begin
        Matrix[i,j]:=round(random*(MainForm.Setup.MaxConValue-MainForm.Setup.MinConValue)+MainForm.Setup.MinConValue);
        NumOfCons:=NumOfCons-1;
      end;
      MaxNumOfCons:=MaxNumOfCons-1
    end;
  // -->>
  repeat
    for i:=0 to NumOfPoints-1 do
    begin
      Check[0,i]:=0;
      for j:=0 to i-1 do
        if (Matrix[j,i]<>0)and(Count[0,i]<Count[0,j]+1)then
        begin
         Check[0,i]:=1;
         Count[0,i]:=Count[0,j]+1
        end;
    end;
  until NoCheck;

  MaxCount:=0;
  for i:=0 to NumOfPoints-1 do
   if MaxCount<Count[0,i] then MaxCount:=Count[0,i];

  IF checkBox1.checked then
  BEGIN
  Y:=0;
  MaxNumber:=1;
  for i:=0 to MaxCount do
  begin
    X:=round(dX.Value+dX.Value/2*(i mod 2));
    Y:=Y+dY.Value;
    for j:=0 to NumOfPoints-1 do
     if Count[0,j]=i then
     begin
      MainForm.Graph.AddPoint(X,Y,round(random*(MainForm.Setup.MaxPointValue-MainForm.Setup.MinPointValue)+MainForm.Setup.MinPointValue));
      Numbers[0,j]:=MaxNumber;
      MaxNumber:=MaxNumber+1;
      X:=X+dX.Value
     end;
  end;
  END
  ELSE
  BEGIN
  MaxNumber:=1;
  X0:=400;
  Y0:=300;
  R:=200;
  Alpha:=0;
  dAlpha:=2*Pi/NumOfPoints;
  for i:=0 to NumOfPoints-1 do
  begin
    X:=round(X0-R*cos(Alpha));
    Y:=round(Y0-R*sin(Alpha));
    MainForm.Graph.AddPoint(X,Y,random(MainForm.Setup.MaxPointValue-MainForm.Setup.MinPointValue)+MainForm.Setup.MinPointValue);
    Numbers[0,i]:=MaxNumber;
    MaxNumber:=MaxNumber+1;
    Alpha:=Alpha+dAlpha
  end;
  END;

  for i:=0 to NumOfPoints-1 do
    for j:=i+1 to NumOfPoints-1 do
      if Matrix[i,j]<>0 then
      begin
        fP:=MainForm.Graph.GetPointByID(Numbers[0,i]);
        tP:=MainForm.Graph.GetPointByID(Numbers[0,j]);
        MainForm.Graph.AddConnection(fp,tp,Matrix[i,j])
      end;
  Close;
  MainForm.UpdateStatus;
  MainForm.pole.repaint;
end;

procedure TAutoGenForm.NOPChange(Sender: TObject);
begin
  CountNumOfCons
end;

procedure TAutoGenForm.COMPLChange(Sender: TObject);
begin
  CountNumOfCons
end;

procedure TAutoGenForm.FormShow(Sender: TObject);
begin
  CountNumOfCons
end;


end.
