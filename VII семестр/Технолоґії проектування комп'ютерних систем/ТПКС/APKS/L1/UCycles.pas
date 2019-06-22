unit UCycles;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms,L6U,Dialogs,UMarking;

type
  TCycleDialog = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    MS:TSurface;

  end;

var
  CycleDialog: TCycleDialog;

implementation

{$R *.DFM}


procedure TCycleDialog.FormCreate(Sender: TObject);
begin
  MS:=nil;
end;

procedure TCycleDialog.FormShow(Sender: TObject);
  Type

    TVector=array of integer;
    TpVector=^TVector;
    TMatrix=array of TVector;
    TPMatrix=^TMatrix;

Var i,j{,m,kk}:word;C{,M2}:TMatrix;s:string;
  {function AddNode(n1,n2:integer):boolean;
  Var i,m:integer;
  begin
    m:=1;
    i:=1;
     while m<1073741824 do begin
       if((n1 xor n2)and m)>0 then begin
         if i=2 then break
         else i:=i+1;
       end;
       m:=m shl 1;
     end;

    if m<1073741824 then begin
      i:=Length(M2)+1;
      SetLength(M2,i);
      SetLength(M2[i-1],i);
//      while do begin
//      end;
      M2[i-1][i]:=1;

      m:=1;
      while m<1073741824 do begin
        if((n1 xor n2)and m)>0 then begin
          if AddNode(n1 xor m,n2) then begin
            break;
          end;
        end;
        m:=m shl 1;
      end;

      if m >= 1073741824 then begin
        SetLength(M2[Length(M2)-1],0);
        SetLength(M2,Length(M2)-1);
      end;
    end else begin


    end;
  end;

       }
  procedure subline(i:integer;L:TVector;var C:TMatrix);
  Var L2:TVector;j,k{,kk2}:word;
  begin
    j:=1;
    while j<=Length(L) do begin
      if L[j-1]=i then begin
      //  kk:=kk2;
      //  AddNode(MS.Mark[i],getCode(kk));

      //  kk:=kk+1;

        SetLength(C,Length(C)+1);
        SetLength(C[Length(C)-1],Length(L)-j+1);
        k:=j;//
        while k<=Length(L) do begin
          C[Length(C)-1][k-j]:=L[k-1];
          k:=k+1;
        end;
        break;
      end;
      j:=j+1;
    end;
    if j>=Length(L) then begin
    //  AddNode(MS.mark[i],kk);
   //   UMarking.DMarking.MarkingSG.Cells[len-1,i]:=IntToStr(kk);

    //  kk:=kk+1;
      //MS.Mark[i]:=getCode(kk);
      setLength(L,Length(L)+1);
      L[Length(L)-1]:=i;

      if MS.MI[i-1][0]=3 then begin
        SetLength(L2,Length(L));
        j:=1;
        while j<=Length(L) do begin
          L2[j-1]:=L[j-1];
          j:=j+1;
        end;
//        kk2:=kk;
      end;
      j:=2;
      while j<=Length(MS.MI[i-1]) do begin
        if MS.MI[i-1][j-1]>0 then
          if Length(L2)>0 then
            subline(j-1,L2,C)
          else
            subline(j-1,L,C);
        j:=j+1;
      end;
      if j>=Length(MS.MI[i-1]) then begin
        if Length(L2)>0 then
          SetLength(L2,0)
        else
          SetLength(L,0);
      end;
    end else SetLength(L,0);

  end;
//A:array of boolean; ch:boolean;L:array of array of integer;
begin
  if (MS<>nil)and (not MS.MyBox.Check) then begin
  //  kk:=1;
    MS.updateMatrix;
   // SetLength(M2,Length(MS.MI));
    i:=1;
    while i<=MS.PN do begin
      if MS.MI[i-1][0]=1 then begin
        MS.Mark[i-1]:=0;
        break;
      end;
    //  SetLength(M2[i-1],MS.PN);
     { m:=1;
      while m<=MS.PN do begin
        M2[i-1][m-1]:=MS.MI[i-1][m-1];
        m:=m+1;
      end;  }
      i:=i+1;
    end;
    SetLength(C,0);
    subline(i,nil,C);
    Memo1.Lines.Clear;
    i:=1;
    while i<=Length(C) do begin
      s:=IntToStr(C[i-1][0]);
      j:=2;
      while j<=Length(C[i-1]) do begin
        s:=s+'->'+IntToStr(C[i-1][j-1]);
        j:=j+1;
      end;
      Memo1.Lines.Add(s);
      i:=i+1;
    end;
  end else begin

    ShowMessage('There are errors in scheme');
  end;
end;

end.
