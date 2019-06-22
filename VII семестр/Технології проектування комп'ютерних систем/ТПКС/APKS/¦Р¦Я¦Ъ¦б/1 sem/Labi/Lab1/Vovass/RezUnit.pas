unit RezUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,GrafUnit,MainUnit, Grids;

type
  TResForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    sg1: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Memo1: TMemo;
    Label8: TLabel;
    Memo2: TMemo;
    Label9: TLabel;
    Edit6: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResForm: TResForm;
implementation

uses ErrorUnit;

{$R *.dfm}

procedure TResForm.FormActivate(Sender: TObject);
var
  i,j:Integer;
  err,sst:string;
  fl:boolean;
  arr:TArrInt;
  matr:TArrArrInt;
begin
  Graf.ModifyLinksMatrix;
  Edit1.Text:='.......................';
  Edit2.Text:='.......................';
  Edit3.Text:='.......................';
  Edit4.Text:='.......................';
  Edit5.Text:='.......................';
  Edit6.Text:='.......................';
  fl:=false;
  i:=Graf.isBeginEndThere;
  case i of
    1:begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('���������� ������������� ����,');
        ErrorForm.Memo1.Lines.Append('��� ��� ����������� ������� "������" !');
        ErrorForm.ShowModal;
        fl:=true
      end;
    2:begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('���������� ������������� ����,');
        ErrorForm.Memo1.Lines.Append('��� ��� ����������� ������� "�����" !');
        ErrorForm.ShowModal;
        fl:=true
      end;
    3:begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('���������� ������������� ����,');
        ErrorForm.Memo1.Lines.Append('��� ��� ����������� ������� "������"');
        ErrorForm.Memo1.Lines.Append('� "�����" !');
        ErrorForm.ShowModal;
        fl:=true
      end;
  end;
 if fl then
   begin
     Edit1.Text:='������!!!';
     Exit
   end;
 Edit1.Text:='��������� �������';
 fl:=false;
 if Graf.isPointsOK<>0 then
      begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('���������� ������������� ����,');
        ErrorForm.Memo1.Lines.Append('��� ��� ������� �������� ��������');
        ErrorForm.Memo1.Lines.Append('� ������� N'+IntToStr(Graf.getNumErr));
        case Graf.isPointsOK of
          1:err:='�������� ������� ������ ���������� � x(X)';
          2:err:='�������� ������� ������ ����� x(X) ��������� �����';
          3:err:='����������� ������� ������ ���������� � y(Y)';
          4:err:='����������� ������� �� ������ ��������� Yy YY yY yy';
          5:err:='����������� ������� �������� ������������ ������';
          6:err:='����������� ������� �������� ����������������� ��������� Y ';
        end;
        ErrorForm.Memo1.Lines.Append(err);
        ErrorForm.ShowModal;
        fl:=true
      end;
 if fl then
   begin
     Edit2.Text:='������!!!';
     Exit
   end;
 Edit2.Text:='��������� �������';
 fl:=false;
   if Graf.isLinkBegEnd <> 0 then
      begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('����������� ����� "�����" - "������"!');
        ErrorForm.Memo1.Lines.Append('��������� ������������� �����');
        ErrorForm.ShowModal;
        fl:=true
     end;
 if fl then
   begin
     Edit3.Text:='������!!!';
     Exit
   end;
 Edit3.Text:='��������� �������';
 arr:=Graf.getWay;
 SG1.ColCount:=length(arr)-1;
 for i:=1 to length(arr) do
   SG1.Cells[i-1,0]:=IntToStr(arr[i]);

 fl:=false;
 j:=Graf.testLinkedEnd;
   if j <> 0 then
      begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('����������� ����� '+IntToStr(j)+' -� ������� - "�����" !');
        ErrorForm.Memo1.Lines.Append('��������� ������������� �����.');
        ErrorForm.Memo1.Lines.Append('���� ���� ���������� - ������ ������ ������� ������ �');
        ErrorForm.Memo1.Lines.Append('���� �� �������� ��� ������ �� ����� �� ����� "������"-"�����"');        
        ErrorForm.ShowModal;
        fl:=true
     end;
 if fl then
   begin
     Edit4.Text:='������!!!';
     Exit
   end;
 Edit4.Text:='��������� �������';

 fl:=false;
 j:=Graf.testLinkedBegin;
   if j <> 0 then
      begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('����������� ����� "������" '+IntToStr(j)+' !');
        ErrorForm.Memo1.Lines.Append('��������� ������������� �����');
        ErrorForm.ShowModal;
        fl:=true
     end;
 if fl then
   begin
     Edit5.Text:='������!!!';
     Exit
   end;
 Edit5.Text:='��������� �������';

 matr:=Graf.getWays;

 for i:=0 to length(matr)-1 do
  begin
   sst:='';
   for j:=0 to length(matr[i])-2 do
       sst:=sst+IntToStr(matr[i,j])+' - ';
   Memo1.Lines.Append(sst)
  end;

 matr:=Graf.getCycles;
 for i:=0 to length(matr)-1 do
  begin
   sst:='';
   for j:=0 to length(matr[i])-1 do
       sst:=sst+IntToStr(matr[i,j])+' - ';
   Memo2.Lines.Append(sst)
  end;

 fl:=false;
 j:=Graf.testCyclesOnCorrect;
   if j <> 0 then
      begin
        ErrorForm.Memo1.Lines.Clear;
        ErrorForm.Memo1.Lines.Append('���� ������� ����� '+IntToStr(j)+' � ������ ');
        ErrorForm.Memo1.Lines.Append('����������� - ������ ����� ����������� ����������� ������� !');
        ErrorForm.ShowModal;
        fl:=true
     end;
 if fl then
   begin
     Edit6.Text:='������!!!';
     Exit
   end;
 Edit6.Text:='��������� �������';

end;




procedure TResForm.Button1Click(Sender: TObject);
begin
  Close
end;

end.
