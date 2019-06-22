unit Checking;

interface

uses
  StdCtrls,Types,Classes,Grids,GSA;

type
  TVector = array of Integer;
  TMatrix = array of array of Boolean;

var
  PCount : Integer;
  Matrix1,Matrix2 : TMatrix;
  Kinds : array of TElementKind;
  Idxs,IDs : TVector;
  SignalsIn,SignalsOut : TStringList;
  Ready1 : Integer;

procedure Checking1(AGSA : TGSA; var AProgresMemo,ASignalInMemo,ASignalOutMemo,AWaysMemo,ACycleMemo : TMemo; var AStringGrid1,AStringGrid2 : TStringGrid; var AErrorIdx : Integer);

implementation

uses
  GSADraw,SysUtils;

type
  TRectIn = record
  Rect_ : TRect;
  Beg : TPoint;
  end;

function Intersect1(ARect1,ARect2 : TRect) : Boolean;
begin
  with ARect1 do
  Result:= ((Left >= ARect2.Left) and (Left <= ARect2.Right) or
           (Right >= ARect2.Left) and (Right <= ARect2.Right) or
           (Left >= ARect2.Left) and (Right <= ARect2.Right) or
           (Left <= ARect2.Left) and (Right >= ARect2.Right))
           and
           ((Top >= ARect2.Top) and (Top <= ARect2.Bottom) or
           (Bottom >= ARect2.Top) and (Bottom <= ARect2.Bottom) or
           (Top >= ARect2.Top) and (Bottom <= ARect2.Bottom) or
           (Top <= ARect2.Top) and (Bottom >= ARect2.Bottom))
end;

function Intersect2(APoint1 : TPoint; ARect2 : TRect) : Boolean;
var
  Rect1 : TRect;
begin
  Rect1.TopLeft:= APoint1;
  Rect1.BottomRight:= APoint1;
  Result:= Intersect1(Rect1,ARect2);
end;

procedure GetLinksPoints(AElement : TElement; var APoint1,APoint2 : TPoint);
begin
  if AElement.Kind in [ekUpDown,ekLeftRight] then
  begin
    APoint1:= AElement.Rect_.TopLeft;
    APoint2:= AElement.Rect_.BottomRight;
  end
  else
  begin
    APoint1:= AElement.Rect_.BottomRight;
    APoint2:= AElement.Rect_.TopLeft;
  end;
end;

procedure Modify(ACount : Integer; AMatrix : TMatrix);
                                     ////////////ОПРЕДЕЛЕНИЕ ДОСТИЖИМОСТИ ВЕРШИН
var
  I,J,K : Integer;
begin
  for I:= 0 to ACount-1 do
    for J:= 0 to ACount-1 do
      if AMatrix[J,I] then
        for K:= 0 to ACount-1 do
          if AMatrix[I,K] then AMatrix[J,K]:= True;
end;

procedure Mess(AMemo : TMemo; const S : String);
begin
  AMemo.Lines.Add(S);
end;

function Ways(AProgresMemo,AWaysMemo,ACycleMemo : TMemo; ACountPeaks : Integer; APeak1ToPeak,APeak2ToPeak : TMatrix; ABeginIdx,AEndIdx : Integer; APeaksID : array of Integer; APeaksKind : array of TElementKind) : Boolean;
                                     ////////////НАХОЖДЕНИЕ ПУТЕЙ ИЗ НАЧАЛЬНОЙ ВЕРШИНЫ В КОНЕЧНУЮ
                                    /////////////ПРОВЕРКА ЦИКЛОВ
var
  I,J : Integer;
  //--
  Left,Right,Path : array of Integer;
  Been : array of Boolean;
  //--
  S : String;
  //Рекурсивный обход
  procedure Walk(AIdx,ALevel : Integer);
  var
    I : Integer;
    Flag1,Flag2 : Boolean;
  begin
    S:= '';
    Path[ALevel]:= AIdx;
    if AIdx = AEndIdx then
    begin
      for I:= 0 to ALevel do S:= S+IntToStr(APeaksID[Path[I]])+' ';
      Mess(AWaysMemo,S);
    end
    else
    begin
      if not Been[AIdx] then
      begin
        Been[AIdx]:= True;
        Walk(Left[AIdx],ALevel+1);
        if Left[AIdx] <> Right[AIdx] then Walk(Right[AIdx],ALevel+1);
        Been[AIdx]:= False;
      end
      else
      begin
        Flag1:= False;
        Flag2:= False;
        for I:= 0 to ALevel do
          if (S <> '') xor (Path[I] = AIdx) then
          begin
            Flag1:= Flag1 or (APeaksKind[Path[I]] in CONDITIONS);
            Flag2:= Flag2 or (APeaksKind[Path[I]] = ekOperation);
            S:= S+IntToStr(APeaksID[Path[I]])+' ';
          end;
        if not (Flag1 and Flag2) then
        begin
          S:= '# '+S;
          Mess(AProgresMemo,'Ошибка : некоректный цикл');
          Result:= False;
        end;
        Mess(ACycleMemo,S);
      end;
    end;
  end;
begin
  Result:= True;
  //Составление вектора разветвления
  SetLength(Left,ACountPeaks);
  SetLength(Right,ACountPeaks);
  //--
  for I:= 0 to ACountPeaks-1 do
  begin
    for J:= 0 to ACountPeaks-1 do
      if APeak1ToPeak[I,J] then Left[I]:= J;
    for J:= 0 to ACountPeaks-1 do
      if APeak2ToPeak[I,J] then Right[I]:= J;
  end;
  //Cоставления вектора вершин пути
  SetLength(Path,ACountPeaks);
  //--
  for I:= 0 to ACountPeaks-1 do
    Path[I]:= 0;
  //Составления вектора пребывания в вершины
  SetLength(Been,ACountPeaks);
  //--
  for I:= 0 to ACountPeaks-1 do Been[I]:= False;
  //Использую рекурсивный алгоритм начинаем ходить по графу
  Walk(ABeginIdx,0);
end;

procedure Checking1(AGSA : TGSA; var AProgresMemo,ASignalInMemo,ASignalOutMemo,AWaysMemo,ACycleMemo : TMemo; var AStringGrid1,AStringGrid2 : TStringGrid; var AErrorIdx : Integer);
var
  Element : TElement;
  ElementIdx : Integer;
  //--
  I,J,K,I1,J1 : Integer;
  //--
  Count,CountBegin,CountEnd,CountPeaks,CountLinks : Integer;
  //--
  LinksIdx,PeaksIdx : array of Integer;
  LinksKind,PeaksKind : array of TElementKind;
  PeaksID : array of Integer;
  //--
  BeginIdx,EndIdx : Integer;
  //--
  Rect_ : TRect;
  Point1,Point2 : TPoint;
  //--
  Ins : array of TRectIn;
  Outs1,Outs2 : array of TPoint;
  //--
  LinkToLink,Peak1ToLink,Peak2ToLink,LinkToPeak,Peak1ToPeak,Peak2ToPeak,AbsPeakToPeak : TMatrix;
  //--
  SemPeak,SemLink,Flag1,Flag2 : Boolean;
  //--
  S1,S2 : String;
  //--
  SigIn,SigOut : TStringList;
begin
  Ready1:= -1;
  AProgresMemo.Lines.Clear;
  ASignalInMemo.Lines.Clear;
  ASignalOutMemo.Lines.Clear;
  AWaysMemo.Lines.Clear;
  ACycleMemo.Lines.Clear;
  AErrorIdx:= NO;
  Count:= AGSA.ElementsCount;

  ///////////////////ПОДСЧЕТ ВЕРШИН КОЛИЧЕСТВА ВЕРШИН И СВЯЗЕЙ
  CountPeaks:= 0;
  for ElementIdx:= 0 to Count-1 do
  begin
    Element:= AGSA.GetElement(ElementIdx);
    if Element.Kind in PEAKS then Inc(CountPeaks);
  end;
  CountLinks:= Count-CountPeaks;
  Mess(AProgresMemo,'Количество элементов : '+IntToStr(Count));
  Mess(AProgresMemo,'Количество вершин : '+IntToStr(CountPeaks));

  //////////////////Создание индексных массивов
  SetLength(LinksIdx,CountLinks);
  SetLength(LinksKind,CountLinks);
  SetLength(PeaksIdx,CountPeaks);
  SetLength(PeaksKind,CountPeaks);
  SetLength(PeaksID,CountPeaks);
  //--
  I1:= 0;
  J1:= 0;
  for ElementIdx:= 0 to Count-1 do
  begin
    Element:= AGSA.GetElement(ElementIdx);
    if Element.Kind in PEAKS then
    begin
      PeaksIdx[I1]:= ElementIdx;
      PeaksKind[I1]:= Element.Kind;
      PeaksID[I1]:= Element.ID;
      if Element.Kind = ekBegin then BeginIdx:= I1;
      if Element.Kind = ekEnd then EndIdx:= I1;
      Inc(I1);
    end
    else
    begin
      LinksIdx[J1]:= ElementIdx;
      LinksKind[J1]:= Element.Kind;
      Inc(J1);
    end;
  end;

  //////////////////ПРОВЕРКА КОЛИЧЕСТВА НАЧАЛЬНЫХ И КОНЕЧНЫХ ВЕРШИН
  CountBegin:= 0;
  CountEnd:= 0;
  for I:= 0 to CountPeaks-1 do
  begin
    if PeaksKind[I] = ekBegin then
    begin
      Inc(CountBegin);
      BeginIdx:= I;
      if CountBegin > 1 then Mess(AProgresMemo,'Ошибка : Лишняя начальная вершина : '+IntToStr(PeaksID[I]))
    end;
    if PeaksKind[I] = ekEnd then
    begin
      Inc(CountEnd);
      EndIdx:= I;
      if CountEnd > 1 then Mess(AProgresMemo,'Ошибка : Лишняя конечная вершина : '+IntToStr(PeaksID[I]))
    end;
  end;
  if CountBegin = 0 then Mess(AProgresMemo,'Ошибка : Нет начальной вершины');
  if CountEnd = 0 then Mess(AProgresMemo,'Ошибка : Нет конечной вершины');
  if (CountBegin <> 1) or (CountEnd <> 1) then Exit;

  //////////////////Cоставление массивов точек входов и выходов
  SetLength(Ins,Count);
  SetLength(Outs1,Count);
  SetLength(Outs2,Count);
  //--
  for I:= 0 to CountPeaks-1 do
  begin
    ElementIdx:= PeaksIdx[I];
    Element:= AGSA.GetElement(ElementIdx);
    Rect_.Left:= Element.Rect_.Left+IN_X[Element.Kind];
    Rect_.Top:= Element.Rect_.Top+IN_Y[Element.Kind];
    Rect_.BottomRight:= Rect_.TopLeft;
    Ins[ElementIdx].Rect_:= Rect_;
    Ins[ElementIdx].Beg:= Rect_.TopLeft;
    Point1.X:= Element.Rect_.Left+OUT1_X[Element.Kind];
    Point1.Y:= Element.Rect_.Top+OUT1_Y[Element.Kind];
    Point2.X:= Element.Rect_.Left+OUT2_X[Element.Kind];
    Point2.Y:= Element.Rect_.Top+OUT2_Y[Element.Kind];
    Outs1[ElementIdx]:= Point1;
    Outs2[ElementIdx]:= Point2;
  end;
  for I:= 0 to CountLinks-1 do
  begin
    ElementIdx:= LinksIdx[I];
    Element:= AGSA.GetElement(ElementIdx);
    Rect_:= Element.Rect_;
    case Element.Kind of
    ekUpDown : Dec(Rect_.Bottom);
    ekDownUp : Inc(Rect_.Top);
    ekLeftRight : Dec(Rect_.Right);
    ekRightLeft : Inc(Rect_.Left);
    end;
    GetLinksPoints(Element,Point1,Point2);
    Ins[ElementIdx].Rect_:= Rect_;
    Ins[ElementIdx].Beg:= Point1;
    Outs1[ElementIdx]:= Point2;
    Outs2[ElementIdx]:= Point2;
  end;

  /////////////////ПРОВЕРКА КОЛЛИЗИЙ ВХОДОВ
  //Bход совпадает со одним из входов другого элемента
  //Например
  // --------------------->   или -------------------->
  //          |                           |
  //          |                     --------------
  //          |                     |            |
  //          V                     --------------
  //
  //НО НЕ
  //          |
  //          |
  //---------------------->
  //          |
  //          V
  for I:= 0 to Count-1 do
    for J:= 0 to Count-1 do
      if (I <> J) and InterSect2(Ins[I].Beg,Ins[J].Rect_) then
      begin
        AErrorIdx:= I;
        Mess(AProgresMemo,'Ошибка : неопределенное соединение...');
        Exit;
      end;

   //////////////////Составление матриц связанности

  //Создание массива связности между элементами связи
  SetLength(LinkToLink,CountLinks);
  for I:= 0 to CountLinks-1 do SetLength(LinkToLink[I],CountLinks);
  //--
  for I:= 0 to CountLinks-1 do
    for J:= 0 to CountLinks-1 do
    begin
      Point1:= Outs1[LinksIdx[I]];
      Rect_:= Ins[LinksIdx[J]].Rect_;
      LinkToLink[I,J]:= Intersect2(Point1,Rect_);
    end;

  //Создание массива связности между вершинами
  SetLength(Peak1ToPeak,CountPeaks);
  SetLength(Peak2ToPeak,CountPeaks);
  for I:= 0 to CountPeaks-1 do
  begin
    SetLength(Peak1ToPeak[I],CountPeaks);
    SetLength(Peak2ToPeak[I],CountPeaks);
  end;
  //--
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountPeaks-1 do
    begin
      Point1:= Outs1[PeaksIdx[I]];
      Point2:= Outs2[PeaksIdx[I]];
      Rect_:= Ins[PeaksIdx[J]].Rect_;
      Peak1ToPeak[I,J]:= Intersect2(Point1,Rect_);
      Peak2ToPeak[I,J]:= Intersect2(Point2,Rect_);
    end;

  //Создание массива связности между вершинами и элементами связи
  SetLength(Peak1ToLink,CountPeaks);
  SetLength(Peak2ToLink,CountPeaks);
  for I:= 0 to CountPeaks-1 do
  begin
    SetLength(Peak1ToLink[I],CountLinks);
    SetLength(Peak2ToLink[I],CountLinks);
  end;
  //--
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountLinks-1 do
    begin
      Point1:= Outs1[PeaksIdx[I]];
      Point2:= Outs2[PeaksIdx[I]];
      Rect_:= Ins[LinksIdx[J]].Rect_;
      Peak1ToLink[I,J]:= Intersect2(Point1,Rect_);
      Peak2ToLink[I,J]:= Intersect2(Point2,Rect_);
    end;

  //Создание массива связности между элементами связи и вершинами
  SetLength(LinkToPeak,CountLinks);
  for I:= 0 to CountLinks-1 do SetLength(LinkToPeak[I],CountPeaks);
  //--
  for I:= 0 to CountLinks-1 do
    for J:= 0 to CountPeaks-1 do
    begin
      Point1:= Outs1[LinksIdx[I]];
      Rect_:= Ins[PeaksIdx[J]].Rect_;
      LinkToPeak[I,J]:= Intersect2(Point1,Rect_);
    end;

  ///////////////////ПРОВЕРКА НА ВИСЯЩИЕ
  //Проверка массива связности на висящие связи
  for I:= 0 to CountLinks-1 do
  begin
    Flag1:= False;
    for J:= 0 to CountLinks-1 do Flag1:= Flag1 or LinkToLink[I,J];
    for J:= 0 to CountPeaks-1 do Flag1:= Flag1 or LinkToPeak[I,J];
    if (not Flag1) then
    begin
      Mess(AProgresMemo,'Ошибка : связь неподключена ни к одному входу...');
      AErrorIdx:= LinksIdx[I];
      Exit;
    end;
  end;
  for J:= 0 to CountLinks-1 do
  begin
    Flag1:= False;
    for I:= 0 to CountLinks-1 do Flag1:= Flag1 or LinkToLink[I,J];
    for I:= 0 to CountPeaks-1 do Flag1:= Flag1 or Peak1ToLink[I,J] or Peak2ToLink[I,J];
    if (not Flag1) then
    begin
      Mess(AProgresMemo,'Ошибка : связь неподключена ни к одному выходу...');
      AErrorIdx:= LinksIdx[J];
      Exit;
    end;
  end;

  //Проверка массива связности на висящие вершины
  SemPeak:= False;
  for J:= 0 to CountPeaks-1 do
    if PeaksKind[J] <> ekBegin then
    begin
      Flag1:= False;
      for I:= 0 to CountLinks-1 do Flag1:= Flag1 or LinkToPeak[I,J];
      for I:= 0 to CountPeaks-1 do Flag1:= Flag1 or Peak1ToPeak[I,J] or Peak2ToPeak[I,J];
      if not Flag1 then
      begin
        Mess(AProgresMemo,'Ошибка : вершина '+IntToStr(PeaksID[J])+' не связана по входу ни с одной вершиной');
        SemPeak:= True;
      end;
    end;

  for I:= 0 to CountPeaks-1 do
  begin
    Flag1:= False;
    Flag2:= False;
    for J:= 0 to CountLinks-1 do
    begin
      Flag1:= Flag1 or Peak1ToLink[I,J];
      Flag2:= Flag2 or Peak2ToLink[I,J];
    end;
    for J:= 0 to CountPeaks-1 do
    begin
      Flag1:= Flag1 or Peak1ToPeak[I,J];
      Flag2:= Flag2 or Peak2ToPeak[I,J];
    end;
    if (not Flag1) and (PeaksKind[I] <> ekEnd) then
    begin
      Mess(AProgresMemo,'Ошибка : вершина '+IntToStr(PeaksID[I])+' не связана по положительному выходу ни с одной вершиной');
      SemPeak:= True;
    end;
    if (not Flag2) and (PeaksKind[I] in CONDITIONS) then
    begin
      Mess(AProgresMemo,'Ошибка : вершина '+IntToStr(PeaksID[I])+' не связана по отрицательному выходу ни с одной вершиной');
      SemPeak:= True;
    end;
  end;
  if SemPeak then Exit;

  //////////////////ПРОВЕРКА СИГНАЛОВ
  //Создание списков сигналов
  SigIn:= TStringList.Create;
  SigOut:= TStringList.Create;
  SigIn.Capacity:= CountPeaks;
  SigOut.Capacity:= CountPeaks;
  SemPeak:= False;
  //--
  for I:= 0 to CountPeaks-1 do
  begin
    ElementIdx:= PeaksIdx[I];
    Element:= AGSA.GetElement(ElementIdx);
    if (Element.Text = '') then
    begin
      Mess(AProgresMemo,'Ошибка : для вершины '+IntToStr(Element.ID)+' не задан сигнал');
      SemPeak:= True;
    end;
    case Element.Kind of
    ekCondition0..ekCondition5 :
       if SigIn.IndexOf(Element.Text) = -1 then SigIn.Add(Element.Text);
    ekOperation :
       if SigOut.IndexOf(Element.Text) = -1 then SigOut.Add(Element.Text);
    end;
  end;
  if SemPeak then
  begin
    SigIn.Destroy;
    SigOut.Destroy;
    Exit;
  end;

  //Вывод сигналов и списков вершин
  SigIn.Sort;
  SigOut.Sort;
  for I:= 0 to SigIn.Count-1 do
  begin
    S1:= SigIn.Strings[I];
    S2:= S1+' (';
    for J:= 0 to CountPeaks-1 do
    begin
      ElementIdx:= PeaksIdx[J];
      Element:= AGSA.GetElement(ElementIdx);
      if (Element.Text = S1) and (Element.Kind in Conditions) then S2:= S2+IntToStr(Element.ID)+',';
    end;
    Delete(S2,Length(S2),1);
    S2:= S2+')';
    Mess(ASignalInMemo,S2);
  end;
  for I:= 0 to SigOut.Count-1 do
  begin
    S1:= SigOut.Strings[I];
    S2:= S1+' (';
    for J:= 0 to CountPeaks-1 do
    begin
      ElementIdx:= PeaksIdx[J];
      Element:= AGSA.GetElement(ElementIdx);
      if (Element.Text = S1) and (Element.Kind = ekOperation) then S2:= S2+IntToStr(Element.ID)+',';
    end;
    Delete(S2,Length(S2),1);
    S2:= S2+')';
    Mess(ASignalOutMemo,S2);
  end;

  SemPeak:= False;
  for I:= 0 to SigIn.Count-1 do
  begin
    S1:= SigIn.Strings[I];
    if SigOut.IndexOf(S1) <> -1 then
    begin
      Mess(AProgresMemo,'Ошибка : сигнал '+S1+' используется как входной и выходной');
      SemPeak:= True;
    end;
  end;
  if SemPeak then
  begin
    SigIn.Destroy;
    SigOut.Destroy;
    Exit;
  end;

  ///////////Создание массивов связанности
  //Определение связности элементов связи
  Modify(CountLinks,LinkToLink);
  //Дополняем матрицу связности вершина-связь
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountLinks-1 do
    begin
      if Peak1ToLink[I,J] then
        for K:= 0 to CountLinks-1 do
          if LinkToLink[J,K] then Peak1ToLink[I,K]:= True;
      if Peak2ToLink[I,J] then
        for K:= 0 to CountLinks-1 do
          if LinkToLink[J,K] then Peak2ToLink[I,K]:= True;
    end;
  //Дополняем матрицу связности связь-вершина
  for I:= 0 to CountLinks-1 do
    for J:= 0 to CountPeaks-1 do
      if LinkToPeak[I,J] then
        for K:= 0 to CountLinks-1 do
          if LinkToLink[K,I] then LinkToPeak[K,J]:= True;
  //Дополняем матрицу связности вершина-вершина
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountPeaks-1 do
    begin
      if not Peak1ToPeak[I,J] then
        for K:= 0 to CountLinks-1 do
          if Peak1ToLink[I,K] and LinkToPeak[K,J] then Peak1ToPeak[I,J]:= True;
      if not Peak2ToPeak[I,J] then
        for K:= 0 to CountLinks-1 do
          if Peak2ToLink[I,K] and LinkToPeak[K,J] then Peak2ToPeak[I,J]:= True;
    end;

  ////////////////////Вывод матрицы связанности
  AStringGrid1.ColCount:= CountPeaks+1;
  AStringGrid1.RowCount:= CountPeaks+1;
  AStringGrid2.ColCount:= CountPeaks+1;
  AStringGrid2.RowCount:= CountPeaks+1;
  for I:= 1 to PCount do
  begin
    S1:= IntToStr(PeaksId[I-1]);
    AStringGrid1.Cells[0,I]:= S1;
    AStringGrid2.Cells[0,I]:= S1;
    AStringGrid1.Cells[I,0]:= S1;
    AStringGrid2.Cells[I,0]:= S1;
  end;
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountPeaks-1 do
    begin
      if Peak1ToPeak[I,J] then AStringGrid1.Cells[J+1,I+1]:= '1'
      else AStringGrid1.Cells[J+1,I+1]:= '0';
      if Peak1ToPeak[I,J] then AStringGrid2.Cells[J+1,I+1]:= '1'
      else AStringGrid2.Cells[J+1,I+1]:= '0';
    end;
  Ready1:= 0;


  ///////////////ПРОВЕРКА ГРАФА НА СВЯЗНОСТЬ

  SetLength(AbsPeakToPeak,CountPeaks);
  for I:= 0 to CountPeaks-1 do SetLength(AbsPeakToPeak[I],CountPeaks);
  //
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountPeaks-1 do AbsPeakToPeak[I,J]:= Peak1ToPeak[I,J] or Peak2ToPeak[I,J];
  Modify(CountPeaks,AbsPeakToPeak);
  Flag1:= True;
  Flag2:= True;
  for I:= 0 to CountPeaks-1 do
  begin
    if (BeginIdx <> I) and (AbsPeakToPeak[BeginIdx,I] = False) then
    begin
      Flag1:= False;
      Mess(AProgresMemo,'Ошибка : у вершины '+IntToStr(PeaksID[I])+' нет связи с начальной вершиной');
    end;
    if (EndIdx <> I) and (AbsPeakToPeak[I,EndIdx] = False) then
    begin
      Flag2:= False;
      Mess(AProgresMemo,'Ошибка : у вершины '+IntToStr(PeaksID[I])+' нет связи с конечной вершиной');
    end;
  end;
  if (not Flag1) or (not Flag2) then
  begin
    SigIn.Destroy;
    SigOut.Destroy;
    Exit;
  end;

                                     ////////////НАХОЖДЕНИЕ ПУТЕЙ ИЗ НАЧАЛЬНОЙ ВЕРШИНЫ В КОНЕЧНУЮ
                                    /////////////ПРОВЕРКА ЦИКЛОВ
  if not Ways(AProgresMemo,AWaysMemo,ACycleMemo,CountPeaks,Peak1ToPeak,Peak2ToPeak,BeginIdx,EndIdx,PeaksID,PeaksKind) then
  begin
    SigIn.Destroy;
    SigOut.Destroy;
    Exit;
  end;

  /////////////////////СОХРАНЕНИЕ РЕЗУЛЬТАТОВ

  //Сохранение матриц перехода,info вершин
  SetLength(Matrix1,CountPeaks);
  SetLength(Matrix2,CountPeaks);
  for I:= 0 to CountPeaks-1 do
  begin
    SetLength(Matrix1[I],CountPeaks);
    SetLength(Matrix2[I],CountPeaks);
  end;
  SetLength(Idxs,CountPeaks);
  SetLength(Ids,CountPeaks);
  SetLength(Kinds,CountPeaks);
  //--
  PCount:= CountPeaks;
  for I:= 0 to CountPeaks-1 do
    for J:= 0 to CountPeaks-1 do
    begin
      Matrix1[I,J]:= Peak1ToPeak[I,J];
      Matrix2[I,J]:= Peak2ToPeak[I,J];
    end;
  for I:= 0 to CountPeaks-1 do
  begin
    Idxs[I]:= PeaksIdx[I];
    IDs[I]:= PeaksID[I];
    Kinds[I]:= PeaksKind[I];
  end;

  //Сохранение матриц сигналов
  SignalsIn.Clear;
  SignalsOut.Clear;
  SignalsIn.Capacity:= SigIn.Count;
  SignalsOut.Capacity:= SigOut.Count;
  for I:= 0 to SigIn.Count-1 do
    SignalsIn.Add(SigIn.Strings[I]);
  for I:= 0 to SigOut.Count-1 do
    SignalsOut.Add(SigOut.Strings[I]);
  SigIn.Destroy;
  SigOut.Destroy;

  Ready1:= 1;
end;

begin
  Ready1:= -1;
  SignalsIn:= TStringList.Create;
  SignalsOut:= TStringList.Create;
end.
