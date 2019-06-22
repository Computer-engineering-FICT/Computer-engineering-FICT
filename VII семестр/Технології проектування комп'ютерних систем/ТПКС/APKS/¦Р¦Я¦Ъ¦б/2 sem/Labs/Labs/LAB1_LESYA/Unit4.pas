unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,unit1,unit2,unit3;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
procedure DelItem(var A:TPrev;Pos:integer);
  var i:integer;
begin
  for i:=pos+1 to length(A)-1 do
    A[i-1]:=A[i];
  setLength(A,Length(A)-1)
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Close
end;

procedure TForm4.Button1Click(Sender: TObject); {InsConnect}
  var Vp,Vn:integer;
      variant:TConVar;
begin
  if ComboBox1.Items[ComboBox1.ItemIndex][1]=ComboBox2.Items[ComboBox2.ItemIndex] then
    ShowMessage('Запрещенная связь')
  else
  begin
    Vp:=NumFromStr(ComboBox1.Items[ComboBox1.ItemIndex],'/');
    Vn:=NumFromStr(ComboBox2.Items[ComboBox2.ItemIndex],'/');
    TableSv[Vp,Vn]:=true;
    case VerList[Vp].Vid of
       o:Variant:=0;
       l:if IsDelim('/',ComboBox1.Items[ComboBox1.ItemIndex]) then Variant:=1 else Variant:=0;
       b:Variant:=2;
     end;
    with VerList[Vn] do
    begin
      SetLength(Prev,length(prev)+1);
      Prev[Length(Prev)-1]:=Vp;
    end;

    with VerList[Vp] do
    begin
      if (Vid=o) or (Vid=b) then
        NextMain:=Vn;
      if Vid=l then
        if IsDelim('/',ComboBox1.Items[ComboBox1.ItemIndex])  then
          NextAlt:=Vn
        else
          NextMain:=Vn;
    end;
    close;
    Connect(VerList[VP].Col,VerList[VP].Row,VerList[Vn].Col,VerList[Vn].Row,Variant);
  end;
end; {InsConnect}


procedure TForm4.Button3Click(Sender: TObject); {Del}
  var Vp,Vud,i:integer;
      Variant:TConVar;
begin
   Vud:=StrToInt(ComboBox2.Items[ComboBox2.ItemIndex]);
   with  VerList[Vud] do
   begin
     for i:=0 to length(prev)-1 do
     begin
       Vp:=Prev[i];
       case VerList[Vp].Vid of
         o:Variant:=0;
         l:if VerList[Vp].NextAlt=Vud then Variant:=1 else Variant:=0;
         b:Variant:=2;
       end;
       if (VerList[Vp].Vid=l) and (VerList[Vp].NextAlt=Vud) then
          VerList[Vp].NextAlt:=-1
       else
         VerList[Vp].NextMain:=-1;

       DisConnect(VerList[Vp].Col,VerList[Vp].Row,Col,Row,Variant)
     end;
     setLength(Prev,0);

     if Vid<>k then
     begin
       if NextAlt<>-1 then
       begin
         DisConnect(Col,Row,VerList[NextAlt].Col,VerList[NextAlt].Row,1);
         for i:=0 to length(VerList[NextAlt].Prev)-1 do
           if VerList[NextAlt].Prev[i]=Vud then
             DelItem(VerList[NextAlt].prev,i)
       end;
       if NextMain<>-1 then
       begin
         DisConnect(Col,Row,VerList[NextMain].Col,VerList[NextMain].Row,0);
         for i:=0 to length(VerList[NextMain].Prev)-1 do
           if VerList[NextMain].Prev[i]=Vud then
             DelItem(VerList[NextMain].prev,i)

       end
     end;
     NextAlt:=-1;
     nextMain:=-1;
     case Vid of
       k:DelEllipse(Col,Row);
       o:DelRect(Col,Row,'');
       l:delRomb(Col,Row,'   ')
     end;
     if Vud=MaxVerNum then
       MaxVerNum:=MaxVerNum-1;
 //    VerCount:=VerCount-1;
     exist:=False
   end;
  TableSv[Vp,Vud]:=false;
  close;
end; {del}

procedure TForm4.Button4Click(Sender: TObject);
  var Vp,Vn,i:integer;
      Variant:TConVar;
begin
Vp:=NumFromStr(ComboBox1.Items[ComboBox1.ItemIndex],'/');
   Vn:=StrToInt(ComboBox2.Items[ComboBox2.ItemIndex]);
{   Vp:=StrToInt(ComboBox1.Items[ComboBox1.ItemIndex][1]);}
   if (VerList[Vp].NextMain=Vn)or(Verlist[Vp].NextAlt=Vn) then
   with  VerList[Vn] do
   begin
       case VerList[Vp].Vid of
         o:Variant:=0;
         l:if VerList[Vp].NextAlt=Vn then Variant:=1 else Variant:=0;
         b:Variant:=2;
       end;
       if (VerList[Vp].Vid=l) and (VerList[Vp].NextAlt=Vn) then
          VerList[Vp].NextAlt:=-1
       else
         VerList[Vp].NextMain:=-1;
       DisConnect(VerList[Vp].Col,VerList[Vp].Row,Col,Row,Variant);

        if IsDelim('/',ComboBox1.Items[ComboBox1.ItemIndex])  then
          VerList[Vp].NextAlt:=-1
        else
          VerList[Vp].NextMain:=-1;
        for i:=0 to Length(Prev)-1 do
          if Prev[i]=Vp then
           DelItem(prev,i);
       Close;
   end
   else
    showMessage('Связь не существует')

end;

end.
