unit uGraph;

interface //====================================================================

uses //=========================================================================
  Windows, SysUtils, Classes, Graphics, Controls, Forms, FormText,
  Lang;

const //========================================================================

  {Размеры вершин}
  TopHeight      =  50;        // Стандартные
  TopWidth       =  75;        //

  OperTopHeight  =  TopHeight;
  OperTopWidth   =  TopWidth;

  CondTopHeight  =  TopHeight;
  CondTopWidth   =  TopWidth;

  BeginTopHeight =  Round(TopHeight/2);
  BeginTopWidth  =  TopWidth;

  EndTopHeight   =  Round(TopHeight/2);
  EndTopWidth    =  TopWidth;

  TempTopHeight  =  Round(TopWidth/2);
  TempTopWidth   =  Round(TopWidth/2);

  {Цвета}
  GraphBackgroundColor    = $00C8C8B4;     // Фон графа
    {Обычная вершина}
  NormTopBackgroundColor  = clSilver;
  NormTopOutColor         = clBlack;
  NormTopFontColor        = clBlue;
    {Выбранная вершина}
  SelTopBackgroundColor   = clGray;
  SelTopOutColor          = clBlack;
  SelTopFontColor         = clRed;

  {IsBeSaved}
  FirstSave = true;
  NotFirstSave = false;

  {Расширения файлов}
  GraphFileExtention = '.gsc';          // Граф
  TableFileExtention = '.gtb';          // Результирующая таблица

  {Заголовки файлов}
  GraphFileHeaderText = 'Graph-scheme file. Graph 1.0';         // Граф
  TableFileHeaderText = 'Table file. Graph 1.0';                // Результирующая таблица
  ZeroString30 = '                              ';              // Пустая строка !!!!!

  TieWidth       = 1;     // Ширина линии связи
  MoveMist       = 5;     // Допустимое смещение мыши при добавлениии
  RoundCoeff     = 3;     // Коэффициент скругления углов вершин "Н" и "К" (графич.)
  TieSpace       = 10;     // Отступ связи от вершины при огибании

type //=========================================================================

  TTopStyle = (tsOper, tsCond, tsBegin, tsEnd, tsTemp);             // Типы вершин
  TActionType = (atMove, atAddTie, atDelTie, atDelTop, atSetText);  // Типы действий
  TTieType = (ttZero,ttOne);                                        // Типы связей для условных вершин

  TTopSaveRec = record               // Запись для сохранения графа на диск
    Num : integer;
    Style : TTopStyle;
    Left : integer;
    Top : integer;
    InText : string[30];
    Ties : array[ttZero..ttOne] of integer;
  end;

  TTopsTbl = array of TTopSaveRec;   // Массив для считывания графа с диска

  TInTempRec = record                   // Запись для таблицы переходов
    InTopNum: integer;
    OutTopNum: integer;
    InText: string;
  end;

  TJumpTbl = array of TInTempRec;       // Таблица переходов

  TOutTempRec = record                  // Короткая запись для таблицы переходов
    Num: integer;
    InText: string;
  end;

  TOutTbl = array of TOutTempRec;       // Таблица выходов

  TGraphTblRec = record               // Запись для таблицы графа
    TopNum: integer;
    JZero: integer;
    JOne: integer;
    InText: String[5];
  end;

  TGraphTbl = array of TGraphTblRec;  // Таблица графа

  TPathRec = record
    TopNum: integer;
    LastJump: TTieType;
    IsEndFound: boolean;
  end;

  T2DArray = array of array of integer;

//==============================================================================
  TGraph = class(TScrollBox)
  private
    TextForm    : TTextForm;   // Форма с "калькулятором"
    Tops        : TList;       // Список вершин
    LastNum     : integer;     // Номер последней вершины
    LastX       : integer;     // Координаты мыши при MouseDown
    LastY       : integer;     // Координаты мыши при MouseDown
    IsDelTopNeed: boolean;     // Надо удалить вершину
    DelTopIndex : integer;     // Индекс удаляемой вершины
    LastLocalNum: integer;     // Последний локальный номер вершины
    JumpTbl     : TJumpTbl;    // Таблица переходов
    GraphTbl    : TGraphTbl;   // Таблица графа
    {Обработчики событий}
    procedure GraphMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GraphMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    {Добавление вершин}
    procedure AddTop(X,Y:integer);
    procedure AddTopOper(X,Y:integer);
    procedure AddTopCond(X,Y:integer);
    procedure AddTopBegin(X,Y:integer);
    procedure AddTopEnd(X,Y:integer);
    procedure AddTopTemp(X,Y:integer);
    {Запись/считывание файлов}
    procedure SaveGraphToFile(FileName : string);
    procedure CreateTopsFromTbl(TopsTbl: TTopsTbl);
//    procedure Save2DArrayToFile(arr: T2DArray; EndNum: integer; FileName: string);
    {Проверки}
    procedure CheckFillingTops;
    procedure CheckBorder;
    procedure CheckTies;
    procedure CheckTemp;
    procedure CheckStructure;
    function PassTemp(TopNum: integer): integer;
    procedure CreateGraphTbl;
    procedure ConvertTableToArrays;
    {Прочее}
    procedure DelTop(TopNum: integer);
    procedure RecountTops;
    procedure SelectTop(TopNum: integer);
    procedure UnSelectAll;
    function GetTopNum(X,Y: integer): integer; overload;
    function GetLocalNum(TopNum: integer): integer;
    function GetTopNum(LocalNum: integer): integer; overload;
  public
    ActionType  : TActionType; // Тип действия, проводимого в данный момент
    atStyle     : TTopStyle;   // Тип добавляемой вершины
    IsModified  : boolean;     // Признак модификации
    constructor Create(AOwner : TComponent); override;
    procedure SaveToFile(FileName : string; IsFirstSave: boolean);
    function LoadFromFile(FileName : string): boolean;
    procedure Clear;
    function Check: boolean;
  end;
//==============================================================================
  TTie = class(TGraphicControl)
  private
    Graph               : TGraph;       // Родительский граф
    BeginPoint          : TPoint;       // Точка начала связи (на графе)
    EndPoint            : TPoint;       // Точка конца связи  (на графе)
    ToDown              : boolean;      // Точка начала выше точки конца
    DrawPoints          : array[0..5] of TPoint; // Точки линии
    BTNum               : integer;      // Номер начальной вершины
    ETNum               : integer;      // Номер конечной вершины
    procedure TieMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TieMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure UpdatePos;
    procedure SetPos(X1,Y1,X2,Y2: integer);
    procedure SetBeginNum(NewNum: integer);
    procedure SetEndNum(NewNum: integer);
    procedure Disconnect;
  protected
    constructor Create(AOwner : TGraph; BeginTopNum,EndTopNum:integer); reintroduce; overload;
    procedure Paint; override;
  end;
//==============================================================================
  TTop = class(TGraphicControl)
  private
    Graph               : TGraph;       // Родительский граф
    Num                 : integer;      // Номер
    Style               : TTopStyle;    // Тип
    InText              : string;       // Внутренний текст
    Tie                 : TTie;         // Исходящая связь
    InTies              : TList;        // Входящие связи
    BackgroundColor     : TColor;       // Цвет фона
    OutColor            : TColor;       // Цвет границы
    FontColor           : TColor;       // Цвет надписи
    IsMouseDown         : boolean;      // Признак нажатой кнопки мыши (Drag)
    LastX               : integer;      // Координаты мыши при MouseDown
    LastY               : integer;      // Координаты мыши при MouseDown
    StrRect             : TRect;        // Прямоугольник для прорисовки текста
    StrPoint            : TPoint;       // Начальная точка прорисовки текста
    LocalNum            : integer;      // Локальный номер (для вывода путей)
    HaveLocalNum        : boolean;      // Подлежит ли вершина локальной нумерации

    {Обработчики событий (номинальные)}
    procedure TopMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TopMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TopMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TopDblClick(Sender: TObject);
    {Обработчики событий (действительные)}
    procedure MoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure MoveMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure MoveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure AddTieMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure AddTieMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure AddTieMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DelTieMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DelTieMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DelTieMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DelTopMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DelTopMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DelTopMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure SetTextMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure SetTextMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer); dynamic;
    {Прочее}
    procedure MoveTo(X,Y:integer);
  protected
    constructor Create(AOwner : TGraph; NewNum : integer); reintroduce; overload;
    {Действия со связями}
    procedure SetTie(TieType: TTieType;TopNum:integer); dynamic;
    procedure DelTie(X,Y:integer); overload; dynamic;
    procedure DelTie(DTie: TTie); overload; dynamic;
    procedure DelAllTies; dynamic;
    function GetTieType(X,Y: integer): TTieType; dynamic;
    function RemoveTie(DTie: TTie): boolean; dynamic;
    procedure UpdateTies; dynamic;
    function GetOutPoint: TPoint; dynamic;
    function GetInPoint: TPoint; dynamic;
    function GetTiePoint(FTie: TTie): TPoint; dynamic;
    function IsHere(X, Y: Integer): boolean;
    {Прочее}
    procedure SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure SetText(Value : String); dynamic;
    function CanConnectTo(Style: TTopStyle): boolean; dynamic;
    function HaveNeedTies: boolean; dynamic;
    procedure SetNum(NewNum: integer); dynamic;
    procedure Select;
    procedure UnSelect;
  end;
//==============================================================================
  TTopCond = class(TTop)
  private
    Ties        : array[ttZero..ttOne] of TTie; // Исходящие связи
    OutPoints   : array[0..3] of TPoint;   // Точки графической фигуры вершины (для прорисовки)
    OPoint      : TPoint;                  // Точка начала нулевой исходящей связи (на графе)
    ZPoint      : Tpoint;                  // Точка начала единичной исходящей связи (на графе)
  protected
    function GetTieType(X,Y: integer): TTieType; override;
    constructor Create(AOwner : TGraph; NewNum : integer);
    procedure Paint; override;
    procedure SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure UpdateTies; override;
    procedure SetTie(TieType: TTieType; TopNum: integer); override;
    procedure DelTie(X,Y: integer); override;
    procedure DelAllTies; override;
    function RemoveTie(DTie : TTie): boolean; override;
    function GetOutPoint(TieType: TTieType): TPoint; reintroduce; overload;
    function GetTiePoint(FTie: TTie): TPoint; override;
    function HaveNeedTies:boolean; override;
    procedure SetNum(NewNum: integer); override;
  end;
//==============================================================================
  TTopOper = class(TTop)
  private
    OutRect     : TRect;        // Графическая фигура для прорисовки границ вершины
  protected
    constructor Create(AOwner : TGraph; NewNum : integer);
    procedure Paint; override;
    procedure SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;
//==============================================================================
  TTopBegin = class(TTop)
  protected
    constructor Create(AOwner : TGraph; NewNum : integer);
    procedure Paint; override;
    function CanConnectTo(Style: TTopStyle): boolean; override;
    function HaveNeedTies:boolean; override;
  end;
//==============================================================================
  TTopEnd = class(TTop)
  protected
    constructor Create(AOwner : TGraph; NewNum : integer);
    procedure Paint; override;
    function CanConnectTo(Style: TTopStyle): boolean; override;
    function HaveNeedTies:boolean; override;
  end;
//==============================================================================
  TTopTemp = class(TTop)
  private
    SenterPoint         : TPoint;       // Точка центра вершины на графе (для связей)
  protected
    constructor Create(AOwner : TGraph; NewNum : integer);
    procedure Paint; override;
    procedure SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function GetInPoint: TPoint; override;
    function GetOutPoint: TPoint; override;
    function CanConnectTo(Style: TTopStyle): boolean; override;
    function HaveNeedTies:boolean; override;
    procedure SetText(Value : String); override;
  end;
//==============================================================================
  EGraphCheckError = class(Exception)
  private
    ErrorTopNum         : integer;
    ErrorTopLocalNum    : integer;
  public
    constructor Create(Msg: string; TopNum: integer; LocalTopNum: integer = -1); overload;
    constructor Create(Msg: string); overload;
    property TopNum: integer read ErrorTopNum write ErrorTopNum;
    property LocalTopNum: integer read ErrorTopLocalNum write ErrorTopLocalNum;
  end;
//==============================================================================
implementation //===============================================================
//==============================================================================
uses GraphForm, MainUnit;

constructor TGraph.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  TextForm := TTextForm.Create(Self);
  Tops := TList.Create;
  OnMouseDown := GraphMouseDown;
  OnMouseUp := GraphMouseUp;
  IsModified := false;
  IsDelTopNeed := false;
  Color := GraphBackgroundColor;
  Clear;
  {default settings}
  atStyle := tsOper;
  ActionType := atMove;
end;
//------------------------------------------------------------------------------
procedure TGraph.AddTop(X,Y:integer);
begin
  IsModified := true;
  case atStyle of
    tsOper: AddTopOper(X-trunc(OperTopWidth/2),Y-trunc(OperTopHeight/2));
    tsCond: AddTopCond(X-trunc(CondTopWidth/2),Y-trunc(CondTopHeight/2));
    tsBegin: AddTopBegin(X-trunc(BeginTopWidth/2),Y-trunc(BeginTopHeight/2));
    tsEnd: AddTopEnd(X-trunc(EndTopWidth/2),Y-trunc(EndTopHeight/2));
    tsTemp: AddTopTemp(X-trunc(TempTopWidth/2),Y-trunc(TempTopHeight/2));
  end;
  RecountTops;
end;
//------------------------------------------------------------------------------
procedure TGraph.AddTopOper(X,Y:integer);
var
  Top:TTopOper;
begin
  inc(LastNum);
  Top := TTopOper.Create(Self, LastNum);
  Top.MoveTo(X,Y);
  inc(LastLocalNum);
  Top.LocalNum := LastLocalNum;
  Tops.Add(Top);
  UnSelectAll;
  Top.Select;
  InsertControl(Top);
  Top.SetText('');
end;
//------------------------------------------------------------------------------
procedure TGraph.AddTopCond(X,Y:integer);
var
  Top:TTopCond;
begin
  inc(LastNum);
  Top := TTopCond.Create(Self, LastNum);
  Top.MoveTo(X,Y);
  inc(LastLocalNum);
  Top.LocalNum := LastLocalNum;
  Tops.Add(Top);
  UnSelectAll;
  Top.Select;
  InsertControl(Top);
  Top.SetText('');
end;
//------------------------------------------------------------------------------
procedure TGraph.AddTopBegin(X,Y:integer);
var
  Top:TTopBegin;
begin
  inc(LastNum);
  Top := TTopBegin.Create(Self, LastNum);
  Top.MoveTo(X,Y);
  Tops.Add(Top);
  Top.LocalNum := 1;
  UnSelectAll;
  Top.Select;
  InsertControl(Top);
  Top.SetText(BeginTitle);
end;
//------------------------------------------------------------------------------
procedure TGraph.AddTopEnd(X,Y:integer);
var
  Top:TTopEnd;
begin
  inc(LastNum);
  Top := TTopEnd.Create(Self, LastNum);
  Top.MoveTo(X,Y);
  Tops.Add(Top);
  Top.LocalNum := LastLocalNum + 1;
  UnSelectAll;
  Top.Select;
  InsertControl(Top);
  Top.SetText(EndTitle);
end;
//------------------------------------------------------------------------------
procedure TGraph.AddTopTemp(X,Y:integer);
var
  Top:TTopTemp;
begin
  inc(LastNum);
  Top := TTopTemp.Create(Self, LastNum);
  Top.MoveTo(X,Y);
  Tops.Add(Top);
  UnSelectAll;
  Top.Select;
  InsertControl(Top);
end;
//------------------------------------------------------------------------------
procedure TGraph.DelTop(TopNum: integer);
var
  DTop : TTop;
begin
  DTop := Tops.Items[TopNum];
  Tops.Remove(DTop);
  DTop.Free;
  RecountTops;
end;
//------------------------------------------------------------------------------
procedure TGraph.Clear;
var
  CTop: TTop;
begin
  while Tops.Count>0 do
  begin
    CTop := Tops.Items[0];
    CTop.DelAllTies;
    DelTop(0);
  end;
  LastNum := -1;
  LastLocalNum := 1;
  IsModified := false;
end;
//------------------------------------------------------------------------------
function TGraph.GetTopNum(X,Y: integer): integer;
var
  i: integer;
  FTop: TTop;
begin
  Result:=-1;
  for i:=0 to Tops.Count-1 do
  begin
    FTop:= Tops.Items[i];
    if FTop.IsHere(X,Y) then
    begin
      Result:=i;
      break;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.GraphMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LastX := X;
  LastY := Y;
end;
//------------------------------------------------------------------------------
procedure TGraph.GraphMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if IsDelTopNeed
  then
  begin
    DelTop(DelTopIndex);
    IsDelTopNeed := false;
  end
  else if (abs(LastX-X)<MoveMist) and (abs(LastY-Y)<MoveMist) then AddTop(X,Y);
end;
//------------------------------------------------------------------------------
procedure TGraph.SelectTop(TopNum: integer);
var
  STop: TTop;
begin
  STop := Tops.Items[TopNum];
  STop.Select;
end;
//------------------------------------------------------------------------------
procedure TGraph.UnSelectAll;
var
  i: integer;
  DSTop: TTop;
begin
  for i:=0 to Tops.Count-1 do
  begin
    DSTop := Tops.Items[i];
    DSTop.UnSelect;
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.SaveToFile(FileName : string; IsFirstSave: boolean);
var
 S:String;
begin
  if IsFirstSave and FileExists(FileName) then
    if Application.MessageBox(HaveFileVithThisName,Quest,
                              MB_YESNO + MB_ICONQUESTION) = IDNO then exit;
  S := ExtractFileExt(FileName);
  SaveGraphToFile(FileName);
  IsModified := false;
end;
//------------------------------------------------------------------------------
procedure TGraph.SaveGraphToFile(FileName : string);
var
  F: file of TTopSaveRec;
  CTop: TTop;
  CTopS: TTopSaveRec;
  i: integer;
  TT: TTieType;
  CondTop: TTopCond;
begin
  RecountTops;
  AssignFile(F,FileName);
  rewrite(F);
  {file header}
  CTopS.Num := Tops.Count;
  CTopS.Style := tsOper;
  CTopS.Left := -1;
  CTopS.Top := -1;
  for TT:=ttZero to ttOne do CTopS.Ties[TT] := -1;
  CTopS.InText := GraphFileHeaderText;
  write(F,CTopS);
  CTopS.InText := ZeroString30;
  {}
  for i:=0 to Tops.Count-1 do
    with CTopS do
    begin
      CTop := Tops.Items[i];
      Num := CTop.Num;
      Style := CTop.Style;
      CTopS.Left := CTop.Left;
      CTopS.Top := CTop.Top;
      InText := CTop.InText;
      case CTopS.Style of
        tsOper,tsBegin,tsEnd,tsTemp:
        for TT:=ttZero to ttOne do if (TT=ttZero) and (CTop.Tie<>nil)
          then Ties[TT] := CTop.Tie.ETNum
          else Ties[TT] := -1;
        tsCond:
        begin
          CondTop := Tops.Items[i];
          for TT:=ttZero to ttOne do if CondTop.Ties[TT]<>nil
            then Ties[TT] := CondTop.Ties[TT].ETNum
            else Ties[TT] := -1;
        end;
      end;
      write(F,CTopS);
    end;
  CloseFile(F);
end;
//------------------------------------------------------------------------------
function TGraph.LoadFromFile(FileName : string): boolean;
var
  F: file of TTopSaveRec;
  CTopS: TTopSaveRec;
  TopsTbl : TTopsTbl;
begin
  Result := false;
  try
    AssignFile(F,FileName);
    reset(F);
    {file header}
    read(F,CTopS);
    if CTopS.InText<>GraphFileHeaderText then
    begin
      Application.MessageBox(PChar(
        'Файл '+ExtractFileName(FileName)+ExtractFileExt(FileName)+
        ' не является стандартным файлом граф-схем'),
        Err, MB_OK + MB_ICONERROR);
      exit;
    end;
    {}
    SetLength(TopsTbl,0);
    while not EOF(F) do
    begin
      read(F,CTopS);
      SetLength(TopsTbl,length(TopsTbl)+1);
      TopsTbl[length(TopsTbl)-1]:=CTopS;
    end;
    CloseFile(F);
    Result := true;
  except
    on EIOE: EInOutError do
    begin
      Application.MessageBox(
        ErrorOpenGraphFile,Err, MB_OK + MB_ICONERROR);
      exit;
    end;
  end;
  Result := true;
  Clear;
  CreateTopsFromTbl(TopsTbl);
end;
//------------------------------------------------------------------------------
procedure TGraph.CreateTopsFromTbl(TopsTbl: TTopsTbl);
var
  i:integer;
  CTop: TTop;
  TT: TTieType;
begin
  for i:=0 to length(TopsTbl) - 1 do
  begin
    case TopsTbl[i].Style of
      tsOper: AddTopOper(TopsTbl[i].Left,TopsTbl[i].Top);
      tsCond: AddTopCond(TopsTbl[i].Left,TopsTbl[i].Top);
      tsBegin: AddTopBegin(TopsTbl[i].Left,TopsTbl[i].Top);
      tsEnd: AddTopEnd(TopsTbl[i].Left,TopsTbl[i].Top);
      tsTemp: AddTopTemp(TopsTbl[i].Left,TopsTbl[i].Top);
    end;
  end;
  for i:=0 to length(TopsTbl) - 1 do
  begin
    CTop := Tops.Items[i];
    CTop.SetText(TopsTbl[i].InText);
    for TT:=ttZero to ttOne do
      if TopsTbl[i].Ties[TT]<>-1 then CTop.SetTie(TT, TopsTbl[i].Ties[TT]);
  end;
  RecountTops;
end;
//------------------------------------------------------------------------------
procedure TGraph.RecountTops;
var
  i: integer;
  FTop: TTop;
begin
  LastNum := Tops.Count-1;
  LastLocalNum := 1;
  for i:=0 to LastNum do
  begin
    FTop := Tops[i];
    FTop.SetNum(i);
    if FTop.HaveLocalNum then
    begin
      inc(LastLocalNum);
      FTop.LocalNum := LastLocalNum;
    end;
  end;
  for i:=0 to LastNum do
  begin
    FTop := Tops[i];
    if FTop.Style=tsEnd then FTop.LocalNum := LastLocalNum+1;
  end;
  repaint;
end;
//==============================================================================
constructor TTie.Create(AOwner : TGraph; BeginTopNum,EndTopNum:integer);
begin
  inherited Create(AOwner);
  Graph := AOwner;
  OnMouseDown := TieMouseDown;
  OnMouseUp := TieMouseUp;
  BTNum := BeginTopNum;
  ETNum := EndTopNum;
  UpdatePos;
end;
//------------------------------------------------------------------------------
procedure TTie.Paint;
begin
  with Canvas do
  begin
    Pen.Width := TieWidth;
    Polyline(DrawPoints);
  end;
end;
//------------------------------------------------------------------------------
procedure TTie.TieMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
begin
  Graph.GraphMouseDown(Graph, Button, Shift, X+Left, Y+Top);
end;
//------------------------------------------------------------------------------
procedure TTie.TieMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
begin
  Graph.GraphMouseUp(Graph, Button, Shift, X+Left, Y+Top);
end;
//------------------------------------------------------------------------------
procedure TTie.Disconnect;
var
  DTop : TTop;
begin
  DTop := Graph.Tops.Items[BTNum];
  DTop.RemoveTie(Self);
  DTop := Graph.Tops.Items[ETNum];
  DTop.RemoveTie(Self);
end;
//------------------------------------------------------------------------------
procedure TTie.UpdatePos;
var
  QTop: TTop;
begin
  QTop := Graph.Tops.Items[BTNum];
  BeginPoint := QTop.GetTiePoint(Self);
  QTop := Graph.Tops.Items[ETNum];
  EndPoint := QTop.GetTiePoint(Self);
  SetPos(BeginPoint.X, BeginPoint.Y, EndPoint.X, EndPoint.Y);
end;
//------------------------------------------------------------------------------
procedure TTie.SetPos(X1,Y1,X2,Y2: integer);
begin
  BeginPoint.X := X1;
  BeginPoint.Y := Y1;
  EndPoint.X := X2;
  EndPoint.Y := Y2;
  if Y1<Y2 then
  begin
    ToDown := true;
    Top := Y1 - TieWidth;
    Height := Y2 - Y1 + 2*TieWidth;
    Width := abs(X2 - X1) + 2*TieWidth;
    DrawPoints[0].Y := TieWidth;
    DrawPoints[5].Y := Height-TieWidth;
    DrawPoints[1].Y := round(Height/2);
    DrawPoints[4].Y := round(Height/2);
    if X1<X2
    then
    begin
      Left := X1 - TieWidth;
      DrawPoints[0].X := TieWidth;
      DrawPoints[5].X := Width-TieWidth;
    end
    else
    begin
      Left := X2 - TieWidth;
      DrawPoints[0].X := Width-TieWidth;
      DrawPoints[5].X := TieWidth;
    end;
    DrawPoints[1].X := DrawPoints[0].X;
    DrawPoints[4].X := DrawPoints[5].X;
    DrawPoints[2] := DrawPoints[1];
    DrawPoints[3] := DrawPoints[4];
  end      else
  begin
    ToDown := false;
    Top := Y2 - TieSpace - TieWidth;
    Height := Y1 - Y2 + 2*TieSpace + 2*TieWidth;
    Width := abs(X1 - X2) + round(TopWidth/2) + TieSpace + 2*TieWidth;
    DrawPoints[0].Y := Height - TieSpace - TieWidth;
    DrawPoints[5].Y := TieSpace + TieWidth;
    DrawPoints[1].Y := Height - TieWidth;
    DrawPoints[4].Y := TieWidth;
    DrawPoints[2].Y := DrawPoints[1].Y;
    DrawPoints[3].Y := DrawPoints[4].Y;
    if X1<X2 then
    begin
      Left := X1 - round(TopWidth/2) - TieSpace - TieWidth;
      DrawPoints[0].X := TieWidth + TieSpace + round(TopWidth/2);
      DrawPoints[5].X := Width - TieWidth;
      DrawPoints[2].X := TieWidth;
      DrawPoints[3].X := DrawPoints[2].X;
    end
             else
    begin
      Left := X2 - TieWidth;
      DrawPoints[0].X := TieWidth + X1 - X2;
      DrawPoints[5].X := TieWidth;
      DrawPoints[2].X := Width - TieWidth;
      DrawPoints[3].X := DrawPoints[2].X;
    end;
    DrawPoints[1].X := DrawPoints[0].X;
    DrawPoints[4].X := DrawPoints[5].X;
  end;
  refresh;
end;
//------------------------------------------------------------------------------
procedure TTie.SetBeginNum(NewNum: integer);
begin
  BTNum := NewNum;
end;
//------------------------------------------------------------------------------
procedure TTie.SetEndNum(NewNum: integer);
begin
  ETNum := NewNum;
end;
//==============================================================================
constructor TTop.Create(AOwner : TGraph; NewNum : integer);
begin
  inherited Create(AOwner);
  Graph := AOwner;
  Num := NewNum;
  onMouseDown := TopMouseDown;
  onMouseUp := TopMouseUp;
  onMouseMove := TopMouseMove;
  onDblClick := TopDblClick;
  IsMouseDown := false;
  BackgroundColor := NormTopBackgroundColor;
  OutColor := NormTopOutColor;
  FontColor := NormTopFontColor;
  InText := '';
  LocalNum := 0;
  HaveLocalNum := true;
end;
//----------------------------------------------------------------
procedure TTop.TopMouseDown(Sender: TObject; Button: TMouseButton;
                            Shift: TShiftState; X, Y: Integer);
begin
  Graph.UnSelectAll;
  Select;
  case Graph.ActionType of
    atMove: MoveMouseDown(Sender,Button,Shift,X,Y);
    atAddTie: AddTieMouseDown(Sender,Button,Shift,X,Y);
    atDelTie: DelTieMouseDown(Sender,Button,Shift,X,Y);
    atDelTop: DelTopMouseDown(Sender,Button,Shift,X,Y);
    atSetText: SetTextMouseDown(Sender,Button,Shift,X,Y);
  end;
end;
//------------------------------------------------------------------------------
procedure TTop.TopMouseUp(Sender: TObject; Button: TMouseButton;
                          Shift: TShiftState; X, Y: Integer);
begin
  case Graph.ActionType of
    atMove: MoveMouseUp(Sender,Button,Shift,X,Y);
    atAddTie: AddTieMouseUp(Sender,Button,Shift,X,Y);
    atDelTie: DelTieMouseUp(Sender,Button,Shift,X,Y);
    atDelTop: DelTopMouseUp(Sender,Button,Shift,X,Y);
    atSetText: SetTextMouseUp(Sender,Button,Shift,X,Y);
  end;
end;
//------------------------------------------------------------------------------
procedure TTop.TopMouseMove(Sender: TObject; Shift: TShiftState;
                            X, Y: Integer);
begin
  case Graph.ActionType of
    atMove: MoveMouseMove(Sender,Shift,X,Y);
    atAddTie: AddTieMouseMove(Sender,Shift,X,Y);
    atDelTie: DelTieMouseMove(Sender,Shift,X,Y);
    atDelTop: DelTopMouseMove(Sender,Shift,X,Y);
    atSetText: SetTextMouseMove(Sender,Shift,X,Y);
  end;
end;
//------------------------------------------------------------------------------
procedure TTop.TopDblClick(Sender: TObject);
var
  Button: TMouseButton;
  Shift: TShiftState;
  X: integer;
  Y: integer;
begin
  if Graph.ActionType in [atMove, atAddTie, atDelTie] then
  begin
    Button := mbLeft;
    Shift := [ssDouble];
    X := -1;
    Y := -1;
    SetTextMouseUp(Sender,Button,Shift,X,Y);
    if Graph.ActionType = atMove then isMouseDown := true;
  end;
end;
//------------------------------------------------------------------------------
function TTop.IsHere(X, Y: Integer): boolean;
begin
  if (X>=Left)and(X<=Left+Width)and(Y>=Top)and(Y<=Top+Height)
    then Result := true
    else Result := false;
end;
//------------------------------------------------------------------------------
procedure TTop.SetTie(TieType: TTieType; TopNum:integer);
var
  CTop: TTop;
begin
  CTop := Graph.Tops.Items[TopNum];
  if (Tie=nil) and CanConnectTo(CTop.Style) then
  begin
    Tie := TTie.Create(Graph,Num,CTop.Num);
    CTop.InTies.Add(Tie);
    Graph.InsertControl(Tie);
    Tie.SendToBack;
    Tie.UpdatePos;
  end;
  refresh;
end;
//------------------------------------------------------------------------------
procedure TTop.DelTie(X,Y:integer);
begin
  DelTie(Tie);
end;
//------------------------------------------------------------------------------
procedure TTop.DelTie(DTie: TTie);
begin
  if DTie<>nil then
  begin
    DTie.Disconnect;
    Graph.RemoveControl(DTie);
    DTie.Free;
  end;
end;
//------------------------------------------------------------------------------
function TTop.GetTieType(X,Y: integer): TTieType;
begin
  Result := ttZero;
end;
//------------------------------------------------------------------------------
function TTop.RemoveTie(DTie: TTie): boolean;
var
  i: integer;
  FTie: TTie;
begin
  Result := false;
  if Tie=DTie then
  begin
    Tie := nil;
    Result := true;
  end
  else
    for i:=0 to InTies.Count-1 do
    begin
      FTie := InTies.Items[i];
      if FTie=DTie then
      begin
        InTies.Remove(FTie);
        Result := true;
        break;
      end;
    end;
end;
//------------------------------------------------------------------------------
procedure TTop.DelAllTies;
var
  DTie: TTie;
begin
  DelTie(Tie);
  while InTies.Count<>0 do
  begin
    DTie := InTies.Items[0];
    DelTie(DTie);
  end;
end;
//------------------------------------------------------------------------------
function TTop.GetInPoint: TPoint;
begin
  Result.X := Left+round(Width/2);
  Result.Y := Top;
end;
//------------------------------------------------------------------------------
function TTop.GetTiePoint(FTie: TTie): TPoint;
begin
  if FTie = Tie
  then Result := GetOutPoint
  else Result := GetInPoint;
end;
//------------------------------------------------------------------------------
function TTop.HaveNeedTies:boolean;
begin
  if (InTies.Count=0) or (Tie=nil)
    then Result := false
    else Result := true;
end;
//------------------------------------------------------------------------------
procedure TTop.SetText(Value : string);
begin
  InText := Value;
  StrPoint.X := trunc((Width-Canvas.TextWidth(IntToStr(LocalNum)+') '+InText))/2);
  StrPoint.Y := trunc((Height-Canvas.TextHeight(IntToStr(LocalNum)+') '+InText))/2);
  repaint;
end;
//------------------------------------------------------------------------------
procedure TTop.Select;
begin
  BringToFront;
  BackgroundColor := SelTopBackgroundColor;
  OutColor := SelTopOutColor;
  FontColor := SelTopFontColor;
  repaint;
end;
//------------------------------------------------------------------------------
procedure TTop.UnSelect;
begin
  BackgroundColor := NormTopBackgroundColor;
  OutColor := NormTopOutColor;
  FontColor := NormTopFontColor;
  repaint;
end;
//------------------------------------------------------------------------------
procedure TTop.UpdateTies;
var
  i: integer;
  ITie: TTie;
begin
  if Tie<>nil then Tie.UpDatePos;
  for i:=0 to InTies.Count-1 do
  begin
    ITie := InTies.Items[i];
    ITie.UpdatePos;
  end;
end;
//------------------------------------------------------------------------------
function TTop.GetOutPoint: TPoint;
begin
  Result.X:=Left+Round(Width/2);
  Result.Y:=Top+Height;
end;
//------------------------------------------------------------------------------
function TTop.CanConnectTo(Style : TTopStyle): boolean;
begin
  Result := Style<>tsBegin;
end;
//----------------------------------------------------------------
procedure TTop.MoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IsMouseDown := not IsMouseDown;
  LastX := X;
  LastY := Y;
end;
//------------------------------------------------------------------------------
procedure TTop.MoveMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IsMouseDown := false;
end;
//------------------------------------------------------------------------------
procedure TTop.MoveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if IsMouseDown then
    MoveTo(Left + X - LastX, Top+Y-LastY);
end;
//----------------------------------------------------------------
procedure TTop.AddTieMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LastX := X;
  LastY := Y;
end;
//------------------------------------------------------------------------------
procedure TTop.AddTieMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TieIndex: integer;
  CTop: TTop;
begin
  TieIndex:= Graph.GetTopNum(X+Left,Y+Top);
  if TieIndex>=0 then
  begin
    CTop:= Graph.Tops.Items[TieIndex];
    if CTop<>(Sender as TTop) then
    begin
      SetTie(GetTieType(LastX,LastY),CTop.Num);
      Graph.IsModified := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TTop.AddTieMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
end;
//----------------------------------------------------------------
procedure TTop.DelTieMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LastX := X;
  LastY := Y;
end;
//------------------------------------------------------------------------------
procedure TTop.DelTieMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (abs(LastX-X)<MoveMist) and (abs(LastY-Y)<MoveMist) then
  begin
    DelTie(X,Y);
    Graph.IsModified := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TTop.DelTieMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
end;
//----------------------------------------------------------------
procedure TTop.DelTopMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DelAllTies;      
  Graph.RemoveControl(Sender as TTop);
  Graph.DelTopIndex := Graph.Tops.IndexOf(Sender);
  Graph.IsDelTopNeed := true;
  Graph.IsModified := true;
end;
//------------------------------------------------------------------------------
procedure TTop.DelTopMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;
//------------------------------------------------------------------------------
procedure TTop.DelTopMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
end;
//------------------------------------------------------------------------------
procedure TTop.SetTextMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;
//------------------------------------------------------------------------------
procedure TTop.SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;
//------------------------------------------------------------------------------
procedure TTop.SetTextMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
end;
//------------------------------------------------------------------------------
procedure TTop.MoveTo(X,Y:integer);
begin
  Left := X;
  Top := Y;
  UpdateTies;
end;
//------------------------------------------------------------------------------
procedure TTop.SetNum(NewNum: integer);
var
  i : integer;
  STie : TTie;
begin
  Num := NewNum;
  if Tie<>nil then Tie.SetBeginNum(NewNum);
  for i:=0 to InTies.Count-1 do
  begin
    STie := InTies.Items[i];
    STie.SetEndNum(NewNum)
  end;
end;
//==============================================================================
constructor TTopOper.Create(AOwner : TGraph; NewNum : integer);
begin
  inherited Create(AOwner, NewNum);
  Style := tsOper;
  Height := OperTopHeight;
  Width := OperTopWidth;
  InTies := TList.Create;
  OutRect.Left := 0;
  OutRect.Top := 0;
  OutRect.Right := OperTopWidth;
  OutRect.Bottom := OperTopHeight;
  StrRect.Left := 1;
  StrRect.Top := 1;
  StrRect.Right := OperTopWidth-2;
  StrRect.Bottom := OperTopHeight-2;
  StrPoint.X := trunc(OperTopWidth/2);
  StrPoint.Y := trunc(OperTopHeight/2);
end;
//------------------------------------------------------------------------------
procedure TTopOper.Paint;
begin
  with Canvas do
  begin
    Brush.Color := BackgroundColor;
    FillRect(OutRect);
    Brush.Color := OutColor;
    FrameRect(OutRect);
    Brush.Color := BackgroundColor;
    Font.Color := FontColor;
    TextRect(StrRect,StrPoint.X,StrPoint.Y,IntToStr(LocalNum)+') '+InText);
  end;
end;
//------------------------------------------------------------------------------
procedure TTopOper.SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TextForm.SetupForm(inText,'Выходной сигнал',sY);
  if TextForm.ShowModal = mrOk then SetText(TextForm.eText.Text);
end;
//==============================================================================
constructor TTopCond.Create(AOwner : TGraph; NewNum : integer);
begin
  inherited Create(AOwner, NewNum);
  Style := tsCond;
  Height := CondTopHeight;
  Width := CondTopWidth;
  InTies := TList.Create;
  OutPoints[0].X := trunc(TopWidth/2);
  OutPoints[0].Y := 0;
  OutPoints[1].X := TopWidth-1;
  OutPoints[1].Y := trunc(TopHeight/2);
  OutPoints[2].X := trunc(TopWidth/2);
  OutPoints[2].Y := TopHeight-1;
  OutPoints[3].X := 0;
  OutPoints[3].Y := trunc(TopHeight/2);
  StrRect.Left := trunc(TopWidth/4);
  StrRect.Top := trunc(TopHeight/4)+2;
  StrRect.Right := trunc(TopWidth*3/4);
  StrRect.Bottom := trunc(TopHeight*3/4);
  ZPoint.X:=0;
  ZPoint.Y:=trunc(CondTopHeight/2)-17;
  OPoint.X:=CondTopWidth-6;
  OPoint.Y:=trunc(CondTopHeight/2)-17;
  StrPoint.X := trunc(CondTopWidth/2);
  StrPoint.Y := trunc(CondTopHeight/2);
end;
//------------------------------------------------------------------------------
procedure TTopCond.Paint;
begin
  with Canvas do
  begin
    Brush.Color := BackgroundColor;
    Pen.Color := OutColor;
    Polygon(OutPoints);
    Font.Color := FontColor;
    TextRect(StrRect,StrPoint.X,StrPoint.Y,IntToStr(LocalNum)+') '+InText);
    TextOut(ZPoint.X,ZPoint.Y,'0');
    TextOut(OPoint.X,OPoint.Y,'1');
  end;
end;
//------------------------------------------------------------------------------
function TTopCond.GetTieType(X,Y: integer): TTieType;
begin
  if X>CondTopWidth/2
    then Result := ttOne
    else Result := ttZero;
end;
//------------------------------------------------------------------------------
procedure TTopCond.SetTie(TieType: TTieType; TopNum:integer);
var
  X1,Y1,X2,Y2: integer;
  CTop: TTop;
  Point : TPoint;
begin
  CTop := Graph.Tops.Items[TopNum];
  if (Ties[TieType]=nil) and (CTop<>nil) and (CTop.Style<>tsBegin)then
  begin
    Ties[TieType] := TTie.Create(Graph,Num,CTop.Num);
    CTop.InTies.Add(Ties[TieType]);
    Point := GetOutPoint(TieType);
    X1 := Point.X;
    Y1 := Point.Y;
    Point := CTop.GetInPoint;
    X2 := Point.X;
    Y2 := Point.Y;
    Ties[TieType].SetPos(X1,Y1,X2,Y2);
    Graph.InsertControl(Ties[TieType]);
    Ties[TieType].SendToBack;
  end;
  refresh;
end;
//------------------------------------------------------------------------------
procedure TTopCond.DelTie(X,Y:integer);
begin
  DelTie(Ties[GetTieType(X,Y)])
end;
//------------------------------------------------------------------------------
procedure TTopCond.DelAllTies;
var
  TT: TTieType;
begin
  inherited DelAllTies;
  for TT:=ttZero to ttOne do
    DelTie(Ties[TT]);
end;
//------------------------------------------------------------------------------
function TTopCond.RemoveTie(DTie : TTie): boolean;
var
  TT : TTieType;
begin
  result := inherited RemoveTie(DTie);
  if not Result then
    for TT:=ttZero to ttOne do if Ties[TT]=DTie then
    begin
      Ties[TT] := nil;
      Result := true;
    end;
end;
//------------------------------------------------------------------------------
function TTopCond.HaveNeedTies:boolean;
var
  TT: TTieType;
begin
  Result := true;
  if InTies.Count=0 then Result := false;
  for TT:=ttZero to ttOne do if Ties[TT]=nil then Result := false;
end;
//------------------------------------------------------------------------------
procedure TTopCond.SetNum(NewNum: integer);
var
  TT: tTieType;
begin
  inherited SetNum(NewNum);
  for TT:=ttZero to ttOne do if Ties[TT]<>nil then Ties[TT].SetBeginNum(NewNum);
end;
//------------------------------------------------------------------------------
procedure TTopCond.UpdateTies;
var
  TT : TTieType;
begin
  inherited UpdateTies;
  for TT:=ttZero to ttOne do if Ties[TT]<>nil then Ties[TT].UpdatePos;
end;
//------------------------------------------------------------------------------
function TTopCond.GetOutPoint(TieType: TTieType): TPoint;
begin
  Result.Y:=Top+round(Height/2);
  if TieType=ttZero then Result.X:=Left
                    else Result.X:=Left+Width;
end;
//------------------------------------------------------------------------------
function TTopCond.GetTiePoint(FTie: TTie): TPoint;
var
  TT: TTieType;
begin
  for TT:=ttzero to ttOne do
    if FTie = Ties[TT] then
    begin
      Result := GetOutPoint(TT);
      exit;
    end;
  Result := GetInPoint;
end;
//------------------------------------------------------------------------------
procedure TTopCond.SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TextForm.SetupForm(inText,'Условный сигнал',sX);
  if TextForm.ShowModal = mrOk then SetText(TextForm.eText.Text);
end;
//==============================================================================
constructor TTopBegin.Create(AOwner : TGraph; NewNum : integer);
begin
  inherited Create(AOwner, NewNum);
  Height := BeginTopHeight;
  Width := BeginTopWidth;
  Style := tsBegin;
  HaveLocalNum := false;
  InTies := TList.Create;
  StrRect.Left := trunc(BeginTopWidth/8);
  StrRect.Top := 1;
  StrRect.Right := trunc(BeginTopWidth*7/8);
  StrRect.Bottom := BeginTopHeight-1;
end;
//------------------------------------------------------------------------------
procedure TTopBegin.Paint;
begin
  with Canvas do
  begin
    Brush.Color := BackgroundColor;
    Pen.Color := OutColor;
    RoundRect(0,0,BeginTopWidth-1,BeginTopHeight,
              trunc(BeginTopWidth/RoundCoeff),BeginTopHeight);
    Font.Color := FontColor;
    TextRect(StrRect,StrPoint.X,StrPoint.Y,IntToStr(LocalNum)+') '+InText);
  end;
end;
//------------------------------------------------------------------------------
function TTopBegin.CanConnectTo(Style : TTopStyle): boolean;
begin
  Result := not(Style in [tsBegin,tsEnd]);
end;
//------------------------------------------------------------------------------
function TTopBegin.HaveNeedTies:boolean;
begin
  Result := false;
  if Tie <> nil then Result := true;
end;
//==============================================================================
constructor TTopEnd.Create(AOwner : TGraph; NewNum : integer);
begin
  inherited Create(AOwner, NewNum);
  Style := tsEnd;
  Height := EndTopHeight;
  Width := EndTopWidth;
  HaveLocalNum := false;
  InTies := TList.Create;
  StrRect.Left := trunc(EndTopWidth/8);
  StrRect.Top := 1;
  StrRect.Right := trunc(EndTopWidth*7/8);
  StrRect.Bottom := EndTopHeight-1;
end;
//------------------------------------------------------------------------------
procedure TTopEnd.Paint;
begin
  with Canvas do
  begin
    Brush.Color := BackgroundColor;
    Pen.Color := OutColor;
    RoundRect(0,0,EndTopWidth-1,EndTopHeight,
              trunc(EndTopWidth/RoundCoeff),EndTopHeight);
    Font.Color := FontColor;
    TextRect(StrRect,StrPoint.X,StrPoint.Y,IntToStr(LocalNum)+') '+InText);
  end;
end;
//------------------------------------------------------------------------------
function TTopEnd.CanConnectTo(Style : TTopStyle): boolean;
begin
  Result := false;
end;
//------------------------------------------------------------------------------
function TTopEnd.HaveNeedTies:boolean;
begin
  Result := false;
  if InTies.Count<>0 then Result := true;
end;
//==============================================================================
constructor TTopTemp.Create(AOwner : TGraph; NewNum : integer);
var
 Temp : integer;
begin
  inherited Create(AOwner, NewNum);
  Style := tsTemp;
  Height := TempTopHeight;
  Width := TempTopWidth;
  HaveLocalNum := false;
  InTies := TList.Create;
  Temp := round(Sqrt(Sqr(TempTopWidth/2)/2));
  StrRect.Left := 1 + round(TempTopWidth/2) - Temp;
  StrRect.Top := 1 + round(TempTopHeight/2) - Temp;
  StrRect.Right := round(TempTopWidth/2) + Temp - 1;
  StrRect.Bottom := round(TempTopHeight/2) + Temp - 1;
  SenterPoint.X := round(TempTopWidth/2);
  SenterPoint.Y := round(TempTopHeight/2);
  StrPoint.X := trunc(TempTopWidth/2);
  StrPoint.Y := trunc(TempTopHeight/2);
end;
//------------------------------------------------------------------------------
procedure TTopTemp.Paint;
begin
  with Canvas do
  begin
    Brush.Color := BackgroundColor;
    Pen.Color := OutColor;
    Ellipse(0,0,Width,Height);
    Brush.Color := BackgroundColor;
    Font.Color := FontColor;
    TextRect(StrRect,StrPoint.X,StrPoint.Y,InText);
  end;
end;
//------------------------------------------------------------------------------
function TTopTemp.CanConnectTo(Style : TTopStyle): boolean;
begin
  Result := Style <> tsTemp;
end;
//------------------------------------------------------------------------------
function TTopTemp.GetOutPoint: TPoint;
begin
  Result.X:=Left+Round(Width/2);
  Result.Y:=Top+Round(Height/2);
end;
//------------------------------------------------------------------------------
function TTopTemp.GetInPoint: TPoint;
begin
  Result.X:=Left+Round(Width/2);
  Result.Y:=Top+Round(Height/2);
end;
//------------------------------------------------------------------------------
function TTopTemp.HaveNeedTies:boolean;
begin
  Result := not( (inTies.Count=0) = (Tie=nil) );
end;
//------------------------------------------------------------------------------
procedure TTopTemp.SetTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TextForm.SetupForm(inText,'Номер перехода',sNum);
  if TextForm.ShowModal = mrOk then SetText(TextForm.eText.Text);
end;
//------------------------------------------------------------------------------
procedure TTopTemp.SetText(Value : string);
begin
  InText := Value;
  StrPoint.X := trunc((Width-Canvas.TextWidth(InText))/2);
  StrPoint.Y := trunc((Height-Canvas.TextHeight(InText))/2);
  repaint;
end;
//==============================================================================
procedure TGraph.CheckFillingTops;
var
  i: integer;
  CTop: TTop;
begin
  with Tops do
  begin
    for i:=0 to Count-1 do
    begin
      CTop := Items[i];
      if CTop.InText='' then raise EGraphCheckError.Create(EmptyTop, CTop.Num);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.CheckBorder;
var
  BeginCount: integer;
  EndCount: integer;
  i: integer;
  CTop: TTop;
begin
  BeginCount := 0;
  EndCount := 0;
  with Tops do for i:=0 to Count-1 do
  begin
    CTop := Items[i];
    case CTop.Style of
      tsBegin: inc(BeginCount);
      tsEnd: inc(EndCount);
    end;
  end;
  case EndCount of
    1: ;
    0: raise EGraphCheckError.Create(HaveNoEnd);
  else raise EGraphCheckError.Create(MoreThanOneEnd);
  end;
  case BeginCount of
    1: ;
    0: raise EGraphCheckError.Create(HaveNoBegin);
  else raise EGraphCheckError.Create(MoreThanOneBegin);
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.CheckTies;
var
  i: integer;
  CTop: TTop;
begin
  with Tops do for i:=0 to Count-1 do
  begin
    CTop := Items[i];
    if not(CTop.HaveNeedTies) then
      if (CTop.Style<>tsTemp) or ( (CTop.Tie=nil) and (CTop.InTies.Count=0) )
        then raise EGraphCheckError.Create(TopHaveNoTies, CTop.Num)
        else raise EGraphCheckError.Create(TopHaveToManyTies, CTop.Num);
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.CheckTemp;
var
  OutTbl: TOutTbl;               // Таблица выходов
  i,j: integer;
  CTop: TTop;
  InCount: integer;              // счетчик входов
  OutCount: integer;             // счетчик выходов
  FindIn: boolean;
begin
  SetLength(JumpTbl,0);
  SetLength(OutTbl,0);
  for i:=0 to Tops.Count-1 do   // Заполнить JumpTbl и OutTbl
  begin
    CTop := Tops.Items[i];
    if CTop.Style = tsTemp then
      if CTop.Tie<>nil then
      begin
        SetLength(OutTbl,Length(OutTbl)+1);
        OutTbl[Length(OutTbl)-1].Num := i;
        OutTbl[Length(OutTbl)-1].InText := CTop.InText;
      end
                  else
      begin
        SetLength(JumpTbl,Length(JumpTbl)+1);
        JumpTbl[Length(JumpTbl)-1].InTopNum := i;
        JumpTbl[Length(JumpTbl)-1].InText := CTop.InText;
        JumpTbl[Length(JumpTbl)-1].OutTopNum := -1;
      end;
  end;
  InCount := Length(JumpTbl);
  OutCount := Length(OutTbl);
  for i:=0 to OutCount - 1 do         // Дополнить JumpTbl данными о выходах
  begin
    FindIn := false;
    for j:=0 to InCount - 1 do
      if OutTbl[i].InText = JumpTbl[j].InText then
      begin
        CTop := Tops.Items[OutTbl[i].Num];
        if JumpTbl[j].OutTopNum <> -1 then
          raise EGraphCheckError.Create(AlreadyHaveThisNum,OutTbl[i].Num);
        JumpTbl[j].OutTopNum := CTop.Tie.ETNum;
        FindIn := true;
      end;
    if not FindIn then                // Если не найден соответствующий вход
    begin
      CTop := Tops.Items[OutTbl[i].Num];
      raise EGraphCheckError.Create(TempHaveNoIn, CTop.Num);
    end;
  end;
  for i:=0 to InCount-1 do if JumpTbl[i].OutTopNum = -1 then  // Если не найден соответствующий выход
  begin
    CTop := Tops.Items[JumpTbl[i].InTopNum];
    raise EGraphCheckError.Create(TempHaveNoOut, CTop.Num);
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.ConvertTableToArrays;
var
  i: integer;
begin
  with MainGraphForm do
  begin
    ClearArrays;
    AddTop_(0,0,0,'');
    for i:=2 to length(GraphTbl)-2 do
      if GraphTbl[i].JOne=-1
        then AddTop_(0,0,2,GraphTbl[i].InText)
        else AddTop_(0,0,3,GraphTbl[i].InText);
    AddTop_(0,0,1,'');
    for i:=1 to length(GraphTbl)-1 do
    begin
      if GraphTbl[i].JZero<>-1
        then SetTie_(i-1, GraphTbl[i].JZero-1, 'no');
      if GraphTbl[i].JOne<>-1
        then SetTie_(i-1, GraphTbl[i].JOne-1, 'yes');
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TGraph.CheckStructure;
begin
  CreateGraphTbl;
  ConvertTableToArrays;
  Testing_Input_Data;
end;
//------------------------------------------------------------------------------
procedure TGraph.CreateGraphTbl;
var
  i        : integer;
  CTop     : TTop;
  CondTop  : TTopCond;
  F        : TextFile;
begin
  SetLength(GraphTbl,LastLocalNum+2);
  for i:=0 to Tops.Count-1 do
  begin
    CTop := Tops.Items[i];
    if CTop.LocalNum >0 then GraphTbl[CTop.LocalNum].InText := CTop.InText;
    case CTop.Style of
      tsOper: with GraphTbl[CTop.LocalNum] do
      begin
        TopNum := i;
        JZero := GetLocalNum(PassTemp(CTop.Tie.ETNum));
        JOne := -1;
      end;
      tsCond:
      begin
        CondTop := Tops.Items[i];
        with GraphTbl[CondTop.LocalNum] do
        begin
          TopNum := i;
          JZero := GetLocalNum(PassTemp(CondTop.Ties[ttZero].ETNum));
          JOne := GetLocalNum(PassTemp(CondTop.Ties[ttOne].ETNum));
          if JZero = JOne then raise EGraphCheckError.Create(CondTiesInOneTop, i);
        end;
      end;
      tsBegin: with GraphTbl[1] do
      begin
        TopNum := i;
        JZero := GetLocalNum(PassTemp(CTop.Tie.ETNum));
        JOne := -1;
      end;
      tsEnd: with GraphTbl[LastLocalNum + 1] do
      begin
        TopNum := i;
        JZero := -1;
        JOne := -1;
      end;
      tsTemp: ;
    end;
  end;
  ///
  AssignFile(F,'Table.txt');
  Rewrite(F);
  for i:=0 to Length(GraphTbl)-1 do
    Writeln(F, GraphTbl[i].TopNum, '  ', GraphTbl[i].JZero, ' ', GraphTbl[i].jOne,  ' ');
  Close(F);
  ///
end;
//------------------------------------------------------------------------------
function TGraph.PassTemp(TopNum: integer): integer;
      // Возвращает тот же номер, если указанная вершина не является переходом,
      // иначе - номер вершины, на которую указывает переход
var
  i     : integer;
  CTop  : TTop;
begin
  Result := TopNum;
  CTop := Tops.Items[TopNum];
  if CTop.Style <> tsTemp then exit;
  for i:=0 to length(JumpTbl) do if JumpTbl[i].InTopNum = TopNum then
  begin
    Result := JumpTbl[i].OutTopNum;
    exit;
  end;
end;
//------------------------------------------------------------------------------
function TGraph.GetLocalNum(TopNum: integer): integer;
var
  CTop: TTop;
begin
  CTop := Tops.Items[TopNum];
  if CTop.Style = tsEnd
  then Result := LastLocalNum + 1
  else Result := CTop.LocalNum;
end;
//------------------------------------------------------------------------------
function TGraph.GetTopNum(LocalNum: integer): integer;
var
  CTop: TTop;
  i: integer;
begin
  Result := -1;
  for i:=0 to Tops.Count-1 do
  begin
    CTop := Tops.Items[i];
    if CTop.LocalNum = LocalNum then
    begin
      Result := i;
      exit;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TGraph.Check: boolean;
begin
  Result := false;
  UnSelectAll;
  try
    CheckFillingTops;   // Отсутствие пустых вершин
    CheckBorder;        // Наличие Н, К, и только по одной
    CheckTies;          // Наличие всех связей
    CheckTemp;          // Проверка соответствия переходов
    CheckStructure;     //
  except
    on EGCE: EGraphCheckError do
    begin
      if EGCE.ErrorTopNum = -1
        then SelectTop(GetTopNum(EGCE.LocalTopNum))
        else SelectTop(EGCE.TopNum);
      Application.MessageBox(PChar(EGCE.Message), Err, MB_OK + MB_ICONERROR);
      exit;
    end;
  end;
  Application.MessageBox(NoErrors, Mes, MB_OK + MB_ICONINFORMATION);
end;
//==============================================================================
constructor EGraphCheckError.Create(Msg: string; TopNum: integer; LocalTopNum: integer = -1);
begin
  inherited Create(Msg);
  ErrorTopNum := TopNum;
  ErrorTopLocalNum := LocalTopNum;
end;
//------------------------------------------------------------------------------
constructor EGraphCheckError.Create(Msg: string);
begin
  inherited Create(Msg);
  ErrorTopNum := -1;
end;
//==============================================================================
end.
