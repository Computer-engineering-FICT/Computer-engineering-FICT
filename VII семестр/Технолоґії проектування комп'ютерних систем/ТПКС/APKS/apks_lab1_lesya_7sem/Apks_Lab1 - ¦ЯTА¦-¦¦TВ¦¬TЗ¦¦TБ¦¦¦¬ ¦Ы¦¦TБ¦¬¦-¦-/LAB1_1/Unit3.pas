unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,Unit1,Unit2, Buttons;

const
  IX_OPERATOR = 0;
  IX_IF = 1;
  IX_END = 2;

function IsDelim(delimiter:char;S:string):boolean;
function NumFromStr(s:string;delim:char):integer;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    lbSignal: TLabel;
    Label2: TLabel;
    cbType: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateView;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
function IsDelim(delimiter:char;S:string):boolean;
  var i:integer;
begin
  IsDelim:=false;
  for i:=1 to length(S) do
    if S[i]=delimiter then
      Isdelim:=true
end;

function NumFromStr(s:string;delim:char):integer;
  var NfS:string;
      i:integer;
begin
  nfS:='';
  for i:=1 to Length(s) do
    if S[i]=delim then
      break
    else
      Nfs:=NfS+s[i];
  NumFromstr:=StrToInt(NfS);
end;

procedure DevideStr(S:string;var First,Last:string);
  var i:integer;
      flag:boolean;
begin
  Last:='';
  First:='';
  flag:=true;
  for i:=1 to Length(S) do
    if flag and((S[i]=' ')or (S[i]=',')or (S[i]=';')) then
      flag:=false
    else
      if flag then
        First:=First+S[i]
      else
        Last:=Last+S[i]
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
  var Vp,i,Col,Row:integer;
      flag:boolean;
      Variant:TConVar;

  function TestSignal:boolean;
    var Last,First:string;
  begin
    TestSignal:=true;
    Last:=UpperCase(Edit1.Text);
    repeat
      DevideStr(Last,First,Last);
      if (cbType.ItemIndex = IX_IF)and(First[1]<>'X')then
        TestSignal:=false;
      if (cbType.ItemIndex = IX_OPERATOR)and(First[1]<>'Y')then
        TestSignal:=false;
      until Last=''

  end;

begin
  Variant := 0;
     if (Trim(Edit1.Text)='')and(cbType.ItemIndex<>IX_END) then
        showError('Вы не ввели сигнал (содержимое) вершины')
     else
     if not TestSignal then
       showError('Неверное значение сигналов')
     else
     begin
     flag:=false;
     for i:=0 to MaxVerNum do
       if not VerList[i].exist then
       begin
         CurrentVer:=i;
         flag:=true;
         break
       end;
       if not flag then
         CurrentVer:=MaxVerNum+1 ;
   with VerList[CurrentVer] do
   begin
     Num:=CurrentVer;
     exist:=true;
     case cbType.ItemIndex of
       IX_END:begin
          Vid:=k;
//          EndVerNum:=CurrentVer
         end;
       IX_OPERATOR:Vid:=o;
       IX_IF:Vid:=l
     end;
     if Vid<>k then
       Value:=Edit1.Text;
     SetLength(Prev,length(prev)+1);
     Vp:=NumFromStr(ComboBox1.Items[ComboBox1.ItemIndex],'/');
     SetLength(Prev,1);
     Prev[0]:=Vp;
   end;
   with VerList[Vp] do
   begin
     if (Vid=o) or (Vid=b) then
       NextMain:=CurrentVer;
     if Vid=l then
       if IsDelim('/',ComboBox1.Items[ComboBox1.ItemIndex])  then
         NextAlt:=CurrentVer
      else
         Nextmain:=CurrentVer;
     case Vid of
       o:Variant:=0;
       l:if NextAlt=CurrentVer then Variant:=1 else Variant:=0;
       b:Variant:=2;
     end;

   end;
   if (VerList[Vp].Vid=l) and (VerList[Vp].NextAlt=CurrentVer) then
     VerList[CurrentVer].Col:=VerList[Vp].Col+1
   else
     VerList[CurrentVer].Col:=VerList[Vp].Col;
   VerList[CurrentVer].Row:=VerList[Vp].Row+1;
   Row:=VerList[CurrentVer].Row;
   Col:=VerList[CurrentVer].Col;
  case VerList[CurrentVer].Vid of
    k:PutEllipse(Col,row,CurrentVer, CLR_ELLIPSE);
    o:PutRect(Col,Row,CurrentVer,Edit1.Text, CLR_RECT);
    l:PutRomb(Col,Row,CurrentVer,Edit1.Text, CLR_ROMB)
  end;
  Connect(VerList[VP].Col,VerList[VP].Row,Col,Row,Variant, CLR_CONNECT);
  if not flag then
     MaxVerNum:=MaxVerNum+1;
  VerCount:=VerCount+1;
 end;
 ModalResult := mrOk;
end;

procedure TForm3.UpdateView;
begin
  case cbType.ItemIndex of
    IX_OPERATOR: begin
      lbSignal.Caption := 'Сигналы (Y)';
      lbSignal.Visible := True;
      Edit1.Visible := True;
    end;
    IX_IF: begin
      lbSignal.Caption := 'Условия (X)';
      lbSignal.Visible := True;
      Edit1.Visible := True;
    end;
    IX_END: begin
      lbSignal.Visible := False;
      Edit1.Visible := False;      
    end;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  UpdateView;
  if Edit1.Visible then Edit1.SetFocus;
end;

procedure TForm3.cbTypeChange(Sender: TObject);
begin
  UpdateView;
  if Edit1.Visible then Edit1.SetFocus;
end;

end.
