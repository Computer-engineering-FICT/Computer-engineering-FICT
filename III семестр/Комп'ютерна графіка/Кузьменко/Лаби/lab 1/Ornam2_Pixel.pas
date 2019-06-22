program ornament;
uses graphABC;

begin
//setwindowsize(480,320);
ClearWindow;
  While true do
    SetPixel(Random(WindowWidth),Random(WindowHeight),clRandom);
end.