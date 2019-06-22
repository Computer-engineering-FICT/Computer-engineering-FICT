unit Graph;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls,menus;
type
	TNode=class
		Constructor create(x,y,kind,n:integer;v:string);
		procedure Draw(dc:HDC);
	private
		x,y,kind,width,height:integer;
		Link:array[0..1]of integer;
		N:integer;
		V:string;
	end;
/////////////////////////////////////////////////////////////////
	TGraph=class
		Constructor create(P:tScrollBox);
        procedure ExportToFile(FName:string);
        procedure Save(FName:string);
        procedure Load(FName:string);
		procedure AddNode(x,y,kind:integer;v:string);
		procedure DeleteNode(k:integer);
		procedure AddLink(from:integer);
		procedure AddLinkTo(T:integer);
		procedure DeleteLink(k:integer);
		procedure CancelLink();
		procedure ChangeValue(k:integer);
		procedure OnPaint(Sender: TObject);
        procedure ClearGraph();
	private
		procedure MouseDown(Sender: TObject; Button: TMouseButton;
								Shift: TShiftState; X, Y: Integer);
		procedure MouseMove(Sender: TObject; Shift: TShiftState; X,
								Y: Integer);
		procedure MouseUp(Sender: TObject; Button: TMouseButton;
								Shift: TShiftState; X, Y: Integer);
		procedure _AddNode(x,y,kind:integer;v:string);
		procedure _DeleteNode(k:integer);
		function  OnNode(x,y:integer):integer;
		procedure I0onclick(Sender: TObject);
		procedure I1onclick(Sender: TObject);
		procedure I2onclick(Sender: TObject);
		procedure I3onclick(Sender: TObject);
		procedure DrawLink(dc:HDC;from,t,ext:integer);
    private
		Menu:TPopupMenu;
		item:array[0..3] of TMenuItem;
		parent:TWinControl;
		Node:array of TNode;
		n:integer;
		//temporary
		Link,LinkEx:integer;
		PopupNode:integer;
		Down:integer;
		startX,startY:integer;
    public
        property NodeCount:integer read n;
	end;

implementation

//###############################################################
procedure TGraph.ClearGraph();
var i:integer;
begin
	for i:=0 to n-1 do
    	_DeleteNode(i+1);
    OnPaint(parent)
end;
//###############################################################
procedure TGraph.Load(FName:string);
var f:textfile;
	i,j,tmpX,tmpY,tmpKind,tmpL0,tmpL1:integer;
    tmpV:string;
begin
    assignfile(f,fname);
    reset(f);
    ClearGraph();
    readln(f,j);
    for i:=0 to j-1 do
    begin
    	readln(f,tmpX,tmpY,tmpKind,tmpL0,tmpL1);
        readln(f,tmpV);
        _AddNode(tmpX,tmpY,tmpKind,tmpV);
        Node[i].Link[0]:=tmpL0;
        Node[i].Link[1]:=tmpL1
    end;
    OnPaint(parent);
    closefile(f)
end;
//###############################################################
procedure TGraph.Save(FName:string);
var f:textfile;
	i:integer;
begin
    assignfile(f,fname);
    rewrite(f);
    writeln(f,n);
    for i:=0 to n-1 do
    begin
		writeln(f,Node[i].x,' ',Node[i].y,' ',' ',Node[i].kind,' ',
        	Node[i].link[0],' ',Node[i].link[1]);
        writeln(f,Node[i].v)
    end;
    closefile(f)
end;
//###############################################################
procedure TGraph.ExportToFile(FName:string);
var f:textfile;
	i,j:integer;
begin
	assignfile(f,FName);
    rewrite(f);
    writeln(f,n);
    writeln(f);
    for i:=0 to n-1 do
    	write(f,node[i].kind,'  ');
    writeln(f);
    writeln(f);
    for i:=0 to n-1 do
    begin
    	for j:=0 to n-1 do
    	begin
        	if j=(node[i].link[0]-1)then
            begin
            	write(f,1,'  ');
                continue
            end;
        	if j=(node[i].link[1]-1)then
            begin
            	write(f,-1,' ');
                continue
            end;
            write(f,0,'  ')
        end;
        writeln(f)
    end;
    writeln(f);
    for i:=0 to n-1 do
    	writeln(f,node[i].v);
    closefile(f);
end;
//###############################################################
procedure TGraph.DrawLink(dc:HDC;from,t,ext:integer);
var
	pt:array[0..6]of tpoint;
    w1,w2,h1,h2,x1,x2,y1,y2,ww1,ww2,hh1,hh2:integer;
begin
	w1:=Node[from-1].width;
    h1:=Node[from-1].height;
	w2:=Node[t-1].width;
    h2:=Node[t-1].height;
	ww1:=Node[from-1].width div 2;
    hh1:=Node[from-1].height div 2;
	ww2:=Node[t-1].width div 2;
    hh2:=Node[t-1].height div 2;
    x1:=Node[from-1].x;
    y1:=Node[from-1].y;
    x2:=Node[t-1].x;
    y2:=Node[t-1].y;

    pt[6].x:=x2+ww2;
    pt[6].y:=y2;
    pt[5].x:=x2+ww2;
    pt[5].y:=y2-hh2 div 2;
    pt[3].x:=pt[5].x;
    pt[3].y:=pt[5].y;
    pt[4].x:=pt[5].x;
    pt[4].y:=pt[5].y;
    if Node[from-1].kind=3 then
    	begin
        	if ext=0 then	//+
           	begin
				pt[0].x:=x1;
                pt[0].y:=y1+hh1;
                pt[1].x:=x1-hh1;
                pt[1].y:=pt[0].y;
                pt[2].x:=pt[1].x;
                pt[2].y:=pt[5].y
            end
            else   			//-
           	begin
				pt[0].x:=x1+w1;
                pt[0].y:=y1+hh1;
                pt[1].x:=x1+w1+hh1;
                pt[1].y:=pt[0].y;
                pt[2].x:=pt[1].x;
                pt[2].y:=pt[5].y
            end
    	end
    else  //other nodes
    	begin
        	pt[0].x:=x1+ww1;
            pt[0].y:=y1+h1;
            pt[1].x:=x1+ww1;
            pt[1].y:=y1+h1+hh1 div 2;
            if pt[1].y<pt[5].y then   //from higher to
            	begin
                	pt[2].x:=x2+ww2;
                    pt[2].y:=pt[1].y;
                end
            else                     //from lower to
            	begin
                	if ((x1+w1+hh1)<x2)or(((x1)>x2)and((x1-h1)<(x2+w2))) then  //left
                    	begin
                        	pt[2].x:=x1+w1+hh1;
                            pt[2].y:=pt[1].y;
                            pt[3].x:=pt[2].x;
                            pt[3].y:=pt[5].y;
                            if (pt[5].y>y1)and((x1)>x2)and((x1-h1)<(x2+w2))then
                            begin
                            	pt[4].x:=x2-hh2;
                                pt[3].x:=pt[4].x;
                                pt[3].y:=y2+h2+hh2;
                                pt[2].x:=pt[1].x;
                                pt[2].y:=pt[3].y
                            end
                        end
                    else     		//right
                    	begin
                        	pt[2].x:=x1-hh1;
                            pt[2].y:=pt[1].y;
                            pt[3].x:=pt[2].x;
                            pt[3].y:=pt[5].y;
                            if (pt[5].y>y1)and((x1)<x2)and((x1+w1+h1)>x2)then
                            begin
                            	pt[4].x:=x2+w2+hh2;
                                pt[3].x:=pt[4].x;
                                pt[3].y:=y2+h2+hh2;
                                pt[2].x:=pt[1].x;
                                pt[2].y:=pt[3].y
                            end
                        end
                end
        end;
	Polyline(dc,pt,7);
end;
//###############################################################
procedure TGraph.ChangeValue(k:integer);
begin
	if (node[k-1].kind=0) or( node[k-1].kind=1)then exit;
	node[k-1].v:=InputBox('Change Value...','Enter New Value...',node[k-1].v);
	onpaint(parent)
end;
//###############################################################
procedure TGraph.DeleteLink(k:integer);
begin
	node[k-1].Link[0]:=0;
	node[k-1].Link[1]:=0;
	onpaint(parent)
end;
//###############################################################
procedure TGraph.CancelLink();
begin
	link:=0;
	LinkEx:=0;
	Parent.Cursor:=crDefault
end;
//###############################################################
procedure TGraph.AddLinkTo(T:integer);
begin
	if node[t-1].Kind=0 then exit;
	if linkEx<>0 then
	begin
    	if (Node[link-1].Link[1]=t)or (Node[link-1].Link[0]=t)then
        	ShowMessage('Incorrect...')
        else
		if LinkEx=2 then
			Node[link-1].Link[1]:=t
		else
			Node[link-1].Link[0]:=t;
	end
	else
		Node[link-1].Link[0]:=t;
	CancelLink();
	OnPaint(parent);
end;
//###############################################################
procedure TGraph.AddLink(from:integer);
var i:integer;
begin
	if node[from-1].Kind=1 then exit;
	link:=from;
	Parent.Cursor:=crCross;
	if(Node[link-1].kind=3)then
		begin
			i:=MessageDlg('',mtCustom,[mbYes, mbNo],0);
			if i=mrYes then LinkEx:=1;
			if i=mrNo then LinkEx:=2;
		end;
end;
//###############################################################
procedure TGraph.DeleteNode(k:integer);
begin
	_DeleteNode(k);
	OnPaint(parent)
end;
//###############################################################
procedure TGraph._DeleteNode(k:integer);
var i:integer;
begin
	for i:=k-1 to (n-2) do
		begin
			Node[i]:=Node[i+1];
			Node[i].N:=i+1;
		end;
	for i:=0 to n-2 do
	begin
		if(node[i].Link[0]=k )then node[i].Link[0]:=0;
		if(node[i].Link[1]=k )then node[i].Link[1]:=0;
		if(node[i].Link[0]>k) then dec(node[i].Link[0]);
		if(node[i].Link[1]>k) then dec(node[i].Link[1]);
	end;
	n:=n-1;
	SetLength(Node,n)
end;
//###############################################################
function  TGraph.OnNode(x,y:integer):integer;
var i:integer;
begin
	result:=0;
	for i:=0 to n-1 do
		if (x>node[i].x)and(x<(node[i].x+node[i].width))and
		   (y>node[i].y)and(y<(node[i].y+node[i].height))then
		   begin
			  result:=i+1;
			  break;
		   end;
end;
//###############################################################
procedure TGraph.AddNode(x,y,kind:integer;v:string);
begin
	_AddNode(x,y,kind,v);
	OnPaint(parent)
end;
//###############################################################
procedure TGraph._AddNode(x,y,kind:integer;v:string);
begin
	inc(n);
	setlength(node,n);
	node[n-1]:=tnode.create(x,y,kind,n,v)
end;
//###############################################################
Constructor TGraph.create(P:tScrollBox);
var
	i:integer;
begin
	self.parent:=p;
	n:=0;
	down:=0;
	//createing main menu
	Menu:=TPopupMenu.Create(parent);
	for i:=0 to 3 do
		item[i]:=tmenuitem.Create(parent);
	item[0].Caption:='AddLink';
	item[1].Caption:='Delete Link';
	item[2].Caption:='Delete Node';
	item[3].Caption:='Change Value';
	Item[0].OnClick:=I0onclick;
	Item[1].OnClick:=I1onclick;
	Item[2].OnClick:=I2onclick;
	Item[3].OnClick:=I3onclick;
	Menu.Items.Add(item);
	p.OnMouseDown:=MouseDown;
	p.OnMouseUp:=MouseUp;
	p.OnMouseMove:=MouseMove;
end;
//###############################################################
procedure TGraph.I0onclick(Sender: TObject);
begin
	AddLink(PopupNode)
end;
//###############################################################
procedure TGraph.I1onclick(Sender: TObject);
begin
	DeleteLink(PopupNode)
end;
//###############################################################
procedure TGraph.I2onclick(Sender: TObject);
begin
	DeleteNode(PopupNode)
end;
//###############################################################
procedure TGraph.I3onclick(Sender: TObject);
begin
	ChangeValue(PopupNode)
end;
//###############################################################
procedure tgraph.MouseDown(Sender: TObject; Button: TMouseButton;
								Shift: TShiftState; X, Y: Integer);
var
	pt:tpoint;
begin
	PopupNode:=OnNode(x,y);
	if Button=mbRight then
	begin
		if PopupNode<>0 then
		begin
			pt.x:=x;pt.y:=y;
			clienttoscreen(parent.handle,pt);
			menu.Popup(pt.x,pt.y)
		end;
		exit;
	end;
	if PopupNode<>0 then
	if(link>0)then AddLinkTo(PopupNode)
	else
		begin
			Down:=PopupNode;
			startX:=x-node[PopupNode-1].x;startY:=y-node[popupNode-1].y;
		end;
end;
//###############################################################
procedure tgraph.MouseMove(Sender: TObject; Shift: TShiftState; X,
								Y: Integer);
var	pt:Tpoint;
begin
	if(down<>0)then
	begin
		GetCursorPos(pt);
		ScreenToClient(Parent.Handle,pt);
		node[Down-1].x:=pt.x-startx;
		node[Down-1].y:=pt.y-starty;
		OnPaint(parent)
	end
end;
//###############################################################
procedure tgraph.MouseUp(Sender: TObject; Button: TMouseButton;
								Shift: TShiftState; X, Y: Integer);
begin
	down:=0;
end;
//###############################################################
procedure TGraph.OnPaint(Sender: TObject);
var	dc,memdc:HDC;
	i:integer;
	f:tfont;
	rt:Trect;
	bmp:HBITMAP;
begin
	f:=tfont.Create;
	dc:=GetDc(parent.handle);
		memdc:=CreateCompatibleDC(dc);
		GetClientRect(parent.handle,rt);
		bmp:=CreateCompatibleBitmap(dc,rt.Right,rt.Bottom);
		SelectObject(memdc,bmp);
		PatBlt(memdc,0,0,rt.right,rt.bottom,WHITENESS);
		SelectObject(memdc,f.Handle);
	for i:=0 to n-1 do
	begin
		if(Node[i].Link[0]<>0)then
		 DrawLink(memdc,i+1,Node[i].Link[0],0);
		if(Node[i].Link[1]<>0)then
		 DrawLink(memdc,i+1,Node[i].Link[1],1);
	end;
	for i:=0 to n-1 do node[i].Draw(memdc);
		BitBlt(dc,0,0,rt.right,rt.bottom,memdc,0,0,SRCCOPY);
		DeleteDC(memdc);
		DeleteObject(bmp);
	releasedc(parent.Handle,dc);
	f.Free
end;
//###############################################################
//###############################################################
Constructor tnode.create(x,y,kind,n:integer;v:string);
begin
	self.x:=x;self.y:=y;
	self.kind:=kind;
	self.v:=v;
	Width:=60;
	Height:=25;
	if kind=3 then height:=40;
	if (kind=0)then self.v:='Begin';
	if (kind=1)then self.v:='End';
	self.n:=n;
end;
//###############################################################
procedure tnode.Draw(dc:HDC);
var pt:array[0..4]of TPoint;
	rtv,rtn:TRect;
begin
	rtv.Left:=x;		rtv.Top:=y;
	rtv.Right:=x+width;	rtv.Bottom:=y+Height;
	rtn.Left:=x;		rtn.Top:=y;
	rtn.Right:=x+width;	rtn.Bottom:=y+Height;
	if (kind=0)or(kind=1) then
		RoundRect(dc,x,y,x+width,y+Height,Height,Height);
	if kind=2 then
		Rectangle(dc,x,y,x+width,y+Height);
	if kind=3 then
	begin
		pt[0].x:=x;					pt[4].x:=x;
		pt[0].y:=y+(height div 2);	pt[4].y:=y+(height div 2);
		pt[1].x:=x+(width div 2);	pt[1].y:=y;
		pt[2].x:=x+width;			pt[2].y:=y+(height div 2);
		pt[3].x:=x+(width div 2);	pt[3].y:=y+height;
		polygon(dc,pt,5);
	end;
	DrawText(dc,PChar(v),-1,rtv,DT_CENTER or DT_VCENTER or DT_SINGLELINE);
	DrawText(dc,PChar(inttostr(n)),-1,rtn,DT_Left);
end;
//###############################################################
//###############################################################
end.

