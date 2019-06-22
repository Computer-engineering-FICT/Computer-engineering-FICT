unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,unit1,unit2,unit3, Buttons;

type
  TForm4 = class(TForm)
    cbPrev: TComboBox;
    cbNext: TComboBox;
    lbPrev: TLabel;
    lbNext: TLabel;
    BitBtn1: TBitBtn;
    bbOk: TBitBtn;
    procedure SubmitDelConnect(Sender: TObject);
    procedure SubmitDelVerse(Sender: TObject);
    procedure SubmitConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
procedure DelItem(var A:TPrev;Pos:integer);
  var i:integer;
begin
  for i:=pos+1 to length(A)-1 do
    A[i-1]:=A[i];
  setLength(A,Length(A)-1)
end;

procedure TForm4.SubmitConnect(Sender: TObject); {InsConnect}
  var Vp,Vn:integer;
      variant:TConVar;
begin
  Variant := 0;
  if NumFromStr(cbPrev.Items[cbPrev.ItemIndex],ALT_SEPARATOR)=StrToInt(cbNext.Items[cbNext.ItemIndex]) then
    ShowError('Такое соединение невозможно')
  else
  begin
    Vp:=NumFromStr(cbPrev.Items[cbPrev.ItemIndex],ALT_SEPARATOR);
    Vn:=NumFromStr(cbNext.Items[cbNext.ItemIndex],ALT_SEPARATOR);
    TableSv[findver(Vp),Findver(Vn)]:=true;
    case VerList[Findver(Vp)].Vid of
       o:Variant:=0;
       l:if IsNoDelim(ALT_SEPARATOR,cbPrev.Items[cbPrev.ItemIndex]) then Variant:=1 else Variant:=0;
       b:Variant:=2;
     end;
    with VerList[FindVer(Vn)] do
    begin
      SetLength(Prev,length(prev)+1);
      Prev[Length(Prev)-1]:=Vp;
    end;

    with VerList[FindVer(Vp)] do
    begin
      if (Vid=o) or (Vid=b) then
        NextMain:=Vn;
      if Vid=l then
        if IsNoDelim(ALT_SEPARATOR,cbPrev.Items[cbPrev.ItemIndex]) then
          NextAlt:=Vn
        else
          NextMain:=Vn;
    end;
    close;
    Connect(VerList[Findver(VP)].Col,VerList[FindVer(VP)].Row,VerList[FindVer(Vn)].Col,VerList[FindVer(Vn)].Row,Variant, CLR_CONNECT);
  end;
end; {InsConnect}


procedure TForm4.SubmitDelVerse(Sender: TObject); {Del}
  var Vp,Vud,i:integer;
      Variant:TConVar;
begin
   Variant := 0;
   Vud:=StrToInt(cbPrev.Items[cbPrev.ItemIndex]);
   with  VerList[Vud] do
   begin
   if length(prev)=0 then sleep(0) // Vp := -1
   else
     for i:=0 to length(prev)-1 do
     begin
       Vp:=Prev[i];
       case VerList[Vp].Vid of
         o:Variant:=0;
         l:if VerList[Vp].NextAlt=Vud then Variant:=1 else Variant:=0;
         b:Variant:=2;
       end;
       if (VerList[Vp].Vid=l) and (VerList[Vp].NextAlt=Vud) then
          VerList[Vp].NextAlt:=-1
       else
         VerList[Vp].NextMain:=-1;

       DisConnect(VerList[Vp].Col,VerList[Vp].Row,Col,Row,Variant)
     end;
     SetLength(Prev,0);

     if Vid<>k then
     begin
       if NextAlt<>-1 then
       begin
         DisConnect(Col,Row,VerList[NextAlt].Col,VerList[NextAlt].Row,1);
         for i:=0 to length(VerList[NextAlt].Prev)-1 do
           if VerList[NextAlt].Prev[i]=Vud then
             DelItem(VerList[NextAlt].prev,i)
       end;
       if NextMain<>-1 then
       begin
//
         DisConnect(Col,Row,VerList[NextMain].Col,VerList[NextMain].Row,0);
         for i:=0 to length(VerList[NextMain].Prev)-1 do
           if VerList[NextMain].Prev[i]=Vud then
             DelItem(VerList[NextMain].prev,i)

       end
     end;

     exist:=False;
      case Vid of
       k:DelEllipse(Col,Row);
       o:DelRect(Col,Row,'');
       l:delRomb(Col,Row,'   ')
     end;

     NextAlt:=-1;
     nextMain:=-1;
   end;
     for i:=0 to MaxVerNum do
       if VerList[i].Exist then
       with VerList[i] do
       begin
         case Vid of
           o,l:Variant:=0;
           b:Variant:=2;
         end;
         if NextMain>-1 then
          Connect(Col,Row,VerList[findVer(NextMain)].Col, VerList[findVer(NextMain)].Row,Variant, CLR_CONNECT);
         if NextAlt>-1 then
          Connect(Col,Row,VerList[findVer(NextAlt)].Col, VerList[findVer(NextAlt)].Row,1, CLR_CONNECT);
       end;

    if Vud=MaxVerNum then
       MaxVerNum:=MaxVerNum-1;
//    if Vp>-1 then
//  TableSv[Vp,Vud]:=false;
  ModalResult := mrOk;
end; {del}

procedure TForm4.SubmitDelConnect(Sender: TObject);{del connection}
  var Vp,Vn,i:integer;
      Variant:TConVar;
begin
Variant := 0;
Vp:=NumFromStr(cbPrev.Items[cbPrev.ItemIndex],ALT_SEPARATOR);
   Vn:=StrToInt(cbNext.Items[cbNext.ItemIndex]);
   if (VerList[Vp].NextMain=Vn)
      and (not IsNoDelim(ALT_SEPARATOR,cbPrev.Items[cbPrev.ItemIndex]))
      or (Verlist[Vp].NextAlt=Vn)
      and(IsNoDelim(ALT_SEPARATOR,cbPrev.Items[cbPrev.ItemIndex])) then
   with  VerList[FindVer(Vn)] do
   begin
       case VerList[FindVer(Vp)].Vid of
         o:Variant:=0;
         l:if VerList[FindVer(Vp)].NextAlt=Vn then Variant:=1 else Variant:=0;
         b:Variant:=2;
       end;
       DisConnect(VerList[FindVer(Vp)].Col,VerList[Findver(Vp)].Row,Col,Row,Variant);

        for i:=0 to Length(Prev)-1 do
          if Prev[i]=Vp then
           DelItem(prev,i);
        if IsNoDelim(ALT_SEPARATOR,cbPrev.Items[cbPrev.ItemIndex])  then          VerList[Vp].NextAlt:=-1
        else
          VerList[FindVer(Vp)].NextMain:=-1;
        for i:=0 to Length(Prev)-1 do
          if Prev[i]=Vp then
           DelItem(prev,i);

        if IsNoDelim(ALT_SEPARATOR,cbPrev.Items[cbPrev.ItemIndex])  then          VerList[Vp].NextAlt:=-1
        else
          VerList[FindVer(Vp)].NextMain:=-1;
        for i:=0 to Length(Prev)-1 do
          if Prev[i]=Vp then
           DelItem(prev,i);

     for i:=0 to MaxVerNum do
       if VerList[i].Exist then
       with VerList[i] do
       begin
         case Vid of
           o,l:Variant:=0;
           b:Variant:=2;
         end;
         if NextMain>-1 then
          Connect(Col,Row,VerList[findVer(NextMain)].Col, VerList[findver(NextMain)].Row,Variant, CLR_CONNECT);
         if NextAlt>-1 then
          Connect(Col,Row,VerList[findver(NextAlt)].Col, VerList[findver(NextAlt)].Row,1, CLR_CONNECT);
       end;

       Close;
   end
   else
    showMessage('Связь не существует')

end;

end.
