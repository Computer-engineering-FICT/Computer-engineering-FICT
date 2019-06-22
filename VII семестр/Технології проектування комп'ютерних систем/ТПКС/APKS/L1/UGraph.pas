unit UGraph;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms,UMarking,L6U, Grids,Math;

type
  TDGraph = class(TForm)
    Image1: TImage;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Minim;
   public
    MS:TSurface;
  end;

var
  DGraph: TDGraph;

implementation

{$R *.DFM}

procedure TDGraph.Minim;
Var
  s:string;
  i,j,k,m,lr,t,tm,ii,jj:word;
  st1,st2,res:array of string; MRes:array of array of string;
Begin
  setLength(MRes,0);
  //StringGrid2.ColCount:=0;
  //StringGrid2.RowCount:=0;
  jj:=0;
ii:=0;
while ii<=1 do begin
  i:=1;
  tm:=0;
  while i<=StringGrid1.RowCount-1 do begin
    s:=StringGrid1.Cells[5+ii,i];
    if Length(s)>tm  then begin
      tm:=Length(s);
    end;
    i:=i+1;
  end;
  t:=1;
  if ii=0 then begin
   // StringGrid2.ColCount:=tm;
    SetLength(MRes,tm);
  end else begin
   // StringGrid2.ColCount:=tm+StringGrid2.ColCount;
    SetLength(MRes,Length(MRes)+tm);
  end;

 // StringGrid2.RowCount:=0;
 // tm:=1;
  while t<=tm do begin
    SetLength(res,0);
    i:=1;
    j:=0;
    m:=0;
    while i<=StringGrid1.RowCount-1 do begin
      s:=(StringGrid1.Cells[5+ii,i]);
      if (t>tm-Length(s))and(s[t - (tm-Length(s))]='1') then begin
        SetLength(st1,Length(st1)+1);
        st1[j]:=StringGrid1.Cells[3,i];
        j:=j+1;
      end;
      s:=StringGrid1.Cells[3,i];
      if m<Length(s) then
        m:=Length(s);
      i:=i+1;
    end;
    //dopus 0
    i:=1;
    while i<=Length(st1) do begin
      if Length(st1[i-1])<m then begin
        while length(st1[i-1])<m do begin
          st1[i-1]:='0'+st1[i-1];
        end;
      end;
      i:=i+1;
    end;
 //start
    repeat  begin
      lr:=Length(st1);
      i:=1;
      while i<=Length(st1)-1 do begin
        j:=i+1;
        while j<=Length(st1) do begin
          k:=1;
          m:=0;
          s:='';
          while k<=Length(st1[i-1]) do begin
            if ((st1[i-1][k]='x')and(st1[j-1][k]<>'x'))or((st1[i-1][k]<>'x')and(st1[j-1][k]='x'))then begin
              m:=2;
              break;
            end else
            if  not(((st1[i-1][k]='0')and(st1[j-1][k]='0'))or((st1[i-1][k]='1')and(st1[j-1][k]='1')))  then begin
              s:=s+'x';
              if not((st1[i-1][k]='x')or(st1[j-1][k]='x')) then
                m:=m+1;
              if m>=2 then break;
            end else begin
              s:=s+st1[i-1][k];
            end;
            k:=k+1;
          end;
          if m<2 then begin
            SetLength(st2,Length(st2)+1);
            St2[Length(st2)-1]:=s;
          end;
          j:=j+1;
        end;
        i:=i+1;
      end;
      i:=1;
      while i<=Length(st2) do begin
        j:=1;
        while j<=Length(st1) do begin
          k:=1;
          while k<=Length(st2[i-1]) do begin
            if ((st2[i-1][k-1]='1')and(st1[j-1][k-1]='0'))or((st2[i-1][k-1]='0')and(st1[j-1][k-1]='1')) then
              break;
            k:=k+1;
          end;
          if k>Length(st2[i-1]) then begin
            st1[j-1]:=st1[Length(st1)-1];
            SetLength(st1,Length(st1)-1);
          end else
            j:=j+1;
        end;
        i:=i+1;
      end;
      i:=1;
      while i<=Length(st1) do begin
        setLength(res,Length(res)+1);
        res[Length(res)-1]:=st1[i-1];
        i:=i+1;
      end;
      SetLength(st1,Length(st2));
      i:=1;
      while i<=Length(st2) do begin
        st1[i-1]:=st2[i-1];
        i:=i+1;
      end;
      SetLength(st2,0);
    end;
    until lr=Length(st1);
    i:=0;
    SetLength(MRes[t-1+jj],Length(res));
    while Length(res)>0 do begin
      {if i+1>StringGrid2.RowCount then begin
        StringGrid2.RowCount:=StringGrid2.RowCount+1;
      end;}
//      SetLength(MRes,Length(MRes)+1);
      MRes[t-1+jj][i]:=res[Length(res)-1];
//      StringGrid2.Cells[t-1+jj,i]:=res[Length(res)-1];
      SetLength(res,Length(res)-1);
      i:=i+1;
    end;
    t:=t+1;
  end;
  jj:=Length(MRes);//StringGrid2.ColCount;
  ii:=ii+1;
end;
i:=1;
j:=1;
Memo1.Clear;

s:='';

SetLength(Res,0);
while i<=Length(MRes) do begin
  k:=1;
  while k<=Length(res) do begin
    if ((Length(MRes[i-1])>0)and(res[k-1]=MRes[i-1][j-1])) then break;
    k:=k+1;
  end;
  if k>Length(res) then begin
    if Length(MRes[i-1])>0 then begin
      SetLength(res,Length(res)+1);
      res[Length(res)-1]:=MRes[i-1][j-1];
//      MRes[i-1][j-1]:=Length(res)-1;
    end;
  end;
  if (Length(MRes)>0)and(Length(MRes[i-1])>0)then
    s:=s+MRes[i-1][j-1]+'v';
  j:=j+1;
  if(j>Length(MRes[i-1]))then begin
    j:=1;
    setLength(s,Length(s)-1);
    if s<>'' then begin
      if i>(Length(MRes))div 2 then
       s:='R'+IntToStr(i-(Length(MRes))div 2)+' = '+s
      else
       s:='S'+IntToStr(i)+' = '+s;
      Memo1.Lines.Add(s);
      s:='';
    end else begin
      if i>(Length(MRes))div 2 then
       s:='R'+IntToStr(i-(Length(MRes))div 2)+' = x'
      else
       s:='S'+IntToStr(i)+' = x';
      Memo1.Lines.Add(s);
      s:='';
    end;
    i:=i+1;
  end;

end;


end;

procedure getJK(x1,x2:integer;var J,K:string);
var xx1,xx2:integer;
Begin
  J:='';
  K:='';
  xx1:=x1;
  xx2:=x2;
  while (xx1>0)or(xx2>0) do begin
    if (1 and (not(xx1) and not(xx2))>0)then begin
      J:='0'+J;
      K:='x'+K;
    end else
    if (1 and (not(xx1) and xx2)>0)then begin
      J:='1'+J;
      K:='0'+K;
    end else
    if (1 and (xx1 and not(xx2))>0)then begin
      J:='0'+J;
      K:='1'+K;
    end else
    if (1 and (xx1 and xx2)>0)then begin
      J:='x'+J;
      K:='0'+K;
    end;
    xx1:=xx1 shr 1;
    xx2:=xx2 shr 1;
  end;
end;

procedure TDGraph.FormShow(Sender: TObject);
  function substring(var s:string;a:char):string;
  Var t:boolean;ss:string;i:word;
  Begin
    i:=1;
    while i<=Length(s) do begin
      if not t then begin
        if s[i]='-' then begin
          t:=true;
          i:=i+1;
        end;
      end else begin
        ss:=ss+s[i];
      end;
      i:=i+1;
    end;
    substring:=ss;
  end;

const r=14;r2=140;r3=25;
Var
  i,j,q:word;
  x,y,x1,y1,x2,y2,len:integer;
  JS,KS:string;

begin
  Image1.Canvas.FillRect(Rect(0,0,Image1.Width,Image1.Height));
  StringGrid1.RowCount:=1;
  StringGrid1.Cells[0,0]:='¹';
  StringGrid1.Cells[1,0]:='From';
  StringGrid1.Cells[2,0]:='To';
  StringGrid1.Cells[3,0]:='CdFr';
  StringGrid1.Cells[4,0]:='CdTo';
  StringGrid1.Cells[5,0]:='S';
  StringGrid1.Cells[6,0]:='R';
  if MS<>nil then begin

    MS.updateMatrix;
    i:=1;
    q:=Length(MS.MI2);
    Image1.Canvas.Brush.Color:=clWhite;
    Image1.Canvas.Pen.Color:=clBlue;
    while i<=q do begin
      x:=Round(r2*sin(2*3.14*(i-1)/q))+Image1.Width div 2;
      y:=Round(r2*cos(2*3.14*(i-1)/q))+Image1.Height div 2;
      j:=1;
      while j<=q do begin
        if MS.MI2[i-1][j]>0 then begin
          if i<>j then begin
            x1:=Round(r2*sin(2*3.14*(j-1)/q))+Image1.Width div 2;
            y1:=Round(r2*cos(2*3.14*(j-1)/q))+Image1.Height div 2;

            len:=Round(sqrt((x1-x)*(x1-x)+(y1-y)*(y1-y)));
            x2:=Round(x1-r*(x1-x)/len);
            y2:=Round(y1-r*(y1-y)/len);

            Image1.Canvas.MoveTo(x,y);
            Image1.Canvas.LineTo(x2,y2);

            Image1.Canvas.MoveTo(Round(x2-r*(x1-x)/len-r*(y1-y)/len/2),Round(y2-r*(y1-y)/len+r*(x1-x)/len/2));
            Image1.Canvas.LineTo(x2,y2);

            Image1.Canvas.MoveTo(Round(x2-r*(x1-x)/len+r*(y1-y)/len/2),Round(y2-r*(y1-y)/len-r*(x1-x)/len/2));
            Image1.Canvas.LineTo(x2,y2);
            Image1.Canvas.TextOut(Round(x2-2*r*(x1-x)/len),Round(y2-2*r*(y1-y)/len),IntToStr(StringGrid1.RowCount-1));
          end else begin
            x1:=Round((r2+r3)*sin(2*3.14*(i-1)/q))+Image1.Width div 2;
            y1:=Round((r2+r3)*cos(2*3.14*(i-1)/q))+Image1.Height div 2;
            Image1.Canvas.Ellipse(x1-r3,y1-r3,x1+r3,y1+r3);
          end;

          StringGrid1.RowCount:=StringGrid1.RowCount+1;
          StringGrid1.Cells[0,StringGrid1.RowCount-1]:=IntToStr(StringGrid1.RowCount-1);
          StringGrid1.Cells[1,StringGrid1.RowCount-1]:=IntToStr(i);
          StringGrid1.Cells[2,StringGrid1.RowCount-1]:=IntToStr(j);
          StringGrid1.Cells[3,StringGrid1.RowCount-1]:=bybitstr(MS.MI2[i-1][Length(MS.MI2[i-1])-1]);
          StringGrid1.Cells[4,StringGrid1.RowCount-1]:=bybitstr(MS.MI2[j-1][Length(MS.MI2[j-1])-1]);
          getJK(MS.MI2[i-1][Length(MS.MI2[i-1])-1],MS.MI2[j-1][Length(MS.MI2[j-1])-1],JS,KS);
          StringGrid1.Cells[5,StringGrid1.RowCount-1]:=JS;
          StringGrid1.Cells[6,StringGrid1.RowCount-1]:=KS;

        end;
        j:=j+1;
      end;
      if MS.MI2[i-1][0]<>5 then begin
        Image1.Canvas.Ellipse(x-r,y-r,x+r,y+r)
      end else begin
        Image1.Canvas.Pen.Color:=clBlue;
        Image1.Canvas.Ellipse(x-3*r div 4,y-3*r div 4,x+3*r div 4,y+3*r div 4);
        Image1.Canvas.Pen.Color:=clBlue;
      end;
      Image1.Canvas.Font.Color:=clBlue;
      Image1.Canvas.TextOut(x-r div 2 +r,y-r div 2 -r,bybitstr(MS.MI2[i-1][Length(MS.MI2[i-1])-1]));
      Image1.Canvas.Font.Color:=clBlack;
      Image1.Canvas.TextOut(x-r div 2 ,y-r div 2,IntToStr(i));
      i:=i+1;
    end;
  end;
  minim;
  i:=1;
  while i<=Memo1.Lines.Count do begin
    js:=Memo1.Lines.Strings[i-1];
    js:=substring(js,'=');


    i:=i+1;
  end;
end;

end.
