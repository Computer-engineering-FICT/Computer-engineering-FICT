unit MainUnit;
//==============================================================================
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Buttons, ElementUnit, GrafUnit,
  ErrorUnit, ToolWin, ComCtrls, Grids, MyTables, FunctionsUnit;

type
//==============================================================================
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Save1: TMenuItem;
    Load1: TMenuItem;
    Exit1: TMenuItem;
    Service1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    RBbegin: TRadioButton;
    RBend: TRadioButton;
    RBnext: TRadioButton;
    RBif: TRadioButton;
    PostButton: TBitBtn;
    DelButton: TBitBtn;
    Panel3: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    AddLinkButton: TBitBtn;
    DelLinkButton: TBitBtn;
    Panel4: TPanel;
    exitBtn: TBitBtn;
    testBtn: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label1: TLabel;
    Edit3: TEdit;
    Panel5: TPanel;
    Splitter1: TSplitter;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    SG1: TStringGrid;
    Splitter3: TSplitter;
    SG2: TStringGrid;
    SG3: TStringGrid;
    Splitter4: TSplitter;
    SG4: TStringGrid;
    Label3: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    razmMuraBtn: TButton;
    Panel7: TPanel;
    RadioGroup2: TRadioGroup;
    btnMuraS: TButton;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    RB4: TRadioButton;
    Label2: TLabel;
    Panel8: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    razmMiliBtn: TButton;
    Panel9: TPanel;
    RadioGroup3: TRadioGroup;
    btnMiliS: TButton;
    RB5: TRadioButton;
    RB6: TRadioButton;
    RB7: TRadioButton;
    RB8: TRadioButton;
    Memo2: TMemo;
    Panel10: TPanel;
    btnMiliF: TButton;
    btnMuraF: TButton;
    Panel11: TPanel;
    miliSchBtn: TButton;
    muraSchBtn: TButton;
    ScrollBox2: TScrollBox;
    Image2: TImage;
    Splitter2: TSplitter;
    procedure Exit1Click(Sender: TObject);
    procedure PostButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RBbeginClick(Sender: TObject);
    procedure RBendClick(Sender: TObject);
    procedure RBnextClick(Sender: TObject);
    procedure RBifClick(Sender: TObject);
    procedure AddLinkButtonClick(Sender: TObject);
    procedure Repaint;override;
    procedure BitBtn1Click(Sender: TObject);
    procedure CloseButClick(Sender: TObject);
    procedure DelLinkButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure razmMuraBtnClick(Sender: TObject);
    procedure razmMiliBtnClick(Sender: TObject);
    procedure btnMuraSClick(Sender: TObject);
    procedure btnMiliSClick(Sender: TObject);
    procedure btnMiliFClick(Sender: TObject);
    procedure btnMuraFClick(Sender: TObject);
    procedure miliSchBtnClick(Sender: TObject);
    procedure muraSchBtnClick(Sender: TObject);
  private
    procedure paintScheme(kind:byte);
    { Private declarations }
  public
    { Public declarations }
  end;
//==============================================================================
 Tgr = class(TComponent)
  public
   pps:TArrSVVElement;
   lls:TArr3ArrInt;
  end;
//==============================================================================
var
 MainForm: TMainForm;
 counter,lcounter:Integer;
 pointKind:Integer;
 Graf:TGraf;
 tables:TTables;
 gr:Tgr;
 wasBegin,wasEnd:Boolean;
 mistFlag:Boolean;
 svElem:TSVVElement;
 raz:tRazm;
 func:TFunctions;
 logPps:array of TLogPoint;
implementation
uses IfUnit, RezUnit;
{$R *.dfm}
//==============================================================================
procedure TMainForm.Exit1Click(Sender: TObject);
begin
 Close
end;
//==============================================================================
procedure TMainForm.PostButtonClick(Sender: TObject);
begin
 case pointKind of
  1:begin
     gr.pps[counter]:=TBeginPoint.Create(Self);
     wasBegin:=true;
     RBbegin.Enabled:=false;
     RBnext.Checked:=true
    end;
  2:gr.pps[counter]:=TOperPoint.Create(Self);
  3:gr.pps[counter]:=TIfPoint.Create(Self);
  4:begin
     gr.pps[counter]:=TEndPoint.Create(Self);
     wasEnd:=true;
     RBend.Enabled:=false;
     RBnext.Checked:=true
    end
 end;
 gr.pps[counter].FPanel.Parent:=ScrollBox1;
 gr.pps[counter].FPanel.Top:=10;
 gr.pps[counter].PointNum:=counter;
 inc(counter);
 SetLength(gr.pps,counter+1)
end;
//==============================================================================
procedure TMainForm.FormCreate(Sender: TObject);
var
 i:Integer;
begin
 svElem:=TSVVElement.Create(self);
 func:=TFunctions.Create;
 gr:=Tgr.Create(MainForm);
 tables:=TTables.Create;
 counter:=1;
 lcounter:=1;
 pointKind:=1;
 Graf:=TGraf.Create(0,0);
 mistFlag:=false;
 SetLength(gr.pps,2);
 for i:=1 to 2 do SetLength(gr.lls[i],1)
end;
//==============================================================================
procedure TMainForm.RBbeginClick(Sender: TObject);
begin
 pointKind:=1
end;
//==============================================================================
procedure TMainForm.RBendClick(Sender: TObject);
begin
 pointKind:=4
end;
//==============================================================================
procedure TMainForm.RBnextClick(Sender: TObject);
begin
 pointKind:=2
end;
//==============================================================================
procedure TMainForm.RBifClick(Sender: TObject);
begin
 pointKind:=3
end;
//==============================================================================
procedure TMainForm.AddLinkButtonClick(Sender: TObject);
var
 i,start,stop,col:Integer;
 startP,stopP:TSVVElement;
 drowStartX,drowStartY:Integer;
 errFlag:Boolean;
 fl1,fl2:Boolean;
begin
 Memo1.Lines.Clear;
 for i:=1 to 3 do SetLength(gr.lls[i],lcounter+1);
 start:=StrToInt(Edit1.Text);
 stop:=StrToInt(Edit2.Text);
 gr.lls[1,lcounter]:=start;
 gr.lls[2,lcounter]:=stop;
 gr.lls[3,lcounter]:=0;
 inc(lcounter);
 startP:=gr.pps[start];
 stopP:=gr.pps[stop];
 errFlag:=false;
 col:=0;
 fl1:=false;
 for i:=1 to lcounter-1 do if gr.lls[1,i]=start then inc(col);
 if ((col > 1)and((startP is TBeginPoint)or(startP is TOperPoint)))or
    ((col > 2)and(startP is TIfPoint)) then
  begin
   Memo1.Lines.Append('Попытка задать недопустимое количество');
   Memo1.Lines.Append('связей, исходящих из данной вершины');
   gr.lls[1,lcounter-1]:=0;
   gr.lls[2,lcounter-1]:=0;
   dec(lcounter);
   errFlag:=true
  end
 else
  if (startP is TBeginPoint)or(startP is TOperPoint)then
   begin
    drowStartX:=StartP.FPanel.Left+30;
    drowStartY:=StartP.FPanel.Top+65
   end
  else
   if startP is TEndPoint then
    begin
     Memo1.Lines.Append('Невозможно задать связь, исходящую из');
     Memo1.Lines.Append('вершины "конец" !');
     gr.lls[1,lcounter-1]:=0;
     gr.lls[2,lcounter-1]:=0;
     dec(lcounter);
     errFlag:=true
    end
   else
    begin
     IfForm.ShowModal;
     if IfForm.RadioButton1.Checked then
      begin
       startP.setWay(true);
       gr.lls[3,lcounter-1]:=startP.getLab2
      end;
     if IfForm.RadioButton2.Checked then
      begin
       startP.setWay(false);
       gr.lls[3,lcounter-1]:=startP.getLab1
      end
    end;
 if stopP is TBeginPoint then
  begin
   Memo1.Lines.Append('Невозможно задать связь, входящую в');
   Memo1.Lines.Append('вершину "начало" !');
   gr.lls[1,lcounter-1]:=0;
   gr.lls[2,lcounter-1]:=0;
   dec(lcounter);
   errFlag:=true
  end;
 if start=stop then
  begin
   Memo1.Lines.Append('Невозможно задать связь типа "петля",');
   Memo1.Lines.Append('тоесть связь, исходящую и входящую в');
   Memo1.Lines.Append('одну и ту же вершину ! ');
   gr.lls[1,lcounter-1]:=0;
   gr.lls[2,lcounter-1]:=0;
   dec(lcounter);
   errFlag:=true
  end;
 if not errFlag then Repaint
end;
//==============================================================================
procedure TMainForm.Repaint;
var
 i:Integer;
 drowStartX,drowStartY:Integer;
 drowStopX,drowStopY:Integer;
 startP,stopP:TSVVElement;
begin
 Image1.Canvas.Rectangle(Image1.Left,Image1.Top,Image1.Left+Image1.Width,
 Image1.Top+Image1.Height);
 if gr.pps[1]<>nil then
  for i:=0 to lcounter-1 do
   if (gr.lls[1,i]<>0)and(gr.lls[2,i]<>0) then
    if (gr.pps[gr.lls[1,i]]<>nil)and(gr.pps[gr.lls[2,i]]<>nil) then
     begin
      startP:=gr.pps[gr.lls[1,i]];
      stopP:=gr.pps[gr.lls[2,i]];
      if startP is TIfPoint then
       if ((startP.getLab2=1)and(gr.lls[3,i] = 1))or
          ((startP.getLab2=0)and(gr.lls[3,i] = 0))then
        begin
         drowStartX:=StartP.FPanel.Left+60;
         drowStartY:=StartP.FPanel.Top+30
        end
       else
        begin
         drowStartX:=StartP.FPanel.Left;
         drowStartY:=StartP.FPanel.Top+30
        end
      else
       begin
        drowStartX:=StartP.FPanel.Left+30;
        drowStartY:=StartP.FPanel.Top+65
       end;
      drowStopX:=StopP.FPanel.Left+30;
      drowStopY:=StopP.FPanel.Top;
      with MainForm.Image1.Canvas do
       begin
        MoveTo(drowStartX,drowStartY);
        if drowStopY > drowStartY then
         begin
          LineTo(StopP.FPanel.Left+30,drowStartY);
          LineTo(StopP.FPanel.Left+30,StopP.FPanel.Top)
         end
        else
         if drowStartX < drowStopX then
          begin
           LineTo(StopP.FPanel.Left-30,drowStartY);
           LineTo(StopP.FPanel.Left-30,StopP.FPanel.Top-30);
           LineTo(StopP.FPanel.Left+30,StopP.FPanel.Top-30);
           LineTo(StopP.FPanel.Left+30,StopP.FPanel.Top)
          end
         else
          begin
           LineTo(StopP.FPanel.Left+90,drowStartY);
           LineTo(StopP.FPanel.Left+90,StopP.FPanel.Top-30);
           LineTo(StopP.FPanel.Left+30,StopP.FPanel.Top-30);
           LineTo(StopP.FPanel.Left+30,StopP.FPanel.Top)
          end
       end
     end
end;
//==============================================================================
procedure TMainForm.BitBtn1Click(Sender: TObject);
var
 i,j,errCount:Integer;
 err,sst:string;
 fl:boolean;
 arr:TArrInt;
 matr:TArrArrInt;
begin
 Graf.addPoints(gr.pps);
 Graf.links:=gr.lls;
 Graf.ModifyLinksMatrix;
 fl:=false;
 mistFlag:=false;
 Memo1.Lines.Clear;
 errCount:=0;
 err:='';
 i:=Graf.isBeginEndThere;
 case i of
  1:begin
     err:='ОШИБКА - - >  Невозможно анализировать граф, так как отсутствует'+
                                                        ' вершина "Начало" !';
     fl:=true
    end;
  2:begin
     err:='ОШИБКА - - >  Невозможно анализировать граф, так как отсутствует'+
                                                        ' вершина "Конец" !';
     fl:=true
    end;
  3:begin
     err:='ОШИБКА - - >  Невозможно анализировать граф, так как отсутствует '+
                                                'вершины "Начало" и "Конец" !';
     fl:=true
    end;
 end;
 if fl then
  begin
   Memo1.Lines.Append(err);
   inc(errCount)
  end;
 err:='';
 if Graf.isPointsOK<>0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Невозможно анализировать граф, так как '+
        'введено неверное значение в вершине N'+IntToStr(Graf.getNumErr));
   case Graf.isPointsOK of
    1:err:='       Условная вершина должна начинаться с x(X)';
    2:err:='       Условная вершина должна после x(X) содержать номер';
    3:err:='       Операторная вершина должна начинаться с y(Y)';
    4:err:='       Операторная вершина не должна содержать Yy YY yY yy';
    5:err:='       Операторная вершина содержит недопустимый символ';
    6:err:='       Операторная вершина содержит непронумерованное состояние Y '
   end;
   Memo1.Lines.Append(err);
   inc(errCount);
   fl:=true
 end;
 if Graf.isIfOk <> 0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Из условной вершины N '
                        +IntToStr(Graf.isIfOk)+' должно выходить 2 связи');
   inc(errCount);
   fl:=true
  end;
 i:=Graf.isIfNO;
 if i <> 0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Связи, выходящие из условной вершины N '
                        +IntToStr(i)+' ведут в одну и ту же вершину');
   inc(errCount);
   fl:=true
  end;
 if Graf.isLinkBegEnd <> 0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Отсутствует связь "Конец" - "Начало"! '+
                        'Проверьте неразрывность графа');
   inc(errCount);
   fl:=true
  end;
 if not fl then
  begin
   arr:=Graf.getWay;
   err:='';
   for i:=1 to length(arr)-1 do err:=err+' '+IntToStr(arr[i]);
   Memo1.Lines.Append('Путь "Конец" - "Начало" - - >   '+err)
  end;
 j:=Graf.testLinkedEnd;
 if j <> 0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Отсутствует связь '+IntToStr(j)+
           ' -я вершина - "Конец" ! Проверьте неразрывность графа. Если граф '+
           'неразрывен - значит данная вершина входит в цикл из которого нет '+
           'выхода на любой из путей "Начало"-"Конец"');
   inc(errCount);
   fl:=true
  end;
 j:=Graf.testLinkedBegin;
 if j <> 0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Отсутствует связь "Начало" '+IntToStr(j)+
                                ' -я вершина ! Проверьте неразрывность графа');
   inc(errCount);
   fl:=true
  end;
 if not fl then
  begin
   Memo1.Lines.Append('Все пути - - > ');
   matr:=Graf.getWays;
   for i:=0 to length(matr)-1 do
    begin
     sst:='';
     for j:=0 to length(matr[i])-2 do sst:=sst+IntToStr(matr[i,j])+' - ';
     Memo1.Lines.Append(sst)
    end;
   Memo1.Lines.Append('')
  end;
 if not fl then
  begin
   Memo1.Lines.Append('Все циклы - - > ');
   matr:=Graf.getCycles;
   for i:=0 to length(matr)-1 do
    begin
     sst:='';
     for j:=0 to length(matr[i])-1 do sst:=sst+IntToStr(matr[i,j])+' - ';
     Memo1.Lines.Append(sst)
    end;
   Memo1.Lines.Append('')
  end;
 j:=Graf.testCyclesOnCorrect;
 if j <> 0 then
  begin
   Memo1.Lines.Append('ОШИБКА - - >  Цикл имеющий номер '+IntToStr(j)+
   ' в списке некорректен - внутри цикла отсутствует операторная вершина !');
   inc(errCount);
   fl:=true
  end;
 err:='';
 Memo1.Lines.Append('-----------  Проверка блок-схемы завершена  -----------');
 if fl then
  begin
   err:=' Было обнаружено  '+IntToStr(errCount)+'  ошибок ввода.';
   mistFlag:=true
  end
 else err:='Ошибок нет.';
 Memo1.Lines.Append(err)
end;
//==============================================================================
procedure TMainForm.CloseButClick(Sender: TObject);
begin
 Close
end;
//==============================================================================
procedure TMainForm.DelLinkButtonClick(Sender: TObject);
var
 start,stop,i,j:Integer;
 flag:Boolean;
begin
 start:=StrToInt(Edit1.Text);
 stop:=StrToInt(Edit2.Text);
 flag:=false;
 for i:=1 to lcounter do
  if (gr.lls[1,i]=start)and(gr.lls[2,i]=stop) then
   begin
    for j:=i to lcounter-1 do
     begin
      gr.lls[1,j]:=gr.lls[1,j+1];
      gr.lls[2,j]:=gr.lls[2,j+1]
     end;
    dec(lcounter);
    for j:=1 to 2 do SetLength(gr.lls[j],lcounter+1);
    flag:=true;
    break
   end;
 if not flag then MessageBox(handle,'Такой связи нет!',0,mb_ok);
 MainForm.Repaint
end;
//==============================================================================
procedure TMainForm.DelButtonClick(Sender: TObject);
var
 numPoint:Integer;
 i,j,k:Integer;
begin
 numPoint:=StrToInt(Edit3.Text);
 if gr.pps[numPoint] is TEndPoint then RBEnd.Enabled:=true;
 if gr.pps[numPoint] is TBeginPoint then RBBegin.Enabled:=true;
 for i:=1 to counter do
  if gr.pps[i].getNum=numPoint then
   begin
    gr.pps[numPoint].Destroy;
    for j:=i to counter-1 do gr.pps[j]:=gr.pps[j+1];
    break
   end;
 dec(counter);
 SetLength(gr.pps,counter+1);
 for i:=1 to counter-1 do
  if gr.pps[i].getNum > numPoint then gr.pps[i].setNum(gr.pps[i].getNum-1);
 i:=1;
 while i < 3 do
  begin
   j:=0;
   while j <> length(gr.lls[i]) do
    begin
     if gr.lls[i,j]=numPoint then
      begin
       for k:=j to lcounter-2 do
        begin
         gr.lls[1,k]:=gr.lls[1,k+1];
         gr.lls[2,k]:=gr.lls[2,k+1]
        end;
       gr.lls[1,lcounter-1]:=0;
       gr.lls[2,lcounter-1]:=0;
       dec(lcounter);
       dec(j);
       for k:=1 to 2 do SetLength(gr.lls[k],lcounter+1)
      end;
     inc(j)
    end;
   inc(i)
  end;
 for i:=1 to 2 do
  for j:=0 to length(gr.lls[i])-1 do
   if gr.lls[i,j] > numPoint then dec(gr.lls[i,j]);
 Repaint
end;
//==============================================================================
procedure TMainForm.Save1Click(Sender: TObject);
var
 stream:TStream;
 i:Integer;
begin
 if saveDialog1.Execute then
  begin
   stream:=TFileStream.Create(SaveDialog1.FileName,fmCreate);
   try
    for i:=1 to length(gr.pps)-2 do
     begin
      if gr.pps[i] is TBeginPoint then Stream.WriteComponent(TBeginPoint(gr.pps[i]));
      if gr.pps[i] is TEndPoint then Stream.WriteComponent(TEndPoint(gr.pps[i]));
      if gr.pps[i] is TOperPoint then Stream.WriteComponent(TOperPoint(gr.pps[i]));
      if gr.pps[i] is TIfPoint then Stream.WriteComponent(TIfPoint(gr.pps[i]))
     end
   finally
    Stream.Free
   end
  end
end;
//==============================================================================
procedure TMainForm.Load1Click(Sender: TObject);
var
 stream:TStream;
 i:Integer;
begin
 if OpenDialog1.Execute then
  begin
   gr.Free;
   gr:=tGr.Create(MainForm);
   stream:=TFileStream.Create(OpenDialog1.FileName,fmOpenRead);
   try
    i:=1;
    while stream.Size <> stream.Position do
     begin
      setLength(gr.pps,i+1);
      Stream.ReadComponent(svElem);
      if svElem.FEdit.Text='Начало' then
       begin
        gr.pps[i]:=TBeginPoint.Create(Self);
        wasBegin:=true;
        RBbegin.Enabled:=false;
        RBnext.Checked:=true
       end;
      if svElem.FEdit.Text='Конец' then
       begin
        gr.pps[i]:=TEndPoint.Create(Self);
        wasEnd:=true;
        RBend.Enabled:=false;
        RBnext.Checked:=true
       end;
      if svElem.FEdit.Text[1]='x' then gr.pps[i]:=TIfPoint.Create(Self);
      if svElem.FEdit.Text[1]='y' then gr.pps[i]:=TOperPoint.Create(Self);
      gr.pps[i].FEdit.Text:=svElem.FEdit.Text;
      gr.pps[i].FLabel.Caption:=svElem.FLabel.Caption;
      gr.pps[i].FPanel.Top:=svElem.FPanel.Top;
      gr.pps[i].FPanel.left:=svElem.FPanel.Left;
      gr.pps[i].FPanel.Parent:=ScrollBox1;
      gr.pps[i].FImage.Show;
      inc(i);
     end
   finally
    stream.Free
   end
  end
end;
//==============================================================================
procedure TMainForm.razmMuraBtnClick(Sender: TObject);
var
 i:Integer;
begin
 tables.putGraf(graf);
 tables.setKind(1);
 raz:=tables.razmGraf;
 SG1.ColCount:=length(raz[1])+1;
 SG1.Cells[0,0]:='N вершины';
 SG1.Cells[0,1]:='Сост.';
 SG1.Cells[0,2]:='КОД';
 for i:=0 to length(raz[1])-1 do
  begin
   SG1.Cells[i+1,0]:=raz[1,i];
   SG1.Cells[i+1,1]:=raz[2,i];
   SG1.Cells[i+1,2]:=raz[3,i]
  end
end;
//==============================================================================
procedure TMainForm.razmMiliBtnClick(Sender: TObject);
var
 i:Integer;
begin
 tables.putGraf(graf);
 tables.setKind(0);
 raz:=tables.razmGraf;
 SG3.ColCount:=length(raz[1])+1;
 SG3.Cells[0,0]:='N вершины';
 SG3.Cells[0,1]:='Сост.';
 SG3.Cells[0,2]:='КОД';
 for i:=0 to length(raz[1])-1 do
  begin
   SG3.Cells[i+1,0]:=raz[1,i];
   SG3.Cells[i+1,1]:=raz[2,i];
   SG3.Cells[i+1,2]:=raz[3,i]
  end
end;
//==============================================================================
procedure TMainForm.btnMuraSClick(Sender: TObject);
var
 rezPereh:tRezPereh;
 i,j:Integer;
begin
 tables.putGraf(graf);
 tables.setKind(1);
 if rb1.Checked then i:=0;
 if rb2.Checked then i:=1;
 if rb3.Checked then i:=2;
 if rb4.Checked then i:=3;
 rezPereh:=tables.getPerehTable(i);
 SG2.ColCount:=length(rezPereh[1]);
 SG2.RowCount:=length(rezPereh);
 for i:=0 to length(rezPereh)-1 do
  for j:=0 to length(rezPereh[i])-1 do
   SG2.Cells[j,i]:=rezPereh[i,j]
end;
//==============================================================================
procedure TMainForm.btnMiliSClick(Sender: TObject);
var
 rezPereh:tRezPereh;
 i,j:Integer;
begin
 tables.putGraf(graf);
 tables.setKind(0);
 if rb5.Checked then i:=0;
 if rb6.Checked then i:=1;
 if rb7.Checked then i:=2;
 if rb8.Checked then i:=3;
 rezPereh:=tables.getPerehTable(i);
 SG4.ColCount:=length(rezPereh[1]);
 SG4.RowCount:=length(rezPereh);
 for i:=0 to length(rezPereh)-1 do
  for j:=0 to length(rezPereh[i])-1 do
   SG4.Cells[j,i]:=rezPereh[i,j]
end;
//==============================================================================
procedure TMainForm.btnMiliFClick(Sender: TObject);
var
 tArr:frezType;
 i:Integer;
begin
 tables.putGraf(graf);
 tables.setKind(0);
 if rb5.Checked then i:=0;
 if rb6.Checked then i:=1;
 if rb7.Checked then i:=2;
 if rb8.Checked then i:=3;
 tables.getPerehTable(i);
 func.setTable(tables);
 tArr:=func.getResult;
 Memo2.Lines.Clear;
 Memo2.Lines.Append('----------------- Функции автомата Мили ----------------');
 for i:=0 to length(tArr)-1 do
  Memo2.Lines.Append(tArr[i])
end;
//==============================================================================
procedure TMainForm.btnMuraFClick(Sender: TObject);
var
 tArr:frezType;
 i:Integer;
begin
 tables.putGraf(graf);
 tables.setKind(1);
 if rb1.Checked then i:=0;
 if rb2.Checked then i:=1;
 if rb3.Checked then i:=2;
 if rb4.Checked then i:=3;
 tables.getPerehTable(i);
 func.setTable(tables);
 tArr:=func.getResult;
 Memo2.Lines.Clear;
 Memo2.Lines.Append('----------------- Функции автомата Мура ----------------');
 for i:=0 to length(tArr)-1 do
  Memo2.Lines.Append(tArr[i])
end;
//==============================================================================
procedure TMainForm.paintScheme(kind:Byte);
const
 top = 40;
 left = 100;
var
 i,startJ,j,k,xPos,yPos,yoldPos,tPos,inCol,orCol:Integer;
 pStr,pStp:Integer;
 tArr:frezType;
 ins,triggs:TStrArray;
 outs:String;
 fll:boolean;
 rezPereh:tRezPereh;
begin
 for i:=0 to length(logPps)-1 do
  begin
   logPps[i].FPanel.Destroy;
   logPps[i].Destroy
  end;
 setLength(logPps,0);
 tables.putGraf(graf);
 tables.setKind(kind);
 if kind = 0 then
  begin
   if rb5.Checked then i:=0;
   if rb6.Checked then i:=1;
   if rb7.Checked then i:=2;
   if rb8.Checked then i:=3
  end
 else
  begin
   if rb1.Checked then i:=0;
   if rb2.Checked then i:=1;
   if rb3.Checked then i:=2;
   if rb4.Checked then i:=3
  end;
 rezPereh:=tables.getPerehTable(i);
 func.setTable(tables);
 tArr:=func.getResult;
 xPos:=left;
 yPos:=top;
 yoldPos:=yPos;
 inCol:=0;
 for i:=0 to length(tArr)-1 do
  for j:=1 to length(tArr[i]) do inc(inCol);
 Image2.Align:=alNone;
 Image2.Height:=20*inCol;
 Image2.Canvas.Rectangle(Image2.Left,Image2.Top,Image2.Left+Image2.Width,
 Image2.Top+Image2.Height);
 inCol:=0;
 for i:=0 to length(tArr)-1 do
  begin
   j:=1;
   startJ:=j;
   while tArr[i][j]<>'=' do inc(j);
   outs:=copy(tArr[i],startJ,j-startJ);
   orCol:=0;
   fll:=false;
   inc(j,2);
   while true do
    begin
     startJ:=j;
     inCol:=1;
     SetLength(ins,0);
     pStr:=j+1;
     pStp:=j;
     if j >= length(tArr[i])then break;
     while tArr[i][j]<>')' do
      begin
       if tArr[i][j]='*' then
        begin
         pStp:=j-1;
         setLength(ins,length(ins)+1);
         ins[length(ins)-1]:=copy(tArr[i],pStr,pStp-pStr+1);
         pStr:=j+1;
         inc(inCol)
        end;
       inc(j)
      end;
     setLength(ins,length(ins)+1);
     ins[length(ins)-1]:=copy(tArr[i],pStr,j-pStr);
     inc(orCol);
     inc(j);
     setLength(logPps,length(logPps)+1);
     logPps[length(logPps)-1]:=TLogPoint.Create(inCol,xPos,yPos,'&&',ins,
                                                                TabSheet4);
     logPps[length(logPps)-1].FPanel.Parent:=ScrollBox2;
     for k:=0 to inCol-1 do
      with Image2.Canvas do
       begin
        moveTo(xPos,yPos+20*k+10);
        lineTo(left-20,yPos+20*k+10)
       end;
     if (fll)and(tArr[i][j]<>'v') then
      with Image2.Canvas do
       begin
        moveTo(xPos+65,yPos+10);
        lineTo(xPos+80,yPos+10)
       end;
     fll:=false;
     if tArr[i][j]='v' then
      with Image2.Canvas do
       begin
        moveTo(xPos+65,yPos+10);
        lineTo(xPos+80,yPos+10);
        fll:=true
       end;
     tPos:=yPos;
     yPos:=yPos+inCol*20+20;
     inc(j)
    end;
   if orCol > 1 then
    begin
     setLength(logPps,length(logPps)+1);
     logPps[length(logPps)-1]:=TLogPoint.Create(orCol,xPos+100,yoldPos,'1',ins,
                                                                TabSheet4);
     logPps[length(logPps)-1].FPanel.Parent:=ScrollBox2;
     with Image2.Canvas do
      begin
       moveTo(xPos+80,tPos+10);
       lineTo(xPos+80,yoldPos+10);
       lineTo(xPos+100,yoldPos+10);
       moveTo(xPos+165,yoldPos+10);
       lineTo(xPos+200,yoldPos+10);
       for k:=0 to orCol-1 do
        begin
         moveTo(xPos+100,yoldPos+20*k+10);
         lineTo(xPos+80,yoldPos+20*k+10)
        end;
       textOut(xPos+180,yoldPos-5,outs)
      end;
    end
   else
    with Image2.Canvas do
     begin
      moveTo(xPos+65,tPos+10);
      lineTo(xPos+200,tPos+10);
      textOut(xPos+180,tPos-5,outs)
     end;
   yoldPos:=yPos
  end;
 i:=tables.getFCol;
 pStr:=4+tables.getXCol;
 pStp:=pStr+i;
 with Image2.Canvas do
  begin
   moveTo(xPos+200,yPos+20*i);
   lineTo(xPos+200,top+10);
   moveTo(left-20,yPos+20*i);
   lineTo(left-20,top-20);
   for j:=pStr-4 downto 1 do
    begin
     moveTo(left-20,yPos+20*j);
     lineTo(left-70,yPos+20*j);
     textOut(left-40,yPos+20*j-15,rezPereh[0,pStr-j])
    end;
   for j:=i downto 1 do
    begin
     moveTo(xPos+200,yPos+20*j);
     lineTo(xPos+300,yPos+20*j);
     textOut(xPos+280,yPos+20*j-15,rezPereh[0,pStp-j])
    end;
  end;
 yPos:=top;
 xPos:=xPos+200;
 pStr:=pStp;
 while pStp < length(rezPereh[0]) do inc(pStp);
 i:=pStp-pStr;
 setLength(triggs,i);
 for j:=0 to i-1 do triggs[j]:=rezPereh[0,pStr+j];
 inCol:=1;
 if (rb5.Checked)or(rb6.Checked) then
  begin
   i:=round(i/2);
   inCol:=2
  end;
 startJ:=0;
 for j:=0 to i-1 do
  begin
   setLength(ins,0);
   setLength(ins,inCol);
   for startJ:=0 to inCol-1 do ins[startJ]:=triggs[j+startJ];
   setLength(logPps,length(logPps)+1);
   logPps[length(logPps)-1]:=TLogPoint.Create(inCol,xPos+50,yPos,'TT',ins,
                                                                TabSheet4);
   logPps[length(logPps)-1].FPanel.Parent:=ScrollBox2;
   for startJ:=0 to inCol-1 do
    with Image2.Canvas do
     begin
      moveTo(xPos,yPos+20*startJ+10);
      lineTo(xPos+50,yPos+20*startJ+10)
     end;
   with Image2.Canvas do
    begin
     moveTo(xPos+115,yPos+10);
     lineTo(xPos+165,yPos+10);
     textOut(xPos+145,yPos-5,'Q'+IntToStr(j+1))
    end;
   tPos:=yPos;
   yPos:=yPos+inCol*20+20
  end;
 with Image2.Canvas do
  begin
   moveTo(xPos+165,tPos+10);
   lineTo(xPos+165,top-20);
   lineTo(left-20,top-20)
  end
end;
//==============================================================================
procedure TMainForm.miliSchBtnClick(Sender: TObject);
begin
 paintScheme(0)
end;
//==============================================================================
procedure TMainForm.muraSchBtnClick(Sender: TObject);
begin
 paintScheme(1)
end;
//==============================================================================
end.
