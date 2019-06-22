unit CS1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, StdCtrls, Grids, Spin, Buttons, TeEngine,
  Series, TeeProcs, Chart;

const
  Tn= 11;
  TT= 30;
  CM_VALID                = WM_USER + 10000;
  CM_MY_MESSAGE           = CM_VALID + 1;

type
(*  TControlClass = class of TWinControl;
  TopArray = array[1..Tn] of Integer;
  MatrTopArray= array[1..Tn] of TopArray;
  InfArray = array[1..3] of TopArray;
  ConditionsInf = array[1..2] of TopArray;*)
  GraphTab = record
    ASFlag : array [1..TT]of Boolean;//WORK/SLEEP
    SFlag : array [1..TT]of Boolean;//CONNECT/DISCONNECT
    IDName : array [1..TT]of ShortString;//
    NName  : array [1..TT]of ShortString;
    AT,AL,AH,AW : array [1..TT]of Integer;
    Conts  : array [1..TT]of ShortString;//Contents
    SizeFFrame  : array [1..TT,1..TT]of Integer;//SizeFFrame
    FrameGrantee  : array [1..TT,1..TT]of Integer;//Frame Grantee
    ExistAmountFrame : array [1..TT]of Integer;//Exist Amount Frame
    AmountFrame : array [1..TT]of Integer;//Amount Probables Frames
    StayedInQueueAmountFrame : array [1..TT,1..TT]of Integer;//Stayed In Size and In Queue Amount Frame
    InpNN  : array [1..TT,1..TT]of Integer;
    OutpNN : array [1..TT,1..TT]of Integer;
    ValueSend : array [1..TT]of Integer;
    VSFlag : array [1..TT]of Boolean;
  end;
  MarkerPP = record // FDDI Netware Marker
    Position :  Integer;
    From_Who :  Integer;
    To_Who :  Integer;
    SizeSent :  Integer;
  end;
  Grr = array [1..20] of Integer;
  GR = array [1..20] of Grr;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Clear1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    Howto1: TMenuItem;
    N3: TMenuItem;
    About1: TMenuItem;
    Serchforerrors1: TMenuItem;
    Bevel1: TBevel;
    StatusBar1: TStatusBar;
    OD1: TOpenDialog;
    SD1: TSaveDialog;
    Btn1: TButton;
    PopupMenu1: TPopupMenu;
    de1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ProgressBar1: TProgressBar;
    PageControl1: TPageControl;
    TS1: TTabSheet;
    TS2: TTabSheet;
    Memo1: TMemo;
    ScrollBar1: TScrollBar;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Timer1: TTimer;
    N10: TMenuItem;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpinEdit2: TSpinEdit;
    BitBtn3: TBitBtn;
    Disable1: TMenuItem;
    Enable1: TMenuItem;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    StringGrid4: TStringGrid;
    Diskonect1: TMenuItem;
    Conect1: TMenuItem;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Exit2: TMenuItem;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure N5Click(Sender: TObject);
//    procedure GroupBox1MouseUp(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
//    procedure GroupBox1DblClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    {My Spec Procedure}
    procedure ButtonKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Bt1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N8Click(Sender: TObject);
    procedure OpenInpPar(SenderM: TButton);
    procedure ButtonDoubleClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TabSheet1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N10Click(Sender: TObject);
//    procedure GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
//      Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure Serchforerrors1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SkanningNetwork(Var NomberBATerminal: Integer);
    procedure Disable1Click(Sender: TObject);
    procedure Enable1Click(Sender: TObject);
    procedure Randomerco(var Fgrantee, Sframe: Integer);
    procedure SpinEdit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure Diskonect1Click(Sender: TObject);
    procedure Conect1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDblClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Exit2Click(Sender: TObject);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Howto1Click(Sender: TObject); //////***********
  private
    { Private declarations }
    ClassRef: TControlClass;
    Counter,Coun,Counter1,Counter2,CounterMess : Integer;
    DEADCtrl: TControl;
    FTop,FHeight,FWidth,FLeft : Integer;
///////////////////
    GraphRoute: GR;
    LN, LE, II, IJ, NRC : Integer;
////////????????????????????????
//    fDragging: Boolean;
//    fRect: TRect;
//    GT: array of GraphTab;
(*    procedure MyWinCtrlKeyPress(Sender: TObject; var Key: Char);*)
    procedure CMDisplaySelRows(var mess: TMessage); message CM_MY_MESSAGE;
    procedure BtContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure MyBtnClick(Sender: TObject);
    procedure DelPar(SenderD: TObject);
    procedure OutpSomeMassage(SomeM : String);
    procedure CangeStringGrid;
  public
    isDown, FNLine, ELMove: boolean;
    GT: GraphTab;//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    MP: MarkerPP;
    MAF : Integer;
    Direction: Boolean;
    CrossMarker: Integer;
//    GraphRoute: array of array of Integer;
(*    GraphRoute: GR;
    LN, LE, II, IJ, NRC : Integer;
*)          { Public declarations }
  end;
(*
const
  Inf:InfArray= {1Стр.-на какую вершину идти после выполнения условной вершины}
               ((0,0,1,2,1,2,1,2,0,0,0), {1- по True; 2-по False}
                (0,1,1,1,0,0,1,1,0,0,-1),{-1-конец,0-работа с файлом,1-Функц.вершина }
                (1,0,0,0,1,2,0,0,3,3,0));{Кол-во циклов считывания инф. из файла}
  MTArray:MatrTopArray=
               ((0,1,0,0,0,0,0,0,0,0,0),{1}
                (0,0,1,1,0,0,0,0,0,0,0),{2}
                (0,0,0,0,1,1,0,0,0,0,0),{3}
                (0,0,0,0,1,1,0,0,0,0,0),{4}
                (0,0,0,0,0,0,1,1,0,0,0),{5}
                (0,0,0,0,0,0,1,1,0,0,0),{6}
                (0,0,0,0,0,0,0,0,1,0,0),{7}
                (0,0,0,0,0,0,0,0,0,1,0),{8}
                (0,0,0,0,0,0,0,0,0,0,1),{9}
                (0,0,0,0,0,0,1,1,0,0,0),{10}
                (0,0,0,0,0,0,0,0,0,0,0));{11 FIN}*)
var             {1,2,3,4,5,6,7,8,9,0,11}
  Form1: TForm1;
  NewCtrl: TControl;
  DelSet: Boolean;
  FLName: String;
  FName,MyName: String;
  OLX,OLY,SSX,SSY : Integer;
  SN, SK, CounPress : Integer;
  F1GT: File of GraphTab;
  RandomerCountyng, BedAbonentsTeminal, Fg, Sf: Integer;
  SummaryOutPoleMess : String;
(*  MTVArray:MatrTopArray=
               ((0,1,0,0,0,0,0,0,0,0,0),{1}
                (0,0,1,1,0,0,0,0,0,0,0),{2}
                (0,0,0,0,1,1,0,0,0,0,0),{3}
                (0,0,0,0,1,1,0,0,0,0,0),{4}
                (0,0,0,0,0,0,1,1,0,0,0),{5}
                (0,0,0,0,0,0,1,1,0,0,0),{6}
                (0,0,0,0,0,0,0,0,1,0,0),{7}
                (0,0,0,0,0,0,0,0,0,1,0),{8}
                (0,0,0,0,0,0,0,0,0,0,1),{9}
                (0,0,0,0,0,0,1,1,0,0,0),{10}
                (0,0,0,0,0,0,0,0,0,0,0));{11 FIN}
                {1,2,3,4,5,6,7,8,9,0,11}
*)
implementation

uses CSUTPC1, Unit1, U1;

{$R *.DFM}

procedure TForm1.About1Click(Sender: TObject);
begin
  with TAboutBox.Create(Application) do begin
     ShowModal;
      Free;
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
with OD1 do
  if Execute then
    if ofExtensionDifferent in Options then
        MessageDlg ('Not a file with the .sdf extension',mtError, [mbOK], 0)
    else
      begin
        Memo1.Lines.LoadFromFile (FileName);
        FLName:=FileName;
        StatusBar1.Panels[0].Text:=('Open file:'+ FLName);
    end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  with SD1 do
    if Execute then
      Memo1.Lines.SaveToFile (FileName);
end;

(*      Search for error in FUTURE Graph        *)
procedure TForm1.Btn1Click(Sender: TObject);
  Function StepStop(NCS: Integer): Integer;

 procedure ConclusionOfSomeTransition(m: Integer);//Conclusion Of Some Transition
 var
   OutpRouteMess: String;
   MM, K: Integer;
 begin
   CounterMess:= CounterMess + 1;
   OutpRouteMess:='Route № ' + IntToStr(CounterMess) + ' :';
   for K:= 1 to II do begin
     MM:= GraphRoute[K,IJ];
     GraphRoute[K,IJ]:= 0; //>>>>> 2Step-Del-IJ;
     OutpRouteMess:= OutpRouteMess + GT.NName[MM];
     if K <> II then OutpRouteMess:= OutpRouteMess + ', ';
   end;
   PageControl1.ActivePage:= TS2;
   Memo1.SetFocus; //>>>>> 1Step-Outp;
   Memo1.Lines.Add(OutpRouteMess);
   if IJ <> 1 then begin // If TOTAL Was 1 Route really
     IJ:= IJ - 1; //>>>>> 3Step-(IJ-1);
     K:= 0;
     repeat;
       K:= K + 1;
       if K <> 1 then
         NRC:= GraphRoute[(K - 1),IJ];
       II:= K - 1;
     until GraphRoute[K,IJ] = 0;
   end
   else
     NRC:= 0;
   StepStop(NRC);
 end;

    Procedure AddStepOfTransition(k,i: Integer);
    var
      l:Integer;
    begin
      case k of
      1: begin
           II:= II + 1;
           GraphRoute[II,IJ]:=i;
         end;
      2: begin
           IJ:=IJ + 1;
           for l:=1 to II-1 do begin  //Old For l:=0 to......
             GraphRoute[l,IJ]:=GraphRoute[l,(IJ-1)];
           end;
           GraphRoute[II,IJ]:=i;
           NRC:= i;
         end;
      3: begin
           II:= II + 1;
           GraphRoute[II,IJ]:=i;
           ConclusionOfSomeTransition(IJ);//>>>>>>>>>1-Outp; 2-Del-IJ; 3-(IJ-1);
         end;
      end;
    end;
  var
    J: Integer;
    FTransition: Boolean;
  begin
  If NRC <> 0 then begin
//    II:=II + 1;
    GraphRoute[II,IJ]:=NCS;
    FTransition:= False;
    with GT do
      for j:=1 to TT do begin
       if NRC = 0 then exit;
        if OutpNN[NCS,j]<>0 then begin
          if FTransition then
            AddStepOfTransition(2,j); //More then one Transition
          if LE=j then begin
            Label1.Caption:= 'Xren Vam';
            AddStepOfTransition(3,j); //Separation Of Transition
                // Vopros esli tekushaya vershina escho perexodit na druguyu
                // Operatornuyu vershiny krome END vershini ????????????????
          end;
          if FTransition = False then begin
           if NRC = 0 then exit;
            FTransition:= True;
            AddStepOfTransition(1,j); //Installation Next Step Of Transition
             NRC:= j;
          end;
        end;
      end;
      StepStop(NRC);
    end;
  end;
var
  I, J : Integer;
  OutpErrorMessage : ShortString;
  SubErrorMessage1, SubErrorMessage2,SubErrorMessage  : ShortString;
  AbsenceStart, AbsenceEnd : Boolean;
  AbsenceInp, AbsenceOutp : Boolean;
begin
  //Search for error in FUTURE Graph
  with GT do begin
(*Search Start and end tops *)
    OutpErrorMessage:='Step1. Is Absent';
    AbsenceStart := True;
    AbsenceEnd := True;
    for I:= 1 to TT do begin
      if Conts[I] = 'Начало' then
        LN:= I;
        AbsenceStart := False;
      if Conts[I] = 'Конец' then
        LE:= I;
        AbsenceEnd := False;
    end;
(*Output Start and end tops *)
    if AbsenceStart or AbsenceEnd then begin
      if AbsenceStart then
        OutpErrorMessage:= OutpErrorMessage + ' Initial';
      if AbsenceEnd then
        if AbsenceStart then
          OutpErrorMessage:= OutpErrorMessage + ' and End tops'
        else
          OutpErrorMessage:= OutpErrorMessage + ' End top'
      else
        OutpErrorMessage:= OutpErrorMessage + ' top';
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage);
    end;
(*Searching Поиск висячей (висячие) вершины - hanging tops*)
(*Conclusion (Image) Отображение Висячей (висячие) вершины - hanging tops*)
    OutpErrorMessage:='Step2. Hanging top : ';
    SubErrorMessage := '';
    SubErrorMessage1 := '';
    SubErrorMessage2 := '';
    for I:= 1 to Counter do begin
//      OutpErrorMessage:= 'Step2. Hanging top :';
      AbsenceInp := True;
      AbsenceOutp := True;


      for J:= 1 to Counter do begin
        if (OutpNN[I,J] <> 0) or (Conts[I] = 'Конец') then
            AbsenceOutp := False;
        if (InpNN[I,J] <> 0) or (Conts[I] = 'Начало') then
            AbsenceInp := False;
      end;
      if AbsenceInp and AbsenceOutp then
        SubErrorMessage := SubErrorMessage + NName[I] + ', '
      else begin
        if AbsenceInp then
            SubErrorMessage1 := SubErrorMessage1 + NName[I] + ', ';
        if AbsenceOutp then
            SubErrorMessage2 := SubErrorMessage2 + NName[I] + ', ';
      end;
    end;
    If SubErrorMessage <> '' then begin
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage + SubErrorMessage);
    end;
    If SubErrorMessage1 <> '' then begin
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage + SubErrorMessage1 + ' - on Input');
    end;
    If SubErrorMessage2 <> '' then begin
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage + SubErrorMessage2 + ' - on Output');
    end;
    Application.ProcessMessages;
(*Searching Поиск висячего(висячие) циклы - hanging cycles*)
(*Conclusion(Image) Вывод(Отображение) Висячего(висячие) циклы - hanging cycles*)
    OutpErrorMessage:='Step3. Cikli : ';
    SubErrorMessage := '';
    SubErrorMessage1 := '';
    SubErrorMessage2 := '';
//    for I:= 1 to Counter do begin
//      OutpErrorMessage:= 'Step3. Hanging cycles :';
      AbsenceInp := True;
      AbsenceOutp := True;
      StepStop(LN);
      NRC:= 1;

//    end;
    If SubErrorMessage <> '' then begin
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage + SubErrorMessage);
    end;
    If SubErrorMessage1 <> '' then begin
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage + SubErrorMessage1 + ' - on Input');
    end;
    If SubErrorMessage2 <> '' then begin
      Application.ProcessMessages;
      OutpSomeMassage(OutpErrorMessage + SubErrorMessage2 + ' - on Output');
    end;
//*)    Application.ProcessMessages;
//endstep3
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  Application.CreateForm(TF1, F1);
//    F1.Visible:= True;
//  with TF1.Create(Application) do begin
//    showModal;
//    Free;
//  end;
  CrossMarker:= 0;
  Direction:= True;
  MP.Position:= 1;
  StringGrid4.Cells[0,0]:= 'Comp';
  StringGrid4.Cells[0,1]:= '1';
  StringGrid4.Cells[1,0]:= 'Frames';
  SpinEdit3.Enabled:= False;
  SpinEdit3.Color:=clSilver;
  II:= 1;
  IJ:= 1;
  CounPress := 1;
  //perem:=nil;
  ClassRef := TButton;
  FName:=' В. ';
  FLeft := 40;
  FTop := 10;
  FWidth := 80;
  FHeight := 18;
  isDown := False;
end;

procedure TForm1.Clear1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.Saveas1Click(Sender: TObject);
begin
with SD1 do
  begin
    FileName:=FLName;
    if Execute then
      Memo1.Lines.SaveToFile (FileName);
  end;
end;
//////////////////////////////////////////

procedure TForm1.N4Click(Sender: TObject);
begin
  ClassRef := TButton;
  FName:=' В. ';
  FLeft := 40;
  Top := 10;
  FWidth := 80;
  FHeight := 18;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  GroupBox1.Top:=StrToInt('-' + IntToStr(ScrollBar1.Position));
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  ClassRef := TButton;
  FName:=' У.В. ';
  FLeft := 22;
  FTop := 20;
  FWidth := 44;
  FHeight := 40;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
//  NewCtrl: TControl;
//  MyName: String;
begin
    // create the control
    NewCtrl := ClassRef.Create(Form1);
    // hide it temporarily, to avoid flickering
    with NewCtrl do begin
      Visible := False;
      Parent := Form1;
      Left := X - FLeft;
      Top := Y - FTop;
      Width := FWidth;
      Height := FHeight;
      PopupMenu := PopupMenu1;
      Cursor := crHandPoint;
    end;
// compute the unique name (and caption)
//  Inc (Counter);
//  MyName := ClassRef.ClassName + IntToStr (Counter);
//  Delete (MyName, 1, 1);
//  NewCtrl.Name := MyName;
//{IF DOUBLE CLICK}  NewCtrl.Visible := True; *)
end;

procedure TForm1.FormDblClick(Sender: TObject);
//var
//  NCtrl: NewCtrl;//: TControl;
//  MName: MyName;//String;
begin
  if FName=' У.В. ' then begin
    Inc (Counter1);
    Coun:= Counter1;
    TButton(NewCtrl).Caption :=IntToStr (Counter1) +  FName;
  end
  else begin
    Inc (Counter2);
    Coun:= Counter2;
    TButton(NewCtrl).Caption :=IntToStr (Counter2) + FName;
  end;
  Inc(Counter);
  MyName := ClassRef.ClassName + IntToStr (Counter);
  NewCtrl.Tag := Counter;
  Delete (MyName, 1, 1);
  NewCtrl.Name := MyName;
//  TButton(NewCtrl).Caption :=IntToStr (Counter) + FName;
  OnKeyPress     := ButtonKeyPress;
  TButton(NewCtrl).OnMouseDown    := Bt1MouseDown;//ButtonDoubleClick;
  TButton(NewCtrl).OnMouseUp      := Bt1MouseUp;//ButtonDoubleClick;
  TButton(NewCtrl).OnMouseMove    := Bt1MouseMove;//ButtonDoubleClick;
  TButton(NewCtrl).OnContextPopup := BtContextPopup;
  TButton(NewCtrl).OnClick := MyBtnClick;
  NewCtrl.Visible := True;
  TButton(NewCtrl).OnClick := MyBtnClick;

  With GT do begin
    IDName[Counter] := MyName;
    NName[Counter] := TButton(NewCtrl).Caption;
    AL[Counter] := NeWCtrl.Left;
    AT[Counter] := NeWCtrl.Top;
    AW[Counter] := NeWCtrl.Width;
    AH[Counter] := NeWCtrl.Height;
    ASFlag[Counter] := True;
    SFlag[Counter] := True;
  end;
  Label1.Caption := GT.IDName[Counter];
  OpenInpPar(TButton(NewCtrl));
  if Counter > (StringGrid4.RowCount - 1) then begin
    StringGrid4.RowCount:= StringGrid4.RowCount + 1;
    StringGrid4.Cells[0,Counter]:= IntToStr(Counter);
  end;
  if Counter = 1 then begin
//    PageControl1.ActivePage:= TS2;
//    Memo1.SetFocus; //>>>>>
//    Memo1.Lines.Add(Format ('Comp №%d -', [MP.Position]));
//    PageControl1.ActivePage:= TS1;
  end;
end;

procedure TForm1.ButtonDoubleClick(Sender: TObject; Button: TMouseButton;
                                   Shift: TShiftState; X, Y: Integer);
begin
  OpenInpPar(TButton(Sender));
end;

procedure TForm1.OpenInpPar(SenderM: TButton);
var
  Captic : String;
  I : Integer;
begin
  with TCSTPC1.Create(Application) do begin
    CSTPC1.Caption:= 'Время пересылки';
    with GT do begin
      EditPC1.Text := Conts[SenderM.Tag];
      ShowModal;
      Application.ProcessMessages;
      Conts[SenderM.Tag]:= EditPC1.Text;
      for I:= 1 to 7 do begin
        Captic:=Captic + TButton(SenderM).Caption[I];
      end;
      TButton(SenderM).Caption:=Captic + '';
      TButton(SenderM).Caption:=TButton(SenderM).Caption + EditPC1.Text;
      Free;
    end;
   end;
end;

procedure TForm1.DelPar(SenderD: TObject);
var
  SM : String;
  L : Integer;
begin
  With GT do begin
    SM:= (SenderD as TComponent). Name;
    IDName[StrToInt(SM[7])] := '';
    NName[StrToInt(SM[7])] := '';
    Conts[StrToInt(SM[7])] := '';
    AL[StrToInt(SM[7])] := 0;
    AT[StrToInt(SM[7])] := 0;
    AW[StrToInt(SM[7])] := 0;
    AH[StrToInt(SM[7])] := 0;
    for L := 1 to TT do begin
      OutpNN[StrToInt(SM[7]),L] := 0;
      if InpNN[StrToInt(SM[7]),L] <> 0 then begin
        OutpNN[L,StrToInt(SM[7])] := 0;
        InpNN[StrToInt(SM[7]),L] := 0;
      end;
    end;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  if Assigned(ActiveControl) and (ActiveControl is TButton) then
  ELMove := False;
  isDown := False;
  OpenInpPar(TButton(ActiveCOntrol));
//MessageDlg('andrey',mtError,[mbOk,mbCancel],0);
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  DelSet:= True;
  PostMessage(Handle, CM_MY_MESSAGE, 0, LongInt(ActiveControl));
  DelPar(ActiveControl);
//  DEADCtrl:= Sender as ClassRef;
//  Sender.Free;
//  DEADCtrl:=Sender as ClassRef;
//  ClassRef:= Sender;
end;

procedure TForm1.ButtonKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    PostMessage(Handle, CM_MY_MESSAGE, 0, LongInt(ActiveControl));
//  if DelSet then begin
//    NewCtrl := ClassRef.Free;
//    DEADCtrl:= Sender as ClassRef;
//    ClassRef.Free;
//    NewCtrl.Parent := nil;
//    NewCtrl.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
(*  if isDown then begin
//    NewCtrl.Left := SSX;
//    NewCtrl.Top := SSY;
   // Application.ProcessMessages;
  Caption := Format ('Mouse in x=%d, y=%d', [TButton(ActiveCOntrol).Left, TButton(ActiveCOntrol).Top]);
  end;
  IF assigned (DEADCtrl) then
  begin //\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
    DEADCtrl.Free;
    DEADCtrl:= nil;
  end;  //\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\*)
end;

procedure TForm1.BtContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
//jh
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
ButtonKeyPress(Sender,Key);
//CMDisplaySelRows;
(*  if Key = #8 then begin
    DEADCtrl:= Sender as ClassRef;
    DEADCtrl.Free; end;
*)
end;
(*
procedure TForm1.MyWinCtrlKeyPress(Sender: TObject; var Key: Char);
begin
  Sender := nil;
end;
*)
procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
(*
  if Key = 8 then
    PostMessage(Handle, CM_MY_MESSAGE, 0, LongInt(ActiveControl));
*)
end;

procedure TForm1.CMDisplaySelRows(var mess: TMessage);
begin
  TWinControl(mess.LParam).Parent := nil;
  TWinControl(mess.LParam).Free;
end;

procedure TForm1.Bt1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
(*  if isDown then begin
    if Assigned(ActiveControl) and (ActiveControl is TButton) then
      begin
        TButton(ActiveCOntrol).Left := X;
        TButton(ActiveCOntrol).Top := Y;
        SSX := OLX + X;
        SSY := OLY + Y;
        Application.ProcessMessages;
        Caption := Format ('Mouse in x=%d, y=%d', [TButton(ActiveCOntrol).Left, TButton(ActiveCOntrol).Top]);
      end;
  end;*)
end;

procedure TForm1.Bt1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  isDown := True;
//    OLX := X;
//    OLY := Y;

//    if Assigned(ActiveControl) and (ActiveControl is TButton) then
//      begin
//        TButton(ActiveCOntrol).Left :=20+X;// OLX + X;
//        TButton(ActiveCOntrol).Top :=20+Y;// OLY + Y;
//        SSX := 5 + 0;
//        SSY := 5 + 0;
//        Application.ProcessMessages;
//        Caption := Format ('Mouse in x=%d, y=%d', [NewCtrl.Left, NewCtrl.Top]);
//      end;
  //Application.ProcessMessages;
end;

procedure TForm1.Bt1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
SenderkoM: TButton;
begin
  if ELMove then begin
      isDown := False;
      Application.ProcessMessages;
  end;
  if FNLine then //Soedinenie vershin
    if ssShift in Shift then begin
      SenderkoM:= (TButton(ActiveCOntrol));
      if CounPress = 1 then begin
        SN:= SenderkoM.tag;
        Application.ProcessMessages;
      end;
      if CounPress = 2 then begin
        SK:= SenderkoM.tag;
        if SK <> SN then begin
          GT.OutpNN[SN,SK] := SK;
          GT.InpNN[SK,SN] := SN;
          Canvas.Pen.Width:= 2;
          Canvas.MoveTo(GT.AL[SN]+FLeft,GT.AT[SN]+FTop);
          Canvas.LineTo(GT.AL[SK]+FLeft,GT.AT[SK]+FTop);
        end;
        CounPress := 0;
        StatusBar1.Panels[0].Text := '';
        FNLine := False;
        Application.ProcessMessages;
        if GT.VSFlag[SN] = False then begin
          with TCSTPC1.Create(Application) do begin
            Caption:= 'Время Пересылки'; //<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            with GT do begin
              EditPC1.Text := IntToStr(GT.ValueSend[SN]);
              ShowModal;
              Application.ProcessMessages;
              GT.ValueSend[SN]:= StrToInt(EditPC1.Text);
              Free;
            end;
          end;
          GT.VSFlag[SN]:= True;
        end;
        CSTPC1.Caption:= 'Параметры Вершины'; //<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      end;
      CounPress := CounPress + 1;
    end
  else
    isDown := False;
//  Application.ProcessMessages;
end;

procedure TForm1.MyBtnClick(Sender: TObject);
begin
//????????????????  MessageDlg('mtInformation', mtInformation, [mbOK], 0);
end;

(*
Component cout
List controls[0,1,...,N]
If complistClassName  then
*)

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
end;
////////////???????????????????????????????????///////////////////////////
procedure TForm1.TabSheet1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(*  if Button = mbLeft then
  begin
    fDragging := True;
    SetCapture (Handle);
    fRect.Left := X;
    fRect.Top := Y;
    fRect.BottomRight := fRect.TopLeft;
    Canvas.DrawFocusRect (fRect);
  end;*)
end;

procedure TForm1.TabSheet1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
(*  Caption := Format ('Mouse in x=%d, y=%d', [X, Y]);
  if fDragging then
  begin
    // remove and redraw the dragging rectangle
    Canvas.DrawFocusRect (fRect);
    fRect.Right := X;
    fRect.Bottom := Y;
    Canvas.DrawFocusRect (fRect);
  end
  else
    if ssShift in Shift then
      // mark points in yellow
      Canvas.Pixels [X, Y] := clYellow;
*)
end;

procedure TForm1.TabSheet1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(*  if fDragging then
  begin
    ReleaseCapture;
    fDragging := False;
    Invalidate;
      Canvas.Rectangle (fRect.Left, fRect.Top,
    fRect.Right, fRect.Bottom);
  end;
*)
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  FNLine:= True;
  StatusBar1.Panels[0].Text := 'Держите LShift нажатым при кликании';
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ELMove then
    if isDown then
      if Assigned(ActiveControl) and (ActiveControl is TButton) then
        begin
          TButton(ActiveCOntrol).Left := X - 35;
          TButton(ActiveCOntrol).Top := Y - 10;
//          SSX := OLX + X;
//          SSY := OLY + Y;
          Application.ProcessMessages;
          Caption := Format ('Mouse in x=%d, y=%d', [TButton(ActiveCOntrol).Left, TButton(ActiveCOntrol).Top]);
        end;
  //Visible
  SpinEdit2.Visible:= False;
  SpinEdit3.Visible:= False;
  Label2.Visible:= False;
  Label3.Visible:= False;
  Label4.Visible:= False;
  Label5.Visible:= False;
  CheckBox1.Visible:= False;
  CheckBox2.Visible:= False;
  Bevel1.Visible:= False;
  Bevel2.Visible:= False;
  BitBtn2.Visible:= False;
  StringGrid4.Visible:= False;
  Panel2.Visible:= True;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  if ELMove then begin
    ELMove:= False;
    StatusBar1.Panels[0].Text := '';
  end
  else begin
    ELMove:= True;
    StatusBar1.Panels[0].Text := 'Нажмите на вершину потом перетаскивайте';
  end;
end;

procedure TForm1.Howto1Click(Sender: TObject);
begin
  Application.ProcessMessages;
  MessageDlg(' No ways for permit (deciding) this problems ', mtInformation, [mbOK], 0);
end;

procedure TForm1.OutpSomeMassage(SomeM: String);
begin
    Application.ProcessMessages;
    MessageDlg(SomeM, mtInformation, [mbOK], 0);
//                    mtError,mtWarning,mtConfirmation,mtCustom,
end;

procedure TForm1.Serchforerrors1Click(Sender: TObject);
begin
 Btn1Click(Sender);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  with SD1 do
  begin
    FileName:= FLName;
//    FileName:='df.dat';
    if Execute then
//      Memo1.Lines.SaveToFile (FileName);
      AssignFile(F1GT,FileName);
      FLName:= FileName;
      REWrite(F1GT);
      Write(F1GT,GT);
      CloseFile(F1GT);
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
 procedure MProcessing(v, p : Integer);
 var
   l, s : Integer;
   OutPoleMess : String;
 begin
 with MP do
    //GT.AmountFrame
    //GT.ExistAmountFrame
    //GT.StayedInQueueAmountFrame
(*
MP.From_Who
MP.To_Who
MP.Position
MP.SizeSent
*)
    case v of
      1: begin
           if GT.ExistAmountFrame[p] <> 0 then begin
             From_Who:= p;
             To_Who:= GT.FrameGrantee[p,GT.ExistAmountFrame[p]];
             SizeSent:= 1;
             PageControl1.Visible:= True;
   PageControl1.ActivePage:= TS2;
   Memo1.SetFocus; //>>>>>
//   Memo1.Lines.Add(Format ('%d TX Frame to %d -', [MP.From_Who,MP.To_Who]));
   SummaryOutPoleMess:= SummaryOutPoleMess + Format (' %d TX Frame to %d -', [MP.From_Who,MP.To_Who]);
   Memo1.Lines.Add(SummaryOutPoleMess);
   //PageControl1.ActivePage:= TS1;
           end;
         end;
      2: begin
      PageControl1.Visible:= True;
   PageControl1.ActivePage:= TS2;
   Memo1.SetFocus; //>>>>>
//   Memo1.Lines.Add(Format ('%d RX Confirmation from %d -', [MP.To_Who,MP.From_Who]));
   SummaryOutPoleMess:= SummaryOutPoleMess + Format (' %d RX Confirmation from %d -', [MP.To_Who,MP.From_Who]);
   Memo1.Lines.Add(SummaryOutPoleMess);
   //PageControl1.ActivePage:= TS1;
          GT.SizeFFrame[p,GT.ExistAmountFrame[p]]:= GT.SizeFFrame[p,GT.ExistAmountFrame[p]] - 1;
           GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]]:= GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]] - 1;
           if GT.SizeFFrame[p,GT.ExistAmountFrame[p]] = 0 then begin
             GT.AmountFrame[p]:= GT.AmountFrame[p] - 1;
             GT.ExistAmountFrame[p]:= GT.ExistAmountFrame[p] - 1;
             GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]]:= GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]] - 1;
           end;
           From_Who:= 0;
           To_Who:= 0;
           SizeSent:= 0;
         end;
      3: begin
      PageControl1.Visible:= True;
   PageControl1.ActivePage:= TS2;
   Memo1.SetFocus; //>>>>>
//   Memo1.Lines.Add(Format ('TX Confirmation to %d -', [MP.From_Who]));
   SummaryOutPoleMess:= SummaryOutPoleMess + Format (' TX Confirmation to %d -', [MP.From_Who]);
   Memo1.Lines.Add(SummaryOutPoleMess);
   //PageControl1.ActivePage:= TS1;
           To_Who:= From_Who;//GT.FrameGrantee[p,GT.ExistAmountFrame[p]];
           From_Who:= p;
           SizeSent:= 0;
         end;
      4: begin
///Bad Not WANTED things >>>>>>
   PageControl1.Visible:= True;
   PageControl1.ActivePage:= TS2;
   Memo1.SetFocus; //>>>>>
  // Memo1.Lines.Add(Format ('RX NO Confirmation From %d -', [MP.To_Who]));
   SummaryOutPoleMess:= SummaryOutPoleMess + Format (' RX NO Confirmation From %d -', [MP.To_Who]);
   Memo1.Lines.Add(SummaryOutPoleMess);
   //PageControl1.ActivePage:= TS1;
          GT.SizeFFrame[p,GT.ExistAmountFrame[p]]:= GT.SizeFFrame[p,GT.ExistAmountFrame[p]] - 1;
           GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]]:= GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]] - 1;
           if GT.SizeFFrame[p,GT.ExistAmountFrame[p]] = 0 then begin
             GT.AmountFrame[p]:= GT.AmountFrame[p] - 1;
             GT.ExistAmountFrame[p]:= GT.ExistAmountFrame[p] - 1;
             GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]]:= GT.StayedInQueueAmountFrame[p,GT.ExistAmountFrame[p]] - 1;
           end;
           l:=To_Who;
           From_Who:= 0;
           To_Who:= 0;
           SizeSent:= 0;
           OutpSomeMassage(Format ('Abonent system № %d sleep or not work!!!', [l]));
         end;
    end;
 end;

var
  Fg, Sf: Integer;
  I, J : Integer;
  GenFlag : Boolean;
begin
with GT do begin
//Step First:
  CangeStringGrid;
  for I:= 1 to Counter do
    if SFlag[I] then begin
      if ExistAmountFrame[I] < AmountFrame[I] then begin
        Fg:= 0;
        Sf:= 0;
        Randomerco(Fg,Sf);
        Randomerco(Fg,Sf);
        if (Fg <> 0) and (Sf <> 0) then begin
          ExistAmountFrame[I]:= ExistAmountFrame[I] + 1;
          StayedInQueueAmountFrame[I,ExistAmountFrame[I]]:= Sf;
          SizeFFrame[I,ExistAmountFrame[I]]:= Sf;
          if Fg = I then
            Fg:= Fg + 1;
          if Fg > Counter then
            Fg:= Fg - 2;
          FrameGrantee[I,ExistAmountFrame[I]]:= Fg;
        end;
        //DERMO KAKOE-TO >>>>>,jx,jhs,bjhsd,
        //StatusBar1.Panels[0].Text := IntToStr(BedAbonentsTeminal) + '-я Машина НЕ РАБОТАЕТ (вылетела) :-)';end;
      end;
    end
    else begin
      ExistAmountFrame[I]:= 0;
    end;
//    else begin
//    end;
//Step Second:
  CangeStringGrid;
//Step Third:
(*
MP.From_Who
MP.To_Who
MP.Position
MP.SizeSent
*)
  with MP do begin
  //Processing of Marker;
    if (MP.From_Who <> 0) and (MP.SizeSent <> 1) then//RX confirmation, Marker 0
      if MP.To_Who = MP.Position then
        MProcessing(2,Position);

    if (MP.From_Who <> 0) and (MP.SizeSent = 1) then//RX one Frame, TX confirmation
      if MP.To_Who = MP.Position then
        if GT.ASFlag[Position] then begin//If AbonentSystem Not Disable
          MProcessing(3,Position);
          CrossMarker:= 0;
        end;

    if (MP.From_Who <> 0) and (MP.SizeSent = 1) then//RX NO!!! confirmation, OUTPUT Message
      if MP.From_Who = MP.Position then
        if CrossMarker = 1 then begin
          MProcessing(4,Position);
        end
        else begin
          CrossMarker:= 1;
        end;

    if MP.From_Who = 0 then begin                        //RX Marker 0, TX one Frame
      CrossMarker:= 0;
      MProcessing(1,Position);
    end;
//      for J:=1 to Counter do begin//Transition??????????????????????????????????
//        if (FrameGrantee[MP.Position,J] <> 0) and (ASFlag[I])then begin
//          Position:= FrameGrantee[MP.Position,J];//?????????????????????????????
//        end;
//      end;//????????????????????????????????????????????????????????????????????
      if Direction then
        for I:= 1 to Counter do
          if GT.OutpNN[Position,I] <> 0 then//Transition
            if GT.SFlag[GT.OutpNN[Position,I]] then begin///!!!!!!!!!??????1?1?1?!
              Position:= GT.OutpNN[MP.Position,I];
              PageControl1.Visible:= True;
              PageControl1.ActivePage:= TS2;
              Memo1.SetFocus; //>>>>>
              SummaryOutPoleMess:= Format ('Comp №%d -', [MP.Position]);
              //Memo1.Lines.Add(Format ('Comp №%d -', [MP.Position]));
              //PageControl1.ActivePage:= TS1;
              Break;
            end
            else begin
              Direction := False;
              PageControl1.Visible:= True;
              PageControl1.ActivePage:= TS2;
              Memo1.SetFocus; //>>>>>
              Memo1.Lines.Add(Format ('Inverse Direction from %d -', [MP.Position]));
              PageControl1.ActivePage:= TS1;
              Break;
            end;
      if Direction = False then //Inverse Direction
        for I:= 1 to Counter do
          if GT.InpNN[Position,I] <> 0 then begin //Transition
            if GT.SFlag[GT.InpNN[Position,I]] then begin///!!!!!!!!!??????1?1?1?!
              Position:= GT.InpNN[MP.Position,I];
              PageControl1.Visible:= True;
              PageControl1.ActivePage:= TS2;
              Memo1.SetFocus; //>>>>>
              //Memo1.Lines.Add(Format ('Comp №%d -', [MP.Position]));
              SummaryOutPoleMess:= Format ('Comp №%d -', [MP.Position]);
              //PageControl1.ActivePage:= TS1;
              Break;
            end
            else begin
              Direction := True;
              PageControl1.Visible:= True;
              PageControl1.ActivePage:= TS2;
              Memo1.SetFocus; //>>>>>
              Memo1.Lines.Add(Format ('Direct direction from %d -', [MP.Position]));
              PageControl1.ActivePage:= TS1;
              for J:= 1 to Counter do
                if GT.OutpNN[Position,J] <> 0 then//Transition
                  if GT.SFlag[GT.OutpNN[Position,J]] then begin///!!!!!!!!!??????1?1?1?!
                    Position:= GT.OutpNN[MP.Position,J];
                    PageControl1.Visible:= True;
                    PageControl1.ActivePage:= TS2;
                    Memo1.SetFocus; //>>>>>
                    SummaryOutPoleMess:= Format ('Comp №%d -', [MP.Position]);
                    //Memo1.Lines.Add(Format ('Comp №%d -', [MP.Position]));
                    //PageControl1.ActivePage:= TS1;
                    Break;
                  end;
            end;
            Break;
          end;
  end;
//Final Step...
end;
//  Chart1.SeriesList[0].addxy(k,sin(k*pi/10),'',clred);
//    Series2.Add(c, FloatToStr(i), clOrange);
//    Chart1.SeriesList[0].addxy(c,i,'',clred);

end;
procedure TForm1.SkanningNetwork(Var NomberBATerminal: Integer);
begin
//  NomberBATerminal:=Random(12)+1;
end;

procedure TForm1.Disable1Click(Sender: TObject);
var
  Captic : String;
  I : Integer;
begin
//  if Assigned(ActiveControl) and (ActiveControl is TButton) then
    GT.ASFlag[ActiveControl.Tag]:=False;
  Application.ProcessMessages;
with GT do begin
  for I:= 1 to 4 do
    Captic:=Captic + TButton(ActiveControl).Caption[I];
  TButton(ActiveControl).Caption:=Captic + ' SLIP';
end;
end;

procedure TForm1.Enable1Click(Sender: TObject);
var
  Captic : String;
  I : Integer;
begin
//  if Assigned(ActiveControl) and (ActiveControl is TButton) then
    GT.ASFlag[ActiveControl.Tag]:=True;
  Application.ProcessMessages;
with GT do begin
  for I:= 1 to 4 do
    Captic:=Captic + TButton(ActiveControl).Caption[I];
  TButton(ActiveControl).Caption:=Captic + ' WORK';
end;
end;

procedure TForm1.Diskonect1Click(Sender: TObject);
var
  Captic : String;
  I : Integer;
begin
  GT.SFlag[ActiveControl.Tag]:=False;
  GT.ASFlag[ActiveControl.Tag]:=False;
  Application.ProcessMessages;
with GT do begin
  for I:= 1 to 4 do
    Captic:=Captic + TButton(ActiveControl).Caption[I];
  TButton(ActiveControl).Caption:=Captic + ' DISCONECT';
end;
end;

procedure TForm1.Conect1Click(Sender: TObject);
var
  Captic : String;
  I : Integer;
begin
  GT.SFlag[ActiveControl.Tag]:=True;
  GT.ASFlag[ActiveControl.Tag]:=True;
  Application.ProcessMessages;
with GT do begin
  for I:= 1 to 4 do
    Captic:=Captic + TButton(ActiveControl).Caption[I];
  TButton(ActiveControl).Caption:=Captic + ' WORK';
end;
end;


procedure TForm1.Randomerco(var Fgrantee, Sframe: Integer);
var
  Rr : Integer;
begin
  Rr:= Random(4)*Random(4);
  if RandomerCountyng = Rr then begin //For the random lunch of Randomera
    Fgrantee:=Random(Counter)+1; //Frame's grantee
    Sframe  :=Random(Counter)+1; //Size of Frame
    RandomerCountyng := Random(3)*Random(4);
  end;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
var
  I : Integer;
begin
  MAF:= 0;
  for I:= 1 to Counter do begin
    GT.AmountFrame[I]:= SpinEdit2.Value;
    StringGrid4.Cells[1,I]:=IntToStr(SpinEdit2.Value);
  end;
  StringGrid4.ColCount:= SpinEdit2.Value + 2;
  for I:=2 to StringGrid4.ColCount do
    StringGrid4.Cells[I,0]:='Time'+IntToStr(I-1);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.State = cbChecked then begin
    SpinEdit3.Enabled:= True;
    SpinEdit2.Enabled:= False;
    SpinEdit3.Color:=clWindow;
    SpinEdit2.Color:=clSilver;
    SpinEdit3Change(Sender);
  end
  else begin
    SpinEdit2.Enabled:= True;
    SpinEdit3.Enabled:= False;
    SpinEdit2.Color:=clWindow;
    SpinEdit3.Color:=clSilver;
    SpinEdit2Change(Sender);
  end;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
var
  I : Integer;
begin
  MAF:= 0;
  for I:= 1 to Counter do begin
    GT.AmountFrame[I]:= Random(SpinEdit3.Value-1)+1;
    StringGrid4.Cells[1,I]:=IntToStr(GT.AmountFrame[I]);
    if StrToInt(StringGrid4.Cells[1,I]) > MAF then MAF:= StrToInt(StringGrid4.Cells[1,I]);
  end;
  StringGrid4.ColCount:= MAF + 2;
  for I:=2 to StringGrid4.ColCount do
    StringGrid4.Cells[I,0]:='Time'+IntToStr(I-1);
end;

procedure TForm1.CangeStringGrid;
var
  I, J : Integer;
begin
with StringGrid4 do
  if CheckBox2.Checked then
  for I:=1 to Counter do
    for J:=1 to (GT.AmountFrame[I] + 1) do
      GT.StayedInQueueAmountFrame[I,J]:= StrToInt(StringGrid4.Cells[J+1,I]);
  for I:=1 to Counter do
    for J:=1 to (GT.AmountFrame[I] + 1) do
      StringGrid4.Cells[J+1,I]:= IntToStr(GT.StayedInQueueAmountFrame[I,J]);
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
with StringGrid4 do begin
  if CheckBox2.Checked then begin
    Color:= clWindow;
    Options:= [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing];
  end
  else begin
    Color:= clActiveBorder;
    Options:= [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect];
  end;
end;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Panel1.Top:=StrToInt('-' + IntToStr(ScrollBar2.Position));
end;

//procedure TForm1.Button1Click(Sender: TObject); FOR REPORT's MODAL WINDOW /\/\/\/\/\/\/\/\/\
//begin
//TAboutBox.Create(Application) do begin
//  with TF1.Create(Application) do begin
//    showModal;
//    Free;
//  end;
//end;

procedure TForm1.FormPaint(Sender: TObject);
begin
//IN FUTURE PROJECT  Canvas.Rectangle(OLX,OLY,SSX,SSY);
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PageControl1.Visible:= False;
end;

procedure TForm1.Exit2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//  Visible
  SpinEdit2.Visible:= True;
  SpinEdit3.Visible:= True;
  Label2.Visible:= True;
  Label3.Visible:= True;
  Label4.Visible:= True;
  Label5.Visible:= True;
  CheckBox1.Visible:= True;
  CheckBox2.Visible:= True;
  Bevel1.Visible:= True;
  Bevel2.Visible:= True;
  BitBtn2.Visible:= True;
  StringGrid4.Visible:= True;
  Panel2.Visible:= False;
end;

end.
