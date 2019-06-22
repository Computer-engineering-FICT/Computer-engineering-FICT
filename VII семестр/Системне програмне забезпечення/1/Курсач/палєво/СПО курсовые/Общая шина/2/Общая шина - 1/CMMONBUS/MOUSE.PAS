UNIT Mouse;

INTERFACE

USES DOS, Service;

CONST
    MSizeX=30; MSizeY=30; MouseStep=1;

VAR
    MouseX, MouseY, OldMouseX, OldMouseY: Integer;
    Button1, Button2, OldButton1, OldButton2: Byte;
    ds, di, res: Integer;
    regs: Registers;

    procedure GetMouseStatus;
    function  MouseMove:  Boolean;
    function  MousePress: Boolean;
    procedure InitMouse( minX, minY, maxX, maxY, setX, setY: Integer );
    procedure MouseShow;
    procedure MouseHide;
    function  LeftDblClick: Boolean;
    function  RightDblClick: Boolean;

IMPLEMENTATION

VAR lh1,lm1,ls1,lss1 : Word;
    lh2,lm2,ls2,lss2 : Word;
    rh1,rm1,rs1,rss1 : Word;
    rh2,rm2,rs2,rss2 : Word;

    function  LeftDblClick: Boolean;
    var d: Integer;
    begin
       if (Button1 = 1) and (OldButton1 = 0)
       then
       begin
          lh1:= lh2; lm1:= lm2; ls1:= ls2; lss1:= lss2;
          GetTime(lh2,lm2,ls2,lss2);
          if (lh1<>lh2) or (lm1<>lm2) then LeftDblClick:= False
          else begin
                  if ls2 > ls1 then d:= 60-lss1+lss2
                               else d:= lss2-lss1;
                  if (d < 25) and (d > 15) then LeftDblClick:= True
                                           else LeftDblClick:= False;
               end
       end
       else LeftDblClick:= False;
    end;

    function  RightDblClick: Boolean;
    var d: Integer;
    begin
       if (Button2 = 2) and (OldButton2 = 0)
       then
       begin
          rh1:= rh2; rm1:= rm2; rs1:= rs2; rss1:= rss2;
          GetTime(rh2,rm2,rs2,rss2);
          if (rh1<>rh2) or (rm1<>rm2) then RightDblClick:= False
          else begin
                  if rs2 > rs1 then d:= 60-rss1+rss2
                               else d:= rss2-rss1;
                  if (d < 25) and (d > 15) then RightDblClick:= True
                                           else RightDblClick:= False;
               end
       end
       else RightDblClick:= False;
    end;

    procedure GetMouseStatus;
    begin
            OldMouseX:= MouseX;
            OldMouseY:= MouseY;
            regs.ax:= 3;
            intr(51,regs);
            MouseX := regs.cx div MouseStep;  {получить координаты мыши}
            MouseY := regs.dx div MouseStep;
            OldButton1:= Button1;
            OldButton2:= Button2;
            Button1:= regs.bx and 1;
            Button2:= regs.bx and 2;
            ShowLogo;{}
    end;

    function MouseMove:boolean;
    var X,Y: Integer;
    begin
            MouseMove:=false;
            regs.ax:=3;
            intr(51,regs);
            X:= regs.cx div MouseStep;  {получить координаты мыши}
            Y:= regs.dx div MouseStep;
            if (X<>MouseX) or (Y<>MouseY) then MouseMove:= True;
    end;

    function MousePress: boolean;
    begin
            {OldButton1:= Button1;}
            regs.ax:= 3;
            intr(51,regs);
            Button1:= regs.bx and 1;
            Button2:= regs.bx and 2;
            if Button1+Button2 > 0 then MousePress:= True
                                   else MousePress:= False;
            ShowLogo;{}
    end;

    procedure InitMouse( minX, minY, maxX, maxY, setX, setY: Integer );
    begin
            ds:=memw[$0:$ce];
            di:=memw[$0:$cc];        {проверка на наличие}
            res:=mem[ds:di];
            if res = 207 then exit;
            regs.ax:= 7;
            regs.cx:= minX;          {Диапазон по горизонтали}
            regs.dx:= maxX;
            intr(51,regs);
            regs.ax:= 8;
            regs.cx:= minY;           {Диапазон по вертикали}
            regs.dx:= maxY;
            intr(51,regs);
            regs.ax:= 4;             {Установить координаты мыши}
            regs.cx:= setX{320-MSizeX div 2{};
            regs.dx:= setY{160-MSizeY div 2{};
            MouseX:=regs.cx div MouseStep;
            MouseY:=regs.dx div MouseStep;
            intr(51,regs);
            OldMouseX:=MouseX;
            OldMouseY:=MouseY;
    end;

    procedure MouseShow;
    begin
            regs.ax:= 1;
            intr(51,regs);           {показать курсор мыши}
    end;

    procedure  MouseHide;
    begin
            regs.ax:= 2;             {скрыть курсор мыши}
            intr(51,regs);
    end;

BEGIN
   GetTime(lh2,lm2,ls2,lss2);
   GetTime(rh2,rm2,rs2,rss2);
   lh2:= 99; lm2:= 99; ls2:= 99; lss2:= 99;
   rh2:= 99; rm2:= 99; rs2:= 99; rss2:= 99;
   Button1:= 0;
END.