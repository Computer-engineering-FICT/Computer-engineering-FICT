unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

const
  MaxIntervalForCalls = 1000;   // ������������ ����� ����� ��������
  MaxNeedTacts = 100;           // ������������ ����� ���������� ������

type
  txt = text;
  TCall = class
  public
    NeedTacts: word;    // ���������� ����������� ������ ��� ����������
    NumberSource: word; // ����� ���������, ����������� ������
    CreateTact,ExecTact: integer;     // ���� �������� � ���� ������ ����������
    ExecProc: word;     // ����� ������������ �����
    Number: integer;    // ���������� �����
    constructor Create(CExecProc,CNeedTacts,CNumberSource: word;CCreateTact,CExecTact,CNumber: integer);
    function GetInfoFull: string;
  end;

  TSource = class
  public
    Number: word;       // ���������� �����
    IntensForNextCall: word;    // ������������� ��� ���� ����� ��������, ��� Random(1/Intens*MaxIntervalForCalls);
                                // ��� ������ Intens - ��� ������ ����� ����� ��������
                                // 1 <= Intens <= MaxIntervalForCalls
    IntensForNeedTacts: word;   // ������������� ��� ������� ���������� ������
    TactsToNextCall: word;      // ����� �� ��������� ��������� ������
    LastToNextCall: word;       // ����� �� ��������� ����.������ (�������������)
    LastNeedTacts: word;        // ����� ����������� ��� ���������� ��������� ������
    Tacts: integer;     // ����� ������
    Calls: integer;     // ���������� ������������� ������
    constructor Create(CNumber,CIntensForNextCall,CIntensForNeedTacts,CLastToNextCall,CLastNeedTacts: word);
    function GetInfoFull: string;
    function Tact: TCall;
  end;

  TProcessor = class
  public
    Call: TCall;        // ������
    NeedTacts: word;    // �������� ��� ������ ������
    Number: word;       // ���������� �����
    Tacts: integer;     // ���������� ���� ������
    Tacts_Work,Tacts_Idle: integer;     // ����� ������ � �������
    Calls: integer;     // ���������� ����������� ������
    constructor Create(CNumber: word);
    function GetInfoFull: string;
    function Tact: TCall;
    function Load(LCall: TCall): boolean;
  end;

type
  TLine = ^TTLine;
  TTLine = record
    Call: TCall;
    Source: TSource;
    Processor: TProcessor;
    Next: TLine;
  end;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Go(NumberProcessors: word;AllTacts: integer;FileName: string;var lp: extended;var nc: integer);
    procedure AddToLine(var ALine: TLine;ACall: TCall;ASource: TSource;AProcessor: TProcessor);
    function GetFromLine(var ALine: TLine): TCall;
    procedure Start(AllTacts: integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.GetFromLine(var ALine: TLine): TCall;
var
  tmp_line: TLine;
begin
  if ALine <> nil
    then
      begin
        if ALine^.Next = nil
          then
            begin
              Result := ALine.Call;
              dispose(ALine);
              ALine := nil;
            end
          else
            begin
              Result := ALine.Call;
              tmp_line := ALine^.Next;
              dispose(ALine);
              ALine := tmp_line;
            end;
      end
    else
      Result := nil;
end;

procedure TForm1.AddToLine(var ALine: TLine;ACall: TCall;ASource: TSource;AProcessor: TProcessor);
var
  tmp_line,tmp_line2: TLine;
begin
  if ALine = nil
    then
      begin
        new(ALine);
        ALine.Call := ACall;
        ALine.Source := ASource;
        ALine.Processor := AProcessor;
        ALine^.Next := nil;
      end
    else
      begin
        tmp_line := ALine;
        while tmp_line.Next <> nil do
          tmp_line := tmp_line^.Next;
        new(tmp_line2);
        tmp_line2.Call := ACall;
        tmp_line2.Source := ASource;
        tmp_line2.Processor := AProcessor;
        tmp_line^.Next := tmp_line2;
        tmp_line2^.Next := nil;
      end;
end;

procedure TForm1.Go(NumberProcessors: word;AllTacts: integer;FileName: string;var lp: extended;var nc: integer);
var
  InputCalls,OutputCalls,Processors,Sources: TLine;
  tmp: TLine;
  tmp_call: TCall;
  i,j,s: integer;
  f: txt;
  st: string;
begin
  AssignFile(f,FileName);
  if not FileExists(FileName)
    then
      begin
        ReWrite(f);
        CloseFile(f);
      end;
  Append(f);
  InputCalls := nil;
  OutputCalls := nil;
  Processors := nil;
  Sources := nil;
  // �������� ���������
  AddToLine(Sources,nil,TSource.Create(1,StrToInt(Edit1.Text),5,random(50),random(50)),nil);
  AddToLine(Sources,nil,TSource.Create(2,StrToInt(Edit2.Text),5,random(50),random(50)),nil);
  AddToLine(Sources,nil,TSource.Create(3,StrToInt(Edit3.Text),5,random(50),random(50)),nil);
  AddToLine(Sources,nil,TSource.Create(4,StrToInt(Edit4.Text),5,random(50),random(50)),nil);
  // �������� ����������
  for i := 1 to NumberProcessors do
    begin
      AddToLine(Processors,nil,nil,TProcessor.Create(i));
    end;
  for i := 1 to AllTacts do
    begin
      if CheckBox1.Checked
        then
          begin
            WriteLn(f,'-----------------------------------------------');
            WriteLn(f,'���� �'+IntToStr(i)+ ' ���������� �����������: ' + IntToStr(NumberProcessors));
          end;
      // ���������� ����������
      tmp := Sources;
      while tmp <> nil do
        begin
          tmp_call :=  tmp.Source.Tact;
          if tmp_call <> nil then AddToLine(InputCalls,tmp_call,nil,nil);
          if CheckBox1.Checked
            then
              begin
                st := tmp.Source.GetInfoFull;
                WriteLn(f,st);
              end;
          tmp := tmp^.Next;
        end;
      // ���� �����������
      if CheckBox1.Checked then WriteLn(f,'');
      tmp := Processors;
      while tmp <> nil do
        begin
          if tmp.Processor.Call = nil
            then
              begin
                tmp_call := GetFromLine(InputCalls);
                if tmp_call <> nil
                  then
                    tmp.Processor.Load(tmp_call);
              end;
          tmp_call := tmp.Processor.Tact;
          if tmp_call <> nil then AddToLine(OutputCalls,tmp_call,nil,nil);
          if CheckBox1.Checked
            then
              begin
                st := tmp.Processor.GetInfoFull;
                WriteLn(f,st);
              end;
          tmp := tmp^.Next;
        end;

      if CheckBox1.Checked
        then
          begin
            WriteLn(f,'');
            WriteLn(f,'������� �������: ');
            j := 0;
            tmp := InputCalls;
            while tmp <> nil do
              begin
                inc(j);
                WriteLn(f,'����� � �������: ' + IntToStr(j));
                st := tmp.Call.GetInfoFull;
                WriteLn(f,st);
                tmp := tmp^.Next;
              end;
            if j = 0 then WriteLn(f,'�����');
            WriteLn(f,'');
            WriteLn(f,'�������� �������: ');
            j := 0;
            tmp := OutputCalls;
            while tmp <> nil do
              begin
                inc(j);
                WriteLn(f,'����� � �������: ' + IntToStr(j));
                st := tmp.Call.GetInfoFull;
                WriteLn(f,st);
                tmp := tmp^.Next;
              end;
            if j = 0 then WriteLn(f,'�����');
            WriteLn(f,'');
            WriteLn(f,'');
          end;
    end;
  CloseFile(f);
  // ����� ���������� � ����
  Memo1.Lines.Add('');
  Memo1.Lines.Add('���������� �����������: ' + IntToStr(NumberProcessors));
  Memo1.Lines.Add('');
  tmp := Sources;
  while tmp <> nil do
    begin
      Memo1.Lines.Add('�������� �' + IntToStr(tmp.Source.Number) + ' ������� ������: ' + IntToStr(tmp.Source.Calls));
      tmp := tmp^.Next;
    end;
  Memo1.Lines.Add('');
  lp := 0;
  i := 0;
  tmp := Processors;
  while tmp <> nil do
    begin
      inc(i);
      lp := lp + (tmp.Processor.Tacts_Work / tmp.Processor.Tacts * 100);
      Memo1.Lines.Add('��������� �' + IntToStr(tmp.Processor.Number) + ' ��� �������� �� ' + FloatToStr(tmp.Processor.Tacts_Work / tmp.Processor.Tacts * 100) + '%');
      Memo1.Lines.Add('       �������� ������: ' + IntToStr(tmp.Processor.Calls));
      tmp := tmp^.Next;
    end;
  lp := lp / i;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('������� �������: ');
  j := 0;
  s := 0;
  tmp := InputCalls;
  while tmp <> nil do
    begin
      inc(j);
      s := s + tmp.Call.NeedTacts;
      tmp := tmp^.Next;
    end;
  nc := j;
  Memo1.Lines.Add('     �������� ������: ' + IntToStr(j));
  Memo1.Lines.Add('     ����� � ����� ������: ' + IntToStr(s));
  Memo1.Lines.Add('');
  Memo1.Lines.Add('�������� �������: ');
  j := 0;
  s := 0;
  tmp := OutputCalls;
  while tmp <> nil do
    begin
      inc(j);
      s := s + tmp.Call.NeedTacts;
      tmp := tmp^.Next;
    end;
  Memo1.Lines.Add('     ����������� ������: ' + IntToStr(j));
  Memo1.Lines.Add('     � ����� ������: ' + IntToStr(s));
  Memo1.Lines.Add('');
  Memo1.Lines.Add('----------------------------------------');
end;

procedure TForm1.Start(AllTacts: integer);
type
  TOpt = ^TTOpt;
  TTOpt = record
    Number: integer;
    LoadProc: extended;
    LostCalls: integer;
    Next: TOpt;
  end;
var
  i,opti: integer;
  LoadProc,optLoadProc: extended;
  LostCalls,optLostCalls: integer;
  Opt,tmp_opt,tmp_opt2: TOpt;
  fs: string;
  f: txt;
begin
  fs := Application.ExeName;
  fs := ExtractFileDir(fs);
  fs := fs + '\log.txt';
  if CheckBox1.Checked
    then
      begin
        AssignFile(f,fs);
        ReWrite(f);
        CloseFile(f);
      end;
  Memo1.Lines.Clear;
  Opt := nil;
  for i := 1 to StrToInt(Edit6.Text) do
    begin
      Go(i,AllTacts,fs,LoadProc,LostCalls);
      if Opt = nil
        then
          begin
            new(Opt);
            Opt.Number := i;
            Opt.LoadProc := LoadProc;
            Opt.LostCalls := LostCalls;
            Opt.Next := nil;
          end
        else
          begin
            tmp_opt := Opt;
            while tmp_opt^.Next <> nil do
              tmp_opt := tmp_opt^.Next;
            new(tmp_opt2);
            tmp_opt2.Number := i;
            tmp_opt2.LoadProc := LoadProc;
            tmp_opt2.LostCalls := LostCalls;
            tmp_opt^.Next := tmp_opt2;
            tmp_opt2^.Next := nil;
          end;
    end;
  tmp_opt := Opt^.Next;
  opti := Opt.Number;
  optLostCalls := Opt.LostCalls;
  optLoadProc := Opt.LoadProc;
  while tmp_opt <> nil do
    begin
      if tmp_opt.LostCalls < optLostCalls
        then
          begin
            opti := tmp_opt.Number;
            optLostCalls := tmp_opt.LostCalls;
            optLoadProc := tmp_opt.LoadProc;
          end
        else
          begin
            if (tmp_opt.LostCalls = optLostCalls) and (tmp_opt.LoadProc > optLoadProc)
              then
                begin
                  opti := tmp_opt.Number;
                  optLostCalls := tmp_opt.LostCalls;
                  optLoadProc := tmp_opt.LoadProc;
                end;
          end;
      tmp_opt := tmp_opt^.Next;
    end;
  Memo1.Lines.Add('����������� ���������� ����������� ' + IntToStr(opti));
end;

// ------------------------------------------------------
// ---------   ������  TCall   --------------------------
// ------------------------------------------------------

constructor TCall.Create(CExecProc,CNeedTacts,CNumberSource: word;CCreateTact,CExecTact,CNumber: integer);
begin
  Inherited Create;
  ExecProc := CExecProc;
  NeedTacts := CNeedTacts;
  NumberSource := CNumberSource;
  CreateTact := CCreateTact;
  ExecTact := CExecTact;
  Number := CNumber;
end;

function TCall.GetInfoFull: string;
var
  s: string;
begin
  s := '';
  s := s + '������ �' + IntToStr(Number) + #13 + #10;
  s := s + '��������: ' + IntToStr(NumberSource) + #13 + #10;
  s := s + '���� ��������: ' + IntToStr(CreateTact) + #13 + #10;
  s := s + '���������� ������: ' + IntToStr(NeedTacts) + #13 + #10;
  if ExecTact = 0
    then s := s + '�����������' + #13 + #10
    else
      begin
        s := s + '���� ������ ����������: '  + IntToStr(ExecTact) + #13 + #10;
        if ExecProc = 0
          then s := s + '��������� �� ���������' + #13 + #10
          else s := s + '����� ������������ ����������: ' + IntToStr(ExecProc) + #13 + #10;
      end;
  Result := s;
end;

// ------------------------------------------------------
// ---------   ������  TSource   ------------------------
// ------------------------------------------------------

constructor TSource.Create(CNumber,CIntensForNextCall,CIntensForNeedTacts,CLastToNextCall,CLastNeedTacts: word);
begin
  Inherited Create;
  Number := CNumber;
  IntensForNextCall := CIntensForNextCall;
  IntensForNeedTacts := CIntensForNeedTacts;
  LastToNextCall := CLastToNextCall;
  TactsToNextCall := CLastToNextCall;
  LastNeedTacts := CLastNeedTacts;
  Tacts := 0;
  Calls := 0;
end;

function TSource.GetInfoFull: string;
var
  s: string;
begin
  s := '';
  s := s + '����� ���������: ' + IntToStr(Number) + #13 + #10;
  s := s + '������ �� ��������� ������: ' + IntToStr(TactsToNextCall) + #13 + #10;
  s := s + '����� �������� ������: ' + IntToStr(Calls) + #13 + #10;
  s := s + '���� ������: ' + IntToStr(Tacts) + #13 + #10;
  Result := s;
end;

function TSource.Tact: TCall;
var
  tmp: word;
  tmp_call: TCall;
begin
  inc(Tacts);
  if TactsToNextCall > 0
    then
      begin
        dec(TactsToNextCall);
        Result := nil;
      end
    else
      begin
        inc(Calls);
        
        // ������ ������� �� ����. ������
        tmp := Random(Trunc(1/IntensForNextCall*MaxIntervalForCalls));
        LastToNextCall := tmp;
        TactsToNextCall := tmp;

        // ������ ������� ���������� ������
        tmp := Random(Trunc(1/IntensForNeedTacts*MaxNeedTacts));
        if tmp = 0 then tmp := 1;
        LastNeedTacts := tmp;
        tmp_call := TCall.Create(0,tmp,Number,Tacts,0,Calls);
        
        Result := tmp_call;
      end;
end;

// ------------------------------------------------------
// ---------   ������  TProcessor   ---------------------
// ------------------------------------------------------

constructor TProcessor.Create(CNumber: word);
begin
  Inherited Create;
  Call := nil;
  NeedTacts := 0;
  Number := CNumber;
  Tacts := 0;
  Tacts_Work := 0;
  Tacts_Idle := 0;
  Calls := 0;
end;

function TProcessor.GetInfoFull: string;
var
  s: string;
begin
  s := '';
  s := s + '��������� �' + IntToStr(Number) + #13 + #10;
  s := s + '������ ������: ' + IntToStr(Tacts_Work) + #13 + #10;
  s := s + '������ �������: ' + IntToStr(Tacts_Idle) + #13 + #10;
  s := s + '����� ������: ' + IntToStr(Tacts) + #13 + #10;
  s := s + '����������� ������: ' + IntToStr(Calls) + #13 + #10;
  if Call = nil
    then s := s + '�������� ��� ������ ��� �������� ������' + #13 + #10
    else
      begin
        s := s + '����������� ������ �' + IntToStr(Call.Number) + ' �� ��������� ' + IntToStr(Call.NumberSource) + #13 + #10;
        s := s + '�����/�������� ��� ���������� ������: ' + IntToStr(Call.NeedTacts) + '/' + IntToStr(NeedTacts) + #13 + #10;
      end;
  Result := s;
end;

function TProcessor.Tact: TCall;
begin
  inc(Tacts);
  if Call = nil
    then
      begin
        inc(Tacts_Idle);
        Result := nil;
      end
    else
      begin
        inc(Tacts_Work);
        dec(NeedTacts);
        if NeedTacts > 0
          then
            begin
              Result := nil;
            end
          else
            begin
              inc(Calls);
              Call.ExecProc := Number;
              Result := Call;
              Call := nil;
            end;
      end;
end;

function TProcessor.Load(LCall: TCall): boolean;
begin
  if Call <> nil
    then
      begin
        Result := false;
      end
    else
      begin
        Call := LCall;
        Call.ExecTact := Tacts + 1;
        NeedTacts := Call.NeedTacts;
        Result := true;
      end;
end;

// -------------------------------------------------------

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Start(StrToInt(Edit5.Text));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Application.Title := Form1.Caption;
end;

end.
