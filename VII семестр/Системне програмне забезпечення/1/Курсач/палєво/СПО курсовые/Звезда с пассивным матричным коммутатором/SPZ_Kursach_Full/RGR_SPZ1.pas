unit RGR_SPZ1;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Start, Buttons;


const
  MaxTime=500;

type

TZadanie=record
 Processor:Integer;
 VremyaNachala:Integer;
 VremyaObrabotki:Integer;
 VremyaKonca:Integer;
 Active:boolean;
 Done:boolean;
 Klaster:Integer;
end;

TCommutatorElem=record
  Data:Integer;
  Active:boolean;
end;


type
  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button3: TButton;
    Button4: TButton;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  N:Integer;  // ���������� ����� �����
  MatricaSviaznosti,MatricaSviaznostiTemp:array[1..MAX_VER_COUNT,1..MAX_VER_COUNT] of Integer;   // ������� ���������, ����� ������� ���������
                                                              // �������� �� ������ N*N

 Zadanie: array[1..MAX_VER_COUNT] of TZadanie;                      // ������ ����� �����
                                                              // �������� ��� ������ N
 Proc_Count:Integer;            // ���������� ������� �����������
 ProcessorZanjatPeresilkoj:array[1..MAX_VER_COUNT] of boolean;    // ������ ��������� ����������� ����������� ����� �����-����������
                                                       // �������� ��� ������ P
 CommutatorZadanija:array[1..MAX_VER_COUNT,1..MAX_VER_COUNT] of TCommutatorElem;      // ������� ��������� ����� ������ ��� ������-�����������
                                                                  // �������� �� ������ N*N

 GrafikGanta:array[1..MaxTime,1..MAX_VER_COUNT] of Integer;             // ������ �� �������� P
 CurrentPeresilki:array[1..MaxTime] of String;
 Time:Integer;                                                    // ����� �������� �����


 CurrentNizKlastera:Integer;                   // ����� ������� ������(�����) �������� ��������

 DoidenoDoVerha:Boolean;

 function NothingNeeded(stolbec:integer):boolean;
 function AllDone:boolean;
 function ZanyatKanal(i,j:integer):boolean;
 procedure BuildGrafikGanta;
 procedure ViewGrafikGanta;
 function KtoDerzhit(Zadan:integer):integer;
 procedure ZanulitILIVosstanovitPeresilki;
 procedure OptimizeGrafikGanta;
 procedure Pererisovka;
 procedure PreProcessing;
 procedure UporjadochitChisloProcessorov;
 procedure Minimize_Proc_Count;
 procedure SendKlasterToNewProc(Klaster,NewProc:Integer);
implementation

uses RGR_SPZ2;

{$R *.dfm}

//****************************************************************************
procedure Pererisovka;      // Pererisovka tablic zadaniya grafa
var
  i:Integer;
begin
  for i:=1 to  (Form1.StringGrid1.RowCount-1) do
      Form1.StringGrid1.Cells[0,i]:= IntToStr(i);
   for i:=1 to  (Form1.StringGrid1.ColCount-1) do
      Form1.StringGrid1.Cells[i,0]:= IntToStr(i);
   for i:=1 to  (Form1.StringGrid2.ColCount-1) do
      Form1.StringGrid2.Cells[i,0]:= IntToStr(i);
end;
//****************************************************************************
procedure TForm1.FormCreate(Sender: TObject);
begin 
   Pererisovka;
end;
//****************************************************************************
procedure Init;
var
  i,j: Integer;
begin
  
  for i:=1 to MAX_VER_COUNT do      // �������� ������� ��������� (-1 ->  ��� �����)
    for j:=1 to MAX_VER_COUNT do
        MatricaSviaznosti[i,j]:=-1;


  for i:=1 to MAX_VER_COUNT do      // �������� ���� ����� �����
    Zadanie[i].VremyaObrabotki:=0;

  for i:=1 to N do      // ������ ������� ���������
    for j:=1 to N do
      if Form1.StringGrid1.Cells[j,i]<>'' then
        MatricaSviaznosti[i,j]:=StrToInt(Form1.StringGrid1.Cells[j,i])
      else
        MatricaSviaznosti[i,j]:=-1;

   MatricaSviaznostiTemp:=MatricaSviaznosti;        // �������� ������� ���������  � Temp

   for i:=1 to N do      // ������ ���� ����� �����
    Zadanie[i].VremyaObrabotki:=StrToInt(Form1.StringGrid2.Cells[i,1]);
end;
//****************************************************************************
function NothingNeeded(stolbec:integer):boolean;
var
 i:integer;
begin
 NothingNeeded:=true;
 for i:=1 to N do
  if ((MatricaSviaznosti[i,stolbec]>0) and (not Zadanie[i].Done)) or (CommutatorZadanija[i,stolbec].Data>0) or (CommutatorZadanija[i,stolbec].Active) then
    NothingNeeded:=false;
end;
//****************************************************************************
function AllDone:boolean;
var
 i:integer;
begin
 AllDone:=true;
 for i:=1 to N do
  if not Zadanie[i].Done then
    AllDone:=false;
end;
//****************************************************************************

function ZanyatKanal(i,j:integer):boolean;
var
 P1,P2:integer;
begin
  P1:=Zadanie[i].Processor;
  P2:=Zadanie[j].Processor;
  ZanyatKanal:=false;
  if (ProcessorZanjatPeresilkoj[P1]) or (ProcessorZanjatPeresilkoj[P2]) then
    ZanyatKanal:=true;
end;
//****************************************************************************
procedure BuildGrafikGanta;
var
  i,j: Integer;
begin
  for i:=1 to MaxTime do                  // �������� ������ �����
    for j:=1 to MAX_VER_COUNT do
      GrafikGanta[i,j]:=0;

  for i:=1 to N do                  // ��������� ������� ��������� �� ���������� �����
    for j:=1 to N do
      CommutatorZadanija[i,j].Data:=MatricaSviaznostiTemp[i,j];

  for i:=1 to N do                  // ���������� ������������� �������
  begin
    Zadanie[i].Done:=false;
    Zadanie[i].VremyaKonca:=0;
  end;

  Time:=0;
  repeat
    Time:=Time+1;

    for i:=1 to N do
      if NothingNeeded(i) and (not Zadanie[i].Done) and (not Zadanie[i].Active) and (GrafikGanta[Time,Zadanie[i].Processor]=0) then
        begin                     // ������ ������� � ������ �����
          Zadanie[i].VremyaNachala:=Time;
          Zadanie[i].VremyaKonca:=Time+Zadanie[i].VremyaObrabotki-1;
          Zadanie[i].Active:=true;
          for j:=Zadanie[i].VremyaNachala to Zadanie[i].VremyaKonca do
            GrafikGanta[j,Zadanie[i].Processor]:=i;
        end;

    for i:=1 to N do
      if Zadanie[i].Done then
        for j:=1 to N do          // ������� ����� ������� ��� ������� ��������� ����� �����
          if (CommutatorZadanija[i,j].Data>0) and (not ZanyatKanal(i,j)) then
          begin
            CommutatorZadanija[i,j].Active:=true;
            ProcessorZanjatPeresilkoj[Zadanie[i].Processor]:=true;
            ProcessorZanjatPeresilkoj[Zadanie[j].Processor]:=true;
          end;

    for i:=1 to N do
      if Zadanie[i].VremyaKonca=Time then
        begin
          Zadanie[i].Done:=true;
          Zadanie[i].Active:=false;
        end;

    for i:=1 to N do           // ��������� �������� ���������
      for j:=1 to N do
        if (CommutatorZadanija[i,j].Active) and (CommutatorZadanija[i,j].Data>0) then
          CommutatorZadanija[i,j].Data:=CommutatorZadanija[i,j].Data-1;


    CurrentPeresilki[Time]:='';
    for i:=1 to N do
      for j:=1 to N do
        if CommutatorZadanija[i,j].Active then
          CurrentPeresilki[Time]:=CurrentPeresilki[Time]+IntToStr(i)+' -> '+IntToStr(j)+'    ';

    for i:=1 to N do           // ���� �������� ��������� �����������(=0), �� ������� �� ����������
      for j:=1 to N do
        if (CommutatorZadanija[i,j].Active) and (CommutatorZadanija[i,j].Data=0) then
          begin
            CommutatorZadanija[i,j].Active:=false;
            ProcessorZanjatPeresilkoj[Zadanie[i].Processor]:=false;
            ProcessorZanjatPeresilkoj[Zadanie[j].Processor]:=false;
          end;

  until AllDone;
end;
//****************************************************************************
procedure ViewGrafikGanta;
var
  i,j:Integer;
begin
  Form2.Show;
  Form2.StringGrid1.RowCount:=Time+1;
  Form2.StringGrid1.ColCount:=Proc_Count+2;

  for i:=0 to Form2.StringGrid1.RowCount-1 do
    for j:=0 to Form2.StringGrid1.ColCount-1 do
      Form2.StringGrid1.Cells[j,i]:='';

  for i:=0 to Time do
    Form2.StringGrid1.RowHeights[i]:=16;
    
  Form2.StringGrid1.ColWidths[0]:=100;
  Form2.StringGrid1.Cells[0,0]:='Time   Processors';
  
  for i:=1 to Form2.StringGrid1.ColCount-1 do
    Form2.StringGrid1.ColWidths[i]:=30;
  Form2.StringGrid1.ColWidths[Proc_Count+1]:=150;
  Form2.StringGrid1.Cells[Proc_Count+1,0]:='Peresilki';

  for i:=1 to Time do
    Form2.StringGrid1.Cells[0,i]:=IntToStr(i);

  for i:=1 to Proc_Count do
    Form2.StringGrid1.Cells[i,0]:=IntToStr(i);



  for i:=1 to Time do
    for j:=1 to Proc_Count do
      if GrafikGanta[i,j]=0 then
        Form2.StringGrid1.Cells[j,i]:=''
      else
        Form2.StringGrid1.Cells[j,i]:=IntToStr(GrafikGanta[i,j]);


  for i:=1 to Time do
    Form2.StringGrid1.Cells[Proc_Count+1,i]:=CurrentPeresilki[i];

  Form2.Label2.Caption:='�������: '+IntToStr(CurrentNizKlastera);

end;

//****************************************************************************
function KtoDerzhit(Zadan:integer):integer;
var
  i,min:integer;
begin
  min:=1000;
  for i:=1 to N do
    if (MatricaSviaznostiTemp[i,Zadan]>0) and ((Zadanie[Zadan].VremyaNachala-Zadanie[i].VremyaKonca-MatricaSviaznostiTemp[i,Zadan])<min) then
      begin
        min:=Zadanie[Zadan].VremyaNachala-Zadanie[i].VremyaKonca-MatricaSviaznostiTemp[i,Zadan];
        KtoDerzhit:=i;
      end;

end;
//****************************************************************************

procedure ZanulitILIVosstanovitPeresilki;
var
  i,j:integer;
begin
  for i:=1 to N do
    for j:=1 to N do
      begin
        if Zadanie[i].Processor=Zadanie[j].Processor then
          MatricaSviaznostiTemp[i,j]:=0;
        if Zadanie[i].Processor<>Zadanie[j].Processor then
          MatricaSviaznostiTemp[i,j]:=MatricaSviaznosti[i,j];
      end;  
end;
//****************************************************************************
function FindNachaloKlastera(NomerKlastera:Integer):Integer;
var
  i,Nachalo:Integer;
begin
  Nachalo:=Time;
  for i:=1 to N do
    if ((Zadanie[i].Klaster=NomerKlastera) and (Zadanie[i].VremyaNachala<Nachalo)) then
      Nachalo:=Zadanie[i].VremyaNachala;
  FindNachaloKlastera:=Nachalo;
end;
//****************************************************************************
function FindKonecKlastera(NomerKlastera:Integer):Integer;
var
  i,Konec:Integer;
begin
  Konec:=0;
  for i:=1 to N do
    if ((Zadanie[i].Klaster=NomerKlastera) and (Zadanie[i].VremyaKonca>Konec)) then
      Konec:=Zadanie[i].VremyaKonca;
  FindKonecKlastera:=Konec;
end;
//****************************************************************************
function KlasterNerazrivnij(Zadan:Integer;var ZadanieKonecKlastera: Integer):Boolean;
var
  i,ZadanNachaloKuska,ZadanKonecKuska:Integer;
  ProverkaUp,ProverkaDown:Boolean;
begin
  ProverkaUp:=true;
  ProverkaDown:=true;

  i:=Zadanie[Zadan].VremyaKonca;
  repeat Inc(i);
  until ((i>Time) or (GrafikGanta[i,Zadanie[Zadan].Processor]=0));   // ����� ����� ����� ��������(���� �� ���������)
  ZadanKonecKuska:=GrafikGanta[i-1,Zadanie[Zadan].Processor];

  repeat Dec(i);
  until ((i<0) or (GrafikGanta[i,Zadanie[Zadan].Processor]=0));     // ����� ������ ����� ��������(���� �� ���������)
  ZadanNachaloKuska:=GrafikGanta[i+1,Zadanie[Zadan].Processor];
//-----------------------------------------------------------------
  if Zadanie[ZadanNachaloKuska].VremyaNachala<>FindNachaloKlastera(Zadanie[Zadan].Klaster) then
    ProverkaUp:=false;

  if Zadanie[ZadanKonecKuska].VremyaKonca<>FindKonecKlastera(Zadanie[Zadan].Klaster) then
    ProverkaDown:=false;

  ZadanieKonecKlastera:=GrafikGanta[FindKonecKlastera(Zadanie[Zadan].Klaster),Zadanie[Zadan].Processor];
  KlasterNerazrivnij:=ProverkaUp and ProverkaDown;
end;
//****************************************************************************
procedure OptimizeGrafikGanta;
var
  i:Integer;
  CurrZadanie,ToZ,Derzhit,ZadanieKonecKlastera,CurrKlaster:Integer;
begin
  if DoidenoDoVerha then
    begin
      Application.MessageBox('������� �� �����','All Done',mb_Ok);
      Exit;
    end;
    
  i:=Zadanie[CurrentNizKlastera].VremyaKonca;
  repeat i:=i-1;
  until ((i<1) or (GrafikGanta[i,Zadanie[CurrentNizKlastera].Processor]=0));

  CurrZadanie:=GrafikGanta[i+1,Zadanie[CurrentNizKlastera].Processor];        // ����� ������ ��������(���� �����������),
                                                                              // �.�. ������� �������

  if Zadanie[CurrZadanie].VremyaNachala=FindNachaloKlastera(Zadanie[CurrZadanie].Klaster) then   // ���� ������� ������� �����������
    begin
      if Zadanie[CurrZadanie].VremyaNachala=1 then       // ���� ������� ������� ��������(�������)
        begin
          DoidenoDoVerha:=true;
          Exit;
        end;

      ToZ:=KtoDerzhit(CurrZadanie);
      if KlasterNerazrivnij(ToZ,ZadanieKonecKlastera) then  // ���� �������� ������� �����������
        begin
          CurrKlaster:=Zadanie[CurrZadanie].Klaster;

            for i:=1 to N do
                if Zadanie[i].Klaster=CurrKlaster then
                  begin
                    Zadanie[i].Processor:=Zadanie[ToZ].Processor;
                    Zadanie[i].Klaster:=Zadanie[ToZ].Klaster;
                  end;
        end
       else
         begin
           CurrentNizKlastera:=ZadanieKonecKlastera;
           OptimizeGrafikGanta;
         end;
    end
  else         // ���� ������� ������� ���������
    begin
      Derzhit:=KtoDerzhit(CurrZadanie);    // ����� �������, ������� ������
      if KlasterNerazrivnij(Derzhit,ZadanieKonecKlastera) then  // ���� �������� ������� �����������
        begin
          if FindNachaloKlastera(Zadanie[Derzhit].Klaster)<>1 then  // ���� �������� ������� �� ��������(�������)
            CurrZadanie:=GrafikGanta[FindNachaloKlastera(Zadanie[Derzhit].Klaster),Zadanie[Derzhit].Processor]
          else                                               // ���� �������� ������� ��������(�������)
            begin
              DoidenoDoVerha:=true;
              Exit;
            end;

          CurrKlaster:=Zadanie[CurrZadanie].Klaster;

          ToZ:=KtoDerzhit(CurrZadanie);
          for i:=1 to N do
            if Zadanie[i].Klaster=CurrKlaster then
            begin
              Zadanie[i].Processor:=Zadanie[ToZ].Processor;
              Zadanie[i].Klaster:=Zadanie[ToZ].Klaster;
            end;
        end
      else                                      // ���� �������� ������� ���������
        begin
          CurrentNizKlastera:=ZadanieKonecKlastera;
          OptimizeGrafikGanta;
        end;
    end;

  ZanulitILIVosstanovitPeresilki;
end;
//****************************************************************************
function ProcessorNeZanyat(Num:Integer):Boolean;
var
  i:Integer;
begin
  ProcessorNeZanyat:=true;
  for i:=1 to Time do
    if GrafikGanta[i,Num]>0 then
      ProcessorNeZanyat:=false;
end;
//****************************************************************************
procedure UporjadochitChisloProcessorov;
var
  i,j:Integer;
begin

repeat
  i:=0;
  repeat i:=i+1;
  until ((i>Proc_Count) or (ProcessorNeZanyat(i)));

  if i<=Proc_Count then
    begin
      for j:=1 to N do
        if Zadanie[j].Processor>i then
          Zadanie[j].Processor:=Zadanie[j].Processor-1;
      BuildGrafikGanta;
      Proc_Count:=Proc_Count-1;
    end;
until i>Proc_Count;

ZanulitIliVosstanovitPeresilki;
end;
//****************************************************************************
procedure SendKlasterToNewProc(Klaster,NewProc:Integer);
var
  i:Integer;
begin
  for i:=1 to N do
    if Zadanie[i].Klaster=Klaster then
      Zadanie[i].Processor:=NewProc;

  ZanulitILIVosstanovitPeresilki;    
end;
//****************************************************************************
procedure Minimize_Proc_Count;
var
  i,j,k:Integer;
  Klasters:set of 1..MAX_VER_COUNT;
  NachaloKlastera,KonecKlastera:Integer;
  Prev_Time,Prev_Proc:Integer;
  NothingDone:Boolean;
//------------------------------------------------------------------
function Proc_Svoboden(Proc,FromTime,ToTime:Integer):Boolean;
  var
    i:Integer;
  begin
    Proc_Svoboden:=true;
    for i:=FromTime to ToTime do
      if GrafikGanta[i,Proc]>0 then
        Proc_Svoboden:=false;
  end;
//------------------------------------------------------------------
function KlasterProc(Klast:Integer):Integer;
var
  i:Integer;
begin
  for i:=1 to N do
    if Zadanie[i].Klaster=Klast then
      KlasterProc:=Zadanie[i].Processor;
end;
//------------------------------------------------------------------
begin
  Klasters:=[];
  for i:=1 to N do
    if (not (Zadanie[i].Klaster in Klasters)) then
      Include(Klasters,Zadanie[i].Klaster);            // ����� ��������� ���� ������������ ���������

repeat
  NothingDone:=true;

  for i:=N downto 1 do
    if (i in Klasters) then
      begin
        NachaloKlastera:=FindNachaloKlastera(i);
        KonecKlastera:=FindKonecKlastera(i);
        Prev_Time:= Time;
        Prev_Proc:=KlasterProc(i);

        j:=0;
        repeat Inc(j);
        until ((j>Proc_Count) or (Proc_Svoboden(j,NachaloKlastera,KonecKlastera)));
        if j<=Proc_Count then
          begin
            SendKlasterToNewProc(i,j);
            BuildGrafikGanta;

            if Time>Prev_Time then       // ��������������� ��� ����
              SendKlasterToNewProc(i,Prev_Proc)
            else
              begin
                UporjadochitChisloProcessorov;
                NothingDone:=false;
              end;

            BuildGrafikGanta;
          end;


      end;

until NothingDone;

end;
//****************************************************************************
procedure TForm1.Button3Click(Sender: TObject);     // ������ "RUN"
var
 i:Integer;
begin
  Init;

  for i:=1 to N do          // ������� ���� �� ���������� (������� �������)
    begin
      Zadanie[i].Processor:=i;
      Zadanie[i].Klaster:=i;
    end;
  Proc_Count:=N;

  BuildGrafikGanta;
  ViewGrafikGanta;

  DoidenoDoVerha:=false;
end;
//****************************************************************************
procedure TForm1.Button4Click(Sender: TObject);    // ������ "RUN ALL"
var
  i:Integer;
begin
  Init;

  for i:=1 to N do          // ������� ���� �� ���������� (������� �������)
    begin
      Zadanie[i].Processor:=i;
      Zadanie[i].Klaster:=i;
    end;
  Proc_Count:=N;

  BuildGrafikGanta;

  PreProcessing;
  BuildGrafikGanta;
  
  i:=0;
  repeat i:=i+1;
  until GrafikGanta[Time,i]<>0;

  CurrentNizKlastera:=GrafikGanta[Time,i];

  DoidenoDoVerha:=false;
  
  repeat
    OptimizeGrafikGanta;
    BuildGrafikGanta;
  until DoidenoDoVerha;
  
  UporjadochitChisloProcessorov;
  BuildGrafikGanta;

  Minimize_Proc_Count;

  ViewGrafikGanta;
end;
//****************************************************************************
procedure PreProcessing;
var
  i,Otkuda:Integer;
//--------------------------------------------------------------------------
function OdinVhod(var Otkuda:Integer;Kuda:Integer):Boolean;
var
  i,Sum:Integer;
begin
  Sum:=0;
  for i:=1 to Ver_Count do
    if MatricaSviaznostiTemp[i,Kuda]>0 then
      begin
        Sum:=Sum+1;
        Otkuda:=i;
      end;

  if Sum=1 then Result:=true
  else result:=false;
end;
//--------------------------------------------------------------------------
function OdinVyhod(Zadanie:Integer):Boolean;
var
  i,Sum:Integer;
begin
  Sum:=0;
  Result:=false;

  for i:=1 to Ver_Count do
    if MatricaSviaznostiTemp[Zadanie,i]>0 then
      Sum:=Sum+1;

  if Sum=1 then Result:=true
  else result:=false;
end;
//--------------------------------------------------------------------------

begin
  for i:=1 to Ver_Count do
    if OdinVhod(Otkuda,i) and OdinVyhod(Otkuda) then
      begin
        Zadanie[i].Processor:=Zadanie[Otkuda].Processor;
        Zadanie[i].Klaster:=Zadanie[Otkuda].Klaster;
      end;
  ZanulitILIVosstanovitPeresilki;    
end;
//****************************************************************************
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1Main.Close;
end;
//****************************************************************************
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Form1.Hide;
  Form1Main.Show;
end;
//****************************************************************************
end.
