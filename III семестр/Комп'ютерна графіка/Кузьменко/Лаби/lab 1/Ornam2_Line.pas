program ornament;
uses graphABC;

begin
//setwindowsize(480,320);
ClearWindow;
  While true do
        begin
    SetPenColor(clRandom);
    Line(Random(WindowWidth),Random(WindowHeight),Random(WindowWidth),Random(WindowHeight));
    Sleep(100)
    end;
    
end.