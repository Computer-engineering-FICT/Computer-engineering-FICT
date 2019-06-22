UNIT Service;

INTERFACE

CONST
   NminX   =2  ; NminY   =2  ; NmaxX   =50 ; NmaxY   =15 ;{new}
   LminX   =82 ; LminY   =2  ; LmaxX   =180; LmaxY   =15 ;{LoadFile}
   SminX   =212; SminY   =2  ; SmaxX   =310; SmaxY   =15 ;{SaveFile}
   CminX   =342; CminY   =2  ; CmaxX   =410; CmaxY   =15 ;{config}
   AminX   =442; AminY   =2  ; AmaxX   =490; AmaxY   =15 ;{about}
   HminX   =596; HminY   =2  ; HmaxX   =616; HmaxY   =15 ;{help}
   XminX   =618; XminY   =2  ; XmaxX   =636; XmaxY   =15 ;{close}
   OminX   =580; OminY   =464; OmaxX   =639; OmaxY   =477;{Ok or Cancel}
   JminX   =530; JminY   =464; JmaxX   =570; JmaxY   =477;{ЯПФ or Граф}
   MminX   =480; MminY   =464; MmaxX   =519; MmaxY   =477;{Авто}
   BminX   =400; BminY   =464; BmaxX   =469; BmaxY   =477;{Базовое}
   ADminX  =5  ; ADminY  =464; ADmaxX  =130; ADmaxY  =477;{AutoDel}
   SEVMminX=150; SEVMminY=464; SEVMmaxX=168; SEVMmaxY=477;{SaveConfigEVM}
   LEVMminX=175; LEVMminY=464; LEVMmaxX=193; LEVMmaxY=477;{LoadConfigEVM}
   PgminX  =555; PgminY  =440; PgmaxX  =635; PgmaxY  =457;{Page}
   minX_FieldCount = 0;    maxX_FieldCount = 639;
   minY_FieldCount = 20;   maxY_FieldCount = 460;

TYPE
   tKey = record
          end;
         Function  IntToStr( Value: Integer ): String;
         Function  StrToInt( Str: String ): LongInt;
         Function  InputNewValue(X,Y,min,max: Integer): Integer;
         Function  InputString(X,Y,Dlina: Integer): String;
         Procedure Beep;
         Procedure PutText(X,Y: Integer; BKColor: Byte; Text: Char);
         Procedure PointLine( Xo, Yo: Integer; alfa: Real);
         Procedure FieldCount( ColorField, ColorFrame: Byte);
         Procedure Button( Xmin, Ymin, Xmax, Ymax: Integer; Text: String;
                           ColorText, ColorFon: Byte; Press: Boolean);
         Function  AllOkToPressButton( Xmin, Ymin, Xmax, Ymax: Integer;
                   Text: String; ColorText, ColorFon: Byte ): Boolean;
         Function  NumberChar( Str: String; Chr: Char ): Byte;
         Function  MyPos( Str: String; Chr: Char ): Byte;
         Procedure ShowLogo;
         Function  MyKey( Length, Code: Byte ): Boolean;{}
         Procedure CaptionMenu( CaptionStr: String );
         Procedure Menu;

IMPLEMENTATION

USES DOS, Crt, Graph, Mouse;

Var Logo: Char;
    h1,m1,s1,ss1: Word; { переменные для определения времени }
    h2,m2,s2,ss2: Word; {                   работы программы }
    diference: LongInt;

Function InputNewValue(X,Y,min,max: Integer): Integer;
Const step = 8;
Var h,m,s,ss: Word;
    Key     : Char;
    Result  : Integer;
    OldColor: Byte;
    Str     : String;
Begin
   while MousePress do;
   OldColor:= GetPixel(X,Y);
   Result:= 0; Str:= ''; Key:= #0;
   repeat
      if KeyPressed then
      begin
         Key:= ReadKey;
         if (Str='') and (Key = '-') and (min < 0) then Str:= Str+ Key
         else if (Key >= '0') and (Key <= '9')
              then if ((StrToInt(Str+Key) <= max) and (Str[1]<>'-') or
                       (StrToInt(Str+Key) >= min) and (Str[1]= '-'))and
                      not(Str='0') and not(Str='-0')
                   then begin
                           Str:= Str+Key;
                           Result:= StrToInt(Str)
                        end
                   else Beep
              else if (Key <> #13)and(Key <> #27)and(Key <> #8) then Beep;
         if (Key = #8)and(Length(Str)>0) then
         begin
            SetColor(OldColor);
            OutTextXY( X, Y, Str+'_');
            Delete(Str,Length(Str),1);
            SetColor(15);
            OutTextXY( X, Y, Str);
         end;
      end;
      GetTime(h,m,s,ss);
      if (ss >= 0) and (ss < 50)
      then begin SetColor(OldColor);
                 OutTextXY( X+Length(Str)*step, Y, '_') end
      else begin SetColor(15);
                 OutTextXY( X+Length(Str)*step, Y, '_') end;
      SetColor(OldColor);
      OutTextXY( X+(Length(Str)-1)*step, Y, '_');
      SetColor(15);
      OutTextXY( X, Y, Str);
   until (Key = #13) or (Key = #27) or MousePress;
   if Key = #13 then InputNewValue:= Result;
   if (Key = #27) or MousePress then InputNewValue:= min-1;
   SetColor(OldColor);
   OutTextXY( X, Y, Str+'_');
   while MousePress do;
End;

Function IntToStr( Value: Integer ): String;
Var s: String;
Begin
     Str(Value,s);     IntToStr:= s;
End;

Function StrToInt( Str: String ): LongInt;
Var i: Byte;
    Result: LongInt;
Begin
   Result:= 0;
   if Str[1] = '-' then i:= 2 else i:= 1;
   for i:=i to Length(Str) do Result:= Result*10 + Ord(Str[i]) - 48;
   if Str[1] = '-' then Result:= -Result;
   StrToInt:= Result
End;

Procedure Beep;
Begin
   Sound(400); Delay(400); NoSound
End;

Procedure PutText(X,Y: Integer; BKColor: Byte; Text: Char);
Begin
   SetFillStyle(1,BKColor);
   Bar( X-Trunc((Length(IntToStr(Ord(Text)))+1)*3), Y-5,
        X+Trunc((Length(IntToStr(Ord(Text)))+1)*3), Y+3 );
   SetTextJustify(CenterText,CenterText);
   SetTextStyle(0,0,1);
   SetColor(0);
   OutTextXY( X, Y, IntToStr(Ord(Text)) );
End;

Procedure PointLine(Xo,Yo: Integer; alfa: Real);
Const x1=10;  y1=5;
Begin
   Line(Xo,Yo,Xo+Trunc(x1*cos(alfa)-y1*sin(alfa)),
              Yo+Trunc(x1*sin(alfa)+y1*cos(alfa)));
   Line(Xo,Yo,Xo+Trunc(x1*cos(alfa)+y1*sin(alfa)),
              Yo+Trunc(x1*sin(alfa)-y1*cos(alfa)));
End;

Procedure FieldCount( ColorField, ColorFrame: Byte);
Begin
   MouseHide;
   {поле}
   SetFillStyle(1,ColorField);
   Bar( minX_FieldCount, minY_FieldCount,
        maxX_FieldCount, maxY_FieldCount );
   {рамка}
   SetLineStyle(0,0,3);
   SetColor(ColorFrame);
   RecTangle( minX_FieldCount, minY_FieldCount,
              maxX_FieldCount, maxY_FieldCount );
   MouseShow;
End;

Function InputString(X,Y,Dlina: Integer): String;
Const step = 8;
Var h,m,s,ss: Word;
    Key     : Char;
    R       : String;
    OldColor: Byte;
Begin
   while MousePress do;
   OldColor:= GetPixel(X,Y);
   R:= ''; Key:= #0;
   repeat
      if KeyPressed then
      begin
         Key:= ReadKey;
         if (Key = #27) or (Key = #13) then Break;
         if (Key = #8)and(Length(R)>0) then
         begin
            SetColor(OldColor);
            OutTextXY( X, Y, R+'_');
            Delete(R,Length(R),1);
            SetColor(15);
            OutTextXY( X, Y, R);
            Continue;
         end;
         if ((Key >= #65)and(Key<=#90) or (Key >= #97)and(Key<=#122) or
             (Key >= #48)and(Key<=#57) or (Key = '_'))and(Length(R) < Dlina)
         then begin
            SetColor(OldColor);
            OutTextXY( X+Length(R)*step, Y, '_');
            SetColor(15);
            R:= R+Key;
            SetColor(15);
            OutTextXY( X, Y, R);
         end
         else if Key <> #8 then Beep;
      end;
      GetTime(h,m,s,ss);
      if (ss >= 0) and (ss < 50)
      then begin SetColor(OldColor);
                 OutTextXY( X+Length(R)*step, Y, '_') end
      else begin SetColor(15);
                 OutTextXY( X+Length(R)*step, Y, '_') end;
   until MousePress;
   if Key = #13 then InputString:= R;
   if (Key = #27) or MousePress then InputString:= '';
   SetColor(OldColor);
   OutTextXY( X, Y, R+'_');
   while MousePress do;
End;

Procedure Button( Xmin, Ymin, Xmax, Ymax: Integer; Text: String;
                  ColorText, ColorFon: Byte; Press: Boolean);
Begin
   SetFillStyle(1,ColorText);
   Bar(Xmin,Ymin,Xmax,Ymax);
   SetFillStyle(1,ColorFon);
   SetTextStyle(0,0,1);
   SetTextJustify(CenterText,CenterText);
   if Press then begin
      Bar(Xmin+2,Ymin+2,Xmax-1,Ymax-1);
      SetColor(ColorText);
      OutTextXY(Xmin+(Xmax-Xmin)div 2,Ymin+1+(Ymax-Ymin)div 2,Text)
   end else begin
      Bar(Xmin+1,Ymin+1,Xmax-2,Ymax-2);
      SetColor(ColorText);
      OutTextXY(Xmin-1+(Xmax-Xmin)div 2,Ymin+(Ymax-Ymin)div 2,Text);
   end;
End;

Function AllOkToPressButton( Xmin, Ymin, Xmax, Ymax: Integer;
         Text: String; ColorText, ColorFon: Byte ): Boolean;
Begin
   AllOkToPressButton:= False;
   if MousePress and (MouseX > Xmin) and (MouseX < Xmax) and
                     (MouseY > Ymin) and (MouseY < Ymax) then
   begin
      MouseHide;
      Button( Xmin, Ymin, Xmax, Ymax, Text, ColorText, ColorFon, True );
      MouseShow;
      while MousePress do;
      MouseHide;
      Button( Xmin, Ymin, Xmax, Ymax, Text, ColorText, ColorFon, False );
      MouseShow;
      GetMouseStatus;
      if (MouseX > Xmin) and (MouseX < Xmax) and
         (MouseY > Ymin) and (MouseY < Ymax) then AllOkToPressButton:= True;
   end
End;

Function MyKey( Length, Code: Byte ): Boolean;
Var Ch: Char;
Begin
   MyKey:= False;
   if not KeyPressed then Exit;
   Ch:= ReadKey;
   if (Length = 1) and (Ch = #0) or
      (Length = 0) and (Ch<> #0) then Exit;
   if Ch = #0 then Ch:= ReadKey;
   if Ch = Chr(Code) then MyKey:= True;
End;{}

Function NumberChar( Str: String; Chr: Char ): Byte;
Var i, result: Byte; {кол-во символов}
Begin
   result:= 0;
   for i:= 1 to Length( Str ) do
      if Str[i] = Chr then Inc(result);
   NumberChar:= result;
End;

Function MyPos( Str: String; Chr: Char ): Byte;
Var result, i: Byte;
Begin
   result:= 0;
   for i:= 1 to Length(Str) do
      if Str[i] = Chr then
      begin
         result:= i;
         Break;
      end;
   MyPos:= result;
End;

VAR cc: Byte;
Procedure NextLogo;
Const LogoX = 570{587};
      LogoY = 9;
Var Color: Word;
    TextInfo: TextSettingsType;
Begin
   Color:= GetColor;
   GetTextSettings( TextInfo );
   ss1:= ss2;
   s1 := s2;
   m1 := m2;
   h1 := h2;
   SetTextStyle(0,0,1);
   SetTextJustify(CenterText,CenterText);
   {SetColor(15);{}
   MouseHide;
   {}if cc = 14 then cc:= 0 else cc:= cc+1;
   SetColor(cc);
   OutTextXY( LogoX, LogoY, 'KSerg' );{}
   {OutTextXY( LogoX, LogoY, Logo );
   case Logo of
      #0: Logo:= #1;
      #1: Logo:= #2;
      #2: Logo:= #1;
   end;{case}
   {case Logo of
      #0: Logo:= #3;
      #3: Logo:= #4;
      #4: Logo:= #5;
      #5: Logo:= #6;
      #6: Logo:= #3;
   end;{case}
   {case Logo of
      #0 : Logo:= '\';
      '\': Logo:= '|';
      '|': Logo:= '/';
      '/': Logo:= '-';
      '-': Logo:= '\';
   end;{case}
   {case Logo of
      #0 : Logo:= '┬';
      '┬': Logo:= '┤';
      '┤': Logo:= '┴';
      '┴': Logo:= '├';
      '├': Logo:= '┬'(*'╞'*);
      '╞': Logo:= '╥';
      '╥': Logo:= '╡';
      '╡': Logo:= '╨';
      '╨': Logo:= '╩';
      '╩': Logo:= '╠';
      '╠': Logo:= '╦';
      '╦': Logo:= '╣';
      '╣': Logo:= '╢';
      '╢': Logo:= '╧';
      '╧': Logo:= '╟';
      '╟': Logo:= '╤';
      '╤': Logo:= '┬';
   end;{case}
   SetColor(0);
   OutTextXY( LogoX, LogoY, Logo );
   MouseShow;
   SetColor( Color );
   SetTextJustify( TextInfo.Horiz, TextInfo.Vert );
   SetTextStyle( TextInfo.Font, TextInfo.Direction, TextInfo.CharSize );
End;

Procedure MyTime; { определение разницы времени }
Var time1, time2: LongInt;
Begin
   time1:= ((h1*60+m1)*60+s1)*100+ss1;
   time2:= ((h2*60+m2)*60+s2)*100+ss2;
   if time2 < time1 then time2:= time2+8640000{time2+24*60*60*100};
   diference:= time2-time1;
End;

Procedure ShowLogo;
Begin
   GetTime(h2,m2,s2,ss2);
   MyTime;
   if diference > 15 then NextLogo;
End;

Procedure CaptionMenu( CaptionStr: String );
Var Color: Word;
    TextInfo: TextSettingsType;{}
Begin
   Color:= GetColor;
   GetTextSettings( TextInfo );{}
   MouseHide;
   Menu;
   SetTextStyle(0,0,1);
   SetTextJustify( CenterText, CenterText );
   SetColor(0);
   OutTextXY( GetMaxX div 2, 10, CaptionStr );
   MouseShow;
   SetColor( Color );
   SetTextJustify( TextInfo.Horiz, TextInfo.Vert );
   SetTextStyle( TextInfo.Font, TextInfo.Direction, TextInfo.CharSize );{}
End;

Procedure Menu;
Begin
   SetFillStyle(1,15);
   Bar( 0, 0, maxX_FieldCount, minY_FieldCount );
   SetColor(0);
   SetLineStyle(0,0,1);
   Line( 0, minY_FieldCount-2, maxX_FieldCount, minY_FieldCount-2 );
End;

BEGIN
   Logo:= #0;
   GetTime(h1,m1,s1,ss1);
   GetTime(h2,m2,s2,ss2);
   diference:= 9999;
   cc:= 0;
END.