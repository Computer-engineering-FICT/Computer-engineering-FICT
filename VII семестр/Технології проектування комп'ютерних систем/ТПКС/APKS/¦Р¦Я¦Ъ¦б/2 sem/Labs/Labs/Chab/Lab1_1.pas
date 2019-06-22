unit Lab1_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, ComCtrls, ImgList, Math;

type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    AddItem1: TMenuItem;
    NBegin: TMenuItem;
    NEnd: TMenuItem;
    NOper: TMenuItem;
    NCond: TMenuItem;
    N: TMenuItem;
    NLink: TMenuItem;
    Popup: TPopupMenu;
    NPBegin: TMenuItem;
    NPEnd: TMenuItem;
    NPOper: TMenuItem;
    NPCond: TMenuItem;
    N5: TMenuItem;
    NPLink: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Files: TMenuItem;
    NOpen: TMenuItem;
    NSaveAs: TMenuItem;
    NNew: TMenuItem;
    ImageList1: TImageList;
    Nexit: TMenuItem;
    NSave: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    NTable: TMenuItem;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure CrOperation(Sender: TObject);
    procedure CrCondition(Sender: TObject);
    procedure CrBegin(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CrEnd(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure NSaveAsClick(Sender: TObject);
    procedure NOpenClick(Sender: TObject);
    procedure NNewClick(Sender: TObject);
    procedure NLinkClick(Sender: TObject);
    procedure NPLinkClick(Sender: TObject);
    procedure NSaveClick(Sender: TObject);
    procedure NexitClick(Sender: TObject);
    procedure NTableClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TTipe = (beg, ends, oper, cond);
  TNode =^PNode;
  TMatr = array of array of integer;
  PNode = record
          tipe : TTipe;
          shapen : TShape;
          signals : TLabel;
          marker : TLabel;
          Yes : TNode;
          No : TNode;
          next:TNode;
          DostUp:boolean;
          DostDown:boolean;
          end;

var
  Form1: TForm1;
  CX,CY:integer;
  signal:string[5];
  Chang:Boolean;
  //D=No,E=Yes -> for connection
  //B ->pointer on the end of List
  //P ->pointer on the begin of List
  //C ->pointer on which Node you connecting
  //R ->pointer on which Node you DragAndDrop
  Node,P,R,B,E,C,D:TNode;
  no:integer;
  Connect:TMatr;StringF:string;
  table:array[0..7]of PChar = ('000','001','010','011','100','101','110','111');
   procedure Cr_Operation;
   procedure Cr_Begin;
   procedure Cr_End;
   procedure Cr_Condition;
   procedure Recurs(TMP:TNode);
   procedure SavetoMatr;
   procedure SaveFile;
   procedure LoadFile;
   procedure draw_lines;
   procedure draw_line;
   procedure Cr_Mura;
   procedure Cr_Mili;
   procedure New_File;
implementation

uses Editor, edit1form;

{$R *.DFM}

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 CX:=x;
 CY:=y;
end;
{-----------------}
 procedure TForm1.CrOperation(Sender: TObject);
 begin
 Cr_Operation;
 end;
{-----------------}
 procedure Cr_Operation;
 var x1,y1,x2,y2:integer;
 begin
 If ((Cx<(Form1.Left+40))or(Cx>(Form1.Left+Form1.ClientWidth-40))or
    (Cy<(Form1.Top+40))or(Cy>(Form1.Top+Form1.ClientHeight-40)))then
     exit;
        New(Node);
        B^.next:=Node;
        Node^.Yes:=nil;
        Node^.No:=nil;
        Node^.next:=nil;
        Node^.tipe:=oper;
        Node^.DostUp:=false;
        Node^.DostDown:=false;
        B:=Node;{ссылка на перывый элемент}
 x1:=Cx-30;
 y1:=Cy+10;

 Node^.shapen:=TShape.create(Form1);
 with Node^.shapen do
 begin
      parent:=form1;
      shape:=stRectangle;
      Brush.Color:=clwhite;
      height:=25;
      width:=70;
      left:=X1;
      top:=Y1;
      DragMode:=dmAutomatic;
  end;  {tshape}
  Node^.signals:=TLabel.Create(form1);
  with Node^.signals do
  begin
       parent:=form1;
       font.size:=8;
       caption:=signal;
       height:=15;
       color:=clwhite;
       left:=X1+30;
       top:=Y1+5;
       DragMode:=dmAutomatic;
  end;    {TSignals}
   Node^.marker:=TLabel.Create(form1);
  with Node^.marker do
  begin
       parent:=form1;
       font.size:=8;
       caption:=IntToStr(no);
       height:=15;
       left:=X1-20;
       top:=Y1;
       DragMode:=dmAutomatic;
  end;    {TMarker}
 inc(no);
 Chang:=True;
 end;
 {---------------}
 procedure TForm1.CrBegin(Sender: TObject);
 begin
 Cr_Begin;
 end;
 {---------------}
 procedure Cr_Begin;
  var x1,y1,x2,y2:integer;
 begin
 If ((Cx<(Form1.Left+40))or(Cx>(Form1.Left+Form1.ClientWidth-40))or
    (Cy<(Form1.Top+40))or(Cy>(Form1.Top+Form1.ClientHeight-40)))then
     exit;
        New(Node);
        Node^.Yes:=nil;
        Node^.No:=nil;
        Node^.next:=nil;
        Node^.tipe:=beg;
        Node^.DostUp:=false;
        Node^.DostDown:=false;
        P:=Node;{ссылка на перывый элемент}
        B:=P;
 x1:=Cx-30;
 y1:=Cy+10;

 Node^.shapen:=TShape.create(Form1);
 with Node^.shapen do
 begin
      parent:=form1;
      shape:=stRoundRect;
      Brush.Color:=clwhite;
      height:=25;
      width:=70;
      left:=X1;
      top:=Y1;
      DragMode:=dmAutomatic;
  end;  {tshape}
  Node^.signals:=TLabel.Create(form1);
  with Node^.signals do
  begin
       parent:=form1;
       font.size:=8;
       font.Color:=clBlue;
       caption:='Начало';
       height:=15;
       color:=clwhite;
       left:=X1+10;
       top:=Y1+5;
       DragMode:=dmAutomatic;
  end;    {TSignals}
  Node^.marker:=TLabel.Create(form1);
  with Node^.marker do
  begin
       parent:=form1;
       font.size:=8;
       caption:=IntToStr(no);
       height:=15;
       left:=X1-20;
       top:=Y1;
       DragMode:=dmAutomatic;
  end;    {TMarker}
 inc(no);
 Form1.NBegin.Enabled:=False;
 Form1.NPBegin.Enabled:=False;
 Form1.NSave.Enabled:=True;
 Form1.NSaveas.Enabled:=True;
 Form1.NOper.Enabled:=True;
 Form1.NPOper.Enabled:=True;
 Form1.NCond.Enabled:=True;
 Form1.NPCond.Enabled:=True;
 Form1.NCond.Enabled:=True;
 Form1.NPCond.Enabled:=True;
 Form1.NLink.Enabled:=True;
 Form1.NPLink.Enabled:=True;
 Form1.NTable.Enabled:=True;
 Form1.NPEnd.Enabled:=True;
 Form1.NEnd.Enabled:=True;
 end;
 {---------------}
 procedure TForm1.CrEnd(Sender: TObject);
 begin
 Cr_End;
 end;
 {---------------}
 procedure Cr_End;
  var x1,y1,x2,y2:integer;
 begin
 If ((Cx<(Form1.Left+40))or(Cx>(Form1.Left+Form1.ClientWidth-40))or
    (Cy<(Form1.Top+40))or(Cy>(Form1.Top+Form1.ClientHeight-40)))then
     exit;
        New(Node);
        B^.next:=Node;
        Node^.Yes:=nil;
        Node^.No:=nil;
        Node^.next:=nil;
        Node^.tipe:=ends;
        Node^.DostUp:=false;
        Node^.DostDown:=false;
        B:=Node;{ссылка на перывый элемент}
 x1:=Cx-30;
 y1:=Cy+10;
 Node^.shapen:=TShape.create(Form1);
 with Node^.shapen do
 begin
      parent:=form1;
      shape:=stRoundRect;
      Brush.Color:=clwhite;
      height:=25;
      width:=70;
      left:=X1;
      top:=Y1;
      DragMode:=dmAutomatic;
  end;  {tshape}
  Node^.signals:=TLabel.Create(form1);
  with Node^.signals do
  begin
       parent:=form1;
       font.size:=8;
       font.Color:=clBlue;
       caption:='Конец';
       height:=15;
       color:=clwhite;
       left:=X1+10;
       top:=Y1+5;
       DragMode:=dmAutomatic;
  end;    {TSignals}
  Node^.marker:=TLabel.Create(form1);
  with Node^.marker do
  begin
       parent:=form1;
       font.size:=8;
       caption:=IntToStr(no);
       height:=15;
       left:=X1-20;
       top:=Y1;
       DragMode:=dmAutomatic;
  end;    {TMarker}
 inc(no);
 signal:='0';
 Form1.NEnd.Enabled:=False;
 Form1.NPEnd.Enabled:=False;
 end;
 {------------------}
 procedure TForm1.CrCondition(Sender: TObject);
 begin
 Cr_Condition;
 end;
 {---------------}
 procedure Cr_Condition;
 var x1,y1,x2,y2:integer;
 begin
 If ((Cx<(Form1.Left+40))or(Cx>(Form1.Left+Form1.ClientWidth-40))or
    (Cy<(Form1.Top+40))or(Cy>(Form1.Top+Form1.ClientHeight-40)))then
     exit;
       New(Node);
        B^.next:=Node;
        Node^.Yes:=nil;
        Node^.No:=nil;
        Node^.next:=nil;
        Node^.tipe:=cond;
        Node^.DostUp:=false;
        Node^.DostDown:=false;
        B:=Node;{ссылка на перывый элемент}
 x1:=Cx-40;
 y1:=Cy+20;

 Node^.shapen:=TShape.create(Form1);
 with Node^.shapen do
 begin
      parent:=form1;
      shape:=stEllipse;
      Brush.Color:=clwhite;
      height:=25;
      width:=70;
      left:=X1;
      top:=Y1;
      DragMode:=dmAutomatic;
  end;  {tshape}
  Node^.signals:=TLabel.Create(form1);
  with Node^.signals do
  begin
       parent:=form1;
       font.size:=8;
       height:=15;
       caption:=signal;
       color:=clwhite;
       left:=X1+30;
       top:=Y1+5;
       DragMode:=dmAutomatic;
  end;    {TSignals}
    Node^.marker:=TLabel.Create(form1);
  with Node^.marker do
    begin
       parent:=form1;
       font.size:=8;
       caption:=IntToStr(no);
       height:=15;
       left:=X1-20;
       top:=Y1;
       DragMode:=dmAutomatic;
  end;    {TMarker}
   inc(no);
   Chang:=True;
 end;
 {---------------}
procedure TForm1.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
R^.shapen.Left:=x;
R^.shapen.Top:=y;
R^.signals.Left:=x+10;
R^.signals.Top:=y+5;
R^.marker.Left:=x-20;
R^.marker.Top:=y;
end;

procedure TForm1.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
  begin
 R:=P;
 while R<>Nil do begin
 if (Source=R^.shapen) or (Source=R^.marker)or (Source=R^.signals)then
    begin
      Accept:=True;
      exit;
    end
 else begin
        Accept:=False;
        R:=R^.next;
      end;
 end;
end;
{--------------------}
procedure TForm1.FormCreate(Sender: TObject);
begin
 P:=Nil;
 signal:='0';
 Form1.NSaveas.Enabled:=False;
 Form1.NSave.Enabled:=False;

end;
 {-------------------}
 procedure Recurs(TMP:TNode);
 label lab1,lab2;
 begin
  If TMP<>Nil then
    begin
      TMP^.DostUp:=True;
lab2: if TMP^.Yes<>Nil then
        begin
          If not Tmp^.Yes^.DostUp then
             Recurs(TMP^.Yes)
          else
            begin
              if ((TMP^.No<>nil) and (Tmp^.no^.DostUp) and
                 (strtoint(Tmp^.yes^.marker.caption)<strtoint(Tmp^.marker.caption))) then
               begin
                Tmp^.marker.font.Color:=Clred;
                exit;
               end;
              if ((TMP^.No<>nil) and (Tmp^.no^.DostUp) and
                 (strtoint(Tmp^.yes^.marker.caption)>strtoint(Tmp^.marker.caption))) then
                 exit
              else goto Lab1;
            end;
        end;
  //    if ((tmp^.Yes<>nil)and(tmp^.Yes.DostDown))then Tmp^.DostDown:=true;
lab1: if TMP^.No<>Nil then
        begin
          If not Tmp^.no^.DostUp then
             Recurs(TMP^.No)
          else
            begin
              if ((TMP^.yes<>nil) and (Tmp^.yes^.DostUp) and
                 (strtoint(Tmp^.yes^.marker.caption)<strtoint(Tmp^.marker.caption))) then
               begin
                Tmp^.marker.font.Color:=Clred;
                exit;
               end;
              if ((TMP^.yes<>nil) and (Tmp^.yes^.DostUp) and
                 (strtoint(Tmp^.yes^.marker.caption)>strtoint(Tmp^.marker.caption))) then
                exit
              else  goto lab2;
            end;
        end ;
   //   if ((TMP^.No=nil) and (TMP^.yes=nil) and (TMP^.tipe=ends)) then TMP^.DostDown:=true;
    end;
 end;
 {-------------------}
procedure SavetoMatr;
  var i:integer;
begin
  setlength(Connect,no,2);
  c:=p;
  i:=0;
  while c<>Nil do
  begin
    if c^.yes<>nil then Connect[i,0]:=strtoint(c^.yes^.marker.caption);
    if c^.yes=nil then Connect[i,0]:=-1;
    if c^.no<>nil then Connect[i,1]:=strtoint(c^.no^.marker.caption);
    if c^.no=nil then Connect[i,1]:=-1;
  c:=c^.next;
  inc(i);
  end;
end;
 {-------------------}
procedure Cr_Mura;
var i,j,xs,xn,yn,kol,curY,curX,ys,razr:integer;
str,str1:string;
begin
 kol:=0;ys:=0;xs:=0;
 For i:=0 to (no-1) do
  begin
    if ((Connect[i,0]<>-1)and(Connect[i,1]<>-1))then inc(xs);
    if ((Connect[i,0]<>-1)and(Connect[i,1]=-1))then  inc(ys);
  end;
  inc(ys);
  razr:=trunc(logN(2,(ys-1)))+1;
  editform.MMura.RowCount:=ys+xs;
  editform.MMura.ColCount:=ys+xs+2+2*razr;
  xn:=4;yn:=4+xs;cury:=yn-1;curX:=xn;
 c:=p;
 kol:=0;
 while c<>nil do
  begin
  if ((C^.tipe<>cond)and(C^.tipe<>ends)) then
  begin
   if C^.Yes^.tipe=oper then
     begin
      inc(kol);
      //ИС
      editform.MMura.Cells[0,kol]:=' a'+C^.marker.Caption;
      //код ИС
      editform.MMura.Cells[1,kol]:=Table[strtoint(C^.marker.Caption)];
      //СП
      editform.MMura.Cells[2,kol]:=' a'+C^.yes^.marker.Caption;
      //код СП
      editform.MMura.Cells[3,kol]:=Table[strtoint(C^.yes^.marker.Caption)];
      for j:=yn to (yn+ys) do editform.MMura.Cells[j,kol]:=' 0';
      if C^.tipe<>beg then
        begin
          editform.MMura.Cells[curY,0]:=' y'+C^.signals.Caption;
          editform.MMura.Cells[CurY,kol]:=' 1';
        end;
      for j:=xn to (xn+xs-1) do editform.MMura.Cells[j,kol]:=' -';
      inc(cury);
     end;
   if C^.Yes^.tipe=cond then
     begin
      inc(kol);
      //условия переходов
      for j:=xn to (xn+xs-1) do editform.MMura.Cells[j,kol]:=' -';
      editform.MMura.Cells[curx,0]:=' x'+C^.yes^.signals.Caption;
      //ИС
      editform.MMura.Cells[0,kol]:=' a'+C^.marker.Caption;
      //код ИС
      editform.MMura.Cells[1,kol]:=Table[strtoint(C^.marker.Caption)];
      //СП 1
      editform.MMura.Cells[2,kol]:=' a'+C^.yes^.yes^.marker.Caption;
      //код СП 1
      editform.MMura.Cells[3,kol]:=Table[strtoint(C^.yes^.marker.Caption)];
      // переход по да
      editform.MMura.Cells[curx,kol]:=' 1';
      for j:=yn to (yn+ys) do editform.MMura.Cells[j,kol]:=' 0';
      if C^.tipe<>beg then
        begin
          editform.MMura.Cells[curY,0]:=' y'+C^.signals.Caption;
          editform.MMura.Cells[curY,kol]:=' 1';
        end;
      inc(kol);
      //СП 2
      for j:=xn to (xn+xs-1) do editform.MMura.Cells[j,kol]:=' -';
      editform.MMura.Cells[2,kol]:=' a'+C^.yes^.no^.marker.Caption;
      //код СП 2
      editform.MMura.Cells[3,kol]:=Table[strtoint(C^.yes^.no^.marker.Caption)];
      //Вых. сигналы
      for j:=yn to (yn+ys) do editform.MMura.Cells[j,kol]:=' 0';
      if C^.tipe<>beg then
        begin
          editform.MMura.Cells[curY,kol]:=' 1';
          inc(curY);
        end;
      //переход по нет
      editform.MMura.Cells[curx,kol]:=' 0';
      inc(curX);
    end;
   if C^.Yes^.tipe=ends then
     begin
      inc(kol);
      //ИС
      editform.MMura.Cells[0,kol]:=' a'+C^.marker.Caption;
      //код ИС
      editform.MMura.Cells[1,kol]:=Table[strtoint(C^.marker.Caption)];
      //СП
      editform.MMura.Cells[2,kol]:=' a0';
      //код СП
      editform.MMura.Cells[3,kol]:=Table[0];
      for j:=yn to (yn+ys) do editform.MMura.Cells[j,kol]:=' 0';
      if C^.tipe<>beg then
        begin
          editform.MMura.Cells[curY,0]:=' y'+C^.signals.Caption;
          editform.MMura.Cells[CurY,kol]:=' 1';
        end;
      for j:=xn to (xn+xs-1) do editform.MMura.Cells[j,kol]:=' -';
      inc(cury);
     end;
 end;
  c:=c^.next;
  end;
//Переход состояний для D триггерa
   j:=1;
   for i:=(ys+xs+2) to (ys+xs+razr+1) do
    begin
      editform.MMura.Cells[i,0]:=' D'+inttostr(j);
      inc(j);
    end;
   for j:=1 to (editform.MMura.RowCount-1) do
   begin
    xn:=4-razr;
    str:=editform.MMura.cells[3,j];
     for i:=(ys+xs+2) to (ys+xs+razr+1) do
       begin
          case str[xn] of
           '0' : editform.MMura.cells[i,j]:=' 0';
           '1' : editform.MMura.cells[i,j]:=' 1';
          end;
       inc(xn);
       end;
   end;
//Переход состояний для T триггерa
   j:=1;
   for i:=(ys+xs+razr+2) to (ys+xs+2*razr+1) do
    begin
      editform.MMura.Cells[i,0]:=' T'+inttostr(j);
      inc(j);
    end;
   for j:=1 to (editform.MMura.RowCount-1) do
   begin
    xn:=4-razr;
    str:=editform.MMura.cells[3,j];
    str1:=editform.MMura.cells[1,j];
    if str1='' then str1:=editform.MMura.cells[1,j-1];
     for i:=(ys+xs+razr+2) to (ys+xs+2*razr+1) do
       begin
         if (((str1[xn]='0') and (str[xn]='1'))or((str1[xn]='1') and (str[xn]='0'))) then
            editform.MMura.cells[i,j]:=' 1'
         else editform.MMura.cells[i,j]:=' 0';
         inc(xn);
       end;
   end;
   editform.Memo1.Lines.LoadFromFile(stringF+'MU');
   editform.Memo2.Lines.LoadFromFile(stringF+'MI');
end;
{--------------------}
procedure Cr_Mili;
var i,j,xs,xn,yn,kol,curY,curX,ys,razr,s:integer;
str,str1:string;
begin
 kol:=0;ys:=0;xs:=0;s:=0;
 For i:=0 to (no-1) do
  begin
    if ((Connect[i,0]<>-1)and(Connect[i,1]<>-1))then inc(xs);
    if ((Connect[i,0]<>-1)and(Connect[i,1]=-1))then  inc(ys);
  end;
  inc(ys);
  razr:=trunc(logN(2,(ys-1)))+1;
  editform.MMili.ColCount:=ys+xs+2+2*razr;
  xn:=4;yn:=4+xs;cury:=yn;curX:=xn;
  c:=p;
  kol:=0;

  while c<>nil do
  begin
   if  C^.tipe=beg then
   begin
   inc(kol);
   editform.MMili.RowCount:=2;
   for j:=yn to (yn+ys) do editform.MMili.Cells[j,kol]:=' 0';
   for j:=xn to (xn+xs-1) do editform.MMili.Cells[j,kol]:=' -';
   //ИС
   editform.MMili.Cells[0,kol]:=' a1';
   //код ИС
   editform.MMili.Cells[1,kol]:=Table[0];
   if ((C^.yes^.tipe=oper)and(C^.yes^.yes^.tipe<>ends))then
      begin
         //СП
         editform.MMili.Cells[2,kol]:=' a'+C^.yes^.yes^.marker.Caption;
         //код СП
         editform.MMili.Cells[3,kol]:=Table[strtoint(C^.yes^.yes^.marker.Caption)];
         editform.MMili.Cells[curY,0]:=' y'+C^.yes^.signals.Caption;
         editform.MMili.Cells[CurY,kol]:=' 1';
         inc(cury);
      end;
   end;
   if ((C^.tipe=oper)and(C^.Yes<>Nil)and(C^.yes^.tipe<>ends)) then
     begin
      if(C^.yes^.yes^.tipe<>ends) then begin
      inc(kol);
      editform.MMili.RowCount:=kol;
      for j:=yn to (yn+ys) do editform.MMili.Cells[j,kol]:=' 0';
      for j:=xn to (xn+xs-1) do editform.MMili.Cells[j,kol]:=' -';
      //ИС
      editform.MMili.Cells[0,kol]:=' a'+C^.yes^.marker.Caption;
      //код ИС
      editform.MMili.Cells[1,kol]:=Table[strtoint(C^.yes^.marker.Caption)];
      end;
      if ((C^.yes^.tipe=oper)and(C^.yes^.yes^.tipe<>ends))then
        begin
         //СП
         editform.MMili.Cells[2,kol]:=' a'+C^.yes^.yes^.marker.Caption;
         //код СП
         editform.MMili.Cells[3,kol]:=Table[strtoint(C^.yes^.yes^.marker.Caption)];
         editform.MMili.Cells[curY,0]:=' y'+C^.yes^.signals.Caption;
         editform.MMili.Cells[CurY,kol]:=' 1';
         inc(cury);
        end;
      if ((C^.yes^.tipe=cond)and(C^.yes^.yes^.tipe<>ends))then
        begin
         editform.MMili.Cells[curx,0]:=' x'+C^.yes^.signals.Caption;
         editform.MMili.Cells[curx,kol]:=' 1';
         if (C^.yes^.yes^.tipe=oper) then
              begin
               //СП по "ДА"
                if (C^.yes^.yes^.yes^.tipe<>ends) then
                begin
                editform.MMili.Cells[2,kol]:=' a'+C^.yes^.yes^.yes^.marker.Caption;
                //код СП
                editform.MMili.Cells[3,kol]:=Table[strtoint(C^.yes^.yes^.yes^.marker.Caption)];
                end
                else
                begin
                editform.MMili.Cells[2,kol]:=' a1';
                //код СП
                editform.MMili.Cells[3,kol]:=Table[0];
                end;
                for i:=yn to (yn+ys)do
                   if (editform.MMili.Cells[i,0]=' y'+C^.yes^.Yes^.signals.Caption) then
                      begin
                      editform.MMili.Cells[i,kol]:=' 1';
                      s:=1;
                      end;
                if s=0 then
                begin
                editform.MMili.Cells[curY,0]:=' y'+C^.yes^.yes^.signals.Caption;
                editform.MMili.Cells[CurY,kol]:=' 1';
                inc(cury);
                end;
                s:=0;
              end;
         //СП по "НЕТ"
         inc(kol);
         editform.MMili.RowCount:=kol;
         for j:=xn to (xn+xs-1) do editform.MMili.Cells[j,kol]:=' -';
         editform.MMili.Cells[curx,kol]:=' 0';
         for j:=yn to (yn+ys) do editform.MMili.Cells[j,kol]:=' 0';
         if C^.Yes^.No^.tipe=oper then
           begin
             editform.MMili.Cells[2,kol]:=' a'+C^.yes^.No^.yes^.marker.Caption;
             //код СП
             editform.MMili.Cells[3,kol]:=Table[strtoint(C^.yes^.No^.yes^.marker.Caption)];
             for i:=yn to (yn+ys)do
                   if (editform.MMili.Cells[i,0]=' y'+C^.yes^.no^.signals.Caption) then
                      begin
                      editform.MMili.Cells[i,kol]:=' 1';
                      s:=1;
                      end;
             if s=0 then
             begin
             editform.MMili.Cells[CurY,kol]:=' 1';
             editform.MMili.Cells[curY,0]:=' y'+C^.yes^.no^.signals.Caption;
             inc(cury);
             end;
             s:=0;
             inc(curx);
           end;
        end;

     end;
     if ((C^.tipe=oper)and(C^.Yes<>Nil)and(C^.yes^.tipe=ends)) then
     begin
      inc(kol);
      editform.MMili.RowCount:=kol+1;
      for j:=yn to (yn+ys) do editform.MMili.Cells[j,kol]:=' 0';
      for j:=xn to (xn+xs-1) do editform.MMili.Cells[j,kol]:=' -';
      //ИС
      editform.MMili.Cells[0,kol]:=' a'+C^.marker.Caption;
      //код ИС
      editform.MMili.Cells[1,kol]:=Table[strtoint(C^.marker.Caption)];
      //СП
      editform.MMili.Cells[2,kol]:=' a1';
      //код СП
      editform.MMili.Cells[3,kol]:=Table[0];
      for i:=yn to (yn+ys)do
          if (editform.MMili.Cells[i,0]=' y'+C^.signals.Caption) then
             begin
             editform.MMili.Cells[i,kol]:=' 1';
             s:=1;
             end;
          if s=0 then
             begin
             editform.MMili.Cells[curY,0]:=' y'+C^.signals.Caption;
             editform.MMili.Cells[CurY,kol]:=' 1';
             inc(cury);
             end;
          s:=0;
     end;
  c:=c^.next;
  end;
  //Переход состояний для D триггерa
   j:=1;
   for i:=(ys+xs+2) to (ys+xs+razr+1) do
    begin
      editform.MMili.Cells[i,0]:=' D'+inttostr(j);
      inc(j);
    end;
   for j:=1 to (editform.MMili.RowCount-1) do
   begin
    xn:=4-razr;
    str:=editform.MMili.cells[3,j];
     for i:=(ys+xs+2) to (ys+xs+razr+1) do
       begin
          case str[xn] of
           '0' : editform.MMili.cells[i,j]:=' 0';
           '1' : editform.MMili.cells[i,j]:=' 1';
          end;
       inc(xn);
       end;
   end;
//Переход состояний для T триггерa
   j:=1;
   for i:=(ys+xs+razr+2) to (ys+xs+2*razr+1) do
    begin
      editform.MMili.Cells[i,0]:=' T'+inttostr(j);
      inc(j);
    end;
   for j:=1 to (editform.MMili.RowCount-1) do
   begin
    xn:=4-razr;
    str:=editform.MMili.cells[3,j];
    str1:=editform.MMili.cells[1,j];
    if str1='' then str1:=editform.MMili.cells[1,j-1];
     for i:=(ys+xs+razr+2) to (ys+xs+2*razr+1) do
       begin
         if (((str1[xn]='0') and (str[xn]='1'))or((str1[xn]='1') and (str[xn]='0'))) then
            editform.MMili.cells[i,j]:=' 1'
         else editform.MMili.cells[i,j]:=' 0';
         inc(xn);
       end;
   end;

end;
{--------------------}
procedure SaveFile;
var MyFile:text;
i,j:byte;
tmps:integer;
begin
SavetoMatr;
Chang:=false;
 AssignFile(MyFile,Form1.SaveDialog1.FileName);
 rewrite(MyFile);
 c:=p;
  writeln(MyFile,no);
 while c<>Nil do
 begin
  case c^.tipe of
  beg : Writeln(MyFile,1);
  ends: Writeln(MyFile,2);
  oper: Writeln(MyFile,3);
  cond: Writeln(MyFile,4);
  end;
  Writeln(MyFile,(c^.shapen.left+30));
  Writeln(MyFile,(c^.shapen.top-10));
  Writeln(MyFile,C^.signals.caption);

 c:=c^.next;
 end;
 for i:=0 to (no-1) do
    for j:=0 to 1 do Writeln(MyFile,Connect[i,j]);
 CloseFile(MyFile);
end;
{--------------------}
procedure LoadFile;
var MyFile:text;
i,j,number:integer;
name,tmps:integer;
tmp:string[6];
begin
 New_File;
{открытие файла}
AssignFile(MyFile,Form1.OpenDialog1.FileName);
StringF:=Form1.OpenDialog1.FileName;
reset(MyFile);
Readln(MyFile,number);
{считываем позицию, название, сигнлы вершины}
for i:=0 to (Number-1) do begin
 Readln(MyFile,name);
 Readln(MyFile,Cx);
 Readln(MyFile,Cy);
 Readln(MyFile,signal);
   if name=1 then Cr_Begin;
   if name=2 then Cr_End;
   if name=3 then Cr_Operation;
   if name=4 then Cr_Condition;
end;
{считываем матрицу связности }
 setlength(Connect,number,2);
for i:=0 to (number-1) do
    for j:=0 to 1 do Readln(Myfile,Connect[i,j]);
CloseFile(MyFile);

    c:=p;D:=Nil;i:=0;
while c<>Nil do
  begin
    if Connect[i,0]<>-1 then
       begin
         E:=p;
         while E<>Nil do
           begin
             if E^.marker.Caption=inttostr(Connect[i,0]) then break ;
             E:=E^.next;
           end;
       end;
    if Connect[i,1]<>-1 then
       begin
         D:=p;
         while D<>Nil do
           begin
             if D^.marker.Caption=inttostr(Connect[i,1]) then break;
             D:=D^.next;
           end;
       end;
 C^.yes:=E;
 if D<>nil then C^.no:=D;
 D:=nil;
 if C^.tipe=cond then draw_lines;
 if C^.tipe<>cond then draw_line;
 c:=C^.next;
 inc(i);
end;
Chang:=False;
end;
{--------------------}
procedure New_File;
begin
{отчистка экрана от пердыдущего файла}
 if p<>nil then
 begin
  c:=p;
  while c<>nil do
  begin
   C^.shapen.Destroy;
   C^.signals.Destroy;
   C^.marker.Destroy;
   c:=c^.next;
  end;
 Form1.Refresh;
 c:=nil; e:=nil; d:=nil; p:=nil; r:=nil; b:=nil;
 setlength(connect,0,0);
 no:=0;
 signal:='';
 cx:=0;cy:=0;
 Form1.NBegin.Enabled:=True;
 Form1.NPBegin.Enabled:=True;
 Form1.NEnd.Enabled:=True;
 Form1.NPEnd.Enabled:=True;

 end;
end;
{--------------------}
procedure draw_line;
var x1,x2,y1,y2:integer;
begin
x1:=C^.shapen.left+35;
x2:=C^.yes^.shapen.left+35;
y1:=C^.shapen.top;
y2:=C^.yes^.shapen.top;
if y1>y2 then
    begin
      y1:=y1+25;
      Form1.Canvas.Moveto(x1,y1);
      y1:=y1+20;
      Form1.canvas.Lineto(x1,y1);
      if x1>x2 then
      begin
       Form1.Canvas.Moveto(x1,y1);
       x1:=x1+10;
       Form1.canvas.Lineto(x1,y1);
      end;
      if x1<x2 then
      begin
       Form1.Canvas.Moveto(x1,y1);
       x1:=x1-55;
       Form1.canvas.Lineto(x1,y1);
      end
      else
      begin
       Form1.Canvas.Moveto(x1,y1);
       x1:=x1+55;
       Form1.canvas.Lineto(x1,y1);
      end;
      y2:=y2-20;
      Form1.Canvas.Moveto(x1,y1);
      Form1.canvas.Lineto(x1,y2);
      Form1.Canvas.Moveto(x1,y2);
      Form1.canvas.Lineto(x2,y2);
      Form1.Canvas.Moveto(x2,y2);
      Form1.canvas.Lineto(x2,y2+20);

     end
else
 begin
   y1:=y1+25;
   if (x1=x2) then
   begin
    Form1.Canvas.Moveto(x1,y1);
    Form1.canvas.Lineto(x2,y2);
   end
   else
   begin
    Form1.Canvas.Moveto(x1,y1);
    Form1.canvas.Lineto(x1,y1+5);
    Form1.Canvas.Moveto(x1,y1+5);
    Form1.canvas.Lineto(x2,y1+5);
    Form1.Canvas.Moveto(x2,y1+5);
    Form1.canvas.Lineto(x2,y2);
   end;
 end;
end;
{--------------------}
procedure draw_lines;
var x3,x1,x2,y1,y2,y3:integer;
begin
x1:=C^.shapen.left+35;
x3:=C^.No^.shapen.left+35;
x2:=C^.yes^.shapen.left+35;
y1:=C^.shapen.top;
y2:=C^.yes^.shapen.top;
y3:=C^.no^.shapen.top;
      {правая ветка условия, пеерход по 1}
      y1:=y1+12;
      if y2>y1 then
       begin
        Form1.Canvas.Moveto(x1+35,y1);
        Form1.canvas.Lineto(x1+65,y1);
        Form1.Canvas.Moveto(x1+65,y1);
        Form1.canvas.Lineto(x1+65,y1+30);
        Form1.Canvas.Moveto(x1+65,y1+30);
        Form1.canvas.Lineto(x2,y1+30);
        Form1.Canvas.MoveTo(x2,y1+30);
        Form1.canvas.Lineto(x2,y2);
       end
      else
       begin
        Form1.Canvas.Moveto(x1+35,y1);
        Form1.canvas.Lineto(x1+65,y1);
        Form1.Canvas.Moveto(x1+65,y1);
        Form1.Canvas.MoveTo(x1+65,y1);
        Form1.canvas.Lineto(x1+65,y2-20);
        Form1.Canvas.MoveTo(x1+65,y2-20);
        Form1.canvas.Lineto(x2,y2-20);
        Form1.Canvas.MoveTo(x2,y2-20);
        Form1.canvas.Lineto(x2,y2);
       end;
      {левая ветка, переход по 0}
       if y3>y1 then
       begin
        Form1.Canvas.Moveto(x1-35,y1);
        Form1.canvas.Lineto(x1-65,y1);
        Form1.Canvas.Moveto(x1-65,y1);
        Form1.canvas.Lineto(x1-65,y1+20);
        Form1.Canvas.Moveto(x1-65,y1+20);
        Form1.canvas.Lineto(x3,y1+20);
        Form1.Canvas.MoveTo(x3,y1+20);
        Form1.canvas.Lineto(x3,y3);
       end
      else
       begin
        Form1.Canvas.Moveto(x1-35,y1);
        Form1.canvas.Lineto(x1-65,y1);
        Form1.Canvas.Moveto(x1-65,y1);
        Form1.Canvas.MoveTo(x1-65,y1);
        Form1.canvas.Lineto(x1-65,y3-20);
        Form1.Canvas.MoveTo(x1-65,y3-20);
        Form1.canvas.Lineto(x3,y3-20);
        Form1.Canvas.MoveTo(x3,y3-20);
        Form1.canvas.Lineto(x3,y3);
       end;
end;
{--------------------------}
procedure TForm1.Button1Click(Sender: TObject);
begin
Change.ShowModal;
end;

procedure TForm1.NSaveAsClick(Sender: TObject);
begin
if SaveDialog1.Execute then SaveFile;
end;

procedure TForm1.NOpenClick(Sender: TObject);
begin
if OpenDialog1.Execute then LoadFile;
end;

procedure TForm1.NNewClick(Sender: TObject);
begin
New_File;
Form1.NSaveas.Enabled:=False;
Form1.NSave.Enabled:=False;
end;

procedure TForm1.NLinkClick(Sender: TObject);
begin
Change.ShowModal;
end;

procedure TForm1.NPLinkClick(Sender: TObject);
begin
Change.ShowModal;
end;

procedure TForm1.NSaveClick(Sender: TObject);
begin
SaveFile;
end;

procedure TForm1.NexitClick(Sender: TObject);
begin
halt;
end;

procedure TForm1.NTableClick(Sender: TObject);
var i,k:integer;
tmp:boolean;
begin
{Проверка на достижимость}
C:=p;tmp:=false;
while c<>nil do
begin
c^.marker.font.Color:=Clblack;
c^.DostUp:=false;
c:=C^.next;
end;
if ((length(connect)=0)or(Chang)) then
  begin
    MessageDlg('Сохраните файл',mtError,[mbOK],0);
    exit;
  end;
Recurs(P);
c:=p;
 while C<>Nil do
 begin
   if not C^.DostUp then
      begin
        C^.shapen.Brush.Color:=clred;
        C^.signals.Color:=Clred;
        MessageDlg('Ne dostijimaya',mtError,[mbOK],0);
        tmp:=true;
      end
   else
      begin
        C^.shapen.Brush.Color:=clwhite;
        C^.signals.Color:=Clwhite;
      end ;
 C:=C^.next;
 end;
if tmp then exit;
 {конец проверки}
 Cr_Mura;
 Cr_Mili;
 EditForm.ShowModal;
end;

end.
