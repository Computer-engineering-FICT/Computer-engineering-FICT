unit L6U;

interface
uses ExtCtrls,Classes,Controls,Graphics,SysUtils,StrUtils,Dialogs,Math;
 Const
  CActiveColor=clRed;
  CPasiveColor=clBlue;
  CLineColor = clGreen;

  CPenWidth=1;
  //TParam
  CTTWidth=40;
  CTTHeight=20;
  //RParam
  CTRWidth=40;
  CTRHeight=20;

  CTMWidthHeight=3;
  //PParam
  CTPWidth=40;
  CTPHeight=20;

  //CTPDiametr=12;


 Type
  TMainBox=class;
  TSurface=class;
  TMarker=class;
  TLine=class;

  TM=class
   private
    M:array of word;
   public
    function getN:word;
    function isMe(CM:TM):boolean;
    constructor Create(N:word);
    destructor Destroy;override;
  end;

  TTreeNode=class
   public
    Marking:TM;
    MySubNodes:TList;
   // procedure addNode(N:TTreeNode);
    //function inMe
  end;

  TEvObj=class
    procedure ObjLeftClick(X,Y:integer);virtual;
    procedure ObjRightClick(X,Y:integer);virtual;
    procedure ObjDblClick(X,Y:integer);virtual;
    procedure ObjMouseMove(X,Y,dx,dy:integer);virtual;
    procedure ObjMouseDrug(X,Y,dx,dy:integer);virtual;
    procedure ObjMouseDown(X,Y:integer);virtual;
    procedure ObjMouseUp(X,Y:integer);virtual;
    procedure paint(G:TCanvas);virtual;
  end;

  TObj=class(TEvObj)
   public
    function getData(MOwner:TMainBox):AnsiString;virtual;abstract;
    procedure ObjMouseEntered(X,Y,dx,dy:integer);virtual;
    procedure ObjMouseExited(X,Y,dx,dy:integer);virtual;
    procedure ObjMouseRelased(X,Y,dx,dy:integer);virtual;

    constructor Create;
    destructor Destroy(MOwner:TMainBox);virtual; 
  end;

  TColorObject=class(TObj)
   private
    Color:TColor;
    Selected:boolean;
   public
    procedure paint(G:TCanvas);override;
    procedure setColor(C:TColor);
    procedure ObjMouseEntered(X,Y,dx,dy:integer);override;
    procedure ObjMouseExited(X,Y,dx,dy:integer);override;
    procedure ObjMouseRelased(X,Y,dx,dy:integer);override;
    procedure ObjMouseDrug(X,Y,dx,dy:integer);override;
    procedure onAdd(Mybox:TMainBox);    virtual;
    procedure onRem(Mybox:TMainBox);    virtual;
    procedure setXY(x,y:integer);virtual;
    function onMe(x,y:integer):boolean;virtual;
    procedure setSelected(NSelected:boolean);

    constructor Builder(var Data:AnsiString;MOwner:TSurface);virtual;
    constructor Create;
    destructor dertroy(MOwner:TMainBox);
  end;

  TElement=class(TColorObject)
   protected
    x_,y_:integer;
   public
    function getX:integer;
    function getY:integer;
    procedure setXY(x,y:integer);override;
    function getData(MOwner:TMainBox):AnsiString;override;

  end;

  TNode=class(TElement)
   private
    MyLines:TList;
   public
    Name:String;
    procedure AddLine(MLine:TLine);
    procedure DelLine(MLine:TLine);
    function LineNumOut:integer;

    function getX1:integer; virtual;
    function getY1:integer; virtual;
    function getXin:integer; virtual;
    function getYin:integer; virtual;


    procedure STEP;
    procedure paint(G:TCanvas);override;
    function getData(MOwner:TMainBox):AnsiString;override;
    constructor Builder(var Data:AnsiString;MOwner:TSurface);override;
    constructor Create;
    destructor Destroy(MOwner:TMainBox);override;
  end;

  TP=class(TNode)
   // P:word;
    procedure ObjLeftClick(X,Y:integer);override;
    procedure ObjRightClick(X,Y:integer);override;
    procedure paint(G:TCanvas);override;
    function onMe(x,y:integer):boolean;override;
  //  function getData(MOwner:TMainBox):AnsiString;override;
    constructor Builder(var Data:AnsiString;MOwner:TSurface);override;
    constructor Create(MOwner:TSurface);virtual;
  end;

  TBegin=class(TP)
    function getData(MOwner:TMainBox):AnsiString;override;
    constructor Create(MOwner:TSurface);override;
  end;

  TEnd=class(TP)
    function getData(MOwner:TMainBox):AnsiString;override;
    constructor Create(MOwner:TSurface);override;
  end;

  TRT=class(TNode)
    procedure ObjDblClick(X,Y:integer);override;
  end;            

  TT=class(TRT)
    procedure paint(G:TCanvas);override;
    function onMe(x,y:integer):boolean;override;
    function getData(MOwner:TMainBox):AnsiString;override;
    constructor Builder(var Data:AnsiString;MOwner:TSurface);override;
    constructor Create(MOwner:TSurface);
  end;

  TR=class;

  TElNode=class(TNode)
    Owner:TR;
    function getX1:integer; override;
    function getY1:integer; override;
    procedure paint(G:TCanvas);override;
    function onMe(x,y:integer):boolean;override;
    function getData(MOwner:TMainBox):AnsiString;override;
    procedure setXY(x,y:integer);override;
    destructor destroy(MOwner:TMainBox);override;
  end;

  TR=class(TRT)
    ElseNode:TElNode;
    procedure setXY(x,y:integer);override;
    procedure paint(G:TCanvas);override;
    function onMe(x,y:integer):boolean;override;
    function getData(MOwner:TMainBox):AnsiString;override;
    procedure onAdd(Mybox:TMainBox);override;
    procedure onRem(Mybox:TMainBox);override;
    constructor Builder(var Data:AnsiString;MOwner:TSurface);override;
    constructor Create(MOwner:TSurface);
   // destructor destroy(MOwner:TSurface);override;
  end;

  TLine=class(TColorObject)
   private
    MyLines:TList;
    NB,NE:TNode;
   public
    procedure setNB(NNB:TNode);
    procedure setNE(NNE:TNode);
    function getNB:TNode;
    function getNE:TNode;
    procedure AddNode(N:TMarker);
    procedure DelNode(N:TMarker;MOwner:TMainBox);
    procedure paint(G:TCanvas);override;
    function getData(MOwner:TMainBox):AnsiString;override;

    constructor Builder(var Data:AnsiString;MOwner:TSurface);override;
    destructor Destroy(MOwner:TMainBox);override;
    constructor Create;
  end;

  TMarker=class(TElement)
   private
    OwnerL:TLine;
   public
    procedure paint(G:TCanvas);override;
    function onMe(x,y:integer):boolean;override;
    function getData(MOwner:TMainBox):AnsiString;override;

    constructor Builder(var Data:AnsiString;MOwner:TSurface;NOwnerL:TLine);overload;  
    constructor Create(NOwnerL:TLine);
    destructor Destroy(MOwner:TMainBox);override;
  end;

  TMainBox=class(TObj)
   private
    MyObjects:TList;
    Selected:TColorObject;
//    PS,RTS:word;
   public
    PN,RTN:word;
    procedure ObjMouseMove(X,Y,dx,dy:integer);override;
    function getSelected(X,Y:integer):TColorObject;overload;
    function getSelected:TColorObject;overload;

    procedure Add(Obj:TColorObject);
    procedure Del(Obj:TColorObject);
    function Count:word;
    function getObj(i:word):TColorObject;
    function getP(i:word):TP;
    function getRT(i:word):TRT;
    function STEP:TM;
    function Check:boolean;

    function Connected(N1,N2:TNode):integer;
    function isBegin:integer;
    function isEnd:integer;
    procedure Paint(G:TCanvas);override;
    function getData(MOwner:TMainBox):AnsiString;override;
    procedure Clear(MOwner:TSurface);
    function getMarking:TM;

    procedure Builder(var Data:AnsiString;MOwner:TSurface);
    constructor Create;
    destructor Destroy(MOwner:TSurface);
  end;

  TTool=class(TEvObj)
   private
    Owner:TSurface;
   public
    constructor Create(NOwner:TSurface);
    destructor Destroy;virtual;
  end;

  TTArrow=class(TTool)
    procedure ObjLeftClick(X,Y:integer);override;
    procedure ObjRightClick(X,Y:integer);override;
    procedure ObjDblClick(X,Y:integer);override;
    procedure ObjMouseMove(X,Y,dx,dy:integer);override;
    procedure ObjMouseDrug(X,Y,dx,dy:integer);override;
    procedure ObjMouseDown(X,Y:integer);override;
    procedure ObjMouseUp(X,Y:integer);override;
    constructor Create(NOwner:TSurface);
    destructor Destroy;override;
  end;

  TTDelete=class(TTArrow)
    procedure ObjLeftClick(X,Y:integer);override;
    destructor Destroy;override;
  end;

  TTNodeBuilder=class(TTool)
   private
    MyNode:TNode;
   public
    procedure ObjLeftClick(X,Y:integer);override;
    procedure ObjMouseMove(X,Y,dx,dy:integer);override;
    procedure paint(G:TCanvas);override;
    constructor Create(NNode:TNode;NOwner:TSurface);
    destructor Destroy;override;
  end;

  TTIfBuilder=class(TTNodeBuilder)
    procedure paint(G:TCanvas);override;
  end;

  TTLineBuilder=class(TTool)
   private
    MyN:TList;
    MyLine:TLine;
    onLCL:procedure(N:TNode;x,y:integer)of object;
    procedure onLCL1(N:TNode;x,y:integer);
    procedure onLCL2(N:TNode;x,y:integer);
    procedure onLCLP(N:TNode;x,y:integer);
    procedure onLCLT(N:TNode;x,y:integer);
    procedure onLCLR(N:TNode;x,y:integer);
   public
    procedure ObjLeftClick(X,Y:integer);override;
    procedure ObjMouseMove(X,Y,dx,dy:integer);override;
    procedure ObjRightClick(X,Y:integer);override;
    procedure paint(G:TCanvas);override;
    constructor Create(NOwner:TSurface);
    destructor Destroy;override;
  end;

  TSurface=class(TImage)
   private
    Pressed:boolean;
    click:boolean;
    x_,y_,dx,dy:integer;
    procedure ObjDblClick(Sender: TObject);
    procedure ObjMouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);
    procedure ObjMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure ObjMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
   public
    PN:word;
    MI:array of array of integer;
    Mili1:array of integer;
    Mili2:array of integer;

    MI2:array of array of integer;

    Mark:array of integer;
    MyBox:TMainBox;
    MyTool:TTool;
    procedure paint;override;
    procedure SetTool(NewTool:TTool);
    procedure updateMatrix;
    function Check:boolean;

    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
  end;

  function getSubString(S:AnsiString;C1,C2:char;var l:word):AnsiString;

implementation
  function getSubString(S:AnsiString;C1,C2:char;var l:word):AnsiString;
  Var i,j:word;
  Begin
    j:=0;
    if C1='_'then
      i:=0
    else
      i:=1;
    while(i<=Length(S))do begin
      if(S[i]=C1)or(C1='_')then begin
        while i+j<=Length(S) do begin
          if(S[i+j]=C2)then
            break;
          j:=j+1;
        end;
        break;
      end;
      i:=i+1;
    end;
    if(i+j<=Length(S))and(j<>0)then begin
      l:=i+j;
      getSubString:=AnsiMidStr(S,i+1,j-1)
    end else begin
      l:=0;
      getSubString:='';
    end;
  end;

  //TM Begin
  function TM.getN:word;
  Begin
    getN:=Length(M);
  end;

  function TM.isMe(CM:TM):boolean;
  Var i:word;
  Begin
    i:=1;
    while i<=Length(M) do begin
      if(CM.M[i-1]<>M[i-1])then
        break;
      i:=i+1;
    end;
    isMe:=(i>Length(M));
  end;

  constructor TM.Create(N:word);
  Begin
    inherited Create;
    SetLength(M,N);
  end;

  destructor TM.Destroy;
  Begin
    SetLength(M,0);
    inherited;
  end;
  //TM End

// TEvObject    begin
  procedure TEvObj.ObjLeftClick(X,Y:integer);
  Begin
  end;

  procedure TEvObj.ObjRightClick(X,Y:integer);
  Begin
  end;

  procedure TEvObj.ObjDblClick(X,Y:integer);
  Begin
  end;

  procedure TEvObj.ObjMouseMove(X,Y,dx,dy:integer);
  Begin
  end;

  procedure TEvObj.ObjMouseDrug(X,Y,dx,dy:integer);
  Begin
  end;

  procedure TEvObj.ObjMouseDown(X,Y:integer);
  Begin
  end;

  procedure TEvObj.ObjMouseUp(X,Y:integer);
  Begin
  end;

  procedure TEvObj.paint(G:TCanvas);
  Begin
  end;

// TEvObject end

// TObj Begin

  procedure TObj.ObjMouseEntered(X,Y,dx,dy:integer);
  Begin
  end;

  procedure TObj.ObjMouseExited(X,Y,dx,dy:integer);
  Begin
  end;

  procedure TObj.ObjMouseRelased(X,Y,dx,dy:integer);
  Begin
  end;

  destructor TObj.Destroy(MOwner:TMainBox);
  Begin
    inherited Destroy;
  end;

  constructor TObj.Create;
  Begin
    inherited Create;
  end;

// TObj end

// TColorObject Begin

  procedure TColorObject.setColor(C:TColor);
  Begin
    Color:=C;
  end;

 procedure TColorObject.ObjMouseEntered(X,Y,dx,dy:integer);
  Begin
    setColor(CActiveColor);
  end;

  procedure TColorObject.ObjMouseExited(X,Y,dx,dy:integer);
  Begin
    setColor(CPasiveColor);
  end;

  procedure TColorObject.onAdd(Mybox:TMainBox);
  Begin
  end;

  procedure TColorObject.onRem(Mybox:TMainBox);
  Begin
  end;


  procedure TColorObject.ObjMouseRelased(X,Y,dx,dy:integer);
  Begin
    setXY(X,Y);
    setColor(CPasiveColor);
  end;

  procedure TColorObject.ObjMouseDrug(X,Y,dx,dy:integer);
  Begin
    setXY(X,Y);
  end;

  procedure TColorObject.setXY(X,Y:integer);
  Begin
  end;

  procedure TColorObject.paint(G:TCanvas);
  Begin
    inherited paint(G);
    g.Brush.Style:=bsClear;
    G.Pen.Width:=CPenWidth;
    G.Pen.Color:=Color;
  end;

  function TColorObject.onMe(x,y:integer):boolean;
  Begin
    onMe:=false;
  end;

  procedure TColorObject.setSelected(NSelected:boolean);
  Begin
    Selected:=NSelected;
  end;

  constructor TColorObject.Builder(var Data:AnsiString;MOwner:TSurface);
  Begin
    inherited Create;
    MOwner.MyBox.Add(self);
    Color:=CPasiveColor;
  end;

  constructor TColorObject.Create;
  Begin
    inherited;
    Color:=CPasiveColor;
  end;

  destructor TColorObject.dertroy(MOwner:TMainBox);
  begin
    MOwner.Del(self);
    inherited destroy(MOwner);
  end;

// TColorObject end

//TElement Begin

  function TElement.getX:integer;
  Begin
    getX:=x_;
  end;

  function TElement.getY:integer;
  Begin
    getY:=y_;
  end;

  procedure TElement.setXY(x,y:integer);
  Begin
    x_:=x;
    y_:=y;
  end;

  function TElement.getData(MOwner:TMainBox):AnsiString;
  Begin
    getData:='<'+IntToStr(x_)+','+IntToStr(y_)+'>';
  end;

//TElement End

//TNode begin
  procedure TNode.AddLine(MLine:TLine);
  Begin
    MyLines.Add(MLine)
  end;

  procedure TNode.DelLine(MLine:TLine);
  Begin
    MyLines.Remove(MLine);
  end;

  function TNode.LineNumOut:integer;
  Var i,s:word;P:TLine;
  Begin
    i:=1;
    s:=0;
    while i<=MyLines.Count do begin
      P:=MyLines.Items[i-1];
      if P.NB=self then begin
        s:=s+1;
        break;
      end;

      i:=i+1;
    end;
    LineNumOut:=s;

  end;

  procedure TNode.STEP;
  Begin
  end;

  procedure TNode.paint(G:TCanvas);
  Begin
    inherited paint(G);
    G.TextOut(x_-G.TextWidth(Name)div 2,y_-G.TextHeight(Name)-3+CTTHeight div 2,Name);
   // G.TextOut(x_-G.TextWidth(Name)div 2,y_-G.TextHeight(Name) div 2-h+CTTHeight div 2,Name);
   // G.TextOut(x_-G.TextWidth(Name)div 2,y_-CTRHeight-G.TextHeight(Name),Name);
  end;

  function TNode.getData(MOwner:TMainBox):AnsiString;
  Begin
    getData:=(inherited getData(MOwner))+Name+',';
  end;


  function TNode.getX1:integer;
  Begin
    getX1:=getX;
  end;

  function TNode.getY1:integer;
  Begin
    getY1:=getY+CTRHeight;
  end;

    function TNode.getXin:integer; begin
      getXin:=getX;
    end;

    function TNode.getYin:integer; begin
      getYin:=getY-CTRHeight;
    end;



  constructor TNode.Builder(var Data:AnsiString;MOwner:TSurface);
  Var l1,l2:word;
  Begin
    inherited Builder(Data,MOwner);
    MyLines:=TList.Create;
    setXY(StrToInt(getSubString(Data,'<',',',l1)),StrToInt(getSubString(Data,',','>',l2)));
    Data:=AnsiMidStr(Data,l2+1,Length(Data)-l2);
    //
    Name:=getsubstring(Data,'_',',',l1);
    Data:=AnsiRightStr(Data,Length(Data)-l1);
  end;

  constructor TNode.Create;
  Begin
    inherited;
    MyLines:=TList.Create;
    Name:='';
  end;

  destructor TNode.Destroy(MOwner:TMainBox);
  Var
    P:TLine;
  Begin
    if MyLines<>nil then begin
    while 0<MyLines.Count do begin
      P:=MyLines.Items[0];
      P.Destroy(MOwner);
    end;
    MyLines.Destroy;
    MyLines:=nil;
    MOwner.Del(self);
    inherited Destroy(MOwner);
    end;
  end;

//TNode end

//TP Begin

  procedure TP.ObjLeftClick(X,Y:integer);
  Begin
   // P:=P+1;
  end;

  procedure TP.ObjRightClick(X,Y:integer);
  Begin
 //   if P>0 then
 //     P:=P-1;
  end;

  procedure TP.paint(G:TCanvas);
  Begin
    inherited paint(G);
    G.Ellipse(x_-CTPWidth,y_-CTPHeight,x_+CTPWidth,y_+CTPHeight);

  end;

  function TP.onMe(x,y:integer):boolean;
  Begin
    onMe:=((x>x_-CTPWidth)and(x<x_+CTPWidth)and(y>y_-CTPHeight)and(y<y_+CTPHeight));
    //onMe:=((x_-x)*(x_-x)+(y_-y)*(y_-y)<CTPDiametr*CTPDiametr);
  end;

//  function TP.getData(MOwner:TMainBox):AnsiString;
  //Begin

//  end;

  constructor TP.Builder(var Data:AnsiString;MOwner:TSurface);
  Var l1:word;S:string;
  Begin
    inherited Builder(Data,MOwner);
    S:=getsubstring(Data,'_','/',l1);
    Data:=AnsiRightStr(Data,Length(Data)-l1);
   // P:=StrToInt(S);
  end;

  constructor TP.Create;//(MOwner:TSurface);
  Begin
    inherited Create;
  end;

//TP End

//TRT Begin


//TRT End

 constructor TBegin.Create;//(MOwner:TSurface);
 Begin
  inherited;
  Name:='Begin';
 end;

 function TBegin.getData(MOwner:TMainBox):AnsiString;
 Begin
   getData:='B'+(inherited getData(MOwner)){+IntToStr(P)}+'/';
 end;


 constructor TEnd.Create;//(MOwner:TSurface);
 Begin
  inherited;
  Name:='End';
 end;

 function TEnd.getData(MOwner:TMainBox):AnsiString;
 Begin
   getData:='E'+(inherited getData(MOwner)){+IntToStr(P)}+'/';
 end;


  procedure TRT.ObjDblClick(X,Y:integer);begin
    inherited objDblClick(x,y);
    Name:=InputBox('Input Box', 'Input value of the box', 'x');
  end;

//TT Begin
  function TT.onMe(x,y:integer):boolean;
  Begin
    onMe:=((x>x_-CTRWidth)and(x<x_+CTRWidth)and(y>y_-CTRHeight)and(y<y_+CTRHeight));
  end;

  procedure TT.paint(G:TCanvas);
  Begin
    inherited paint(G);
    G.Polygon([Point(x_-CTRWidth, y_-CTRHeight), Point(x_-CTRWidth, y_+CTRHeight),Point(x_+CTRWidth, y_+CTRHeight), Point(x_+CTRWidth, y_-CTRHeight)]);
  end;

  function TT.getData(MOwner:TMainBox):AnsiString;
  Begin
    getData:='T'+(inherited getData(MOwner))+FloatToStr({T}0)+'/';
  end;

  constructor TT.Builder(var Data:AnsiString;MOwner:TSurface);
  Var l1:word;S:string;
  Begin
    inherited Builder(Data,MOwner);
    S:=getsubstring(Data,'_','/',l1);
    Data:=AnsiRightStr(Data,Length(Data)-l1);
 //   T:=StrToFloat(S);
  end;

  constructor TT.Create(MOwner:TSurface);
  Begin
    inherited Create;
    Name:='Y';
  end;

//TT End
  function TElNode.getX1:integer;  Begin
    getX1:=getX+CTRWidth;
  end;

  function TElNode.getY1:integer;   Begin
    getY1:=getY;
  end;

  procedure TElNode.paint(G:TCanvas);
  Begin
    inherited paint(G);
    G.Polyline([Point(x_+CTRWidth div 2, y_ - CTRHeight div 2), Point(x_+CTRWidth, y_),Point(x_, y_+CTRHeight), Point(x_-CTRWidth div 2, y_+CTRHeight div 2)]);
  //  Owner.paint(G);
  end;

  function TElNode.onMe(x,y:integer):boolean;
  Begin
    onMe:=(((x_-x)<(y-y_)*CTRWidth/CTRHeight)and(x<x_+CTRWidth)and(y<y_+CTRHeight));
  end;

 procedure TElNode.setXY(x,y:integer);
 Var x_,y_:integer;
 Begin
  x_:=getX;
  y_:=getY;
  inherited setXY(x,y);
  if (x<>x_)or(y<>y_) then
   Owner.setXY(x,y);
 end;

  function TElNode.getData(MOwner:TMainBox):AnsiString;
  Begin
    getData:='';
  end;

  destructor TElNode.destroy(MOwner:TMainBox);
  begin
    inherited destroy(MOwner);
    if Owner<>nil then begin
      Owner.ElseNode:=nil;
      Owner.Destroy(MOwner);
    end;
  end;

//TR Begin
  function TR.onMe(x,y:integer):boolean;
  Begin
    onMe:=((x>x_-CTRWidth)and(x<x_+CTRWidth)and(y>y_-CTRHeight)and(y<y_+CTRHeight)and((x_-x)>(y-y_)*CTRWidth/CTRHeight));
//    onMe:=((x>x_-CTRWidth)and(x<x_+CTRWidth)and(y>y_-CTRHeight)and(y<y_+CTRHeight));
  end;

  procedure TR.paint(G:TCanvas);
  Begin
    inherited paint(G);
    G.Polyline([Point(x_+CTRWidth div 2, y_ - CTRHeight div 2), Point(x_, y_-CTRHeight),Point(x_-CTRWidth, y_), Point(x_-CTRWidth div 2, y_+CTRHeight div 2)]);
    //(ElseNode as TNode).paint(G);

  end;

  procedure TR.setXY(x,y:integer);
  Var x_,y_:integer;
  Begin
    x_:=getX;
    y_:=getY;
    inherited setXY(x,y);
    if (x<>x_)or(y<>y_) then
      ElseNode.setXY(x,y);
  end;

  function TR.getData(MOwner:TMainBox):AnsiString;
  Begin
    getData:='I'+(inherited getData(MOwner))+'/';
  end;

  procedure TR.onAdd(Mybox:TMainBox);
  Begin
    MyBox.Add(ElseNode);
  end;

  procedure TR.onRem(Mybox:TMainBox);
  Begin
    if ElseNode<>nil then begin
      ElseNode.Owner:=nil;
      ElseNode.destroy(MyBox);
      ElseNode:=nil;
    end;
  end;

  constructor TR.Builder(var Data:AnsiString;MOwner:TSurface);
  Var l1:word;
  Begin
    ElseNode:=TElNode.Create;
    ElseNode.Owner:=self;
    inherited Builder(Data,MOwner);
    getsubstring(Data,'_','/',l1);
    Data:=AnsiRightStr(Data,Length(Data)-l1);
    ElseNode.setXY(getX,getY);
  end;

  constructor TR.Create(MOwner:TSurface);
  Begin
    inherited Create;
    ElseNode:=TElNode.Create;
    ElseNode.Owner:=self;
    Name:='X';
  end;

 //destructor TR.destroy(MOwner:TSurface);begin
 // inherited destroy(MOwner);
  
 //end;

//TR End



//TLine Begin
  procedure TLine.setNB(NNB:TNode);
  Begin
    NB:=NNB;
    if NB<>nil then
      NB.AddLine(self);
  end;

  procedure TLine.setNE(NNE:TNode);
  Begin
    NE:=NNE;
    if NE<>nil then
      NE.AddLine(self);
  end;

  function TLine.getNB:TNode;
  Begin
    getNB:=NB;
  end;

  function TLine.getNE:TNode;
  Begin
    getNE:=NE;
  end;

  procedure TLine.AddNode(N:TMarker);
  Begin
    MyLines.Add(N);
  end;

  procedure TLine.DelNode(N:TMarker;MOwner:TMainBox);
  Begin
    MyLines.Remove(N);
    if MyLines.Count=0 then
      Destroy(MOwner);
  end;

  procedure TLine.paint(G:TCanvas);
    procedure DrawArrow(x1,y1,x2,y2:integer;G:TCanvas);
    Var xo,yo,l:real;
    Begin
      inherited paint(G);
      G.Pen.Color:=CLineColor;
      with G do begin
        G.MoveTo(x1,y1);
        xo:=(x1+x2)/2;
        yo:=(y1+y2)/2;
        l:=sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
        if l>3 then begin
          G.LineTo(Round(xo+6*(x2-x1)/l),Round(yo+6*(y2-y1)/l));
          G.LineTo(Round(xo+6*((-x2+x1)*2-y2+y1)/l),Round(yo+6*((-y2+y1)*2+x2-x1)/l));
          G.LineTo(Round(xo+6*((-x2+x1)*2+y2-y1)/l),Round(yo+6*((-y2+y1)*2-x2+x1)/l));
          G.LineTo(Round(xo+6*(x2-x1)/l),Round(yo+6*(y2-y1)/l));
        end;
        G.LineTo(x2,y2);
      end;
    end;
  Var
    i:word;
    P:TMarker;
    x1,x2,y1,y2:integer;
  Begin
    inherited paint(G);
    if (NB<>nil)then begin
      x2:=NB.getX1;
      y2:=NB.getY1;
      with MyLines do begin
        if Count>0 then begin
          i:=1;
          while i<=Count do begin
            P:=Items[i-1];
            x1:=x2;
            y1:=y2;
            x2:=P.getX;
            y2:=P.getY;
            DrawArrow(x1,y1,x2,y2,G);
            i:=i+1;
          end;
        end;
      end;
      if NE<>nil then if (NE is TRT) then begin
        DrawArrow(x2,y2,NE.getXin,NE.getYin,G);
      end else if (NE is TEnd) then
        DrawArrow(x2,y2,NE.getXin,NE.getYin,G);
    end;
  end;

  function TLine.getData(MOwner:TMainBox):AnsiString;
  Var
    i,j:word;
    M:TMarker;
    S:AnsiString;
    P:TColorObject;
  Begin
    i:=1;
    S:='L<';
    while i<=MyLines.Count do begin
      M:=MyLines.Items[i-1];
      S:=S+M.getData(MOwner);//+',';
      i:=i+1;
    end;
    
    i:=1;
    j:=0;
    with MOwner.MyObjects do begin
      repeat
        P:=Items[i-1];
        if P is TNode then
          j:=j+1;
        i:=i+1;
      until (NB=P);
    end;
    S:=S+IntToStr(j)+',';

    i:=1;
    j:=0;
    with MOwner.MyObjects do begin
      repeat
        P:=Items[i-1];
        if P is TNode then
          j:=j+1;
        i:=i+1;
      until (NE=P);
    end;
    S:=S+IntToStr(j)+'>/';
    getData:=S;
  end;

  constructor TLine.Builder(var Data:AnsiString;MOwner:TSurface);
  Var l1:word;S:string;
  Begin
    inherited Builder(Data,MOwner);
    MyLines:=TList.Create;
    Data:=AnsiRightStr(Data,Length(Data)-2);
    while true do begin
      case Data[1] of
        'M':TMarker.Builder(Data,MOwner,self);
      else
        break;
      end;
    end;
    NB:=MOwner.MyBox.MyObjects.Items[StrToInt(getsubstring(Data,'_',',',l1))-1];
    NE:=MOwner.MyBox.MyObjects.Items[StrToInt(getsubstring(Data,',','>',l1))-1];

    NB.AddLine(self);
    NE.AddLine(self);
    Data:=AnsiRightStr(Data,Length(Data)-l1);
    //
    S:=getsubstring(Data,'_','/',l1);
    Data:=AnsiRightStr(Data,Length(Data)-l1);
  end;

  constructor TLine.Create;
  Begin
    inherited;
    MyLines:=TList.Create;
  end;

  destructor TLine.Destroy(MOwner:TMainBox);
  Var P:TMarker;
  Begin
    while MyLines.Count<>0 do begin
      P:=MyLines.Items[0];
      P.OwnerL:=nil;
      MyLines.Remove(P);
      P.Destroy(MOwner);
    end;
    if NB<>nil then
      NB.DelLine(self);

    if NE<>nil then
      NE.DelLine(self);

    if MOwner<>nil then
      MOwner.Del(self);
    inherited;
  end;
//TLine End

//TMarker Begin
  procedure TMarker.paint(G:TCanvas);
  Begin
    inherited paint(G);
    G.Rectangle(Rect(x_-CTMWidthHeight,y_-CTMWidthHeight,x_+CTMWidthHeight,y_+CTMWidthHeight));
  end;

  function TMarker.onMe(x,y:integer):boolean;
  Begin
    onMe:=((x>x_-CTMWidthHeight)and(x<x_+CTMWidthHeight)and(y>y_-CTMWidthHeight)and(y<y_+CTMWidthHeight));
  end;

  function TMarker.getData(MOwner:TMainBox):AnsiString;
  Begin
    getData:='M'+(inherited getData(MOwner));
  end;

  constructor TMarker.Builder(var Data:AnsiString;MOwner:TSurface;NOwnerL:TLine);
  Var l1,l2:word;
  Begin
    inherited Builder(Data,MOwner);
    NOwnerL.AddNode(self);
    OwnerL:=NOwnerL;
    setXY(StrToInt(getSubString(Data,'<',',',l1)),StrToInt(getSubString(Data,',','>',l2)));
    Data:=AnsiMidStr(Data,l2+1,Length(Data)-l2);
  end;

  constructor TMarker.Create(NOwnerL:TLine);
  Begin
    inherited Create;
    OwnerL:=NOwnerL;
  end;

  destructor TMarker.Destroy(MOwner:TMainBox);
  Begin
    if OwnerL<>nil then
      OwnerL.DelNode(self,MOwner);
    if MOwner<>nil then
      MOwner.Del(self);
    inherited;
  end;

//TMarker End

//TMainBox Begin
  function TMainBox.getSelected(X,Y:integer):TColorObject;
  var i:word;P:TColorObject;
  Begin
    P:=nil;
    i:=1;
    while i<=MyObjects.Count do begin
      P:=MyObjects.Items[i-1];
      if P.onMe(X,Y) then
        break;
      i:=i+1;
    end;
    if i>MyObjects.Count then
      P:=nil;
    getSelected:=P;
  end;

  function TMainBox.isBegin:integer;
  Var i,q,j:word;P:TObj;
  Begin
    i:=1;
    j:=0;
    q:=MyObjects.Count;
    while i<=q do begin
      P:=MyObjects.Items[i-1];
      if (P is TBegin)then
        j:=j+1;
      i:=i+1;
    end;
    isBegin:=j;
  end;

  function TMainBox.isEnd:integer;
  Var i,q,j:word;P:TObj;
  Begin
    i:=1;
    j:=0;
    q:=MyObjects.Count;
    while i<=q do begin
      P:=MyObjects.Items[i-1];
      if (P is TEnd)then
        j:=j+1;
      i:=i+1;
    end;
    isEnd:=j;
  end;

  procedure TMainBox.ObjMouseMove(X,Y,dx,dy:integer);
  Begin
    Selected:=getSelected(X,Y);
  end;

  function TMainBox.getSelected:TColorObject;
  Begin
    getSelected:=Selected;
  end;

  procedure TMainBox.Add(Obj:TColorObject);
  Begin
    MyObjects.Add(Obj);
    Obj.onAdd(self);
  {  if(Obj is TP)then begin
      PN:=PN+1;
      PS:=PS+1;
      (Obj as TNode).Name:=(Obj as TNode).Name+IntToStr(PS);
    end else if(Obj is TRT)then begin
      RTN:=RTN+1;
      RTS:=RTS+1;
      (Obj as TNode).Name:=(Obj as TNode).Name+IntToStr(RTS);
    end; }
  end;

  procedure TMainBox.Del(Obj:TColorObject);
  Begin
    MyObjects.Remove(Obj);
    Obj.onRem(self);
  end;

  function TMainBox.Count:word;
  Begin
    Count:=MyObjects.Count;
  end;

  function TMainBox.getObj(i:word):TColorObject;
  Begin
    if i<=MyObjects.Count then
      getObj:=MyObjects.Items[i-1]
    else
      getObj:=nil;
  end;

  function TMainBox.getP(i:word):TP;
  Var j,k:word;P:TNode;
  Begin
    j:=1;
    k:=0;
    P:=nil;
    with MyObjects do begin
      while(j<=Count)and(k<>i)do begin
        P:=Items[j-1];
        if(P is TP)then
          k:=k+1;
        j:=j+1;
      end;
      if k=i then
        getP:=P as TP
      else
        getP:=nil;
    end;
  end;

  function TMainBox.getRT(i:word):TRT;
  Var j,k:word;P:TNode;
  Begin
    j:=1;
    k:=0;
    P:=nil;
    with MyObjects do begin
      while(j<=Count)and(k<>i)do begin
        P:=Items[j-1];
        if(P is TRT)then
          k:=k+1;
        j:=j+1;
      end;
      if k=i then
        getRT:=P as TRT
      else
        getRT:=nil;
    end;
  end;

  function TMainBox.STEP:TM;
  Var i:word;
  Begin
    i:=1;
    while i<=PN do begin
      getP(i).STEP;
      i:=i+1;
    end;
    STEP:=getMarking;
  end;

  function TMainBox.Connected(N1,N2:TNode):integer;
  Var i,j,q:word;P:TLine;
  Begin
    i:=1;
    j:=0;
    q:=N1.MyLines.Count;
    while i<=q do begin
      P:=N1.MyLines.Items[i-1];
      if (P.NB=N1)and(P.NE=N2)then begin
        j:=1;
        break;
      end else
      i:=i+1;
    end;
    if (i>q)and(N1 is TR) then begin
      q:=(N1 as TR).ElseNode.MyLines.Count;
      i:=1;
      while i<=q do begin
        P:=(N1 as TR).ElseNode.MyLines.Items[i-1];
        if (P.NB=(N1 as TR).ElseNode)and(P.NE=N2)then begin
          j:=2;
          break;
        end else
        i:=i+1;
      end;
    end;
    Connected:=j;
  end;


{
  function TMainBox.Connected(N1,N2:TNode):word;
  Var i,j:word;P:TLine;
  Begin
    j:=0;
    i:=1;
    with N1.MyLines do begin
      while i<=Count do begin
        P:=Items[i-1];
        if P.NE=N2 then
          j:=j+1;
        i:=i+1;
      end;
      Connected:=j;
    end;
  end;
}

  procedure TMainBox.Paint(G:TCanvas);
  Var i:word;P:TColorObject;
  Begin
    inherited paint(G);
    i:=1;
    while i<=MyObjects.Count do begin
      P:=MyObjects.Items[i-1];
      P.paint(G);
      i:=i+1;
    end;
  end;

  function TMainBox.getData(MOwner:TMainBox):AnsiString;
  Var
    i:word;
    P:TColorObject;
    S:AnsiString;
  Begin
    S:='MB<';
    i:=1;
    while i<=MyObjects.Count do begin
      P:=MyObjects.Items[i-1];
      if not (P is TMarker) and not(P is TLine)then
        S:=S+P.getData(MOwner);//+',';
      i:=i+1;
    end;
    i:=1;
    while i<=MyObjects.Count do begin
      P:=MyObjects.Items[i-1];
      if P is TLine then
        S:=S+P.getData(MOwner);//+',';
      i:=i+1;
    end;
    S:=S+'0'+','+'0'+'>';
    getData:=S;
  end;

  procedure TMainBox.Clear(MOwner:TSurface);
  Var P:TColorObject;i:word;
  Begin
    MOwner.SetTool(TTArrow.Create(MOwner));
    i:=1;
    with MyObjects do begin
      while i<=MyObjects.Count do begin
        P:=MyObjects.Items[i-1];
        P.Destroy(MOwner.MyBox);
        i:=i+1;
      end;
    end;
    PN:=0;
//    PS:=0;
    RTN:=0;
  //  RTS:=0;
    MyObjects.Clear;
  end;

  function TMainBox.getMarking:TM;
  Var NM:TM;i:word;
  Begin
    NM:=TM.Create(PN);
    i:=1;
    while i<=PN do begin
   //   NM.M[i-1]:=getP(i).P;
      i:=i+1;
    end;
    getMarking:=NM;
  end;

  procedure TMainBox.Builder(var Data:AnsiString;MOwner:TSurface);
  Var l1:word;
  Begin
    Clear(MOwner);
    Data:=AnsiMidStr(Data,4,Length(Data)-3);
    while Length(Data)>0 do begin
      case Data[1] of
        'T':TT.Builder(Data,MOwner);
        'B':TBegin.Builder(Data,MOwner);
        'E':TEnd.Builder(Data,MOwner);
        'I':TR.Builder(Data,MOwner);
        'L':TLine.Builder(Data,MOwner);
      else
        PN:=StrToInt(getsubstring(Data,'_',',',l1));
        Data:=AnsiRightStr(Data,Length(Data)-l1);
        RTN:=StrToInt(getsubstring(Data,'_','>',l1));
        Data:=AnsiRightStr(Data,Length(Data)-l1);
        break;
      end;
    end;

  end;


  function TMainBox.Check:boolean;
  Begin
    check:=not((isBegin=1)and(isEnd=1));
  end;

  constructor TMainBox.Create;
  Begin
    inherited;
    PN:=0;
    RTN:=0;
    MyObjects:=TList.Create;
  end;

  destructor TMainBox.Destroy(MOwner:TSurface);
  Var P:TColorObject;i:word;
  Begin
    i:=1;
    with MyObjects do begin
      while i<=MyObjects.Count do begin
        P:=MyObjects.Items[i-1];
        P.Destroy(MOwner.MyBox);
        i:=i+1;
      end;
    end;
    MyObjects.Destroy;
    MOwner.MyBox:=nil;
    //inherited Destroy(MOwner);
  end;

//TMainBox End

//TTool Begin

 constructor TTool.Create(NOwner:TSurface);
 Begin
  inherited Create;
  Owner:=NOwner;
 end;

 destructor TTool.Destroy;
 Begin
  inherited;
   Owner.MyTool:=TTArrow.Create(Owner);
 end;

//TTool End

//TTArrow Begin

  procedure TTArrow.ObjLeftClick(X,Y:integer);
  var P:TColorObject;
  Begin
    P:=Owner.MyBox.getSelected(X,Y);
    if P<>nil then
      P.ObjLeftClick(X,Y);
  end;

  procedure TTArrow.ObjRightClick(X,Y:integer);
  var P:TColorObject;
  Begin
    P:=Owner.MyBox.getSelected(X,Y);
    if P<>nil then
      P.ObjRightClick(X,Y);
  end;

  procedure TTArrow.ObjDblClick(X,Y:integer);
  var P:TColorObject;
  Begin
    P:=Owner.MyBox.getSelected(X,Y);
    if P<>nil then
      P.ObjDblClick(X,Y);
  end;

  procedure TTArrow.ObjMouseMove(X,Y,dx,dy:integer);
  var P,Q:TColorObject;j:word;
  Begin
    Owner.MyBox.ObjMouseMove(X,Y,dx,dy);
    P:=Owner.MyBox.getSelected;
    if P<>nil then begin
      P.ObjMouseMove(X,Y,dx,dy);
      if not P.onMe(X-dx,Y-dy) then
        P.ObjMouseEntered(X,Y,dx,dy);
    end;
    j:=1;
    with Owner.MyBox do begin
      while j<=Count do begin
        Q:=getObj(j);
        if (Q<>P)and Q.onMe(X-dx,Y-dy) then
          Q.ObjMouseExited(X,Y,dx,dy);
        j:=j+1;
      end;
    end;
  end;

  procedure TTArrow.ObjMouseDrug(X,Y,dx,dy:integer);
  var P:TColorObject;
  Begin
    with Owner.MyBox do begin
      P:=getSelected(X,Y);
      if P<>nil then
        P.ObjMouseDrug(X,Y,dx,dy)
      else begin
        P:=getSelected(X-dx,Y-dy);
        if P<>nil then
          P.ObjMouseDrug(X,Y,dx,dy)
      end;
    end;
  end;

  procedure TTArrow.ObjMouseDown(X,Y:integer);
  var P:TColorObject;
  Begin
    P:=Owner.MyBox.getSelected(X,Y);
    if P<>nil then
      P.ObjMouseDown(X,Y);
  end;

  procedure TTArrow.ObjMouseUp(X,Y:integer);
  var P:TColorObject;
  Begin
    P:=Owner.MyBox.getSelected(X,Y);
    if P<>nil then
      P.ObjMouseUp(X,Y);
  end;

 constructor TTArrow.Create(NOwner:TSurface);
 Begin
  inherited Create(NOwner);
 end;

  destructor TTArrow.Destroy;
  Begin
    inherited;
  end;

//TTArrow End

//TTDelete Begin
  procedure TTDelete.ObjLeftClick(X,Y:integer);
  Var P:TColorObject;
  Begin
    P:=Owner.MyBox.getSelected(X,Y);
    if P<>nil then begin
      P.Destroy(Owner.MyBox);
    end;
    Destroy;
  end;

  destructor TTDelete.Destroy;
  Begin
   Owner.MyTool:=TTArrow.Create(Owner);
  end;

//TTDelete Begin

//TTNodeBuilder Begin

  procedure TTNodeBuilder.paint(G:TCanvas);
  Begin
    MyNode.paint(G);
  end;

  procedure TTNodeBuilder.ObjMouseMove(X,Y,dx,dy:integer);
  Begin
   // Owner.MyBox.ObjMouseMove(X,Y,dx,dy);
    MyNode.setXY(X,Y);
  end;

  procedure TTNodeBuilder.ObjLeftClick(X,Y:integer);
  Begin
    Owner.MyBox.Add(MyNode);
    MyNode:=nil;
    Destroy;
  end;

  constructor TTNodeBuilder.Create(NNode:TNode;NOwner:TSurface);
  Begin
    inherited Create(NOwner);
    MyNode:=NNode;
  end;

  destructor TTNodeBuilder.Destroy;
  Begin
    if MyNode<>nil then
      MyNode.Destroy(Owner.MyBox);
    inherited;
  end;
//TTNodeBuilder End

  procedure TTIfBuilder.paint(G:TCanvas);
  Begin
    inherited paint(G);
    (MyNode as TR).ElseNode.paint(G);
  end;

//TTLineBuilder Begin

  procedure TTLineBuilder.onLCL1(N:TNode;x,y:integer);
  Begin
    if (N<>nil)and(not (N is TEnd))and(N.LineNumOut=0) then begin
      MyLine.setNB(N);
      onLCL:=onLCL2;
    end;
  end;

  procedure TTLineBuilder.onLCL2(N:TNode;x,y:integer);
  Var
    NN:TNode;M:TMarker;
  Begin
    if N=nil then begin
      M:=TMarker.Create(MyLine as TLine);
      MyN.Add(M);
      M.setXY(x,y);
      MyLine.AddNode(M);
      NN:=MyLine.getNB;
      if(NN is TRT)or((NN is TBegin))or(NN is TElNode) then
        onLCL:=onLCLT;
    end;
  end;

  procedure TTLineBuilder.onLCLP(N:TNode;x,y:integer);
  Var
    M:TMarker;
  Begin
    if N<>nil then begin
      if not(N is TP)then begin
        MyLine.setNE(N);
        Owner.MyBox.Add(MyLine);
        MyLine:=nil;
        Owner.SetTool(TTLineBuilder.Create(Owner));
      end;
    end else begin
      M:=TMarker.Create(MyLine as TLine);
      MyN.Add(M);
      M.setXY(x,y);
      MyLine.AddNode(M);
    end;
  end;

  procedure TTLineBuilder.onLCLT(N:TNode;x,y:integer);
  Var
    M:TMarker;
  Begin
    if N<>nil then begin
      if(N is TEnd)or(N is TRT) then begin
        MyLine.setNE(N);
        Owner.MyBox.Add(MyLine);
        MyLine:=nil;
        Owner.SetTool(TTLineBuilder.Create(Owner));
      end
    end else begin
      M:=TMarker.Create(MyLine as TLine);
      MyN.Add(M);
      M.setXY(x,y);
      MyLine.AddNode(M);
    end;
  end;

  procedure TTLineBuilder.onLCLR(N:TNode;x,y:integer);
  Var
    M:TMarker;
  Begin
    if N<>nil then begin
      if (N is TP)then begin
        MyLine.setNE(N);
        Owner.MyBox.Add(MyLine);
        MyLine:=nil;
        Owner.SetTool(TTLineBuilder.Create(Owner));
      end;
    end else begin
      M:=TMarker.Create(MyLine as TLine);
      MyN.Add(M);
      M.setXY(x,y);
      MyLine.AddNode(M);
    end;
  end;

  procedure TTLineBuilder.ObjLeftClick(X,Y:integer);
  Begin
    with Owner.MyBox do
      if (getSelected is TNode)or(getSelected=nil) then
        onLCL(getSelected as TNode,X,Y);
  end;

  procedure TTLineBuilder.ObjMouseMove(X,Y,dx,dy:integer);
  Begin
    Owner.MyBox.ObjMouseMove(X,Y,dx,dy);
  end;

  procedure TTLineBuilder.ObjRightClick(X,Y:integer);
  Begin
    Destroy;
  end;

  procedure TTLineBuilder.paint(G:TCanvas);
  Var i:word;P:TMarker;
  Begin
    MyLine.paint(G);
    i:=1;
    with MyN do begin
      while i<=Count do begin
        P:=Items[i-1];
        P.paint(G);
        i:=i+1;
      end;
    end;
  end;

  constructor TTLineBuilder.Create(NOwner:TSurface);
  Begin
    inherited Create(NOwner);
    MyLine:=TLine.Create;
    MyN:=TList.Create;
    onLCL:=onLCL1;
  end;

  destructor TTLineBuilder.Destroy;
  Var i:word;
  Begin
    if MyLine=nil then begin
      i:=1;
      with Owner.MyBox do begin
        while i<=MyN.Count do begin
          Add((MyN.Items[i-1]));
          i:=i+1;
        end;
      end;
    end else
      MyLine.Destroy(nil);
    MyN.Destroy;
    inherited;
  end;

//TTLineBuilder End

//TSurface Begin

    procedure TSurface.paint;
    Begin
      inherited;
      Canvas.Brush.Color:=clWhite;
      Canvas.FillRect(Rect(0,0,Width,Height));
      MyBox.Paint(Canvas);
      if MyTool<>nil then
        MyTool.Paint(Canvas);
    end;

    procedure TSurface.SetTool(NewTool:TTool);
    Begin
      if @MyTool<>nil then
        MyTool.Destroy;
      MyTool:=NewTool;
    end;

    procedure TSurface.updateMatrix;
    Var i,j,nq,nb,kk:word;P:TNode;NA:array of TNode;PP:TObj;
      function getCode(i:integer):integer;
      Begin
        getCode:=(i shr 1)xor i;
      end;

      function subline(ii,ii2:integer):boolean;
      Var i,j,t,kk2,xx,xm,xn,ib:integer;
      Begin
        if (MI2[ii][Length(MI2[ii])-1]<0) then begin
          kk2:=kk;
          MI2[ii][Length(MI2[ii])-1]:=getCode(kk);
          kk:=kk+1;
          if (MI[ii][0]<>2) then begin
            i:=1;
            t:=0;
            while i<=Length(MI) do begin
              if MI[ii][i]>0 then begin
                if t=1 then
                  kk:=(Round(Power(2,2+Int(Ln(kk)/Ln(2)))))-1-kk2
                else
                 t:=1;
                Subline(i-1,ii);
              end;
              i:=i+1;
            end;
          end;
        end else begin
          xn:=MI2[ii2][Length(MI2[ii2])-1];
          xx:=xn xor MI2[ii][Length(MI2[ii])-1];
          i:=0;
          xm:=1;
          while xm>0  do begin
           if xm and xx>0 then begin
             i:=i+1;
             if i>=2 then break;
           end;
           xm:=xm shl 1;
           i:=i+1;
          end;
          //xn:=xn and (not xx);
//          t:=0;
          if i>=2 then begin
            xm:=1;
            ib:=Length(MI2);
            while xm>0 do begin
              if (xx and xm>0) then begin

                xn:=xn xor (xx and xm);
                if (MI2[ii2][Length(MI2[ii2])-1]<>xn)and(MI2[ii][Length(MI2[ii])-1]<>xn) then begin
//              addnode(xn);
                j:=Length(MI2)+1;
                SetLength(MI2,j);
                SetLength(MI2[0],Length(MI2[0])+1);
                i:=1;
                while i<=j do begin
                  SetLength(MI2[i-1],Length(MI2[0]));
                  MI2[i-1][Length(MI2[i-1])-1]:=MI2[i-1][Length(MI2[i-1])-2];
                  MI2[i-1][Length(MI2[i-1])-2]:=0;
                  i:=i+1;
                end;
                i:=2;
                while i<=Length(MI2[j-1])-1 do begin
                  MI2[j-1][i]:=0;
                  i:=i+1;
                end;
                MI2[j-1][0]:=5;
                // MI2[j-1][j-2]:=1;
                MI2[j-1][Length(MI2[j-1])-1]:=xn;
//              MI2[i-1][Length(MI2[i-1])-2]:=0;
              end;

            end;
            xm:=xm shl 1;


          end;
            if MI2[Length(MI2)-1][0]=5 then begin
              MI2[Length(MI2)-1][ii+1]:=1;

              if MI2[ii2][ii+1]=1 then
                MI2[ii2][ib+1]:=1
              else if MI2[ii2][ii+1]=2 then
                MI2[ii2][ib+1]:=2;
              MI2[ii2][ii+1]:=0;

              i:=ib;
              while i<=Length(MI2)-2 do begin
                MI2[i][i+2]:=1;
                i:=i+1;
              end;
            end;
           end;
        end;
      end;

    Begin
      SetLength(Mili1,0);
      SetLength(Mili2,0);
      if MyBox.MyObjects.Count>0 then begin
        i:=1;
        nq:=0;
        nb:=0;
        while i<=MyBox.MyObjects.Count do begin
          PP:=MyBox.MyObjects.Items[i-1];
          if (PP is TNode)and not(PP is TElNode) then begin
            P:=PP as TNode;
            nq:=nq+1;
            SetLength(MI,nq);
            SetLength(NA,nq);
            NA[Length(NA)-1]:=P;
            SetLength(MI[nq-1],1);
            SetLength(Mark,nq);

            if P is TBegin then begin
              nb:=nq-1;
              MI[nq-1][0]:=1;
            end else
            if P is TEnd then begin
              MI[nq-1][0]:=2;
            end else
            if P is TR then begin
              MI[nq-1][0]:=3;
            end else
            if P is TT then begin
              MI[nq-1][0]:=4;
            end;
          end;
          i:=i+1;
        end;
      //mili
        i:=1;
        while i<=nq do begin
          SetLength(MI[i-1],nq+1);
          j:=1;
          while j<=nq do begin
            MI[i-1][j]:=MyBox.Connected(NA[i-1],NA[j-1]);
            SetLength(Mili1,Length(Mili1)+1);
            SetLength(Mili2,Length(Mili2)+1);

            Mili1[Length(Mili1)-1]:=i;
            Mili2[Length(Mili2)-1]:=j;
            j:=j+1;
          end;
          i:=i+1;
        end;
        PN:=nq;
        SetLength(NA,0);
        //susidne

        SetLength(MI2,Length(MI));
        i:=1;
        while i<=nq do begin
          SetLength(MI2[i-1],Length(MI2)+2);
          j:=0;
          while j<=nq do begin
            MI2[i-1][j]:=MI[i-1][j];
            MI2[i-1][Length(MI2)+1]:=-1;
            j:=j+1;
          end;
          i:=i+1;
        end;
        kk:=0;
        subline(nb,-1);

      end;
    end;

    procedure TSurface.ObjDblClick(Sender: TObject);
    Begin
      MyTool.ObjDblClick(x_,y_);
    end;

    procedure TSurface.ObjMouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);
    Begin
      dx:=X-x_;
      dy:=Y-y_;
      x_:=X;
      y_:=Y;
      if Pressed then begin
        if (dx*dx+dy*dy>6)then
          click:=false;
        MyTool.ObjMouseDrug(x_,y_,dx,dy)
      end else
        MyTool.ObjMouseMove(x_,y_,dx,dy);
    end;

    procedure TSurface.ObjMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    Begin
      click:=true;
      Pressed:=true;
      MyTool.ObjMouseDown(x_,y_);
    end;

    procedure TSurface.ObjMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    Begin
      Pressed:=false;
      MyTool.ObjMouseUp(x_,y_);
      if click then begin
        case Button of
          mbLeft:MyTool.ObjLeftClick(x_,y_);
          mbRight:MyTool.ObjRightClick(x_,y_);
        end;
        click:=false;
      end;
    end;


    function TSurface.Check:boolean;
    Begin
      if MyBOX.Check then begin
        Check:=true;
        ShowMessage('There are errors in scheme');
      end else begin
        Check:=false;
        ShowMessage('Checked OK');
      end;
    End;

    procedure updateMatrix;
    Begin
    end;

    constructor TSurface.Create(AOwner: TComponent);
    Begin
      inherited Create(AOwner);
      SetLength(Mili1,0);
      SetLength(Mili2,0);
      SetLength(Mark,0);
      Parent:=(AOwner as TWinControl);
      Width:=960;
      Height:=680;
      MyBox:=TMainBox.Create;
      MyTool:=TTArrow.Create(self);

      onDblClick:=ObjDblClick;
      onMouseMove:=ObjMouseMove;
      onMouseDown:=ObjMouseDown;
      onMouseUp:=ObjMouseUp;
      Pressed:=false;
      click:=false;
    end;

    destructor TSurface.Destroy;
    Begin
      SetLength(Mili1,0);
      SetLength(Mili2,0);
      SetLength(Mark,0);
      MyBox.Destroy(self);
      MyTool.Destroy;
      inherited;
    end;
//TSurface End
end.
