unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ServiceUnit, ExtCtrls,ComCtrls,comobj, Variants;

type
  txt=text;
  TForm1 = class(TForm)
    Button1: TButton;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edA: TEdit;
    edB: TEdit;
    Label3: TLabel;
    edPorA: TEdit;
    edPorB: TEdit;
    Label4: TLabel;
    edAddA: TEdit;
    edAddB: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    edVarCol: TEdit;
    edVarRow: TEdit;
    btSetNumbers: TButton;
    GroupBox3: TGroupBox;
    cb1: TCheckBox;
    cb2: TCheckBox;
    Label1: TLabel;
    btZaoSetNumbers: TButton;
    edZaoZachetka: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btSetNumbersClick(Sender: TObject);
    procedure btZaoSetNumbersClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses sserv1;

const
//Used when making filename for resulting doc
USE_NONE=0;
USE_VARIANT=1;
USE_ZAOCHNIKI=2;

var path:string;
    UseName:byte;

function GetWindowsDir:string;
var windowssystem:string;
    windowdir:pchar;
    szofit:cardinal;
begin
szofit:=500;
windowdir:=stralloc(szofit);
getwindowsdirectory(windowdir,szofit);
windowssystem:=string(windowdir);
result:=windowssystem
end;

procedure RunIt(cmdline:string);
var
   pi:_process_information;
   si:_startupinfoa;
begin
getstartupinfo(si);
si.cb:=sizeof(si);
createprocess(nil,pchar(cmdline),
nil,nil,false,create_default_error_mode,nil,nil,si,pi)
end;

procedure Execute(commandline:string);
begin
winexec(@commandline,SW_Hide)
end;

//Converts txt document to doc, passing
//it through winbest.exe and Word
procedure Convert(infilename,docfilename:string);
var W: Variant;
    outfilename:string;
begin
with Form1 do begin
//
outfilename:='c:\output.txt';
runit(path+'winbest.exe '+infilename);
sleep(2500);
ProgressBar1.Position:=95;
try
   W:=CreateOleObject('Word.Application');
   W.Documents.Open(outfilename);
   W.Run('Decode');
   W.ActiveDocument.SaveAs(FileName:=DocFilename, FileFormat:=0);
   W.Quit;
finally
   W:=UnAssigned;
end;
//Finally
ProgressBar1.Position:=100;
sleep(200);
DeleteFile(infilename);
DeleteFile(outfilename);
ProgressBar1.Position:=0;
//
end
end;

//Chooses filename for doc-file
//Adviced - what part is adviced to add
//to filename
function ChooseFilename(Adviced:byte):string;
var stbefore:string;
begin
with Form1 do begin
//
//Get file filename
stbefore:='';
if cb1.Checked then begin
   if cb2.Checked then stbefore:='Full_'
   else stbefore:='PartOne_';
end
else begin
   stbefore:='PartTwo_';
end;
if (UseName=USE_VARIANT)and(Adviced=USE_VARIANT) then
 stbefore:=stbefore+edVarCol.text+'_'+edVarRow.text+'_';
if (UseName=USE_ZAOCHNIKI)and(Adviced=USE_ZAOCHNIKI) then
 stbefore:=stbefore+edZaoZachetka.text+'_';
Result:='C:\'+stbefore+'('+edA.Text+'_'+edB.Text+').doc';
//
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b:word;
   pora,porb:shortint;
   adda,addb:string;
   reg:infou;
   docfilename:string;
   infilename:string;
begin
docfilename:=ChooseFilename(USE_VARIANT);
infilename:='C:\input.txt';
setoutputfile(infilename);
//Clear and set variables
clearoutputfile;
a:=strtoint(edA.text);
b:=strtoint(edB.text);
pora:=strtoint(edPorA.text);
porb:=strtoint(edPorB.text);
adda:=edAddA.text;
addb:=edAddB.text;
if cb1.checked then begin
   calc_2_1_a_whole(a);
   calc_2_1_b_whole(a);
   calc_2_1_c_whole(a);
   calc_2_1_a_fraction(b);
   calc_2_1_b_fraction(b);
   calc_2_1_c_fraction(b);
   ProgressBar1.Position:=40;
   calc_2_2(a,b);
   ProgressBar1.Position:=50;
   calc_2_3_precache(a,b);
   calc_2_3_a_1(a,b);
   calc_2_3_a_2(a,b);
   calc_2_3_b(a,b);
   ProgressBar1.Position:=60;
   MulAll(a,b);
   ProgressBar1.Position:=70;
   calc_2_5(a,b);
   ProgressBar1.Position:=80;
   calc_2_6(a,b);
   ProgressBar1.Position:=90
end;
if cb2.checked then begin
   calc_2_7_a(a,b);
   calc_2_7_b(a,b);
   ProgressBar1.Position:=65;
   calc_2_8(a,b);
   ProgressBar1.Position:=75;
   calc_2_10(a,b,pora,porb,adda,addb,reg);
   ProgressBar1.Position:=80;

   plusall_2_11_a(reg.pa+'.'+reg.a,reg.pb+'.'+reg.b);
   plusall_2_11_a2(reg.pa+'.'+reg.a,reg.pb+'.'+reg.b);
   plusall_2_11_b(reg.pa+'.'+reg.a,reg.pb+'.'+reg.b);

   calc_2_12(a,b);
   ProgressBar1.Position:=85;
   calc_2_13_1_a(a,b);
   calc_2_13_1_b(a,b);
   ProgressBar1.Position:=90;
   Sleep(100)
end;
//Convert
Convert(infilename,docfilename);
//Notify user
ShowMessage('װאיכ סמחהאם: '+docfilename);
end;

procedure TForm1.btSetNumbersClick(Sender: TObject);
var Col,Row:Integer;
begin
Col:=StrToInt(edVarCol.Text);
Row:=StrToInt(edVarRow.Text);
edA.Text:=VariantsNumbers[Row,1];
edB.Text:=VariantsNumbers[Row,Col+1];
edPorA.Text:=VariantsNumbers[Row,6];
edPorB.Text:=VariantsNumbers[Row,7];
edAddA.Text:=VariantsNumbers[Row,8];
edAddB.Text:=VariantsNumbers[Row,9];
//For right filename generation
UseName:=USE_VARIANT;
end;

procedure TForm1.btZaoSetNumbersClick(Sender: TObject);
var Zachetka:Integer;
begin
Zachetka:=StrToInt(edZaoZachetka.text);
edA.Text:=IntToStr(10*(Zachetka div 100)+2*(Zachetka mod 100));
edB.Text:=ExtendBin(IntToSTr(1000 - StrToInt(edA.Text) + 27),3);
//For right filename generation
UseName:=USE_ZAOCHNIKI;
end;

procedure TForm1.Button2Click(Sender: TObject);
var a,b:word;
    docfilename:string;
    infilename:string;
begin
docfilename:=ChooseFilename(USE_ZAOCHNIKI);
infilename:='C:\input.txt';
setoutputfile(infilename);
//Clear and set variables
clearoutputfile;
a:=strtoint(edA.text);
b:=strtoint(edB.text);
ProgressBar1.Position:=0;
if cb1.checked then begin
   Zaoch_1(a,b);
   ProgressBar1.Position:=25;
   Zaoch_2(a,b);
   ProgressBar1.Position:=50;
   Zaoch_3(a,b);
   ProgressBar1.Position:=75;
   Zaoch_4(a,b);
end;
if cb2.checked then
begin
   Zaoch_5_1(a,b);
   ProgressBar1.Position:=20;
   Zaoch_5_2(a,b);
   ProgressBar1.Position:=40;
   Zaoch_6(a,b);
   ProgressBar1.Position:=60;
   ControlMod3(a,b);
   Zaoch_8;
   ProgressBar1.Position:=80;
   Zaoch_9(a,b);
end;
ProgressBar1.Position:=90;
//Convert
Convert(infilename,docfilename);
//Notify user
ShowMessage('װאיכ סמחהאם: '+docfilename);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
deletefile('c:\output.txt');
end;

initialization
path:=ExtractFilePath(ParamStr(0))+'\';
//For right filename generation
UseName:=USE_NONE;

end.
