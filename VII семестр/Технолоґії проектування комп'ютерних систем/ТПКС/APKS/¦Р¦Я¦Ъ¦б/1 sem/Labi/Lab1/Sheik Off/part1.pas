unit part1;

interface

uses SysUtils,utils,stdctrls;

type
	TCheck=class
    	Constructor Create(t:TVec;m:TMas;status:TMemo);
        procedure Change(t:TVec;m:TMas);
		procedure Mes(st:string);
		function Check():integer;
    private
		procedure Roads();
		function Check_BeginEnd():integer;
		function Check_Links():integer;
		function Check_Deads():integer;
		function Check_BeginDeads():integer;
		function Check_Cicles():integer;
		function LinkTo(k:integer;p:byte):integer;
    private
    	mas:tmas;
        t:tvec;
        n:integer;
        status:TMemo;
    end;
implementation
//##################################################################
//##################################################################
//##################################################################
function TCheck.Check():integer;
var err:integer;
begin
result:=1;
	err:=Check_BeginEnd();
	if err<>0 then
		begin
			mes('	Total errors='+inttostr(err));
			exit;
		end;
	err:=Check_Links();
	if err<>0 then
		begin
			mes('	Total errors='+inttostr(err));
			exit;
		end;
	err:=Check_BeginDeads();
	if err<>0 then
		begin
			mes('	Total errors='+inttostr(err));
			exit;
		end;
	err:=Check_Deads();
	if err<>0 then
		begin
			mes('	Total errors='+inttostr(err));
			exit;
		end;
	err:=Check_Cicles();
	if err<>0 then
		begin
			mes('	Total errors='+inttostr(err));
			exit;
		end;
	mes('There are no errors in file...');
	Roads();
	result:=0
end;
//###############################################################
procedure TCheck.Roads();
type troad=array of integer;
var i,ii:integer;
	tmp:troad;
	st:string;
	rr:array of array of integer;
procedure rec(k:integer;r:troad);
var j,jj,len,len2:integer;
	c:boolean;
begin
	len:=length(r);
	setlength(r,len+1);
	r[len]:=k;
    c:=false;
	for j:=0 to len-1 do if r[j]=k then c:=true;
	if (t[k]=0)or(c) then
		begin
			len2:=length(rr);
			setlength(rr,len2+1);
			setlength(rr[len2],len+1);
			jj:=0;
			for j:=len downto 0 do
				begin
					rr[len2][jj]:=r[j];
					inc(jj)
				end;
			exit
		end;
	for j:=0 to n-1 do
		if mas[j][k]<>0 then
			rec(j,r);
end;
begin
	for i:=0 to n-1 do if t[i]=1 then break;
	rec(i,tmp);
	for i:=0 to length(rr)-1 do
	if rr[i][0]=0 then
	begin
		st:='Pass>>> ';
		for ii:=0 to length(rr[i])-1 do
		begin
			st:=st+inttostr(rr[i][ii]+1)+'->';
		end;
		mes(st)
	end
	else
	begin
		st:='Cicle<<< ';
		for ii:=0 to length(rr[i])-1 do
		begin
			st:=st+inttostr(rr[i][ii]+1)+'->';
			if (rr[i][0]=rr[i][ii])and(ii<>0)then break;
		end;
		mes(st)
	end;

end;
//###############################################################
function TCheck.Check_Cicles():integer;
type troad=array of integer;
var i,ii,j:integer;
	tmp:troad;
	st:string;
	rr:array of array of integer;
procedure rec(k:integer;r:troad);
var j,jj,len,len2:integer;
	c:boolean;
begin
	len:=length(r);
	setlength(r,len+1);
	r[len]:=k;
    c:=false;
	for j:=0 to len-1 do if r[j]=k then c:=true;
    if t[k]=0 then exit;
	if c then
		begin
			len2:=length(rr);
			setlength(rr,len2+1);
			setlength(rr[len2],len+1);
			jj:=0;
			for j:=len downto 0 do
				begin
					rr[len2][jj]:=r[j];
					inc(jj)
				end;
			exit
		end;
	for j:=0 to n-1 do
		if mas[j][k]<>0 then
			rec(j,r);
end;
begin
	for i:=0 to n-1 do if t[i]=1 then break;
	rec(i,tmp);
	result:=0;
	for i:=0 to length(rr)-1 do
    begin
    	j:=0;st:='';
        for ii:=0 to length(rr[i])-1 do
        begin
        	if t[rr[i][ii]]=2 then j:=1;
            st:=st+inttostr(rr[i][ii]+1)+'->';
            if (rr[i][0]=rr[i][ii])and(ii<>0) then break;
        end;
        if j=0 then
        begin
        	inc(result);
            mes('Error: There is no Operator Node in cicle: '+st);
        end
    end
end;
//###############################################################
function TCheck.LinkTo(k:integer;p:byte):integer;
var i:integer;
begin
	result:=0;
	for i:=0 to n-1 do
	if mas[k][i]<>0 then
		if p=0 then
			if mas[k][i]>0 then result:=i
			else continue
		else if mas[k][i]<0 then result:=i;
end;
//###############################################################
function TCheck.Check_BeginDeads():integer;
var i,j:integer;
	tmp:array of integer;
function rec(k:integer):integer;
var ii:integer;
begin
	result:=1;
    if t[k]=0 then exit;
    if tmp[k]=10 then exit;
    if tmp[k]<>0 then
    	begin
        	result:=0;
            exit
        end;
    tmp[k]:=1;
    ii:=0;
	repeat
    	if mas[ii][k]<>0 then
        	if rec(ii)=1 then break;
        inc(ii);
        if ii=n then result:=0
    until ii=n
end;
begin
	setlength(tmp,n);
	result:=0;
	for i:=0 to n-1 do
	begin
		if(rec(i)=1)then tmp[i]:=10
		else
		begin
			mes('Error: Node'+inttostr(i+1)+' not connected with Begin...');
			inc(result);
		end;
		for j:=0 to n-1 do
		if tmp[j]<>10 then tmp[j]:=0;
	end
end;
//###############################################################
function TCheck.Check_Deads():integer;
var i,j:integer;
	tmp:array of integer;
function rec(k:integer):integer;
begin
	result:=1;
	repeat
	if t[abs(k)]=1 then break;
	if k<0 then
		begin
			k:=-k;
			if tmp[linkTo(k,1)]=0 then
			begin
				if linkto(k,1)=k then
				begin
					result:=0;
					break
				end;
				k:=linkto(k,1);
				tmp[k]:=t[k];
				continue
			end
			else
			begin
				if tmp[linkto(k,1)]<>10 then result:=0;
				break;
			end
		end
	else
		begin
			if t[k]=3 then
				if rec(-k)=1 then break;
			if tmp[linkto(k,0)]=0 then
				if t[k]<>1 then
				begin
					k:=linkto(k,0);
					tmp[k]:=t[k];
					continue
				end
				else break
			else if tmp[linkto(k,0)]<>10 then result:=0;
			break;
		end;
	until false
end;
begin
	setlength(tmp,n);
	result:=0;
	tmp[0]:=t[0];
	for i:=0 to n-1 do
	begin
		if(rec(i)=1)then tmp[i]:=10
		else
		begin
			mes('Error: DeadEnd in node '+inttostr(i+1));
			inc(result);
		end;
		for j:=0 to n-1 do
		if tmp[j]<>10 then tmp[j]:=0;
	end
end;
//###############################################################
function TCheck.Check_Links():integer;
var i,j,tmp:integer;
begin
	result:=0;
	for i:=0 to n-1 do
	begin
		tmp:=0;
		for j:=0 to n-1 do if mas[i][j]<>0 then inc(tmp);
		if((t[i]=0)or(t[i]=2))then
		begin
			if tmp=0 then
			begin
				mes('Error: There is no link from '+inttostr(i+1)+' node...');
				inc(Result)
			end;
			if tmp>1 then
			begin
				mes('Error: There are more then one link from '+inttostr(i+1)+' node');
				inc(Result)
			end
		end;
		if(t[i]=3)then
		begin
			if tmp<2 then
			begin
				mes('Error: There is no link from '+inttostr(i+1)+' node...');
				inc(Result)
			end;
			if tmp>2 then
			begin
				mes('Error: There are more then one link from '+inttostr(i+1)+' node');
				inc(Result)
			end;
		end;
		if (t[i]=1)and(tmp<>0)then
		begin
			mes('Error: Link from End node...');
			inc(Result)
		end;
	end;

	for j:=0 to n-1 do
	begin
		tmp:=0;
		for i:=0 to n-1 do if mas[i][j]<>0 then inc(tmp);
		if (t[j]=0)and(tmp<>0)then
		begin
			mes('Error: Incoming link to Begin node...');
			inc(Result)
		end
		else if (t[j]<>0)and(tmp=0)then
		begin
			mes('Error: There is no incoming link to '+inttostr(j+1)+' node...');
			inc(Result)
		end;
	end
end;
//###############################################################
function TCheck.Check_BeginEnd():integer;
var i,b,e:integer;
begin
	result:=0;b:=0;e:=0;
	for i:=0 to n-1 do
	begin
		if t[i]=0 then inc(b);
		if t[i]=1 then inc(e);
	end;
	if b=0 then
		begin
			mes('Error: Begin expected...');
			inc(Result)
		end
	else if b>1 then
		begin
			mes('Error: There are '+inttostr(b)+' Begins...');
			inc(Result)
		end;
	if e=0 then
		begin
			mes('Error: End expected...');
			inc(Result)
		end
	else if e>1 then
		begin
			mes('Error: There are '+inttostr(b)+' Ends...');
			inc(Result)
		end;
end;
//###############################################################
procedure TCheck.Mes(st:string);
begin
	if Status.Height=0 then Status.Height:=50;
	Status.Lines.Add(st);
end;
//##################################################################
procedure TCheck.Change(t:TVec;m:TMas);
var i:integer;
begin
    n:=length(t);
   	SetLength(self.t,n);
   	SetLength(self.mas,n);
    for i:=0 to n-1 do
    begin
    	SetLength(self.mas[i],n);
    end;
    self.mas:=m;
    self.t:=t
end;
//##################################################################
Constructor TCheck.Create(t:TVec;m:TMas;status:TMemo);
begin
	Change(t,m);
    self.status:=status
end;
//##################################################################
//##################################################################
end.
