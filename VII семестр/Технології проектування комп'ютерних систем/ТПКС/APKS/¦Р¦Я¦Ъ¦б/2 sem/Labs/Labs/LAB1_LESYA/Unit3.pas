unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,Unit1,Unit2;
function IsDelim(delimiter:char;S:string):boolean;
function NumFromStr(s:string;delim:char):integer;
type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
function IsDelim(delimiter:char;S:string):boolean;
  var i:integer;
begin
  IsDelim:=false;
  for i:=0 to length(S)-1 do
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

procedure TForm3.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm3.Button1Click(Sender: TObject);{insert}
  var Vp,i,Col,Row:integer;
      flag:boolean;
      Variant:TConVar;
begin
     if (Trim(Edit1.Text)='')and(RadioGroup1.ItemIndex<>0) then
       ShowMessage('Вершина должна содержать сигнал !')
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
 {      else
         showmessage(' '); }
   with VerList[CurrentVer] do
   begin
     Num:=CurrentVer;
     exist:=true;
     case RadioGroup1.ItemIndex of
       0:begin
          Vid:=k;
          EndVerNum:=CurrentVer
         end;
       1:Vid:=o;
       2:Vid:=l
     end;
     if Vid<>k then
       Value:=Edit1.Text;
     SetLength(Prev,length(prev)+1);
     Vp:=NumFromStr(ComboBox1.Items[ComboBox1.ItemIndex],'/');
     Prev[Length(Prev)-1]:=Vp;
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
   close;
  case VerList[CurrentVer].Vid of
    k:PutEllipse(Col,row,CurrentVer);
    o:PutRect(Col,Row,CurrentVer,Edit1.Text);
    l:PutRomb(Col,Row,CurrentVer,Edit1.Text)
  end;
  Connect(VerList[VP].Col,VerList[VP].Row,Col,Row,Variant);
  if not flag then
     MaxVerNum:=MaxVerNum+1;
  VerCount:=VerCount+1;
 end
end;

end.
