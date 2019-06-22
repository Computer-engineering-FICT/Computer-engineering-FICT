unit part2;

interface

uses windows,sysutils,utils,grids,stdctrls,extctrls,graphics;

type
	trv=record
     	s:string;
        i:integer;
    end;
    Torv=array of trv;
	Ttable=class
    	Constructor Create(t:TVec;m:TMas;s:TStr;table:TStringGrid;memo:TMemo;paint:TPaintBox);
        procedure Change(t:TVec;m:TMas;s:TStr);
        procedure Run(Model,Trigger:integer;Full:boolean);
        procedure OnPaint();
    private
		function LinkTo(k:integer;p:byte):integer;
        function GetXcount():integer;
        function GetQcount():integer;
		function Razmetka_Mura():integer;
		function Razmetka_Mili():integer;
		function FillYs():integer;
        function IF_SinStr(st:string):integer;
        function IF_SinStr2(st:string):integer;
        procedure GetStr(st:string;var Str:TStr);
		procedure FillQin();
		procedure FillRout();
		procedure FillRoutMili();
		procedure FillY();
		procedure FillYMili();
        procedure FillX();
        procedure FillXMili();
		procedure FillQout();
		procedure FillTR(Trigger:integer);
        procedure FillTable();
        procedure Insert(line:integer);
		//functions
		procedure Functions();
        //graph
		procedure Line(dc:HDC;x1,y1,x2,y2:integer);
		procedure LineS(dc:HDC;x1,y1,x2,y2:integer;st:string);
		procedure DrawBus(dc:HDC);
        procedure DrawAnd(dc:HDC);
        procedure DrawOr(dc:HDC);
		procedure DrawTR(dc:HDC);
        function GetPanelHeight():INTEGER;
    private
    	m,tab:tmas;
        t,andv:tvec;
        orv:Torv;
        s,Ys,Xs:tstr;
        n:integer;
        table:TStringGrid;
		memo:TMemo;
        paint:TPaintBox;
		Q,X,Y,TR,Size,rin:integer;
        Model:integer;
    end;

implementation
//##################################################################
procedure TTable.Insert(line:integer);
var i,j,k:integer;
begin
    size:=size+1;
    setlength(tab,size);
    setlength(tab[size-1],length(tab[0]));
    for i:=size-1 downto line+1 do
        for j:=0 to length(tab[i])-1 do
        begin
            k:=tab[i-1][j];
            tab[i][j]:=k
        end
end;
//##################################################################
procedure TTable.FillXMili();
var i,j,lTmp:integer;
    tmp:TVEC;
    function rec(k,line:integer):integer;
    var j:integer;
        c:boolean;
    begin
//    if k>=0 then k:=LinkTo(k,1);
    c:=false;
	repeat
	if k<0 then
		begin
			k:=-k;
            for j:=0 to x-1 do
            if s[k]=xs[j] then
            begin
                tab[line][j+1+Q]:=0;
                break
            end;
            k:=linkTo(k,0)
		end
	else
		begin
            for j:=0 to size-1 do
            if ((tab[j][0]=k+1)or(t[k]=1))and(c)then
            begin
                tab[line][1+X+Q]:=k+1;
                exit
            end;
			if t[k]=3 then
            begin
                insert(line);
                rec(-k,line+1)
            end;
            for j:=0 to x-1 do if s[k]=xs[j] then
            begin
                tab[line][j+1+Q]:=1;
                break
            end;
            k:=linkto(k,1)
		end;
        c:=true
	until false
    end;
begin
    for i:=0 to size-1 do
    begin
        Setlength(tab[i],Q+2+X);
        for j:=Q+1 to Q+X+1 do tab[i][j]:=-1
    end;
    setlength(tmp,rin);
    for i:=0 to rin-1 do tmp[i]:=tab[i][0];
    for i:=0 to rin-1 do
    begin
        for j:=0 to size-1 do if tab[j][0]=tmp[i] then break;
        rec(tmp[i]-1,j);
    end;
    for i:=0 to size-1 do
        if t[tab[i][Q+X+1]-1]=1 then tab[i][Q+X+1]:=tab[0][0]
end;
//##################################################################
procedure TTable.FillX();
var i,j:integer;
    tmp2:TVEC;
    function rec(k,line:integer):integer;
    var j:integer;
    begin
    if k>=0 then k:=LinkTo(k,1);
	repeat
	if k<0 then
		begin
			k:=-k;
            for j:=0 to x-1 do
            if s[k]=xs[j] then
            begin
                tab[line][j+1+Q]:=0;
                break
            end;
            k:=linkTo(k,0)
		end
	else
		begin
			if t[k]=3 then
            begin
                insert(line);
                rec(-k,line+1)
            end;
            for j:=0 to x-1 do if s[k]=xs[j] then
            begin
                tab[line][j+1+Q]:=1;
                break
            end;
            if (t[k]=1)or(t[k]=2)then
            begin
                tab[line][1+X+Q]:=k+1;
                break
            end;
            k:=linkto(k,1)
		end;
	until false
    end;
begin
    for i:=0 to size-1 do
    begin
        Setlength(tab[i],Q+2+X);
        for j:=Q+1 to Q+X+1 do tab[i][j]:=-1
    end;
    setlength(tmp2,rin);
    for i:=0 to rin-1 do tmp2[i]:=tab[i][0];
    for i:=0 to rin-1 do
    begin
        for j:=0 to size-1 do if tab[j][0]=tmp2[i] then break;
        rec(tmp2[i]-1,j);
    end;
    for i:=0 to size-1 do
        if t[tab[i][Q+X+1]-1]=1 then tab[i][Q+X+1]:=tab[0][0]
end;
//##################################################################
function TTable.GetXcount():integer;
var i:integer;
begin
	result:=0;X:=0;
    setlength(Xs,0);
	for i:=0 to n-1 do if t[i]=3 then
    	if If_SinStr2(s[i])=-1 then
        	begin
            	result:=result+1;
                X:=result;
            	setlength(Xs,result);
                Xs[result-1]:=s[i]
            end
end;
//##################################################################
function TTable.GetQcount():integer;
var i:integer;
begin
	i:=rin+1;
    result:=1;
	repeat
    	i:=i div 2;
        if i<>1 then inc(result)
    until i<=2
end;
//##################################################################
procedure TTable.FillTR(Trigger:integer);
var i,j,k:integer;
begin
	if trigger=0 then
		for i:=0 to size-1 do
        	begin
            	setlength(tab[i],2+3*Q+X+Y);
            	for j:=0 to Q-1 do
                if tab[i][j+1]=0 then tab[i][2+2*Q+X+Y+j]:=0
                else tab[i][2+2*Q+X+Y+j]:=1
            end
    else
		for i:=0 to size-1 do
        	begin
            	k:=0;
            	setlength(tab[i],2+4*Q+X+Y);
            	for j:=0 to (Q-1) do
                begin
                	if (tab[i][j+1]=0)and(tab[i][j+2+Q+X]=0)then
                    	begin
                        	tab[i][2+2*Q+X+Y+k]:=0;
                            tab[i][2+2*Q+X+Y+k+1]:=-1;
                            k:=k+2;
                        	continue
                        end;
                	if (tab[i][j+1]=0)and(tab[i][j+2+Q+X]=1)then
                    	begin
                        	tab[i][2+2*Q+X+Y+k]:=1;
                            tab[i][2+2*Q+X+Y+k+1]:=-1;
                            k:=k+2;
                        	continue
                        end;
                	if (tab[i][j+1]=1)and(tab[i][j+2+Q+X]=0)then
                    	begin
                        	tab[i][2+2*Q+X+Y+k]:=-1;
                            tab[i][2+2*Q+X+Y+k+1]:=1;
                            k:=k+2;
                        	continue
	                    end;
                        	tab[i][2+2*Q+X+Y+k]:=-1;
                            tab[i][2+2*Q+X+Y+k+1]:=0;
                    k:=k+2;
                end
            end
end;
//##################################################################
procedure TTable.FillQout();
var i,j,k:integer;
begin
	for i:=0 to size-1 do
    	begin
        	setlength(tab[i],Q+X+2+Q);
            for j:=0 to size-1 do
                if tab[j][0]=tab[i][1+Q+X] then break;
            for k:=0 to Q-1 do
            	tab[i][2+Q+X+k]:=tab[j][1+k]
        end
end;
//##################################################################
procedure TTable.FillYMili();
var i,ii,j,k:integer;
	tmp:TStr;
begin
	for i:=0 to size-1 do
    	begin
        	setlength(tab[i],Q+X+Q+2+Y);
            if t[tab[i][0]-1]=1 then continue;
	    	k:=tab[i][0];j:=0;
			repeat
        		if t[k-1]=3 then
            	begin
            		for ii:=0 to X-1 do
            			if UPPERCASE(s[k-1])=UPPERCASE(Xs[ii])then break;
					k:=LinkTo(k-1,tab[i][Q+1+ii])+1;
            	end
            	else
                if t[k-1]=2 then
                begin
                	j:=1;
                	break
                end;
				for ii:=0 to size-1 do
            		if k=tab[ii][0]then j:=2;//exit;
                if (j=2)or(t[k-1]=1) then break
        	until false;
            if j=1 then
            begin
            	getstr(s[k-1],tmp);
            	for j:=0 to length(tmp)-1 do
            		tab[i][2+2*Q+X+IF_sinstr(tmp[j])]:=1;
            end
        end
end;
//##################################################################
procedure TTable.FillY();
var i,j:integer;
	tmp:TStr;
begin
	for i:=0 to size-1 do
    	begin
        	setlength(tab[i],Q+X+Q+2+Y);
            if t[tab[i][0]-1]=0 then continue;
            getstr(s[tab[i][0]-1],tmp);
            for j:=0 to length(tmp)-1 do
            	tab[i][2+2*Q+X+IF_sinstr(tmp[j])]:=1;

        end
end;
//##################################################################
procedure TTable.FillTable();
var i,j:integer;
begin
    table.RowCount:=size+1;
    table.ColCount:=2+2*Q+X+Y+TR;
    table.FixedCols:=1;
    table.FixedRows:=1;
    for i:=1 to Q do table.Cells[i,0]:='Q'+inttostr(i);
    j:=Q+1;
    for i:=0 to X-1 do 	table.Cells[j+i,0]:=Xs[i];
    table.Cells[Q+X+1,0]:='';
    for i:=Q+X+2 to 2*Q+X+1 do table.Cells[i,0]:='Q'+inttostr(i-Q-X-1);
    for i:=0 to Y-1 do table.Cells[i+2+2*Q+X,0]:=YS[i];
    j:=2+2*Q+X+Y;
    if TR=Q then
	    for i:=0 to Q-1 do
    		begin
               	table.Cells[j,0]:='D'+inttostr(i+1);
        	    j:=j+1
        	end
    else
	    for i:=0 to Q-1 do
    		begin
               	table.Cells[j,0]:='J'+inttostr(i+1);
               	table.Cells[j+1,0]:='K'+inttostr(i+1);
        	    j:=j+2
        	end;
	for i:=1 to size do
    	for j:=0 to (2+2*Q+X+Y+TR)-1 do
        	if tab[i-1][j]=-1 then table.Cells[j,i]:='-'
            else table.Cells[j,i]:=inttostr(tab[i-1][j])
end;
//##################################################################
function TTable.LinkTo(k:integer;p:byte):integer;
var i:integer;
begin
	result:=0;
	for i:=0 to n-1 do
	if m[k][i]<>0 then
		if p=1 then
			if m[k][i]>0 then result:=i
			else continue
		else if m[k][i]<0 then result:=i;
end;
//##################################################################
procedure TTable.FillRoutMili();
var i:integer;
	function GetNode(k:integer):integer;
    var i:integer;
    begin
    	result:=tab[k][0];
        if t[tab[k][0]-1]=1 then exit;
		repeat
        	if t[result-1]=3 then
            begin
            	for i:=0 to X-1 do
            		if UPPERCASE(s[result-1])=UPPERCASE(Xs[i])then break;
				result:=LinkTo(result-1,tab[k][Q+1+i])+1;
            end
            else result:=LinkTo(result-1,1)+1;
			for i:=0 to size-1 do
            	if result=tab[i][0]then exit;
        until false
    end;
begin
	for i:=0 to size-1 do setlength(tab[i],(Q+X+2));
	for i:=0 to size-1 do
    	begin
           	tab[i][Q+X+1]:=GetNode(i);
            if t[tab[i][Q+X+1]-1]=1 then tab[i][Q+X+1]:=tab[0][0]
        end
end;
//##################################################################
procedure TTable.FillRout();
var i:integer;
	function GetNode(k:integer):integer;
    var i,j:integer;
    begin
		result:=LinkTo(tab[k][0]-1,1)+1;
        if t[result-1]<>3 then exit;
		repeat
            for j:=0 to n-1 do if (result-1)=j then break;
            for i:=0 to X-1 do
            	if UPPERCASE(s[j])=UPPERCASE(Xs[i])then break;
			result:=LinkTo(result-1,tab[k][Q+1+i])+1;
    	    if t[result-1]<>3 then exit;
        until false
    end;
begin
	for i:=0 to size-1 do setlength(tab[i],(Q+X+2));
	for i:=0 to size-1 do
    	begin
           	tab[i][Q+X+1]:=GetNode(i);
            if t[tab[i][Q+X+1]-1]=1 then tab[i][Q+X+1]:=tab[0][0]
        end
end;
//##################################################################
procedure TTable.GetStr(st:string;var Str:TStr);
var i:integer;
begin
	SetLength(str,1);
    str[0]:='';
	for i:=1 to length(st) do
    	begin
        	if st[i]=' ' then
            	begin
                	SetLength(str,length(str)+1);
                    Continue
                end;
            str[length(str)-1]:=str[length(str)-1]+st[i]
        end
end;
//##################################################################
function TTable.IF_SinStr(st:string):integer;
var i:integer;
begin
	result:=-1;
	for i:=0 to Y-1 do
    	if UpperCase(st)=UpperCase(Ys[i])then result:=i
end;
//##################################################################
function TTable.IF_SinStr2(st:string):integer;
var i:integer;
begin
	result:=-1;
	for i:=0 to X-1 do
    	if UpperCase(st)=UpperCase(Xs[i])then result:=i
end;
//##################################################################
function TTable.FillYs():integer;
var i,j:integer;
	tmp:TStr;
begin
	SetLength(Ys,0);
    Y:=0;
	for i:=0 to n-1 do
    	begin
        	if t[i]<>2 then continue;
            GetStr(s[i],tmp);
            for j:=0 to length(tmp)-1 do
            	if If_SinStr(tmp[j])=-1 then
                	begin
                    	Y:=Y+1;
                    	SetLength(ys,Y);
                        Ys[Y-1]:=tmp[j]
                    end
        end;
    result:=Y
end;
//##################################################################
procedure TTable.FillQin();
var j,i,etalon,cur:integer;
begin
    for i:=0 to size-1 do SetLength(tab[i],Q+1);
    etalon:=1; cur:=1;
    for j:=Q-1 downto 0 do
    	begin
        	for i:=0 to size-1 do
            	begin
                	if cur=-etalon then cur:=etalon;
                	if cur>0 then tab[i][j+1]:=0
                    else tab[i][j+1]:=1;
                    cur:=cur-1
                end;
            etalon:=etalon*2;
            cur:=etalon
        end
end;
//##################################################################
function TTable.Razmetka_Mili():integer;
var j:integer;
	tmp:TVec;
    procedure mili(k,was:integer);
    var i:integer;
    begin
    	for i:=0 to length(tmp)-1 do
    		if (tmp[i]=k) then exit;//was here
        if t[k]=3 then
        begin
           	if was=0 then
            begin
            	setlength(tmp,length(tmp)+1);
                tmp[length(tmp)-1]:=k
            end;
            i:=LinkTo(k,0);
            mili(i,1);
            i:=LinkTo(k,1);
            mili(i,1);
            exit
        end;
        if (t[k]=2) then
        begin
        	if was=0 then
            begin
            	setlength(tmp,length(tmp)+1);
                tmp[length(tmp)-1]:=k
            end;
            i:=LinkTo(k,1);
            mili(i,0);
            exit
        end;
    end;
begin
	for j:=0 to n-1 do if t[j]=0 then break;
    j:=linkto(j,1);
   	mili(j,0);
    rin:=length(tmp);
    result:=rin;
    Setlength(tab,rin);
    for j:=0 to rin-1 do
       	begin
           	setlength(tab[j],1);
            tab[j][0]:=tmp[j]+1
        end
end;
//##################################################################
function TTable.Razmetka_Mura():integer;
var i:integer;
	tmp:TVEC;
begin
	setlength(tmp,1);
    result:=1;
	for i:=0 to n-1 do
    begin
    	if (t[i]=3)or(t[i]=1)then continue;
        if (t[i]=0)then
        	begin
            	tmp[0]:=i+1;
                continue
            end;
        result:=result+1;
	    setlength(tmp,result);
        tmp[result-1]:=i+1;
    end;
    rin:=result;
    Setlength(tab,result);
    for i:=0 to rin-1 do
       	begin
           	setlength(tab[i],1);
            tab[i][0]:=tmp[i]
        end
end;
//##################################################################
// 0->Mura	| 0->d
// 1->Mili  | 1->jk
procedure TTable.Run(Model,Trigger:integer;Full:boolean);
begin
    self.Model:=model;
	X:=GetXcount();
//******** fill Raz
	if Model=0 then Size:=Razmetka_mura()
    else Size:=Razmetka_mili();
//******** fill QinX
	Q:=GetQcount();
    FillQin();
//******** fill Ys
	Y:=FillYs();
//******** fill X
    if model=0 then FillX()
    else FillXMili();
{//******** fill rout
    if model=0 then FillRout()
    else FillRoutMili();
}//******** fill Qout
    FillQout();
//******** fill Y
	if model=0 then FillY()
    else FillYMili();
//******** fill TR
	FillTR(trigger);
    if trigger=0 then TR:=Q else TR:=2*Q;
//*************
	FillTable();
//****************
	functions();
end;
//##################################################################
procedure TTable.Change(t:TVec;m:TMas;s:TStr);
var i:integer;
begin
    n:=length(t);
   	SetLength(self.t,n);
   	SetLength(self.m,n);
   	SetLength(self.s,n);
    for i:=0 to n-1 do
    begin
    	SetLength(self.m[i],n);
    end;
    self.m:=m;
    self.s:=s;
    self.t:=t
end;
//##################################################################
Constructor TTable.Create(t:TVec;m:TMas;s:TStr;table:TStringGrid;memo:TMemo;paint:TPaintBox);
begin
	self.table:=table;
	self.memo:=memo;
	self.paint:=paint;
    self.Model:=-1;
	Change(t,m,s)
end;
//##################################################################
//##################################################################
//             Function functions
procedure TTable.Functions();
var i,j,k:integer;
	st:string;
begin
	memo.Clear;
    SetLength(orv,0);
    SetLength(andv,0);
	for i:=0 to Y-1 do
   	begin
    	st:=Ys[i]+'=';
        setlength(orv,length(orv)+1);
        orv[length(orv)-1].s:=Ys[i];
        orv[length(orv)-1].i:=0;
    	for j:=0 to size-1 do
        begin
        	if tab[j][2+Q*2+X+i]=1 then
            begin
            	setlength(andv,length(andv)+1);
                andv[length(andv)-1]:=j;
            	for k:=0 to Q-1 do
                begin
                    if tab[j][k+1]=0 then st:=st+'not(Q'+inttostr(k+1)+')*'
                    else st:=st+'Q'+inttostr(k+1)+'*'
                end;
            	for k:=0 to X-1 do
                begin
                    if tab[j][k+Q+1]=0 then st:=st+'not('+Xs[k]+')*';
                    if tab[j][k+Q+1]=1 then st:=st+Xs[k]+'*'
                end;
                st[length(st)]:=' ';
                st:=st+'v ';
		        orv[length(orv)-1].i:=orv[length(orv)-1].i+1;
            end;
        end;
		st[length(st)-1]:=' ';
        memo.Lines.Add(st)
    end ;
//fill triggers;
	for i:=0 to TR-1 do
   	begin
    	st:=table.cells[2+2*Q+X+Y+i,0]+'=';
        setlength(orv,length(orv)+1);
        orv[length(orv)-1].s:=table.cells[2+2*Q+X+Y+i,0];
        orv[length(orv)-1].i:=0;
    	for j:=0 to size-1 do
        begin
        	if tab[j][2+Q*2+X+Y+i]=1 then
            begin
            	setlength(andv,length(andv)+1);
                andv[length(andv)-1]:=j;
            	for k:=0 to Q-1 do
                begin
                    if tab[j][k+1]=0 then st:=st+'not(Q'+inttostr(k+1)+')*'
                    else st:=st+'Q'+inttostr(k+1)+'*'
                end;
                if model =1 then
            	for k:=0 to X-1 do
                begin
                    if tab[j][k+Q+1]=0 then st:=st+'not('+Xs[k]+')*';
                    if tab[j][k+Q+1]=1 then st:=st+Xs[k]+'*'
                end;
                st[length(st)]:=' ';
                st:=st+'v ';
		        orv[length(orv)-1].i:=orv[length(orv)-1].i+1;
            end;
        end;
		st[length(st)-1]:=' ';
        memo.Lines.Add(st)
    end
end;
//##################################################################
//##################################################################
//     Graph Functions
//##################################################################
//##################################################################
procedure TTable.LineS(dc:HDC;x1,y1,x2,y2:integer;st:string);
var rt:TRect;
begin
    Line(dc,x1,y1,x2,y2);
    rt.Left:=x1;rt.Right:=x2-2;
    rt.Top:=y1-25;rt.Bottom:=y2;
    DrawText(dc,PCHAR(st),-1,rt,DT_RIGHT or DT_BOTTOM or DT_SINGLELINE);
end;
//##################################################################
procedure TTable.Line(dc:HDC;x1,y1,x2,y2:integer);
begin
	MoveToEx(dc,x1,y1,nil);
    LineTo(dc,x2,y2)
end;
//##################################################################
procedure TTable.DrawBus(dc:HDC);
var pen:HPEN;
	i:integer;
begin
	pen:=CreatePen(PS_SOLID,3,0);
	SelectObject(dc,pen);
    Line(dc,50,paint.Height-10,50,5);
    LineTo(dc,(paint.Width)-5,5);
    LineTo(dc,(paint.Width)-5,paint.Height-10);
    Line(dc,195,5,195,paint.Height-10);
    Line(dc,370,5,370,paint.Height-10);
	DeleteObject(pen);
    SelectObject(dc,paint.Canvas.pen.Handle);
    for i:=0 to X-1 do
    	begin
        	LineS(dc,30,15*(i+1)+20,49,15*(i+1)+20,Xs[i])
        end;
end;
//##################################################################
procedure TTable.DrawAnd(dc:HDC);
var i,j,b,val1,val2,tmp:integer;
	rt:TRect;
begin
	b:=20;
	for i:=0 to length(andv)-1 do
    begin
        val1:=0;val2:=0;;tmp:=0;
        for j:=0 to TR-1 do
            tmp:=tmp+orv[length(orv)-TR+j].i;
        tmp:=length(andv)-tmp-1;
        for j:=0 to (Q+X-1)do
            if (model=0)and(j>=Q)and(i>tmp)then continue
            else if tab[andv[i]][j+1]<>-1 then inc(val1);
        Rectangle(dc,100,b,150,b+(val1)*20);
        rt.Left:= 100;rt.Top:=b+2;
        rt.Right:=150;rt.Bottom:=b+(val1)*20;
        DrawText(dc,PCHAR('AND'),-1,rt,DT_CENTER or DT_SINGLELINE);
        for j:=0 to (Q-1)do
        begin
           	if tab[andv[i]][j+1]=0 then
            	LineS(dc,50,b+(j+1)*20-10,100,b+(j+1)*20-10,'-Q'+inttostr(j+1))
            else
            	LineS(dc,50,b+(j+1)*20-10,100,b+(j+1)*20-10,'Q'+inttostr(j+1))
        end;
        for j:=0 to (X-1)do
        begin
            if (model=0)and(i>tmp)then continue ;
           	if tab[andv[i]][j+Q+1]=0 then
            begin
            	LineS(dc,50,b+(val2+Q+1)*20-10,100,b+(val2+Q+1)*20-10,Xs[j]);
                inc(val2)
            end;
           	if tab[andv[i]][j+Q+1]=1 then
            begin
            	LineS(dc,50,b+(val2+Q+1)*20-10,100,b+(val2+Q+1)*20-10,Xs[j]);
                inc(val2)
            end
        end;
       	LineS(dc,150,b+(val1)*20 div 2,193,b+(val1)*20 div 2,inttostr(i+1));
        b:=b+(val1)*20+10
	end
end;
//##################################################################
procedure TTable.DrawOr(dc:HDC);
var i,j,b,k,t:integer;
	rt:TRect;
begin
	b:=25;k:=1;t:=0;
	for i:=0 to length(orv)-1 do
    begin
        Rectangle(dc,250,b,300,b+orv[i].i*20);
        rt.Left:= 250;rt.Top:=b+2;
        rt.Right:=300;rt.Bottom:=b+orv[i].i*20;
        DrawText(dc,PCHAR('OR'),-1,rt,DT_CENTER or DT_SINGLELINE);
        for j:=0 to orv[i].i-1 do
        begin
        	LineS(dc,195,b+20*(j+1)-10,250,b+20*(j+1)-10,inttostr(k));
            inc(k)
        end;
        if Y>t then
       	LineS(dc,300,b+(orv[i].i*20 div 2),369,b+(orv[i].i*20 div 2),Ys[t])
        else
       	LineS(dc,300,b+(orv[i].i*20 div 2),369,b+(orv[i].i*20 div 2),table.Cells[t+2+2*Q+X,0]);
        b:=b+orv[i].i*20+10;
        t:=t+1
	end
end;
//##################################################################
procedure TTable.DrawTR(dc:HDC);
var i,b,t:integer;
	rt:TRect;
begin
	b:=20;t:=(TR div Q);
	for i:=0 to Q-1 do
    begin
        Rectangle(dc,420,b,470,b+(i+1)+t*40);
        rt.Left:= 420;rt.Top:=b+2;
        rt.Right:=470;rt.Bottom:=b+(i+1)+t*40;
        DrawText(dc,PCHAR('TR'),-1,rt,DT_CENTER or DT_SINGLELINE);
        LineS(dc,370,b+20,420,b+20,table.Cells[2+2*Q+X+Y+i*t,0]);
        if t<>1 then
        LineS(dc,370,b+60,420,b+60,table.Cells[2+2*Q+X+Y+i*t+1,0]);
       	LineS(dc,470,b+20,paint.Width-7,b+20,'Q'+inttostr(i+1));
        b:=b+(i+1)+t*40+10;
 	end
end;
//##################################################################
procedure TTable.OnPaint();
var	memdc:HDC;
	f:tfont;
	rt,rt2:Trect;
	bmp:HBITMAP;
begin
	paint.Height:=GetPanelHeight();
{	f:=tfont.Create;
	memdc:=CreateCompatibleDC(paint.Canvas.Handle);
    rt:=paint.ClientRect;//.Canvas.ClipRect;
    rt2:=paint.Canvas.ClipRect;
	bmp:=CreateCompatibleBitmap(paint.Canvas.Handle,
    		rt.Right-rt.Left,rt.Bottom-rt.Top);
	SelectObject(memdc,bmp);
	PatBlt(memdc,rt2.Left,rt2.Top,rt2.Right-rt2.Left,rt2.Bottom-rt2.top,WHITENESS);
	SelectObject(memdc,f.Handle);
    //paint here
}    DrawBus(paint.Canvas.Handle);
    DrawAnd(paint.Canvas.Handle);
 	DrawOr(paint.Canvas.Handle);
	DrawTR(paint.Canvas.Handle);
{	BitBlt(paint.Canvas.Handle,rt2.Left,rt2.Top,rt2.Right-rt2.Left,
    			rt2.Bottom-rt2.Top,memdc,rt2.Left,rt2.Top,SRCCOPY);
	DeleteDC(memdc);
	DeleteObject(bmp);
	f.Free
}end;

function TTable.GetPanelHeight():integer;
var i,j,tmp:integer;
begin
    result:=0;
    for i:=0 to length(andv)-1 do
    begin
        tmp:=0;
        for j:=0 to TR-1 do
            tmp:=tmp+orv[length(orv)-TR+j].i;
        tmp:=length(andv)-tmp-1;
        for j:=0 to (Q+X-1)do
            if (model=0)and(j>=Q)and(i>tmp)then continue
            else if (tab[andv[i]][j+1]<>-1) then inc(result);
    end;
    result:=result*20+40+length(andv)*10
end;
end.
